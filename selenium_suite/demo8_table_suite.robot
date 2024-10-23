*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Launch Browser
    [Arguments]    ${browser}
    Open Browser    browser=${browser}    
    Maximize Browser Window
    Set Selenium Implicit Wait    4s

Print Each Cell
        [Arguments]    ${table_xpath}      ${cell}
        ${row_count}    Get Element Count    xpath=${table_xpath}//tbody//tr
        FOR    ${i}    IN RANGE    1    ${row_count}+1    
            Scroll Element Into View    xpath=${table_xpath}//tbody//tr[${i}]//td[${cell}]
            ${name}    Get Text    xpath=${table_xpath}//tbody//tr[${i}]//td[${cell}]
            Log To Console    ${name}
        END

Get Salary For Employee 
        [Arguments]    ${table_xpath}      ${employee_name}
        [Documentation]    returns Salary
        ${row_count}    Get Element Count    xpath=${table_xpath}//tbody//tr
        FOR    ${i}    IN RANGE    1    ${row_count}+1    
            ${name}    Get Text    xpath=${table_xpath}//tbody//tr[${i}]//td[2]
            ${sal}    Get Text    xpath=${table_xpath}//tbody//tr[${i}]//td[6]
            Exit For Loop If    '${employee_name}'=='${name}'
        END
        Return From Keyword    ${sal}
        # [Return]    ${sal}


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
    
    FOR    ${page}    IN RANGE    1    7  
         
        ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
        FOR    ${i}    IN RANGE    1    ${row_count}+1    
            Scroll Element Into View    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            Log To Console    ${name}
        END
        Click Element    css=[aria-label='Next']
    END

TC4 Print names
    Open Browser    browser=chrome    
    Maximize Browser Window
    Set Selenium Implicit Wait    4s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/checkbox.html

    #print names from all pages

    ${output}    Run Keyword And Ignore Error    Click Element    css=[aria-label='Next']    
    Log    ${output}

    ${output}    Run Keyword And Ignore Error    Element Should Be Enabled    css=[aria-label='Next']    
    Log    ${output}

    ${output}    Run Keyword And Ignore Error    Get Element Attribute    css=[aria-label='Next']    tabindex   
    Log    ${output}
    ${attribute}    Get Element Attribute    css=[aria-label='Next']    tabindex
    Log    ${attribute}
   

TC6 Print names
    Open Browser    browser=chrome    
    Maximize Browser Window
    Set Selenium Implicit Wait    4s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/checkbox.html

    #print names from all pages

    ${output}    Run Keyword And Ignore Error    Get Element Attribute    css=[aria-label='Next']    tabindex   
    Log    ${output}
    Log    ${output}[0]
    Log    ${output}[1]  

    WHILE    '${output}[1]' != '-1'
        ${output}    Run Keyword And Ignore Error    Get Element Attribute    css=[aria-label='Next']    tabindex  
        ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
        FOR    ${i}    IN RANGE    1    ${row_count}+1    
            Scroll Element Into View    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            Log To Console    ${name}
        END
        Click Element    css=[aria-label='Next']

        # IF    '${output}[1]' == '-1'
        #     BREAK
        # END
        
    END

TC7 
    Launch Browser    chrome
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/checkbox.html

    #print names from all pages
    ${output}    Run Keyword And Ignore Error    Get Element Attribute    css=[aria-label='Next']    tabindex   
     WHILE    '${output}[1]' != '-1'
        ${output}    Run Keyword And Ignore Error    Get Element Attribute    css=[aria-label='Next']    tabindex  
        Print Each Cell    //table[@id='example']    2
        Click Element    css=[aria-label='Next']    
    END

TC8
    Launch Browser    chrome
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/checkbox.html
    ${sal}    Get Salary For Employee    //table[@id='example']    Brenden Wagner
    Log To Console    ${sal}
    Get Salary For Employee    $table_xpath    $employee_name
