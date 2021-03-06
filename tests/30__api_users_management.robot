*** Settings ***
Resource        keywords.resource

Suite Setup     Add test groups
Suite Teardown  Remove test groups

*** Keywords ***
Add test groups
    Run task    module/${MID1}/add-group    {"group":"g1","users":[]}
    Run task    module/${MID1}/add-group    {"group":"g2","users":[]}

Remove test groups
    Run task    module/${MID1}/remove-group    {"group":"g1"}
    Run task    module/${MID1}/remove-group    {"group":"g2"}

*** Test Cases ***
Add user first.user
    Run task    module/${MID1}/add-user    {"user":"first.user","display_name":"First User","locked":false,"groups":["g1"]}

    ${out}  ${err}  ${rc} =    Execute Command    podman exec ldapclient ldapsearch -LLL -H ${SURL} -x -D 'uid\=${admuser},ou=People,${DOMSUFFIX}' -w '${admpass}' -b '${DOMSUFFIX}' uid=first.user
    ...    return_stderr=${TRUE}    return_rc=${TRUE}
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${out}    first.user
    Should Contain    ${out}    First User

    ${out}  ${err}  ${rc} =    Execute Command    podman exec ldapclient ldapsearch -LLL -H ${SURL} -x -D 'uid\=${admuser},ou=People,${DOMSUFFIX}' -w '${admpass}' -b '${DOMSUFFIX}' cn=g1
    ...    return_stderr=${TRUE}    return_rc=${TRUE}
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${out}    memberUid: first.user

User already exists failure
    Run task    module/${MID1}/add-user    {"user":"first.user","display_name":"First User","locked":false,"groups":["g1"]}
    ...    rc_expected=2

Alter user first.user
    Run task    module/${MID1}/alter-user    {"user":"first.user","display_name":"Changed full name","locked":true,"groups":["g2"]}

    ${out}  ${err}  ${rc} =    Execute Command    podman exec ldapclient ldapsearch -LLL -H ${SURL} -x -D 'uid\=${admuser},ou=People,${DOMSUFFIX}' -w '${admpass}' -b '${DOMSUFFIX}' uid=first.user
    ...    return_stderr=${TRUE}    return_rc=${TRUE}
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${out}    first.user
    Should Not Contain    ${out}    First User
    Should Contain    ${out}    Changed full name


    ${out}  ${err}  ${rc} =    Execute Command    podman exec ldapclient ldapsearch -LLL -H ${SURL} -x -D 'uid\=${admuser},ou=People,${DOMSUFFIX}' -w '${admpass}' -b '${DOMSUFFIX}' cn=g1
    ...    return_stderr=${TRUE}    return_rc=${TRUE}
    Should Be Equal As Integers    ${rc}    0
    Should Not Contain    ${out}    memberUid: first.user

    ${out}  ${err}  ${rc} =    Execute Command    podman exec ldapclient ldapsearch -LLL -H ${SURL} -x -D 'uid\=${admuser},ou=People,${DOMSUFFIX}' -w '${admpass}' -b '${DOMSUFFIX}' cn=g2
    ...    return_stderr=${TRUE}    return_rc=${TRUE}
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${out}    memberUid: first.user

Remove first.user display name
    Run task    module/${MID1}/alter-user    {"user":"first.user","display_name":""}

    ${out}  ${err}  ${rc} =    Execute Command    podman exec ldapclient ldapsearch -LLL -H ${SURL} -x -D 'uid\=${admuser},ou=People,${DOMSUFFIX}' -w '${admpass}' -b '${DOMSUFFIX}' uid=first.user
    ...    return_stderr=${TRUE}    return_rc=${TRUE}
    Should Be Equal As Integers    ${rc}    0
    Should Not Contain    ${out}    displayName:


Alter non-existing user
    Run task    module/${MID1}/alter-user    {"user":"bad-user","display_name":"First User","locked":false,"groups":["g1"]}
    ...    rc_expected=1

Remove user first.user
    Run task    module/${MID1}/remove-user    {"user":"first.user"}

    ${out}  ${err}  ${rc} =    Execute Command    podman exec ldapclient ldapsearch -LLL -H ${SURL} -x -D 'uid\=${admuser},ou=People,${DOMSUFFIX}' -w '${admpass}' -b '${DOMSUFFIX}' uid=first.user
    ...    return_stderr=${TRUE}    return_rc=${TRUE}
    Should Not Contain    ${out}    numEntries:
