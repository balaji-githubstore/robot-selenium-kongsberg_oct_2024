*** Settings ***
Library     AutoItLibrary
Library    SeleniumLibrary
Test Teardown   Close Browser

*** Comments ***
http://the-internet.herokuapp.com/basic_auth
http://username:password@the-internet.herokuapp.com/basic_auth

#1. windows auth
#2. Upload activity

https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Go To    url=http://admin:admin@the-internet.herokuapp.com/basic_auth
    Sleep    2s

TC2
    Open Browser    browser=chrome
    Go To    url=http://the-internet.herokuapp.com/basic_auth
    Win Wait Active    WindowTitle=the-internet.herokuapp.com/basic_auth - Google Chrome
    ...     WindowText=${EMPTY}    TimeOut=15
    AutoItLibrary.Send      admin
    AutoItLibrary.Send      {TAB}
    AutoItLibrary.Send      admin
    AutoItLibrary.Send      {ENTER}
    Sleep    5s

TC3
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Click Element    link=Select PDF file
    Sleep    2s
    Control Focus    Open    ${EMPTY}    Edit1
    Control Set Text    Open    ${EMPTY}    Edit1    ${EXECDIR}${/}profile.pdf
    Control Click    Open     ${EMPTY}    Button1
    Sleep    5s
