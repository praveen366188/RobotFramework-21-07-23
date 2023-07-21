*** Settings ***
Library         SeleniumLibrary
Documentation    Suite description

*** Keywords ***
Smart Click
    [Arguments]    ${Webelement}
    wait until element is visible    ${Webelement}     30s
    click element    ${Webelement}

Smart Input
    [Arguments]    ${Webelement}    ${Text}
    wait until element is visible    ${Webelement}     30s
    input text    ${Webelement}    ${Text}

Get text and compare
    [Documentation]   Get text and compare
    [Arguments]    ${locator}    ${expected_message}
    ${actual_message} =       Get text     ${locator}
    Should be equal     ${actual_message}     ${expected_message}
