*** Settings ***
Library     SeleniumLibrary
Library    Screenshot

Resource   ../Resources/LoginResources.robot

*** Variables ***



*** Test Cases ***
Awake
    SeleniumLibrary.Set Screenshot Directory     ${screenshot_dir}
    Screenshot.Set Screenshot Directory     ${screenshot_dir}

OpenWebsite
#Open the tool shop demo website
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window
    Sleep    1s

#Click at the sign-in option
ClickSignIn
    Click Link    link:Sign in
    Sleep    1s

#Click at the 'register your account' link
ClickRegister
    Click Link    link:Register your account
    Sleep     1s

#Fill the data in
FillRegistrationData
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
    #CreateScreenshot
    Sleep     1s

#Click at the 'Register' button
ClickRegisterButton
    Click element   xpath://button[@type="submit"]
    Sleep     1s
    

#Enter the correct email for the newly created user
InsertCorrectUsername
    Wait Until Page Contains    Login
    Input Text    id=email    ${email}
    
#Enter the correct password for the newly created user
InsertCorrectPassword
    Input Text    id=password    ${password}
    Sleep     1s

#Click at the login button
ClickLoginButton
    Click element   xpath://input[@type="submit"]
    Sleep     5s


*** Keywords ***
CreateScreenshot
    Execute JavaScript    window.scrollTo(0, 1000)
    Capture Page Screenshot     screenshot.png