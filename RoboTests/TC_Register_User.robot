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
    Input Text    id=first_name    user1
    Input Text    id=last_name    user1last name
    Input Text    id=dob    10/10/1990
    Input Text    id=street    Kobaltweg 11
    Input Text    id=postal_code    3542CE
    Input Text    id=city    Utrecht
    Input Text    id=state    Utrecht
    Select From List By Label    id=country    Netherlands (the)
    Input Text    id=phone    0612345678
    Input Text    id=email    demoa@specialisterren.nl
    Input Text    id=password    12345678!aB
    Sleep     1s

#Click at the 'Register' button
ClickRegisterButton
    #Click element    xpath://html/body/app-root[1]/div[1]/app-register[1]/div[1]/div[1]/div[1]/form[1]/div[1]/button[1]
    Click element   xpath://button[@type="submit"]
    Execute JavaScript    window.scrollTo(0, 1000)
    Take Screenshot   RegisterUserError.jpg    ${screenshot_dir}
    Sleep     20s
    

#Enter the correct email for the newly created user
InsertCorrectUsername
    Input Text    id=email    demoa@specialisterren.nl
    
#Enter the correct password for the newly created user
InsertCorrectPassword
    Input Text    id=password    12345678!aB
    Sleep     1s

#Click at the login button
ClickLoginButton
    Click element   xpath://input[@type="submit"]
    Sleep     20s

    #old password for testing 1267t3861237867812

