*** Settings ***
Library     SeleniumLibrary
Resource   ../Resources/LoginResources.robot

*** Test Cases ***
Register account and login    [Documentation]    This test case goes through the process of registering a new account and logging in    
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window
    Click Link    link:Sign in
    Wait Until Element Is Visible   link:Register your account
    Click Link    link:Register your account
    Wait Until Element Is Visible   id=first_name
    Input Text    id=first_name    ${first_name}
    Input Text    id=last_name     ${last_name} 
    Input Text    id=dob           ${dob}
    Input Text    id=street        ${street}
    Input Text    id=postal_code   ${postal_code}
    Input Text    id=city          ${city}
    Input Text    id=state         ${city}
    Select From List By Label    id=country    ${country}
    Input Text    id=phone         ${phone}
    Input Text    id=email         ${registration_email}
    Input Text    id=password      ${registration_password}
    Wait Until Element Is Visible   xpath://button[@type="submit"][contains(text(),"Register")]
    Click element   xpath://button[@type="submit"][contains(text(),"Register")]
    Wait Until Page Contains    Login
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Click element   xpath://input[@type="submit"]
