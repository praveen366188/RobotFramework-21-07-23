*** Settings ***
Documentation       Home page reusable keywords

Library             SeleniumLibrary
Resource            ../../../SuaceLabInventory/Helpers/UI/SauceLab_Common.robot


*** Variables ***
${checkout_complete_verification}       xpath://span[text()='Checkout: Complete!']
${checkout_complete_thanks_message}     xpath://h2[text()='Thank you for your order!']
${checkout_complete_message}            class:complete-text
${back_to_home}                         id:back-to-products


*** Keywords ***
Verify Checkout Complete Page
    [Documentation]    Verify Checkout Complete Page
    wait until element is visible    ${checkout_complete_verification}

    wait until element is visible    ${checkout_complete_thanks_message}
    wait until element is visible    ${checkout_complete_message}
    Get text and compare
    ...    ${checkout_complete_message}
    ...    Your order has been dispatched, and will arrive just as fast as the pony can get there!
    wait until element is visible    ${back_to_home}
