*** Settings ***
Library    OperatingSystem


*** Test Cases ***
TC1
    Append To Environment Variable    path    C:${/}Users${/}Balaji_Dinakaran${/}.cache${/}selenium${/}chromedriver${/}win64${/}130.0.6723.58
    Log Environment Variables
    Create Directory    path=${EXECDIR}${/}downloads
    Directory Should Exist    path=${EXECDIR}${/}downloads

TC3
    Log    ${TEMPDIR}
    @{files}    List Files In Directory    path=${TEMPDIR}      pattern=dd_Back*  
    Log    ${files}
    
    #print all file name that contains "python"

