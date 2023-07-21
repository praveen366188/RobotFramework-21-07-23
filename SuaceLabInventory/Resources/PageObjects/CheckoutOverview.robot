*** Settings ***
Library         SeleniumLibrary
Resource        ../../../SuaceLabInventory/Helpers/UI/SauceLab_Common.robot
Documentation    Home page reusable keywords

*** Variables ***
${checkout_overview_verification}            xpath://span[text()='Checkout: Overview']
${total_amount}            xpath://div[contains(@class,'summary_total_label')]
${finish_btn}            id:finish


*** Keywords ***

Verify Checkout Overview Page
    [Documentation]     Verify Checkout Overview Page
    wait until element is visible     ${checkout_overview_verification}


Verify we got zero dollers in the checkmate overview page
    [Documentation]     Verify we got zero dollers in the checkmate overview page
    ${amount} =       Get text     ${total_amount}
    Should be equal     ${amount}     Total: $0.00
    capture page screenshot

Click Finish button
    [Documentation]     click finish button
    Smart Click    ${finish_btn}