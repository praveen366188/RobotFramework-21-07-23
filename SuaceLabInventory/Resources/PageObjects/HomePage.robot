*** Settings ***
Library         SeleniumLibrary
Resource        ../../../SuaceLabInventory/Helpers/UI/SauceLab_Common.robot
Documentation    Home page reusable keywords

*** Variables ***
${home_page_tiles}            id:inventory_container
${shopping_cart_badge}            class:shopping_cart_badge
${shopping_cart}            class:shopping_cart_link

*** Keywords ***
Verify Home page
    [Documentation]     verify we are landed into the home page
    wait until element is visible     ${home_page_tiles}
    capture page screenshot

Verify the incorrect image in Home image
    [Documentation]     verify we are landed into the home page
    FOR    ${i}    IN RANGE    1    6
           ${actual_error} =       Get element attribute     xpath=(//img[@class='inventory_item_img'])[${i}]      src
           Should be equal     ${actual_error}     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    END
    capture page screenshot

Add the product to cart
    [Documentation]   Click Add to cart button
    [Arguments]    ${product_name}
    ${Boolean} =   Run keyword and return status
    ...   Element should be visible      //div[contains(text(),'${product_name}')]/../../..//button[text()='Add to cart']
    IF    ${Boolean} == True
        Smart Click      //div[contains(text(),'${product_name}')]/../../..//button[text()='Add to cart']
    ELSE
        fail   Already in the cart
    END

Remove the product
    [Documentation]   Click remove from cart button
    [Arguments]    ${product_name}

    ${Boolean} =   Run keyword and return status
    ...   Element should be visible      //div[contains(text(),'${product_name}')]/../../..//button[text()='Remove']
    IF    ${Boolean} == True
        Smart Click      //div[contains(text(),'${product_name}')]/../../..//button[text()='Remove']
    ELSE
        fail   Not in the cart
    END

Verify the remove button for the product
    [Documentation]   Verify the remove button for the product
    [Arguments]    ${product_name}
    Element should be visible      //div[contains(text(),'${product_name}')]/../../..//button[text()='Remove']

Verify the add to cart button for the product
    [Documentation]   Verify the add to cart button for the product
    [Arguments]    ${product_name}
    Element should be visible   //div[contains(text(),'${product_name}')]/../../..//button[text()='Add to cart']


Get the cart count
    [Documentation]   Get the cart count
    ${actual_count}    Set Variable    ${0}    #${}
    ${Boolean} =   Run keyword and return status
    ...   Element should be visible      ${shopping_cart_badge}
    IF    ${Boolean} == True
        ${actual_count} =       Get text     ${shopping_cart_badge}
        ${actual_count} =   convert to integer    ${actual_count}
    END
    [Return]      ${actual_count}

Verify the cart count
    [Arguments]    ${count_before}     ${adding_or_removing}
    [Documentation]   Verify the cart count
    IF    '${adding_or_removing}' == 'Add'
        ${present_count_expected} =     Evaluate    ${count_before}+1
        ${present_count_actual} =     Get the cart count
    ELSE
        ${present_count_expected} =     Evaluate    ${count_before}-1
        ${present_count_actual} =     Get the cart count
    END
    Should be equal as integers    ${present_count_expected}    ${present_count_actual}

Click the shopping cart button
    smart click    ${shopping_cart}