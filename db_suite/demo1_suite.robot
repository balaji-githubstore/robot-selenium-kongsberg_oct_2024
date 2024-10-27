*** Settings ***
Library    DatabaseLibrary

Suite Setup    

Suite Teardown    Disconnect From Database

*** Keywords ***
Connect All Database
    Connect To Database     db_module=pymysql     db_name=dbfree_db    db_user=dbfree_db
     ...     db_password=12345678     db_host=db4free.net  db_port=3306   alias=mysql
    Connect To Database     db_module=pymysql     db_name=dbfree_db    db_user=dbfree_db
     ...     db_password=12345678     db_host=db4free.net  db_port=3306   alias=mssql

*** Test Cases ***
TC1
    Switch Database    alias=mysql
    #  Connect To Database     db_module=pymysql     db_name=dbfree_db    db_user=dbfree_db
    #  ...     db_password=12345678     db_host=db4free.net  db_port=3306
     ${count}    Row Count    select * from Products where product_id<10
     Log To Console    ${count}
    #  [Teardown]     Disconnect From Database

TC2
    Switch Database    alias=mssql
    Row Count Is 0    select * from Products where product_id=4
    Row Count Is Equal To X    select * from Products where product_id<10    7

TC3
    Execute Sql String    update Products set productname='bala' where product_id=4
    Row Count Is Equal To X    select * from Products where productname='bala' and product_id=4    1

TC5
    ${result}    Query    select * from Products
    Log    ${result}
    Log    ${result}[0]
    Log    ${result}[0][0]