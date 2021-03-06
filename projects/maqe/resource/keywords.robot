*** Settings ***
Library     Collections
Library     OperatingSystem     # Example: File Directory       # incase checking file in diractory should alway import this library
Library     String              # Example: About String Value
Library     CSVLib

*** Variable ***
${capture_screen_path}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\capture_screen\\
${data_test_path}=          D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\data_test\\
${url_robot_framework_log_report}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\log.html
${browser}=     gc

*** Keywords ***
_Function_get_Data_Test_from_Text_File
    [Arguments]     ${dataTest_}

    ${dataTestFile}=     Get File     ${data_test_path}${dataTest_}
    @{dataTestFile_lines}=     Split to lines     ${dataTestFile}
    [return]     ${dataTestFile_lines}

_Function_Get_Data_Test_Eng_Language_From_CSV_File
    [Arguments]     ${csv_file_name}
    @{dataList}=		read csv as list		${data_test_path}${csv_file_name}
    [return]     ${dataList}

_Function_Capture_Screen_RobotFramwork_Log_Report
    Open Browser     ${url_robot_framework_log_report}     ${browser}
        Sleep     3s
    Maximize Browser Window
        Sleep     3s
#    Click Element     //*[@id="s1-t1"]/div[1]
     ${testcase_title}=     Get Element Attribute     //*[@id="s1-t1"]/div[1]/div[1]     title
     Click Element     //*[@id="s1-t1"]/div[1]/div[1][contains(@title,"${testcase_title}")]
        Sleep     3s
     Capture Page Screenshot     ${capture_screen_path}TestCase_01_capture_screen_robotframwork_log_report.png
        Sleep     1s

_Function_check_file_exist_in_directory
    File Should Exist     ${capture_screen_path}TestCase_01_payment_details_before_comfirm.png
        Sleep     1s
    File Should Exist     ${capture_screen_path}TestCase_01_comfirm_payment_top.png
        Sleep     1s
    File Should Exist     ${capture_screen_path}TestCase_01_comfirm_payment_middle.png
        Sleep     1s
    File Should Exist     ${capture_screen_path}TestCase_01_comfirm_payment_bottom.png
        Sleep     1s

_Function_Delete_Capture_Screen
    Remove File     ${capture_screen_path}TestCase_01_payment_details_before_comfirm.png
        Sleep     1s
    Remove File     ${capture_screen_path}TestCase_01_comfirm_payment_top.png
        Sleep     1s
    Remove File     ${capture_screen_path}TestCase_01_comfirm_payment_middle.png
        Sleep     1s
    Remove File     ${capture_screen_path}TestCase_01_comfirm_payment_bottom.png
        Sleep     1s
#    Remove File     ${capture_screen_path}TestCase_01_capture_screen_robotframwork_log_report.png
#        Sleep     1s

