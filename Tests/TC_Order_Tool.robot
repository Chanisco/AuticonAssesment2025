*** Settings ***
Library     SeleniumLibrary
Resource   ../Resources/LoginResources.robot

*** Test Cases ***
TC_Order_Tool Process     [Documentation]    This test case goes through the process Login in, Searching for a product, Adding it to the cart, and completing the purchase
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window
    Click Link    link:Sign in
    Wait Until Page Contains    Login
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Click element   xpath://input[@type="submit"]
    Wait Until Page Contains    My account
    Click Element    xpath=//a[@class="navbar-brand"]
    Wait Until Page Contains     Search
    Input Text    id=search-query    Pliers
    Click element   xpath://button[@type="submit"]
    Wait Until Page Contains    ${product}
    Click Product Image    ${product}
    Wait Until Page Contains    Add to cart
    Click Button    id=btn-add-to-cart
    Wait Until Element Is Visible    xpath=//a[@href="/checkout"]
    Click Element    xpath=//a[@href="/checkout"]
    Wait until page contains    Proceed to checkout
    Click Button    xpath=//button[@data-test="proceed-1"]
    Click Button    xpath=//button[@data-test="proceed-2"]
    Input Text    id=state         ${city}
    Input Text    id=postal_code   ${postal_code}
    Wait Until Element Is Visible    xpath=//button[@data-test="proceed-3"]
    Click Button    xpath=//button[@data-test="proceed-3"]
    Select From List By Label    id=payment-method    ${payment_method}
    Wait Until Element Is Visible    id=monthly_installments
    Select From List By Label    id=monthly_installments    ${monthly_installments}
    Click Button    xpath=//button[@data-test="finish"]
    Wait Until Element Is Enabled    xpath=//div[@class='help-block'][contains(text(),'Payment was successful')]
    Click Button    xpath=//button[@data-test="finish"]
    Wait Until Page Contains    Thanks for your order

*** Keywords ***
Click Product Image
    [Documentation]    This keyword clicks on the product image based on the alt text to add the product to the cart.
    [Arguments]    ${ImageAlt}
    Click Element    xpath=//img[@alt="${ImageAlt}"]/ancestor::a