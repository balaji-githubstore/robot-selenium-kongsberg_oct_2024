*** Settings ***
Library    Collections
Library    OperatingSystem
Library    RPA.JSON

*** Variables ***
${BROWSER_NAME}    Chrome
@{COLORS}    red    green     yellow    blue
&{MY_DETAILS}    my_name=bala    role=trainer    mobile=898883

*** Test Cases ***
TC8
    Log To Console    ${MY_DETAILS}
    Log To Console    ${MY_DETAILS}[mobile]
    &{android_dic}     Create Dictionary    platformName=android    deviceName=Oneplus    app=zomato
    # Log To Console    ${android_dic}[platformName]
    ${output}    Get From Dictionary    ${android_dic}    platformName    ios
    Log To Console    ${output}

TC1
    Log To Console    ${BROWSER_NAME}

TC2
    Log To Console    ${BROWSER_NAME}
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[1]
    #create list and load mango, banana, orange
    @{fruits}    Create List    mango    banana    orange
    Log To Console    ${fruits}

    #append item grapes to the list 
    Append To List    ${fruits}    grapes
    #insert kiwi at index 1
    Insert Into List    ${fruits}    1    kiwi
    #remove mango

    #print final output

TC4
    @{fruits}     Create List     mango    banana    orange
    Log     ${fruits}  
    Append To List    ${fruit_s}    grapes    kiwi
    Log     ${fruits}    
    Insert Into List    ${fruits}    1    apple
    Log    ${fruits}
    Remove Values From List    ${fruits}    mango
    Log    ${fruits}

    ${count}     Get Length    ${fruits} 
    Log    ${count}

    #print each item from the list using for loop


TC6
    @{fruits}     Create List     mango    banana    orange   grapes    kiwi
    ${count}      Get Length    ${fruits}
    Log To Console    ${count}

    FOR    ${i}    IN RANGE    0    ${count}    
        Log To Console    ${fruits}[${i}]
    END
    
TC7
    @{fruits}     Create List     mango    banana    orange   grapes    kiwi
    FOR    ${val}    IN    @{fruits}
        Log To Console   ${val}
    END


