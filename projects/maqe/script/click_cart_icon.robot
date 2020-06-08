*** Settings ***
Library     SeleniumLibrary
#Library     OperatingSystem
#Library     Collections
#Library     String


*** Variable ***
${url}=     https://factools.uat.maqe.com/catalog
${browser}=     gc
#${get_data_test_tc01}=     dataTest_tc01.txt
#${capture_screen_path}=     D:\\Work\\Automation_Test\\RobotFramework\\MyRepository\\projects\\maqe\\capture_screen\\


*** Test Case ***
Test_Keywords
    Step_Open_Web_by_URL

*** Keywords ***
Step_Open_Web_by_URL
    Open Browser     ${url}     ${browser}
        Sleep     3s
    Maximize Browser Window
        Sleep     3s

#    @{windows} =  Get Window Handles    # get windows code ex. [ CDwindow-07AC56D3762944086DDA06AA0AFAA040 | CDwindow-CEAB2E65CED7216B65C53A3501F3812B ]
#    Select Window  @{windows}[0]
#    Sleep     3s

    Wait Until Page Contains     แจ้งการโอนเงิน
#    /html/body/header/div[2]/div[3]/div/a
#    /html/body/header/div[2]/div[3]/div/a
#    Click Element     //header/div[2]/div[3]/div/a
#    Sleep     3s
    Click Element     //header/div[2]/div[3]/a
    Sleep     3s