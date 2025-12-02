*** Settings ***
Library         SSHLibrary
Resource        keywords.resource

Suite Setup     Add test user
Suite Teardown  Remove test user

*** Variables ***
${TOKEN}    missing

*** Keywords ***
Add test user
    Run task    module/${MID1}/add-user    {"user":"u1","groups":[],"display_name":"User One","password":"Nethesis,1234"}

Remove test user
    Run task    module/${MID1}/remove-user    {"user":"u1"}

*** Test Cases ***
User portal requires HTTPS
    ${output}  ${error}  ${rc} =  Execute Command    curl -I http://127.0.0.1/users-admin/${DOMAIN}/    return_rc=1  return_stderr=True
    Should Contain    ${output}    Location: https://
    Should Be Equal As Integers    ${rc}    0

User portal has expected homepage
    ${output}  ${error}  ${rc} =  Execute Command    curl -k -L http://127.0.0.1/users-admin/${DOMAIN}/    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    <div id=\"app\">

Denied access with bad token
    ${output}  ${error}  ${rc} =  Execute Command    curl -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/logout    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "code":401

User can login and obtain a token
    ${token}  ${error}  ${rc} =  Execute Command    curl -H 'Content-type: application/json' --data '{"username":"u1","password":"Nethesis,1234"}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/login | jq -r .token    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Not Be Empty    ${token}
    Set Suite Variable    ${TOKEN}    ${token}

Allowed access with valid token
    ${output}  ${error}  ${rc} =  Execute Command    curl -v -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/logout    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "code":200

Export users fails with non-admin credentials
    ${output}  ${error}  ${rc} =  Execute Command    curl -v -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/export-users    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "code":403

Cluster admin can login and obtain a token
    ${token}  ${error}  ${rc} =  Execute Command    curl -H 'Content-type: application/json' --data '{"username":"${cadmuser}","password":"${cadmpass}","auth_backend":"api-server"}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/login | jq -r .token    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Not Be Empty    ${token}
    Set Suite Variable    ${TOKEN}    ${token}

Export users works with admin credentials
    ${output}  ${error}  ${rc} =  Execute Command    curl -v -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/export-users    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "status":"success"
    Should Contain    ${output}    "user":"u1"
    Should Not Contain    ${output}    "user":"imported.user"

Import Users works with admin credentials
    ${output}  ${error}  ${rc} =  Execute Command    curl -v -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{"records":[{"user":"imported.user","groups":["g1","g2","imported.group"],"display_name":"Imported User","password":"Secret1234","locked":true,"mail":"imported@example.org","must_change_password":false,"no_password_expiration":true}]}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/import-users    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "status":"success"

Check if imported.user is present
    ${output}  ${error}  ${rc} =  Execute Command    curl -v -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/export-users    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "status":"success"
    Should Contain    ${output}    "user":"imported.user"

Remove imported.user
    ${output}  ${error}  ${rc} =  Execute Command    curl -v -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{"user":"imported.user"}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/remove-user    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "status":"success"
    Should Contain    ${output}    "message":"user_removed"

Remove imported.group
    ${output}  ${error}  ${rc} =  Execute Command    curl -v -H "Authorization: Bearer ${TOKEN}" -H 'Content-type: application/json' --data '{"group":"imported.group"}' -k https://127.0.0.1/users-admin/${DOMAIN}/api/remove-group    return_rc=1  return_stderr=True
    Should Be Equal As Integers    ${rc}    0
    Should Contain    ${output}    "status":"success"
    Should Contain    ${output}    "message":"group_removed"
