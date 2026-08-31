*** Settings ***
Documentation    Run update-syncrepl.awk against synthetic cn=config dumps.
...              Output order is part of the contract: deleting the config DB
...              olcSyncrepl or the olcServerID restarts the cn=config consumer
...              on every peer, so anything emitted after that may never reach
...              them.
Library     Collections
Resource    keywords.resource

*** Variables ***
${MDB_DN}       olcDatabase={2}mdb,cn=config
${CONFIG_DN}    olcDatabase={0}config,cn=config
${SUFFIX}       dc=t,dc=org

*** Test Cases ***
Removing the last replica clears the whole syncrepl attribute
    ${fixture} =    Config fixture    2
    ${signature} =    Filter signature    ${fixture}    2
    ${expected} =    Catenate    SEPARATOR=|
    ...    dn: ${MDB_DN}    replace: olcSyncrepl    replace: olcMultiProvider
    ...    dn: ${CONFIG_DN}    replace: olcSyncrepl    replace: olcMultiProvider
    ...    dn: cn=config    delete: olcServerID
    Should Be Equal    ${signature}    ${expected}

Removing one replica out of three deletes its values only
    ${fixture} =    Config fixture    3
    ${signature} =    Filter signature    ${fixture}    3
    ${expected} =    Catenate    SEPARATOR=|
    ...    dn: ${MDB_DN}    delete: olcSyncrepl
    ...    dn: ${CONFIG_DN}    delete: olcSyncrepl
    ...    dn: cn=config    delete: olcServerID
    Should Be Equal    ${signature}    ${expected}

Removing two replicas out of three leaves one provider and clears the attribute
    ${fixture} =    Config fixture    3
    ${signature} =    Filter signature    ${fixture}    2 3
    ${expected} =    Catenate    SEPARATOR=|
    ...    dn: ${MDB_DN}    replace: olcSyncrepl    replace: olcMultiProvider
    ...    dn: ${CONFIG_DN}    replace: olcSyncrepl    replace: olcMultiProvider
    ...    dn: cn=config    delete: olcServerID
    ...    dn: cn=config    delete: olcServerID
    Should Be Equal    ${signature}    ${expected}

Removing two replicas out of four emits every olcServerID deletion last
    ${fixture} =    Config fixture    4
    ${signature} =    Filter signature    ${fixture}    3 4
    ${expected} =    Catenate    SEPARATOR=|
    ...    dn: ${MDB_DN}    delete: olcSyncrepl
    ...    dn: ${MDB_DN}    delete: olcSyncrepl
    ...    dn: ${CONFIG_DN}    delete: olcSyncrepl
    ...    dn: ${CONFIG_DN}    delete: olcSyncrepl
    ...    dn: cn=config    delete: olcServerID
    ...    dn: cn=config    delete: olcServerID
    Should Be Equal    ${signature}    ${expected}

*** Keywords ***
Config fixture
    [Documentation]    Build the ldapsearch output of a domain with ${servers}
    ...                providers, laid out like a real cn=config: olcServerID on
    ...                the olcGlobal entry, olcSyncrepl on both databases.
    [Arguments]    ${servers}
    @{ids} =    Evaluate    list(range(1, ${servers} + 1))
    @{lines} =    Create List    dn: cn=config
    FOR    ${i}    IN    @{ids}
        Append To List    ${lines}    olcServerID: ${i} ldap://10.5.4.${i}:20000
    END
    Append To List    ${lines}    ${EMPTY}    dn: olcDatabase={-1}frontend,cn=config
    Append To List    ${lines}    ${EMPTY}    dn: ${CONFIG_DN}
    FOR    ${i}    IN    @{ids}
        ${rid} =    Evaluate    ${i} * 2
        Append To List    ${lines}
        ...    olcSyncrepl: rid=${rid} provider=ldap://10.5.4.${i}:20000 binddn="cn=config" bindmethod=simple credentials=secret searchbase="cn=config" type=refreshAndPersist retry="5 5 300 +" timeout=1
    END
    Append To List    ${lines}    ${EMPTY}    dn: ${MDB_DN}
    FOR    ${i}    IN    @{ids}
        ${rid} =    Evaluate    ${i} * 2 + 1
        Append To List    ${lines}
        ...    olcSyncrepl: rid=${rid} provider=ldap://10.5.4.${i}:20000 binddn="cn=mdbsync,${SUFFIX}" bindmethod=simple credentials=secret searchbase="${SUFFIX}" type=refreshAndPersist retry="5 5 300 +" timeout=1
    END
    ${fixture} =    Catenate    SEPARATOR=\n    @{lines}
    RETURN    ${fixture}

Filter signature
    [Documentation]    Reduce the filter output to its LDIF change order, so the
    ...                assertion reads as the sequence of operations.
    [Arguments]    ${fixture}    ${targets}
    ${out}    ${rc} =    Execute Command
    ...    printf '%s\\n' '${fixture}' | runagent -m ${MID1} podman exec -i -e AWK_TARGETS='${targets}' openldap sh -c 'awk -v targetid="$AWK_TARGETS" -f "$FILTERS_DIR/update-syncrepl.awk"' | grep -E '^(dn:|delete:|replace:)' | paste -sd'|'
    ...    return_rc=True
    Should Be Equal As Integers    ${rc}  0
    RETURN    ${out}
