*** Settings ***
Library     SeleniumLibrary
Library    Screenshot


*** Variables ***
${browser}    edge
${url}    https://practicesoftwaretesting.com/#/
${screenshot_dir}    Screenshots/

*** Test Cases ***
Awake
    SeleniumLibrary.Set Screenshot Directory     ${screenshot_dir}
    Screenshot.Set Screenshot Directory     ${screenshot_dir}

#Open the tool shop demo login page
OpenWebsite
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window
    Sleep    1s

#Search for a tool
SearchTool
    Input Text    id=search-query    Pliers
#Click at the search button
    Click element   xpath://button[@type="submit"]
    Sleep    1s
    
#Add 'Slip Joint Pliers' in the shopping cart
PutToolInCart
    ClickImageLink    Slip Joint Pliers
    #Click Link    link: Slip Joint Pliers
    Wait Until Page Contains    Add to cart
    Click Button    id=btn-add-to-cart
    Sleep    1s
    Click Element    xpath=//body/app-root[@ng-version='17.1.1']/app-header/nav[@class='navbar navbar-expand-lg navbar-light bg-light']/div[@class='container']/div[@id='navbarSupportedContent']/ul[@class='navbar-nav ms-auto mb-2 mb-lg-0']/li[5]/a[1]
    Sleep    1s

*** Keywords ***
ClickImageLink
    [Arguments]    ${ImageAlt}
    Click Element    xpath=//img[@alt="${ImageAlt}"]/ancestor::a
    Sleep    1s
