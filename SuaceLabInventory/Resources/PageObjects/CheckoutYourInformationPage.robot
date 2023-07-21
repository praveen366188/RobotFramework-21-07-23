*** Settings ***
Library         SeleniumLibrary
Resource        ../../../SuaceLabInventory/Helpers/UI/SauceLab_Common.robot
Documentation    Home page reusable keywords

*** Variables ***
${checkout_your_information_verification}            xpath://span[text()='Checkout: Your Information']
${element_first_name}            id:first-name
${element_last_name}            id:last-name
${element_postal_code}            id:postal-code
${cancel_button}            id:cancel
${continue_button}            id:continue


*** Keywords ***
Verify Checkout Your Information Page
    [Documentation]     verify we are landed into the your cart page
    wait until element is visible     ${checkout_your_information_verification}
    capture page screenshot

Click Cancel button
    [Documentation]     click the cancel button
    Smart Click    ${cancel_button}

Click Continue button
    [Documentation]     click the Continue button
    Smart Click    ${continue_button}

Enter first name
    [Documentation]     Enter first name
    [Arguments]     ${FirstName}
    Smart Input     ${element_first_name}    ${FirstName}

Enter last name
    [Documentation]     Enter last name
    [Arguments]     ${LastName}
    Smart Input     ${element_last_name}    ${LastName}

Enter zip postal code
    [Documentation]     Enter zip postal code
    [Arguments]     ${Zipcode}
    Smart Input     ${element_postal_code}    ${Zipcode}

Fill your information form on checkout screen
    [Documentation]     Fill your information form on checkout screen
    [Arguments]     ${FirstName}    ${LastName}    ${Zipcode}
    Enter first name     ${FirstName}
    Enter last name      ${LastName}
    Enter zip postal code     ${Zipcode}