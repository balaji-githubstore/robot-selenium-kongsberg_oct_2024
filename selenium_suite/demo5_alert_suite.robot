*** Settings ***
Library    SeleniumLibrary

Test Setup    Open Browser    browser=chrome
Test Teardown    Run Keywords    Log Title   AND    Close Browser

*** Test Cases ***
TC1
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    #click on Go
    Click Element    xpath=//img[@alt='Go']
    ${actual_alert_text}    Handle Alert    action=DISMISS    timeout=20s
    Log    ${actual_alert_text}
    Should Be Equal As Strings    ${actual_alert_text}    Customer ID${SPACE}${SPACE}cannot be left blank.

TC2
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    #click on Go
    Click Element    xpath=//img[@alt='Go']
    
    Alert Should Be Present    text=Customer ID${SPACE}${SPACE}cannot be left blank.    action=ACCEPT
    ...    timeout=20s

TC3
    [Setup]
    Log To Console    Balaji Dinakaran
    [Teardown]    None