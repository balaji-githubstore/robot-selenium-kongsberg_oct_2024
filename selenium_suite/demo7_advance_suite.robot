*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']    file_path=C:${/}Mine${/}profile.pdf
    # Choose File    xpath=//input[@type='file']    file_path=C:${/}Mine${/}demo.txt

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']    file_path=${EXECDIR}${/}files${/}profile.pdf
    # Choose File    xpath=//input[@type='file']    file_path=C:${/}Mine${/}demo.txt
    
TC3
    Log To Console    C:\\Mine\\profile.pdf
    Log To Console    C:${/}Mine${/}profile.pdf
    Log To Console    ${EXECDIR}
    Log To Console    ${CURDIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}


TC4 CSS
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.facebook.com/
    # Input Text    locator=id:email    text=hello1233444@gmail.com
    Input Text    css=#email    hello1233444@gmail.com
    Input Password    css=#pass    welcome12344
    Click Element    css=button[name='login']

TC5
    Open Browser    browser=chrome    options=add_argument("start-maximized");add_argument("--disable-notifications");
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.malaysiaairlines.com/us/en/home.html
    Click Element    xpath=//span[text()='Accept all cookies']
    #from
    #to 

    #date field - approach 1- not working
    # Input Text    xpath=//input[@name='dateDeparture']    25 Oct 2024

    #date field - approach 2- automate the calendar

    #date field - approach 3- use javascript 
    Execute Javascript    document.querySelector("input[name='dateDeparture']").value='29 Oct 2024'
    Execute Javascript    document.querySelector("input[name='dateReturn']").value='29 Nov 2024'


     #date field - approach 4 - use javascript and webelment
    ${departure_element}    Get WebElement    xpath=//div[@id='book-flight']//input[@name='dateDeparture']
    Execute Javascript    arguments[0].value='29 Oct 2024'    ARGUMENTS    ${departure_element}

    ${return_element}    Get WebElement    xpath=//div[@id='book-flight']//input[@name='dateReturn']
    Execute Javascript    arguments[0].value='29 Nov 2024'    ARGUMENTS    ${return_element}

    ${output}    Execute Javascript    return document.querySelector("#book-flight input[name='dateDeparture']").value
    Log To Console    ${output}


    #assign id and then use in js
    Assign Id To Element    xpath=//div[@id='book-flight']//input[@name='dateReturn']    mine_work
    Execute Javascript    document.querySelector("#mine_work").value='29 Oct 2024'
    Sleep    5s
    

    
TC5
    Open Browser    browser=chrome    alias=b1
    Open Browser     browser=edge    alias=b2

    Switch Browser    b2
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.malaysiaairlines.com/us/en/home.html
    Click Element    xpath=//span[text()='Accept all cookies']

    Switch Browser    b2
    Go To    url=https://www.google.com

    Close Browser
    Close All Browsers

    

