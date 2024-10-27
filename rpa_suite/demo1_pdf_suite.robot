*** Settings ***
Library    RPA.PDF
Library    Collections

*** Test Cases ***
TC1    
    ${page_count}    Get Number Of Pages    C:${/}Mine${/}profile.pdf
    Log To Console    ${page_count}

TC2
    ${text}    Get Text From Pdf    C:${/}Mine${/}profile.pdf
    Log     ${text}
    ${page1}    Convert To Integer    1
    Log     ${text}[${page1}]

    ${keys}    Get Dictionary Keys    ${text}
    Log    ${keys}

TC3
    Open Pdf    C:${/}Mine${/}profile.pdf
    ${text}    Get Text From Pdf 
    Log     ${text}
    Close Pdf