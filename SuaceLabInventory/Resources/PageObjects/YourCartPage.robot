*** Settings ***
Library         SeleniumLibrary
Resource        ../../../SuaceLabInventory/Helpers/UI/SauceLab_Common.robot
Documentation    Home page reusable keywords

*** Variables ***
${cart_page_verification}            xpath://span[text()='Your Cart']
${continue_shopping_btn}            id:continue-shopping
${checkout_btn}            id:checkout

*** Keywords ***
Verify Your Cart page
    [Documentation]     verify we are landed into the your cart page
    wait until element is visible     ${cart_page_verification}
    capture page screenshot

Verify the product in the cart page
    [Documentation]   Verify the product is present in the cart page
    [Arguments]    ${product_name}     ${present_or_absent}
    IF    '${present_or_absent}' == 'present'
        Element should be visible       //div[contains(text(),'${product_name}')]
    ELSE
        Element should not be visible       //div[contains(text(),'${product_name}')]
    END

Click continue shopping button
    [Documentation]     click continue shopping button
    Smart Click     ${continue_shopping_btn}

Click Checkout button
    [Documentation]     Click Checkout button
    Smart Click     ${checkout_btn}
    capture page screenshot