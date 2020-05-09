*** Settings ***
Library     JMeterLib
Library     Collections
Library     OperatingSystem     # Example: File Directory       # incase checking file in diractory should alway import this library
Library     String              # Example: About String Value
Resource     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\resource\\Keywords.robot        # Call any keyword in project file (Keywords.project)
#Resource     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\report_issue\\
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\py\\checknumber.py               # Call any function in python file (checknumber.py)

*** Variables ***
${JMeters_path}=     D:\\Program for install\\apache-jmeter-5.2.1\\bin\\jmeter.bat
${JMeter_script_path}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\TC01_TS01_CreateNewProject.jmx
${JMeter_log_path}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\result\\TC01_TS01_CreateNewProject_Result.jtl
${JMeter_script_path2}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\TC01_TS02_AddNewProjectInToPerformanceTestProject.jmx
${JMeter_log_path2}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\result\\TC01_TS02_AddNewProjectInToPerformanceTestProject_Result.jtl

# =======================  "TC01_TS01_Create_New_Project_In_MantisBT.txt" for create new project in Mantis BT ==============================
${filePath}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\dataTest\\TC01_TS01_Create_New_Project_In_MantisBT.txt

# =======================  "TC01_TS01_Get_All_Project_ID.txt" is id of all projects in Mantis BT ==============================
${filePath2}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\dataTest\\TC01_TS01_Get_All_Project_ID.txt

# =======================  "TC01_TS01_Filter_Project_ID.txt" is project id on focus in Mantis BT ==============================
${filePath3}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\dataTest\\TC01_TS01_Filter_Project_ID.txt

# =======================  "TC01_TS01_Latest_ID_Of_New_Project_Created.txt" is project id on focus in Mantis BT ==============================
${filePath4}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\bug_tracking\\mantis\\jmeter_script\\dataTest\\TC01_TS01_Latest_ID_Of_New_Project_Created.txt


*** Test Cases ***
TestCase_AutoCreateNewProjectInMantis_Checking_File_in_Directory
    Step_AutoCreateNewProjectInMantis_Checking_File_in_Directory     ${filePath}
        Sleep     1s
## === Bom : Create this step on 3 May 2020 ===
    Step_Mantis_RunningNewProjectNumber     ${filePath}
        Sleep     1s
# ==============================================
    Step_AutoCreateNewProjectInMantis_Checking_File_in_Directory_and_recreate_blank_file     ${filePath2}
        Sleep     1s
    Step_AutoCreateNewProjectInMantis_Checking_File_in_Directory_and_recreate_blank_file     ${filePath3}
        Sleep     1s
    Step_AutoCreateNewProjectInMantis_Checking_File_in_Directory_and_recreate_blank_file     ${filePath4}

TestCase_AutoCreateNewProjectInMantis_RunJMeterScript_Create_New_Project
    Step_AutoCreateNewProjectInMantis_RunJMeterScript_Create_New_Project

TestCase_AutoCreateNewProjectInMantis_Get_Project_ID_of_New_Project_Created
    Step_AutoCreateNewProjectInMantis_Get_Project_ID_of_New_Project_Created

TestCase_AutoCreateNewProjectInMantis_RunJMeterScript_Add_New_Project_Created_to_be_Sub_Project_of_Project_Performance_Test
    Step_AutoCreateNewProjectInMantis_RunJMeterScript_Add_New_Project_Created_to_be_Sub_Project_of_Project_Performance_Test


*** Keywords ***
Step_AutoCreateNewProjectInMantis_Checking_File_in_Directory
    [arguments]     ${filePath}
    _robot_function_check_file_in_directory_not_create_new_file     ${filePath}

Step_AutoCreateNewProjectInMantis_RunJMeterScript_Create_New_Project
    run jmeter     ${JMeters_path}     ${JMeter_script_path}     ${JMeter_log_path}

Step_AutoCreateNewProjectInMantis_Get_Project_ID_of_New_Project_Created
    _robot_function_read_data_test_from_text_file_and_check_integer_number     ${filePath2}
    ${newArrGetDataTestFromTextFile}=     _robot_function_get_latest_project_id_in_mantis     ${filePath3}
    Append To File     ${filePath4}     ${newArrGetDataTestFromTextFile}[1]${\n}     encoding=UTF-8

Step_AutoCreateNewProjectInMantis_RunJMeterScript_Add_New_Project_Created_to_be_Sub_Project_of_Project_Performance_Test
     run jmeter     ${JMeters_path}     ${JMeter_script_path2}     ${JMeter_log_path2}
