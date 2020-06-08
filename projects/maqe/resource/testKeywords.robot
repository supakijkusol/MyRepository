*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Resource     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\resource\\keywords.robot
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\python\\LineNotify.py

*** Variable ***
#${url}=     https://factools.uat.maqe.com/catalog
#${browser}=     gc
#${get_data_test_tc01}=     dataTest_tc01.txt
#${capture_screen_path}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\capture_screen\\


*** Test Case ***
Test_Keywords
#    Capture_Screen_RobotFramwork_Log_Report
    Check_file_exist_and_delete

*** Keywords ***
Capture_Screen_RobotFramwork_Log_Report
    _Function_Capture_Screen_RobotFramwork_Log_Report

Check_file_exist_and_delete
    ${isFileExist}=     Run Keyword And Return Status     _Function_check_file_exist_in_directory
    Run Keyword If     ${isFileExist}     _Function_Delete_Capture_Screen