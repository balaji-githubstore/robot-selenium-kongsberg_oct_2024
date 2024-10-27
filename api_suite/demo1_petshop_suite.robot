*** Settings ***
Library    RequestsLibrary 
Library    OperatingSystem

Suite Setup    Create Session    alias=petshopapi    url=https://petstore.swagger.io/v2
Suite Teardown    Delete All Sessions

*** Test Cases ***
TC1 Find Valid Pet 
    
    #by default assert expected_status=200
    ${response}    GET On Session    petshopapi    url=pet/25
    Log    ${response}
    Log    ${response.json()}
    Log    ${response.json()}[id]
    Log    ${response.json()}[name]
    #fetch id from category
    Log    ${response.json()}[category]
    Log    ${response.json()}[category][id]
    Should Be Equal As Integers    ${response.json()}[id]    25

TC2 Find Invalid Pet 
    ${response}    GET On Session    petshopapi    url=pet/78    expected_status=404
    Log    ${response.json()}
    Log    ${response.status_code}
    Log    ${response.text}
    Log    ${response.headers}

TC3 Find Valid Pet By Status
    ${response}    GET On Session    petshopapi    url=pet/findByStatus?status=sold    expected_status=200
    Log    ${response.json()}
    #log status of 1st pet in the list

    ${size}    Get Length    ${response.json()}

    FOR    ${i}    IN RANGE    0    ${size}    
        Log    ${response.json()}[${i}][status] 
        Should Be Equal As Strings    ${response.json()}[${i}][status]    sold
    END
    

TC4 Add Valid Pet 
    &{headers}     Create Dictionary        Content-Type=application/json    Connection=keep-alive
    ${json}     Get Binary File    path=${EXECDIR}${/}test-data${/}new_pet.json
   
    ${response}    POST On Session    petshopapi    url=pet    headers=${headers}    data=${json}
    Log    ${response.json()}
    Log    ${response.json()}[id]


TC5 Delete Valid Pet 
    DELETE On Session    


    

