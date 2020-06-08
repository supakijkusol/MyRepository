*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Resource     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\resource\\keywords.robot
Library     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\python\\LineNotify.py

*** Variable ***
${url}=     https://factools.uat.maqe.com/catalog
${browser}=     gc
${get_data_test_tc01}=     dataTest_tc01.txt
${capture_screen_path}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\capture_screen\\
${capture_screen_comfirm_payment_top}=     TestCase_01_comfirm_payment_top.png
${capture_screen_comfirm_payment_middle}=     TestCase_01_comfirm_payment_middle.png
${capture_screen_comfirm_payment_bottom}=     TestCase_01_comfirm_payment_bottom.png
${capture_screen_robotframwork_log_report}=     TestCase_01_capture_screen_robotframwork_log_report.png


*** Test Case ***
TestCase_01_A_Customer_Search_Select_and_Checkout_Products
    [Documentation]     Condition are
    ...    1. A customer adds the products in catalog page and click "Cart" Icon
    ...    2. A customer adjusts their cart due to product quantity and etc.
#    Step_LineNotify_Start_Test
    Step_Open_Web_by_URL
    Step_Get_Data_Test_From_File
    Step_Search_Product
    Step_Checkout
    Step_Close_Browser
#    Step_Capture_Screen_RobotFramwork_Log_Report
    Step_LineNotify_Test_Finish

*** Keywords ***
Step_Open_Web_by_URL
    # == Start testing and Send Line Notify ==
    Log     Start testing and Send Line Notify
    ${_py_notifyMessage}=     notifyMessage
    Log     ${_py_notifyMessage}

        # == Delete capture screen all files ==
            ${isFileExist}=     Run Keyword And Return Status     _Function_check_file_exist_in_directory
            Run Keyword If     ${isFileExist}     _Function_Delete_Capture_Screen

    Open Browser     ${url}     ${browser}
        Sleep     3s
    Maximize Browser Window
        Sleep     3s

Step_Get_Data_Test_From_File
    # ==================================== Products =================================================
    @{dataTestFile_lines}=     _Function_get_Data_Test_from_Text_File     ${get_data_test_tc01}
    ${arrDataTestFile_length}=    Get length    ${dataTestFile_lines}
    ${dataFile_length}=     Convert To Integer     ${arrDataTestFile_length}
#    Log     "line 1 ="@{dataTestFile_lines}[0]
#    Log     "line 2 ="@{dataTestFile_lines}[1]
#    Log     "line 3 ="@{dataTestFile_lines}[2]

    Set Global Variable     @{dataTestFile_lines}
    Set Global Variable     ${dataFile_length}
    # ==================================== Customer Information =====================================








Step_Search_Product
    : For     ${INDEX}     IN RANGE     0     ${dataFile_length}
        \   ${line1_Product}=   Convert To String   @{dataTestFile_lines}[${INDEX}]
        \   ${productName}     ${productQuantity}=  Split String     ${line1_Product}     |
        \   Set Global Variable     ${productName}
        \   Set Global Variable     ${productQuantity}
        \   Input Text     //input[contains(@name,"keyword")]     ${productName}
        \       Sleep     1s
        \   Click Element     //button[contains(.,"ค้นหา")]
        \       Sleep     3s
        \   Step_Select_Product         # Call "Step_Select_Product
    Run Keyword If     ${INDEX}>= ${dataFile_length}     Exit For Loop


Step_Select_Product
    ${product_url}=     Get Element Attribute     //section/div[1]/div[3]/div/div[2]/a[contains(@class,"card card-pad grid-col product-list-item")]     href
    Click Element     //section/div[1]/div[3]/div/div[2]/a
    ${product_name}=     Get Text     //section[1]/div[1]/div[4]/div[2]/h1      # Get product name selected
        Log     "Product selected is = ${product_name}, URL = ${product_url}"
    Clear Element Text     //section[1]/div[1]/div[4]/div[2]/div[7]/div/div/input
    Input Text     //section[1]/div[1]/div[4]/div[2]/div[7]/div/div/input     ${productQuantity}
        Sleep     1s
    Click Element     //section[1]/div[1]/div[4]/div[2]/div[7]/div/button       # Click button "หยิบใส่ตะกร้า"
        Sleep     3s
    Click Element     //section[1]/div[1]/div[7]/div/div[3]/a[1]                # Click button "รถเข็น" on popup "ใส่ในตระกร้าเรียบร้อยแล้ว"
        Sleep     3s

Step_Checkout
    Click Element     //button[contains(.,"ทำการสั่งซื้อ")]
        Sleep     3s
    Click Element     //section/div/div[2]/div/div[3]/form[2]/div/div[2]/label      # click label of checkbox "ต้องการให้เราจัดส่งสินค้าให้"
        Sleep     1s
    Select Checkbox     //*[@id="delivery"]     # select checkbox "ต้องการให้เราจัดส่งสินค้าให้" on screen "เลือกวิธีการรับสินค้า"
        Sleep     1s

    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[2]/div[1]/input     Supakij
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[2]/div[3]/input     Kusol
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[6]/input           6 ม. 6
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[7]/div[1]/input     ต. อุโมงค์
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[7]/div[3]/input     อ. เมือง
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[8]/div[1]/input     จ. ลำพูน
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[8]/div[3]/input     51120
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[12]/input     0875117621
        Sleep     1s
    Input Text     //section/div/div[2]/div/div[3]/form[2]/div/div[4]/div[1]/div[13]/input     Supakij.Kusol@gmail.com1
        Sleep     1s
    Click Element     //button[contains(.,"จัดส่งไปยังที่อยู่นี้")]
        Sleep     3s

    Click Element     //section/div/div[2]/div/div[3]/form/div/div[2]/div[1]/div[1]/label      # click label of checkbox "ขนส่งเอกชน"
        Sleep     1s
    Select Checkbox     //*[@id="delivery_kerry-express"]     # select checkbox "ขนส่งเอกชน" of "เลือกช่องทางการจัดส่ง"
        Sleep     1s
    Click Element     //button[contains(.,"ดูรายละเอียดการชำระเงิน")]
        Sleep     3s
        execute javascript     window.scrollTo(0,50)

    Capture Page Screenshot     ${capture_screen_path}TestCase_01_payment_details_before_comfirm.png         # capture on screen "ดูรายละเอียดการชำระเงิน"
        Sleep     3s

    Click Element     //section/div[2]/div[3]/div[2]/div[2]/form/button     # click button "ยืนยันการสั่งซื้อ"
        Sleep     3s
    Capture Page Screenshot     ${capture_screen_path}TestCase_01_comfirm_payment_top.png         # capture on screen "ดูรายละเอียดการชำระเงิน"
        Sleep     1s
        execute javascript     window.scrollTo(0,500)
    Capture Page Screenshot     ${capture_screen_path}TestCase_01_comfirm_payment_middle.png         # capture on screen "ดูรายละเอียดการชำระเงิน"
        Sleep     1s
        execute javascript     window.scrollTo(0,1500)
    Capture Page Screenshot     ${capture_screen_path}TestCase_01_comfirm_payment_bottom.png         # capture on screen "ดูรายละเอียดการชำระเงิน"
        Sleep     1s

Step_Close_Browser
    Close Browser

Step_LineNotify_Test_Finish
    ${_py_notifyFile}=     notifyFile     ${capture_screen_path}TestCase_01_payment_details_before_comfirm.png

#Step_Capture_Screen_RobotFramwork_Log_Report
#    _Function_Capture_Screen_RobotFramwork_Log_Report
#
#    # == Test finish and send Line Notify ==
#    ${_py_notifyFile}=     notifyFile     ${capture_screen_path}TestCase_01_payment_details_before_comfirm.png
#    ${_py_notifyFile}=     notifyFile     ${capture_screen_path}TestCase_01_capture_screen_robotframwork_log_report.png
##    ${_py_notifyFile}=     notifyFile     ${capture_screen_path}TestCase_01_comfirm_payment_top.png
##    ${_py_notifyFile}=     notifyFile     ${capture_screen_path}TestCase_01_comfirm_payment_middle.png
##    ${_py_notifyFile}=     notifyFile     ${capture_screen_path}TestCase_01_comfirm_payment_bottom.png
##    Log     ${_py_notifyFile}