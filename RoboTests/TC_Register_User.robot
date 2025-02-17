*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${screenshot_directory}    ${CURDIR}/Screenshots
${browser}    edge
${url}    https://practicesoftwaretesting.com/#/

*** Test Cases ***
Test
#Open the tool shop demo website
    Open Browser    https://practicesoftwaretesting.com/#/    edge
    Maximize Browser Window
    Sleep    3s

#Click at the sign-in option


#Click at the 'register your account' link

#Fill the data in

#Click at the 'Register' button

#Enter the correct email for the newly created user

#Enter the correct password for the newly created user

#Click at the login button
