*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/

    Select Frame    xpath=//frame[@name='login_page']

    #enter userid as john123
    Input Text    name=fldLoginUserId    jack123
    #click on continue
    #link or partial link text is case sensitive based on UI
    #xpath is based on html
    Click Element    link=CONTINUE

    Unselect Frame
    [Teardown]    Close Browser