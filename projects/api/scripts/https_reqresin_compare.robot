*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     BuiltIn
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\python\\csvFileManagement.py
Resource     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\resource\\keywords.robot

*** Variables ***
${url}=     https://reqres.in
${request_path_page2}=     /api/users?page=2
${expected_response_code}=     200
${data_test_path}=          D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\data_test\\
${csvFileName}=      listAllUsers_Page2.csv


*** Test Cases ***
TC01_Compare_Data_Between_API_And_CSVFile
    Step_Compare_Data_Between_API_And_CSVFile

*** Keywords ***
#Step_Read_Data_Test_From_CSV_File
#    ${csvDataList}=     _Function_Get_Data_Test_From_CSV_File     ${data_test_path}     ${csvFileName}
#    ${csvDataList_length}=    Get length    ${csvDataList}
#    ${csvDataList_length_int}=     Convert To Integer     ${csvDataList_length}
#
#    : For     ${INDEX}     IN RANGE     0     ${csvDataList_length_int}
#        \   ${line}=   Convert To String   @{csvDataList}[${INDEX}]
#        \   ${id}     ${email}     ${first_name}     ${lastname}     ${avatar}     ${thai_language}=  Split String     ${line}     ,
#    Run Keyword If     ${INDEX}>= ${csvDataList_length_int}     Exit For Loop

Step_Compare_Data_Between_API_And_CSVFile
     create session     reqres_in     ${url}     verify=True
     ${response}=     get request     reqres_in     ${request_path_page2}     timeout=5
     Should Be Equal As Strings     ${response.status_code}     ${expected_response_code}
     ${json_listAllUsers_page2}=     to json     ${response.content}

    # == call python function 'reqresin_readCSVFile' in file 'csvFileManagement.py' ==
    ${csvDataList}=     reqresin_readCSVFile     ${data_test_path}     ${csvFileName}
    ${csvDataList_length}=    Get length    ${csvDataList}
    ${csvDataList_length_int}=     Convert To Integer     ${csvDataList_length}

    : For     ${INDEX}     IN RANGE     0     ${csvDataList_length_int}
        \   ${line}=   Convert To String   @{csvDataList}[${INDEX}]
        \   ${id_from_csv}     ${email_from_csv}     ${first_name_from_csv}     ${lastname_from_csv}     ${avatar_from_csv}     ${thai_language_from_csv}=  Split String     ${line}     ,
        \   Run Keyword And Continue On Failure     Should Be Equal As Strings     ${id_from_csv}     ${json_listAllUsers_page2['data'][${INDEX}]['id']}
        \   Run Keyword And Continue On Failure     Should Be Equal As Strings     ${email_from_csv}     ${json_listAllUsers_page2['data'][${INDEX}]['email']}
        \   Run Keyword And Continue On Failure     Should Be Equal As Strings     ${first_name_from_csv}     ${json_listAllUsers_page2['data'][${INDEX}]['first_name']}
        \   Run Keyword And Continue On Failure     Should Be Equal As Strings     ${lastname_from_csv}     ${json_listAllUsers_page2['data'][${INDEX}]['last_name']}
        \   Run Keyword And Continue On Failure     Should Be Equal As Strings     ${avatar_from_csv}     ${json_listAllUsers_page2['data'][${INDEX}]['avatar']}
    Run Keyword If     ${INDEX}>= ${csvDataList_length_int}     Exit For Loop