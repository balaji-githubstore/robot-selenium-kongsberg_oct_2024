*** Settings ***
Variables    demo123.py   
Library    demo123 


*** Test Cases ***
TC1
    Log To Console    ${username_locator}
    Log To Console    ${username_locator}

TC2
    ${text}    Say Hello
    Log To Console    ${text}
    ${res}    Add    3    4
    Log To Console    ${res}