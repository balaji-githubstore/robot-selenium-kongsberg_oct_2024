*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.salesforce.com/in/form/signup/freetrial-sales/
    Input Text    name=UserFirstName       john
    Input Text    xpath=//input[contains(@id,'UserLastName')]    wick
    Input Text    name=UserEmail       john@gmail.com
    Select From List By Label    name=UserTitle    IT Manager
    Input Text    name=CompanyName       CCCS
    Select From List By Label    name=CompanyCountry    United Kingdom
    Select From List By Label    name=CompanyEmployees    101 - 200 employees
    Click Element    xpath=(//div[@class='checkbox-ui'])[2]    
    Click Element    name=start my free trial
    ${actual_error}    Get Text    xpath=//span[contains(text(),'valid phone')]
    Log    ${actual_error}
    Element Text Should Be    xpath=//span[contains(text(),'valid phone')]    Enter a valid phone number
