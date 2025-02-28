*** Settings ***
Library     SeleniumLibrary
Resource   ../Resources/LoginResources.robot

*** Test Cases ***
Configure Screenshots to save in Screenshots folder
    SeleniumLibrary.Set Screenshot Directory     ${screenshot_dir}
    Screenshot.Set Screenshot Directory     ${screenshot_dir}

Open Website
#Open the tool shop demo website
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window

#Click at the sign-in option
ClickSignIn
    Click Link    link:Sign in

#Click at the 'register your account' link
ClickRegister
    Wait Until Element Is Visible   link:Register your account
    Click Link    link:Register your account

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
     Sleep    1s
    #CreateScreenshot

#Click at the 'Register' button
ClickRegisterButton
    Wait Until Element Is Visible   xpath://button[@type="submit"][contains(text(),"Register")]
    Click element   xpath://button[@type="submit"][contains(text(),"Register")]
    Sleep    1s
    

#Enter the correct email for the newly created user
InsertCorrectUsername
    Wait Until Page Contains    Login
    Input Text    id=email    ${email}
    
#Enter the correct password for the newly created user
InsertCorrectPassword
    Input Text    id=password    ${password}

#Click at the login button
ClickLoginButton
    Click element   xpath://input[@type="submit"]
