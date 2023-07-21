*** Settings ***
Library         SeleniumLibrary
Resource        ../../../SuaceLabInventory/Resources/PageObjects/Login.robot
Resource        ../../../SuaceLabInventory/Resources/PageObjects/HomePage.robot
Variables       ../../../SuaceLabInventory/TestData/UI/SauceLab_Test_Details.yaml

Test Setup     Run keywords
...      Open Browser    ${URL}      ${Browser}
...      AND
...      Maximize Browser Window

Test Teardown      Close browser

*** Variables ***
${URL}      https://www.saucedemo.com/
${Browser}      chrome

*** Test Cases ***
Verify if a user will be able to login with a valid username and password.
    [Documentation]      Verify if a user will be able to login with a valid username and password.
    [Tags]      smoke    regression
    Verify login page
    Enter Username in the login page        ${valid_user}
    Enter Password in the login page        ${password}
    Click the login button
    Verify Home page

Verify if a user cannot login with a valid username and an invalid password.
    [Documentation]      Verify if a user will be able to login with a valid username and password.
    [Tags]      smoke    regression
    Verify login page
    Enter Username in the login page        ${valid_user}
    Enter Password in the login page        Password@223
    Click the login button
    Get error message and compare       Epic sadface: Username and password do not match any user in this service
    ${Boolean} =   Run keyword and return status
    ...   Verify Home page
    Run keyword if   ${Boolean}==True   fail   Logging in for invalid password


Verify if a user cannot login with an invalid username and a valid password.
    [Documentation]      Verify if a user cannot login with an invalid username and a valid password.
    [Tags]      smoke    regression
    Verify login page
    Enter Username in the login page        Praveenkumar
    Enter Password in the login page        ${password}
    Click the login button
    Get error message and compare       Epic sadface: Username and password do not match any user in this service
    ${Boolean} =   Run keyword and return status
    ...   Verify Home page
    Run keyword if   ${Boolean}==True   fail   Logging in for invalid username


Verify if a user cannot login with an invalid username and a invalid password.
    [Documentation]      Verify if a user cannot login with an invalid username and a invalid password.
    [Tags]      smoke    regression
    Verify login page
    Enter Username in the login page        Praveenkumar
    Enter Password in the login page        Password@123
    Click the login button
    Get error message and compare       Epic sadface: Username and password do not match any user in this service
    ${Boolean} =   Run keyword and return status
    ...   Verify Home page
    Run keyword if   ${Boolean}==True   fail   Logging in for invalid username and a invalid password.


Login with the locked-out user and verify the home page.
    [Documentation]      Login with the locked-out user and verify the home page.
    [Tags]      smoke    regression 
    Verify login page
    Enter Username in the login page        ${locked_out_user}
    Enter Password in the login page        ${password}
    Click the login button
    Get error message and compare       Epic sadface: Sorry, this user has been locked out.
    ${Boolean} =   Run keyword and return status
    ...   Verify Home page
    Run keyword if   ${Boolean}==True   fail   Logging in for locked out user


Login with problem_user and verify the home page.
    [Documentation]      Login with problem_user and verify the home page.
    [Tags]      smoke    regression
    Verify login page
    Enter Username in the login page        ${problem_user}
    Enter Password in the login page        ${password}
    Click the login button
    Verify Home page
    Verify the incorrect image in Home image

Login with performance_glitch_user and verify the home page.
    [Documentation]      Login with problem_user and verify the home page.
    [Tags]      smoke    regression
    Verify login page
    Enter Username in the login page        ${performance_glitch_user}
    Enter Password in the login page        ${password}
    Click the login button
    Verify Home page

Login with valid user and verify the home page in another tab.
    [Documentation]      Login with valid user and verify the home page in another tab.
    [Tags]      smoke    regression
    Verify login page
    Enter Username in the login page        ${valid_user}
    Enter Password in the login page        ${password}
    Click the login button
    Verify Home page
    ${url}=   Get Location
    Execute Javascript    window.open('${url}')
    Comment         Change to new window
    Switch Window   locator=NEW                      # do stuff in new tab
    Verify Home page

Login with the empty user name and verify the home page.
    [Documentation]      Login with the empty user name and verify the home page.
    [Tags]      smoke    regression 
    Verify login page
    Enter Username in the login page        ${EMPTY}
    Enter Password in the login page        ${password}
    Click the login button
    Get error message and compare       Epic sadface: Username is required
    ${Boolean} =   Run keyword and return status
    ...   Verify Home page
    Run keyword if   ${Boolean}==True   fail   Logging in for empty user name


Login with the empty password and verify the home page.
    [Documentation]      Login with the empty password and verify the home page.
    [Tags]      smoke    regression 
    Verify login page
    Enter Username in the login page        ${valid_user}
    Enter Password in the login page        ${EMPTY}
    Click the login button
    Get error message and compare       Epic sadface: Password is required
    ${Boolean} =   Run keyword and return status
    ...   Verify Home page
    Run keyword if   ${Boolean}==True   fail   Logging in for empty user name


Login with the empty user name and empty password and verify the home page.
    [Documentation]      Login with the empty user name and empty password and verify the home page.
    [Tags]      smoke    regression 
    Verify login page
    Enter Username in the login page        ${EMPTY}
    Enter Password in the login page        ${password}
    Click the login button
    Get error message and compare       Epic sadface: Username is required
    ${Boolean} =   Run keyword and return status
    ...   Verify Home page
    Run keyword if   ${Boolean}==True   fail   Logging in for empty user name

