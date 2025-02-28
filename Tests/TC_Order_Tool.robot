*** Settings ***
Library     SeleniumLibrary
Resource   ../Resources/LoginResources.robot

Suite Setup    Awake

*** Variables ***
${browser}    edge
${url}    https://practicesoftwaretesting.com/#/


*** Test Cases ***
#Open the tool shop demo login page
Open Website
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window
    Sleep    1s

#Login to website before the case
Login To Website
    Click Link    link:Sign in
    Wait Until Page Contains    Login
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Click element   xpath://input[@type="submit"]
    Wait Until Page Contains    My account
    Click Element    xpath=//a[@class="navbar-brand"]

#Search for a tool
SearchTool
    Wait Until Page Contains     Search
    Input Text    id=search-query    Pliers
#Click at the search button
    Click element   xpath://button[@type="submit"]
    
# Add 'Slip Joint Pliers' in the shopping cart
Put Tool In Cart
    ClickImageLink    Slip Joint Pliers
    Wait Until Page Contains    Add to cart
    Click Button    id=btn-add-to-cart
    Wait Until Element Is Visible    xpath=//a[@href="/checkout"]
    Click Element    xpath=//a[@href="/checkout"]

#Click at 'Proceed to checkout'
ProceedInCart-StepOne Cart
    Wait until page contains    Proceed to checkout
    Click Button    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-1"]

#Click at 'Proceed to checkout' in the informative screen
ProceedInCart-StepTwo Sign In
    Click Button    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-2"]

#Click at 'Proceed to checkout' in the billing address screen
ProceedInCart-StepThree Billing Address
    Input Text    id=state         ${city}
    Input Text    id=postal_code   ${postal_code}
    Wait Until Element Is Visible    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-3"]
    Click Button    xpath=//button[@type='button'][contains(text(),'Proceed to checkout')][@data-test="proceed-3"]


##Fill the payment details
ProceedInCart-StepFour Payment
    Select From List By Label    id=payment-method    Buy Now Pay Later
    Wait Until Element Is Visible    id=monthly_installments
    Select From List By Label    id=monthly_installments    3 Monthly Installments

#Click at 'Confirm'
FinishTransaction
    Click Button    xpath=//button[@type='button'][contains(text(),'Confirm')][@data-test="finish"]

DelayAtTheEnd
    Sleep    5s


*** Keywords ***
ClickImageLink
    [Arguments]    ${ImageAlt}
    Click Element    xpath=//img[@alt="${ImageAlt}"]/ancestor::a