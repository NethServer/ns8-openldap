*** Settings ***
Resource    keywords.resource
Suite Setup    Install replica module
Suite Teardown    Remove the replica module if present

*** Variables ***
${MID2}    na
${MID2_HOST}    ${EMPTY}
${MID2_PORT}    ${EMPTY}
${MID2_SERVERID}    ${EMPTY}

*** Test Cases ***
Join domain as replica
    ${out}    ${err}    ${rc} =    Execute Command
    ...    api-cli run module/${MID2}/configure-module --data '{"provision":"join-domain","domain":"${DOMAIN}","admuser":"${admuser}","admpass":"${admpass}"}'
    ...    return_rc=True  return_stdout=True  return_stderr=True
    Should Be Equal As Integers    ${rc}  0
    ${surl} =    Get server url    ${MID2}
    RootDSE is correct    ${surl}

Both servers appear in service discovery
    ${out}    ${rc} =    Execute Command
    ...    api-cli run module/${MID1}/list-service-providers --data '{"service":"ldap","transport":"tcp","filter":{"domain":"${DOMAIN}"}}'
    ...    return_rc=True
    Should Be Equal As Integers    ${rc}  0
    Should Contain    ${out}    ${MID1}
    Should Contain    ${out}    ${MID2}

Removing the replica reconciles the surviving provider
    # Capture the replica discovery data before the module (and its srv key) is gone.
    ${out} =    Execute Command    runagent redis-exec HGETALL module/${MID2}/srv/tcp/ldap
    &{srv} =    Evaluate    ${out}
    Set Suite Variable    ${MID2_HOST}    ${srv.host}
    Set Suite Variable    ${MID2_PORT}    ${srv.port}
    ${sid} =    Evaluate    "${MID2}".removeprefix("openldap")
    Set Suite Variable    ${MID2_SERVERID}    ${sid}
    # Removing the replica fires module-domain-changed. The surviving provider
    # handles it by purging the stale syncrepl/serverID entry on its own.
    Remove a module instance    ${MID2}
    Set Suite Variable    ${MID2}    na
    # The event handler runs asynchronously, retry until cn=config is reconciled.
    Wait Until Keyword Succeeds    60s    3s    Surviving provider config has no stale replica entry

Surviving provider is still reachable
    ${surl} =    Get server url    ${MID1}
    RootDSE is correct    ${surl}

*** Keywords ***
Install replica module
    ${module_id} =    Create a module instance
    Set Suite Variable    ${MID2}    ${module_id}

Remove the replica module if present
    IF    '${MID2}' != 'na'
        Remove a module instance    ${MID2}
    END

Surviving provider config has no stale replica entry
    ${mid1_serverid} =    Evaluate    "${MID1}".removeprefix("openldap")
    ${out}    ${rc} =    Execute Command
    ...    runagent -m ${MID1} podman exec openldap ldapsearch -Q -LLL -o ldif_wrap=no -b cn=config '(|(objectClass=olcDatabaseConfig)(objectClass=olcGlobal))' olcSyncrepl olcServerID
    ...    return_rc=True
    Should Be Equal As Integers    ${rc}  0
    Should Contain      ${out}    olcServerID: ${mid1_serverid}
    Should Not Contain  ${out}    olcServerID: ${MID2_SERVERID} ldap://${MID2_HOST}:${MID2_PORT}
    Should Not Contain  ${out}    provider=ldap://${MID2_HOST}:${MID2_PORT}
