*** Settings ***
Library     Collections
Library     OperatingSystem     # Example: File Directory       # incase checking file in diractory should alway import this library
Library     String              # Example: About String Value


*** Variable ***
${data_test_path}=          D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\data_test\\


*** Keywords ***
_Function_get_Data_Test_from_Text_File
    [Arguments]     ${dataTest_}

    ${dataTestFile}=     Get File     ${data_test_path}${dataTest_}
    @{dataTestFile_lines}=     Split to lines     ${dataTestFile}
    [return]     ${dataTestFile_lines}