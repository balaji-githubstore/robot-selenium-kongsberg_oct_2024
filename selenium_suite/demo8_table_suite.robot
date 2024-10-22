*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/checkbox.html

    


TC2 Print names
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/checkbox.html

    FOR    ${i}    IN RANGE    1    11    
        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        IF    '${name}'=='Thor Walton'
            Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
            BREAK
        END
    END

# //table[@id='example']//tbody//tr[1]//td[2]
TC3 Print names
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/checkbox.html

    #print names from all pages
    
    ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr

    FOR    ${i}    IN RANGE    1    ${row_count}+1    
        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
    END
