*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     OperatingSystem     # About File
Library     String

*** Keywords ***
_Keyword_Get_All_User
    [Arguments]     ${url}     ${part}     ${expected_response_code}

    create session     thetestingworldapi     ${url}     verify=True
    ${response}=     get request     thetestingworldapi     ${part}      # http://thetestingworldapi.com/api/studentsDetails
    should be equal as strings     ${expected_response_code}     ${response.status_code}
    ${userList}=     to json     ${response.content}
    [return]     ${userList}

_Function_Get_Data_Test_From_Text_File
    [Arguments]     ${data_test_path}     ${dataTest_}

    ${dataTestFile}=     Get File     ${data_test_path}${dataTest_}
    @{dataTestFile_lines}=     Split to lines     ${dataTestFile}
    [return]     ${dataTestFile_lines}

_Function_Check_File_Exist_In_Directory
    [Arguments]     ${data_test_path}     ${textFileName}
    File Should Exist     ${data_test_path}${textFileName}
        Sleep     1s

_Function_Delete_File_In_Directory
    [Arguments]     ${data_test_path}     ${textFileName}
    Remove File     ${data_test_path}${textFileName}
        Sleep     1s


