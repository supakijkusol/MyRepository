*** Settings ***
Library     Collections         # Example: Array List , For Loop , Convert Value
Library     OperatingSystem     # Example: File Directory
Library     String              # Example: About String Value
Library     D:\\Work\\Automation_Test\\RobotFramework\\GitHub\\Repository\\libraries\\checktext.py             # Call any function in python file (checktext.py)
Library     D:\\Work\\Automation_Test\\RobotFramework\\GitHub\\Repository\\libraries\\checknumber.py           # Call any function in python file (checknumber.py)
Library     D:\\Work\\Automation_Test\\RobotFramework\\GitHub\\Repository\\libraries\\filemanagement.py        # Call any function in python file (filemanagement.py)
Resource     D:\\Work\\Automation_Test\\RobotFramework\\GitHub\\Repository\\resource\\Keywords.robot    # Call any keyword in project file (Keywords.project)


*** Variable ***
${dataTestPath}=     D:\\Work\\Automation_Test\\RobotFramework\\GitHub\\Repository\\projects\\writing_capital_n\\data_test\\DataForPlotBigCapitalN.txt
${splitByPipe}=     |

# ======================= Create "ascend_bigN.txt" text file ==============================
${filePath}=     D:\\Work\\Automation_Test\\RobotFramework\\GitHub\\Repository\\projects\\writing_capital_n\\file_directory\\ascend_bigN.txt


*** Test Case ***
# ======================= Pre-interview test -Revised [Compatibility Mode] ==============================
#    Please write function Print(y) to print out a square with width*length equals to y*y by using
#    letter “X” to plot a big capital “N” and filling the rest of the area with letter “O”
# =======================================================================================================
_test_case_get_data_test_from_text_file
    _step_get_data_test_from_text_file     ${dataTestPath}     ${splitByPipe}

_test_case_validation_parameters
    _step_check_special_charator     ${data_test_letter}     ${data_test_x_axis}     ${data_test_y_axis}
    _step_check_integer_number     ${data_test_x_axis}     ${data_test_y_axis}
#    _function_check_decimal_number     ${data_test_x_axis}     ${data_test_y_axis}

_test_case_check_text_file_ascend_bigN_in_directory
    _step_check_file_in_directory     ${filePath}

_test_case_plotBigN_prepareDataBeforePlotIntoTextFile
    _step_plotBigN_prepareDataBeforePlotIntoTextFile

_test_case_plotBigN_append_to_file
    _step_plotBigN_append_to_file


*** Keywords ***
_step_get_data_test_from_text_file
    [arguments]     ${dataTestPath}     ${splitByPipe}
    @{newArrGetDataTestFromTextFile}=     Create List
    ${newArrGetDataTestFromTextFile}=     _robot_function_read_data_test_from_text_file     ${dataTestPath}     ${splitByPipe}       # got value -->  ${newArrGetDataTestFromTextFile} = [['x_axis', '7'], ['y_axis', '1'], ['letter}', 'X']]
    ${data_test_x_axis}=     Convert To String     ${newArrGetDataTestFromTextFile}[0][1]      # get value of x_axis
    ${data_test_y_axis}=     Convert To String     ${newArrGetDataTestFromTextFile}[1][1]      # get value of y_axis
    ${data_test_letter}=     Convert To String     ${newArrGetDataTestFromTextFile}[2][1]      # get value of letter
    Set Global Variable     ${data_test_x_axis}
    Set Global Variable     ${data_test_y_axis}
    Set Global Variable     ${data_test_letter}


_step_check_special_charator
    [arguments]     ${data_test_letter}     ${data_test_x_axis}     ${data_test_y_axis}
    ${result1}=     py_check_special_charator     ${data_test_letter}
    ${result2}=     py_check_special_charator     ${data_test_x_axis}
    ${result3}=     py_check_special_charator     ${data_test_y_axis}


_step_check_integer_number
    [arguments]     ${data_test_x_axis}     ${data_test_y_axis}
    ${result_x_axis_int}=     py_check_integer_number     ${data_test_x_axis}
    ${result_y_axis_int}=     py_check_integer_number     ${data_test_y_axis}
    Should Be Equal As Strings    ${data_test_x_axis}    ${result_x_axis_int}
    Should Be Equal As Strings    ${data_test_y_axis}    ${result_y_axis_int}


_step_check_decimal_number
    [arguments]     ${data_test_x_axis}     ${data_test_y_axis}
    ${result_x_axis_decimal}=     py_check_decimal_number     ${data_test_x_axis}
    ${result_y_axis_decimal}=     py_check_decimal_number     ${data_test_y_axis}
    Should Be Equal As Strings    ${data_test_x_axis}    ${result_x_axis_decimal}
    Should Be Equal As Strings    ${data_test_y_axis}    ${result_y_axis_decimal}


_step_check_file_in_directory
    [arguments]     ${filePath}
    _robot_function_check_file_in_directory     ${filePath}


_step_plotBigN_prepareDataBeforePlotIntoTextFile
#    Log     ${data_test_x_axis}
#    Log     ${data_test_y_axis}
#    Log     ${data_test_letter}
    ${x_axis_line}=     py_create_new_line_of_x_axis     ${data_test_x_axis}
    Log     ${x_axis_line}

_step_plotBigN_append_to_file
#    [Arguments]     ${staticFilePath}     ${string}
    Append To File     ${filePath}     ...This keyword will develop by using Python soon...${\n}     encoding=UTF-8
    log to console     ...This keyword will develop by using Python soon...

###### Test update file and up to github ######