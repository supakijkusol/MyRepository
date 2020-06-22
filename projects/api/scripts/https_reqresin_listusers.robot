*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\python\\textFileManagement.py

*** Variables ***
${url}=     https://reqres.in
${request_path_page1}=     /api/users?page=1
${request_path_page2}=     /api/users?page=2
${expected_response_code}=     200
${data_test_path}=          D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\data_test\\
${textFileName}=      listAllUsers_Page2.txt
${csvFileName}=      listAllUsers_Page2.csv

*** Test Cases ***
TC01_Get_All_Users_Page1_And_Show_In_Log_File
    Step_Get_All_Users_Page1_And_Show_In_Log_File

TC02_Get_All_Users_Page2_And_Write_into_Text_File
    Step_Get_All_Users_Page2_And_Write_into_Text_File

*** Keywords ***
Step_Get_All_Users_Page1_And_Show_In_Log_File
     Create Session     reqres.in     ${url}     verify=True
     ${response}=     Get Request     reqres.in     ${request_path_page1}     timeout=5
     Should Be Equal As Strings     ${response.status_code}     ${expected_response_code}
     ${json_listallUsers}=     to json     ${response.content}
     Log     ${json_listallUsers['page']}
     Log     ${json_listallUsers['per_page']}
     Log     ${json_listallUsers['total']}
     Log     ${json_listallUsers['total_pages']}
     Log     ${json_listallUsers['data']}
     ${getLengthOfData}=     Get Length     ${json_listallUsers['data']}

     :FOR  ${INDEX}  IN RANGE     0     ${getLengthOfData}
     \     LOG     ${json_listallUsers['data'][${INDEX}]['id']}
     \     LOG     ${json_listallUsers['data'][${INDEX}]['email']}
     \     LOG     ${json_listallUsers['data'][${INDEX}]['first_name']}
     \     LOG     ${json_listallUsers['data'][${INDEX}]['last_name']}
     \     LOG     ${json_listallUsers['data'][${INDEX}]['avatar']}
     Run Keyword If     ${INDEX} >= ${getLengthOfData}     Exit For Loop

Step_Get_All_Users_Page2_And_Write_into_Text_File
     create session     reqres_in     ${url}     verify=True
     ${response}=     get request     reqres_in     ${request_path_page2}     timeout=5
     Should Be Equal As Strings     ${response.status_code}     ${expected_response_code}
     ${json_listAllUsers_page2}=     to json     ${response.content}

     # call python function 'reqresin_createTextFile' in file 'textFileManagement.py'
#     reqresin_createTextFile     ${json_listAllUsers_page2['data']}     ${data_test_path}     ${textFileName}
     reqresin_createTextFile     ${json_listAllUsers_page2['data']}     ${data_test_path}     ${csvFileName}