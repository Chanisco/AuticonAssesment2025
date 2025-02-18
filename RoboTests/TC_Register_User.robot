*** Settings ***
Library     SeleniumLibrary
Library    Screenshot


*** Variables ***
${browser}    edge
${url}    https://practicesoftwaretesting.com/#/
${screenshot_dir}    Screenshots/


${first_name}    user1
${last_name}    user1last name
${dob}    10/10/1990
${street}    Kobaltweg 11
${postal_code}    3542CE
${city}    Utrecht
${country}    Netherlands (the)
${phone}    0612345678
${email}    s@specialisterren.nl
${password}    12345678!aB1267t3861237867812


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
    Input Text    id=email         ${email}
    Input Text    id=password      ${password}
    #CreateScreenshot
    Sleep     1s

#Click at the 'Register' button
ClickRegisterButton
    #Click element    xpath://html/body/app-root[1]/div[1]/app-register[1]/div[1]/div[1]/div[1]/form[1]/div[1]/button[1]
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

    #old password for testing 1267t3861237867812

*** Keywords ***
CreateScreenshot
    Execute JavaScript    window.scrollTo(0, 1000)
    Capture Page Screenshot     screenshot.png