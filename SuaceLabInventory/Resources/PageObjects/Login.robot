*** Settings ***
Documentation       Login reusable keywords

Library             SeleniumLibrary
Resource            ../../../SuaceLabInventory/Helpers/UI/SauceLab_Common.robot


*** Variables ***
${login_page_header}        xpath://div[text()='Swag Labs']
${login_username}           id:user-name
${login_password}           id:password
${login_submit_button}      css:#login-button
${error_message_login}      xpath://h3[@data-test="error"]


*** Keywords ***
Verify login page
    [Documentation]    verify we are landed into the login page
    wait until element is visible    ${login_page_header}
    capture page screenshot

Enter Username in the login page
    [Documentation]    We are entering username in the username field on the login page.
    [Arguments]    ${username}
    Verify login page
    Smart Input    ${login_username}    ${username}

Enter Password in the login page
    [Documentation]    We are entering Password in the Password field on the login page.
    [Arguments]    ${password}
    Verify login page
    Smart Input    ${login_password}    ${password}

Click the login button
    [Documentation]    Click the login button on the login page.
    Smart Click    ${login_submit_button}

Get error message and compare
    [Documentation]    Get the error message from the login page and compare
    [Arguments]    ${expected_error}
    ${actual_error} =    Get text    ${error_message_login}
    Should be equal    ${actual_error}    ${expected_error}
    capture page screenshot
