*** Settings ***
Library    SeleniumLibrary

Test Tags    smoke

*** Test Cases ***
TC1
    [Tags]    login
    Open Browser    url=https://www.facebook.com/    browser=chrome
    ${actual_title}    Get Title
    Log To Console    ${actual_title}
    #get the url and print it
    ${actual_url}    Get Location
    Log To Console    ${actual_url}
    #get the page source and print it
    ${actual_page_source}    Get Source
    Log    ${actual_page_source}
    Sleep    5s

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=https://www.facebook.com/
    # Input Text    locator=id:email    text=hello1233444@gmail.com
    Input Text    id=email    hello1233444@gmail.com
    Input Password    id=pass    welcome12344
    Click Element    name=login

TC3
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    #wait for page load to complete
    Go To    url=https://www.facebook.com/
    #check for presence of locator in 0.5s 
    Click Element    link=Create new account
    #enter first name as john
    Input Text    name=firstname    john
    #enter lastname as wick
    #click on custom radio button
    Click Element    xpath=//input[@value='-1']

    #20 Jun 1992
    Select From List By Label    id=day    20

    Select From List By Label    id=month    Jun
    # Select From List By Value    id=day    6
    # Select From List By Index    id=day    5

    






