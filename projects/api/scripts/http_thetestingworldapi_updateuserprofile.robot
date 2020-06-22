*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${url}=     http://thetestingworldapi.com
${part}=     /api/studentsDetails
${expected_response_code}=     200

*** Test Cases ***
TC01_Update_MiddleName_of_User_Selected
    Step_Get_All_User

*** Keywords ***
Step_Get_All_User
    create session     thetestingworldapi     ${url}     verify=True
    ${response}=     get request     thetestingworldapi     ${part}      # http://thetestingworldapi.com/api/studentsDetails
    should be equal as strings     ${expected_response_code}     ${response.status_code}
    ${userList}=     to json     ${response.content}

    Step_Update_MiddleName_of_User_Selected     ${userList}     # call Keywords "Step_Update_MiddleName_of_User_Selected"


Step_Update_MiddleName_of_User_Selected
    [Arguments]     ${userList}

    Log     ${userList}
    # Example = body=[{"id":1,"first_name":"Hello","middle_name":"A","last_name":"World","date_of_birth":"12/12/1985"},
#    Log     ${userList[0]['id']}
#    Log     ${userList[0]['first_name']}
#    Log     ${userList[0]['middle_name']}
#    Log     ${userList[0]['last_name']}
#    Log     ${userList[0]['date_of_birth']}

    create session     thetestingworldapi     ${url}     verify=True
    ${body}=     create dictionary     id=${userList[0]['id']}     first_name=Hello     middle_name=A     last_name=World     date_of_birth=12/12/1985
    ${headers}=     create dictionary     Content-Type=application/json

    ${response_beforeUpdate}=     get request     thetestingworldapi     ${part}/${userList[0]['id']}
    should be equal as strings     ${expected_response_code}     ${response_beforeUpdate.status_code}
    Log     ${response_beforeUpdate.status_code}
    Log     ${response_beforeUpdate.content}

    ${response_update}=     put request     thetestingworldapi     ${part}/${userList[0]['id']}     data=${body}     headers=${headers}      # http://thetestingworldapi.com/api/studentsDetails/{id}
    should be equal as strings     ${expected_response_code}     ${response_update.status_code}
    Log     ${response_update.status_code}
    Log     ${response_update.content}

    ${response_afterUpdate}=     get request     thetestingworldapi     ${part}/${userList[0]['id']}
    should be equal as strings     ${expected_response_code}     ${response_afterUpdate.status_code}
    Log     ${response_afterUpdate.status_code}
    Log     ${response_afterUpdate.content}
    create session     thetestingworldapi     ${url}     verify=True
