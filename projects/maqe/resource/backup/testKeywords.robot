*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Resource     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\resource\\keywords.robot
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\python\\LineNotify.py
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\python\\CSVFile.py

*** Variable ***
#${url}=     https://factools.uat.maqe.com/catalog
#${browser}=     gc
#${get_data_test_tc01}=     dataTest_tc01.txt
${csv_filePath}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\data_test
${csv_file_name_thai}=     customer_info_thai.csv
#${csv_file_name}=     customer_info.csv
#${capture_screen_path}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\capture_screen\\


*** Test Case ***
Test_Keywords
#    Capture_Screen_RobotFramwork_Log_Report
#    Check_file_exist_and_delete
#    Get_Data_Test_Eng_Language_From_CSV_File
    Get_Data_Test_Eng_And_Thai_Language_From_CSV_File

*** Keywords ***
Capture_Screen_RobotFramwork_Log_Report
    _Function_Capture_Screen_RobotFramwork_Log_Report

Check_file_exist_and_delete
    ${isFileExist}=     Run Keyword And Return Status     _Function_check_file_exist_in_directory
    Run Keyword If     ${isFileExist}     _Function_Delete_Capture_Screen

Get_Data_Test_Eng_Language_From_CSV_File
    ${dataList}=     _Function_Get_Data_Test_Eng_Language_From_CSV_File     ${csv_file_name}
    Log     ${dataList}
    ${dataList_length}=    Get length    ${dataList}
    ${arrDataList_length}=     Convert To Integer     ${dataList_length}

    : For     ${INDEX}     IN RANGE     0     ${arrDataList_length}
        \   ${customer_line}=   Convert To String   @{dataList}[${INDEX}]
        \   Log     ${customer_line}
    Run Keyword If     ${INDEX}>= ${arrDataList_length}     Exit For Loop

Get_Data_Test_Eng_And_Thai_Language_From_CSV_File
    ${dataList}=     readCSVFile     ${csv_filePath}     ${csv_file_name_thai}
    Log     ${dataList}
    ${dataList_length}=    Get length    ${dataList}
    ${arrDataList_length}=     Convert To Integer     ${dataList_length}

    : For     ${INDEX}     IN RANGE     0     ${arrDataList_length}
        \   ${customer_line}=   Convert To String   @{dataList}[${INDEX}]
    Run Keyword If     ${INDEX}>= ${arrDataList_length}     Exit For Loop