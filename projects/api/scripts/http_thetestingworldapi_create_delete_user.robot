*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\resource\\keywords.robot
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\python\\textFileManagement.py

*** Variables ***
${url}=     http://thetestingworldapi.com
${part}=     /api/studentsDetails
${expected_search_response_code}=     200
${expected_create_response_code}=     201
${expected_delete_response_code}=     200
${data_test_path}=          D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\api\\data_test\\
${textFileName}=      newUserCreated.txt


*** Test Cases ***
TC01_Create_New_User
    Step_Get_All_User
    Step_Create_New_User
        Sleep     5s        # wait 5 sec. after create and append data into file 'newUserCreated.txt'

TC02_Delete_User
    Step_Delete_User


*** Keywords ***
Step_Get_All_User
    ${userList}=     _Keyword_Get_All_User     ${url}     ${part}     ${expected_search_response_code}
        Log     ${userList}


Step_Create_New_User
    # == call Keywords in file 'keywords.robot' ==
    # == Check and Delete text file 'keywords.robot' ==
            ${isFileExist}=     Run Keyword And Return Status     _Function_Check_File_Exist_In_Directory     ${data_test_path}     ${textFileName}
            Run Keyword If     ${isFileExist}     _Function_Delete_File_In_Directory     ${data_test_path}     ${textFileName}

    create session     thetestingworldapi     ${url}
    # == Example : body=[{"id":1,"first_name":"Hello","middle_name":"A","last_name":"World","date_of_birth":"12/12/1985"}, ==
    ${body}=     create dictionary     first_name=test_firstname_AAA     middle_name=test_middle_name_AAA     last_name=test_lastname_AAA     date_of_birth=12/12/2020
    ${header}=     create dictionary     Content-Type=application/json
    ${response}=     post request     thetestingworldapi     ${part}     data=${body}     headers=${header}
    should be equal as strings     ${expected_create_response_code}     ${response.status_code}
        Log     ${response.status_code}
    ${newUserCreated}=     to json     ${response.content}
    # == Example response of create = body={"id":14,"first_name":"test_firstname_AAA","middle_name":"test_middle_name_AAA","last_name":"test_lastname_AAA","date_of_birth":"12/12/2020"} ==
        Log     ${newUserCreated['id']}
        Log     ${newUserCreated['first_name']}
        Log     ${newUserCreated['middle_name']}
        Log     ${newUserCreated['last_name']}
        Log     ${newUserCreated['date_of_birth']}

    # == call python function 'thetestingworldapi_createTextFile' in file 'textFileManagement.py' ==
     thetestingworldapi_createTextFile     ${newUserCreated}     ${data_test_path}     ${textFileName}


Step_Delete_User
    # == call Keywords '_Function_get_Data_Test_from_Text_File' in file 'keywords.robot' ==
    @{dataTestFile_lines}=     _Function_Get_Data_Test_From_Text_File     ${data_test_path}     ${textFileName}
    ${arrDataTestFile_length}=    Get length    ${dataTestFile_lines}
    ${dataFile_length}=     Convert To Integer     ${arrDataTestFile_length}

    create session     thetestingworldapi     ${url}

    : For     ${INDEX}     IN RANGE     0     ${dataFile_length}
        \   ${line1_Product}=   Convert To String   @{dataTestFile_lines}[${INDEX}]
        # Example data in text file =  21,test_firstname_AAA,test_middle_name_AAA,test_lastname_AAA,12/12/2020
        \   ${id}     ${firstname}     ${middlename}     ${lastname}     ${dob}=  Split String     ${line1_Product}     ,
        \   ${response}=     delete request     thetestingworldapi     ${part}/${id}
        \   should be equal as strings     ${expected_delete_response_code}     ${response.status_code}
        \   Log     ${response.status_code}
        \   Log     ${response.content}
    Run Keyword If     ${INDEX}>= ${dataFile_length}     Exit For Loop
