*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${screenshot_directory}    ${CURDIR}/Screenshots
${browser}    edge
${url}    https://practicesoftwaretesting.com/#/

*** Test Cases ***
Test
#Open the tool shop demo website
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window
    Sleep    1s

#Click at the sign-in option
    Click Link    link:Sign in
    Sleep    1s

#Click at the 'register your account' link
    Click Link    link:Register your account
    Sleep     1s

#Fill the data in
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
    Sleep     3s
    Close Browser

#Click at the 'Register' button
    Click Element    button=Register
    Sleep     3s

#Enter the correct email for the newly created user

#Enter the correct password for the newly created user

#Click at the login button
