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
#--------- Login Credentials only for testing purposes
${email}    customer@practicesoftwaretesting.com
${password}    welcome01

*** Keywords ***
Awake
    SeleniumLibrary.Set Screenshot Directory     ${screenshot_dir}
    Screenshot.Set Screenshot Directory     ${screenshot_dir}

#Open the tool shop demo login page
OpenWebsite
    Open Browser    ${url}     ${browser}    
    Maximize Browser Window
    Sleep    1s