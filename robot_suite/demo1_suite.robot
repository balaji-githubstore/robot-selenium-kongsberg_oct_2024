*** Settings ***
Library    DateTime
Library    String

*** Test Cases ***
TC1
    Log To Console    message=Balaji Dinakaran    
    Log To Console  Balaji

TC2
    ${session}    Set Variable    RobotFramework Session
    Log To Console    ${session}

TC3 
    ${radius}    Set Variable    10
    #calculate area of circle and print it
    ${output}    Evaluate    3.14*${radius}*${radius}
    Log To Console    ${output}
    Log    ${output}

TC4
    ${current_date}    Get Current Date
    Log To Console    ${current_date}

TC5
    Set Local Variable    ${mail_id}    john1@gmail.com
    Log To Console    ${mail_id}
    ${output}    Remove String    ${mail_id}    @gmail.com
    Log To Console    ${output}
    ${output}    Fetch From Left    ${mail_id}    @
    Should Be Equal As Strings    ${output}    john1
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}    john1



TC6
    ${str} =	Remove String	Robot Framework	    o	bt
    Should Be Equal	${str}	R Framewrk


    
