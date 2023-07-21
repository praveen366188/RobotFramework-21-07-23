*** Settings ***
Library             SeleniumLibrary
Resource            ../../../SuaceLabInventory/Resources/PageObjects/Login.robot
Resource            ../../../SuaceLabInventory/Resources/PageObjects/YourCartPage.robot
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
Verify the add product and verifying the shopping cart badge value
    [Documentation]    Verify the add product and verifying the shopping cart badge value
    [Tags]    smoke1    regression
    Login with a valid username and password
    ${actual_cart_value} =    Get the cart count
    Add the product to cart    ${sl_backpack}
    Verify the cart count    ${actual_cart_value}    Add
    ${actual_cart_value} =    Get the cart count
    Add the product to cart    ${sl_bike_light}
    Verify the cart count    ${actual_cart_value}    Add
    ${actual_cart_value} =    Get the cart count
    Add the product to cart    ${sl_bolt_tshirt}
    Verify the cart count    ${actual_cart_value}    Add
    ${actual_cart_value} =    Get the cart count
    Add the product to cart    ${sl_fleece_jacket}
    Verify the cart count    ${actual_cart_value}    Add
    ${actual_cart_value} =    Get the cart count
    Add the product to cart    ${sl_onesie}
    Verify the cart count    ${actual_cart_value}    Add
    ${actual_cart_value} =    Get the cart count
    Add the product to cart    ${sl_red_tshirt}
    Verify the cart count    ${actual_cart_value}    Add

Verify the Remove product and verifying the shopping cart badge value
    [Documentation]    Verify the remove product and verifying the shopping cart badge value
    [Tags]    smoke    regression
    Login with a valid username and password
    Add all the products to the cart
    ${actual_cart_value} =    Get the cart count
    Remove the product    ${sl_backpack}
    Verify the cart count    ${actual_cart_value}    Remove
    ${actual_cart_value} =    Get the cart count
    Remove the product    ${sl_bike_light}
    Verify the cart count    ${actual_cart_value}    Remove
    ${actual_cart_value} =    Get the cart count
    Remove the product    ${sl_bolt_tshirt}
    Verify the cart count    ${actual_cart_value}    Remove
    ${actual_cart_value} =    Get the cart count
    Remove the product    ${sl_fleece_jacket}
    Verify the cart count    ${actual_cart_value}    Remove
    ${actual_cart_value} =    Get the cart count
    Remove the product    ${sl_onesie}
    Verify the cart count    ${actual_cart_value}    Remove
    ${actual_cart_value} =    Get the cart count
    Remove the product    ${sl_red_tshirt}
    Verify the cart count    ${actual_cart_value}    Remove

After adding items to the cart, verify the product added in the cart
    [Documentation]    After adding items to the cart, verify the product added in the cart
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Verify the product in the cart page    ${sl_backpack}    present

After removing item from the homepage, verify the product not in the cart
    [Documentation]    After removing item from the homepage, verify the product not in the cart
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Verify the product in the cart page    ${sl_backpack}    present
    Go to    https://www.saucedemo.com/inventory.html
    Remove the product    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Verify the product in the cart page    ${sl_backpack}    absent

After removing item from the your cart page, verify the product not in the cart
    [Documentation]    After removing item from the homepage, verify the product not in the cart
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Remove the product    ${sl_backpack}
    Verify the product in the cart page    ${sl_backpack}    absent

After adding item from the home page, the add to cart button changes to remove button
    [Documentation]    After adding item from the home page, the add to cart button changes to remove button
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Verify the remove button for the product    ${sl_backpack}

After removing item from the home page, the remove button changes to add to cart button
    [Documentation]    After adding item from the home page, the add to cart button changes to remove button
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Verify the remove button for the product    ${sl_backpack}
    Remove the product    ${sl_backpack}
    Verify the add to cart button for the product    ${sl_backpack}

After adding items to the cart, verify the continue shopping button and verify home page navigation.
    [Documentation]    After adding items to the cart, verify the continue shopping button and verify home page navigation
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Click continue shopping button
    verify home page

After adding items to the cart, verify the checkout button and verify its navigating to Checkout: Your Information.
    [Documentation]    After adding items to the cart, verify the continue shopping button.
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Click the shopping cart button
    Verify Your Cart page
    Click Checkout button
    Verify Checkout Your Information Page

Add all the products to the cart and verify all the items are present in the cart
    [Documentation]    Add all the products to the cart and verify all the items are present in the cart
    [Tags]    smoke    regression
    Login with a valid username and password
    Add the product to cart    ${sl_backpack}
    Add the product to cart    ${sl_bike_light}
    Add the product to cart    ${sl_bolt_tshirt}
    Add the product to cart    ${sl_fleece_jacket}
    Add the product to cart    ${sl_onesie}
    Add the product to cart    ${sl_red_tshirt}
    Click the shopping cart button
    Verify Your Cart page
    Verify the product in the cart page    ${sl_backpack}    present
    Verify the product in the cart page    ${sl_bike_light}    present
    Verify the product in the cart page    ${sl_bolt_tshirt}    present
    Verify the product in the cart page    ${sl_fleece_jacket}    present
    Verify the product in the cart page    ${sl_onesie}    present
    Verify the product in the cart page    ${sl_red_tshirt}    present


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
