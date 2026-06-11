*** Settings ***
Resource    keywords.resource
Suite Setup    Install replica module
Suite Teardown    Remove the replica module

*** Variables ***
${MID2}    na

*** Test Cases ***
Join domain as replica
    ${out}    ${err}    ${rc} =    Execute Command
    ...    api-cli run module/${MID2}/configure-module --data '{"provision":"join-domain","domain":"${DOMAIN}","admuser":"${admuser}","admpass":"${admpass}"}'
    ...    return_rc=True  return_stdout=True  return_stderr=True
    Should Be Equal As Integers    ${rc}  0
    ${surl} =    Get server url    ${MID2}
    RootDSE is correct    ${surl}

Replica appears in service discovery
    ${out}    ${rc} =    Execute Command
    ...    api-cli run module/${MID1}/list-service-providers --data '{"service":"ldap","transport":"tcp","filter":{"domain":"${DOMAIN}"}}'
    ...    return_rc=True
    Should Be Equal As Integers    ${rc}  0
    Should Contain    ${out}    ${MID2}

Remove server from provider config
    ${serverid} =    Evaluate    "${MID2}".removeprefix("openldap")
    ${out}    ${err}    ${rc} =    Execute Command
    ...    api-cli run module/${MID1}/remove-server --data '{"serverid":${serverid}}'
    ...    return_rc=True  return_stdout=True  return_stderr=True
    Should Be Equal As Integers    ${rc}  0

Provider is still reachable after remove-server
    ${surl} =    Get server url    ${MID1}
    RootDSE is correct    ${surl}

Server ID is removed from slapd config
    ${serverid} =    Evaluate    "${MID2}".removeprefix("openldap")
    ${out}    ${rc} =    Execute Command
    ...    runagent -m ${MID1} podman exec openldap ldapsearch -Q -LLL -o ldif_wrap=no -b cn=config '(|(objectClass=olcDatabaseConfig)(objectClass=olcGlobal))' olcSyncrepl olcServerID
    ...    return_rc=True
    Should Be Equal As Integers    ${rc}  0
    Should Not Contain    ${out}    olcServerID: ${serverid}

*** Keywords ***
Install replica module
    ${module_id} =    Create a module instance
    Set Suite Variable    ${MID2}    ${module_id}

Remove the replica module
    Remove a module instance    ${MID2}
