*** Settings ***
Library      SeleniumLibrary
Library    Collections

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.db4free.net/
    #click on phpMyAdmin »
    # //b[contains(text(),'phpMyAdmin')]

    Click Element    partial link=phpMyAdmin123
    Switch Window    phpMyAdmin
    Input Text    id=input_username    admin
    #enter password as admin123
    #click login 

    #check what is happening? 
    Close Window  
    Switch Window    db4free.net - MySQL Database for free
    #check what title is logged in the log.html? 
    Log Title
    [Teardown]    Run Keywords    Log Title    AND    Close Browser    

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.db4free.net/
    #click on phpMyAdmin »
    # //b[contains(text(),'phpMyAdmin')]

    Click Element    partial link=phpMyAdmin123
    Switch Window    NEW
    Input Text    id=input_username    admin
    #enter password as admin123
    #click login 

    #check what is happening? 
    Close Window  
    Switch Window    MAIN
    #check what title is logged in the log.html? 
    Log Title
    [Teardown]    Run Keywords    Log Title    AND    Close Browser    

TC3
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.db4free.net/
    #click on phpMyAdmin »
    # //b[contains(text(),'phpMyAdmin')]

    Click Element    partial link=phpMyAdmin
    
    @{windows}     Get Window Handles
    Log   ${windows}


