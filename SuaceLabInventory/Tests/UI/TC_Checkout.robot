*** Settings ***
Library             SeleniumLibrary
Resource            ../../../SuaceLabInventory/Resources/PageObjects/Login.robot
Resource            ../../../SuaceLabInventory/Resources/PageObjects/YourCartPage.robot
Resource            ../../../SuaceLabInventory/Resources/PageObjects/CheckoutOverview.robot
Resource            ../../../SuaceLabInventory/Resources/PageObjects/CheckoutCompletePage.robot
Resource            ../../../SuaceLabInventory/Resources/PageObjects/CheckoutYourInformationPage.robot
Resource            ../../../SuaceLabInventory/Resources/PageObjects/HomePage.robot
Variables           ../../../SuaceLabInventory/TestData/UI/SauceLab_Test_Details.yaml

Test Setup          Run keywords
...                     Open Browser    ${URL}    ${Browser}
...                     AND
...                     Maximize Browser Window
Test Teardown       Close browser


*** Variables ***
${URL}          https://www.saucedemo.com/
${Browser}      chrome


*** Test Cases ***
After adding items to the cart, verify its navigationg to your cart page after clicking cancel button
    [Documentation]    After adding items to the cart, verify its navigationg to your cart page after clicking cancel button in the checkout your information page
    [Tags]    smoke    regression 
    Login with a valid username and password
    Add all the products to the cart
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${sl_last_name}    ${sl_zipcode}
    Click Cancel button
    Verify Your Cart page

After adding items to the cart, verify its navigationg to Checkout overview after clicking continue button
    [Documentation]    After adding items to the cart, verify its navigationg to Checkout overview after clicking continue button in the checkout your information page
    [Tags]    smoke    regression 
    Login with a valid username and password
    Add all the products to the cart
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${sl_last_name}    ${sl_zipcode}
    Click Continue button
    Verify Checkout Overview Page

Enter an empty first name and verify the error on the checkout information page.
    [Documentation]    Enter an empty first name and verify the error on the checkout information page.
    [Tags]    smoke    regression    
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${EMPTY}    ${sl_last_name}    ${sl_zipcode}
    Click Continue button
    Get error message and compare    Error: First Name is required
    ${Boolean} =    Run keyword and return status
    ...    Verify Checkout Overview Page
    IF    ${Boolean}==True
        fail    navigate to checkout overview page after entering empty value
    END

Enter an empty last name and verify the error on the checkout information page.
    [Documentation]    Enter an empty last name and verify the error on the checkout information page.
    [Tags]    smoke    regression    
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${EMPTY}    ${sl_zipcode}
    Click Continue button
    Get error message and compare    Error: Last Name is required
    ${Boolean} =    Run keyword and return status
    ...    Verify Checkout Overview Page
    IF    ${Boolean}==True
        fail    navigate to checkout overview page after entering empty value
    END

Enter an empty zip code and verify the error on the checkout information page.
    [Documentation]    Enter an empty zip code and verify the error on the checkout information page.
    [Tags]    smoke    regression    
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${sl_last_name}    ${EMPTY}
    Click Continue button
    Get error message and compare    Error: Postal Code is required
    ${Boolean} =    Run keyword and return status
    ...    Verify Checkout Overview Page
    IF    ${Boolean}==True
        fail    navigate to checkout overview page after entering empty value
    END

Check out the empty cart and verify the zero amount.
    [Documentation]    Check out the empty cart and verify the zero amount.
    [Tags]    smoke    regression    
    Login with a valid username and password
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${sl_last_name}    ${sl_zipcode}
    Click Continue button
    Verify Checkout Overview Page
    Verify we got zero dollers in the checkmate overview page

Verify the finish button in the checkout Overview page and verify its navigating to the checkout complete page
    [Documentation]    Verify the finish button in the checkout Overview page and verify its navigating to the checkout complete page
    [Tags]    smoke    regression    
    Login with a valid username and password
    Add all the products to the cart
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${sl_last_name}    ${sl_zipcode}
    Click Continue button
    Verify Checkout Overview Page
    click finish button
    Verify Checkout Complete Page

Verify the cancel button in the checkout Overview page and verify its navigating to the home page
    [Documentation]    Verify the cancel button in the checkout Overview page and verify its navigating to the home page
    [Tags]    smoke    regression    
    Login with a valid username and password
    Add all the products to the cart
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${sl_last_name}    ${sl_zipcode}
    Click Continue button
    Verify Checkout Overview Page
    Click cancel button
    Verify home page

Verify Checkout's complete page
    [Documentation]    Verify Checkout's complete page
    [Tags]    smoke    regression
    Login with a valid username and password
    Add all the products to the cart
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page
    Fill your information form on checkout screen    ${sl_first_name}    ${sl_last_name}    ${sl_zipcode}
    Click Continue button
    Verify Checkout Overview Page
    click finish button
    Verify Checkout Complete Page


*** Keywords ***
Login with a valid username and password
    [Documentation]    Login with a valid username and password
    Verify login page
    Enter Username in the login page    ${valid_user}
    Enter Password in the login page    ${password}
    Click the login button
    Verify Home page

Add all the products to the cart
    Add the product to cart    ${sl_backpack}
    Add the product to cart    ${sl_bike_light}
    Add the product to cart    ${sl_bolt_tshirt}
    Add the product to cart    ${sl_fleece_jacket}
    Add the product to cart    ${sl_onesie}
    Add the product to cart    ${sl_red_tshirt}
