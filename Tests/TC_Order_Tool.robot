*** Settings ***
Library     SeleniumLibrary
Resource   ../Resources/LoginResources.robot

*** Variables ***
${browser}    edge
${url}    https://practicesoftwaretesting.com/#/


*** Test Cases ***
#Open the tool shop demo login page
Order Tool
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
    Wait Until Page Contains    Slip Joint Pliers
    Click Image Of Product    Slip Joint Pliers
    Wait Until Page Contains    Add to cart
    Click Button    id=btn-add-to-cart
    Wait Until Element Is Visible    xpath=//a[@href="/checkout"]
    Click Element    xpath=//a[@href="/checkout"]
    Wait until page contains    Proceed to checkout
    Click Button    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-1"]
    Click Button    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-2"]
    Input Text    id=state         ${city}
    Input Text    id=postal_code   ${postal_code}
    Wait Until Element Is Visible    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-3"]
    Click Button    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-3"]
    Select From List By Label    id=payment-method    Buy Now Pay Later
    Wait Until Element Is Visible    id=monthly_installments
    Select From List By Label    id=monthly_installments    3 Monthly Installments
    Click Button    xpath=//button[@type='button'][contains(text(),'Confirm')][@data-test="finish"]
    Click Link    link:Sign in
    Wait Until Page Contains    Login
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Click element   xpath://input[@type="submit"]
    Wait Until Page Contains    My account


*** Keywords ***
Click Image Of Product
    [Arguments]    ${ImageAlt}
    Click Element    xpath=//img[@alt="${ImageAlt}"]/ancestor::a