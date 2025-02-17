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
#Click at the search button
#Add 'Slip Joint Pliers' in the shopping cart
#Click at 'Proceed to checkout'
#Click at 'Proceed to checkout' in the informative screen
#Click at 'Proceed to checkout' in the billing address screen
#Fill the payment details
#Click at 'Confirm'
#Click at 'Confirm'
