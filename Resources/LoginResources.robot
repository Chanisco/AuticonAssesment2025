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
${registration_email}     demoa@specialisterren.nl
${registration_password}     12345678!aBhjkadshjdaskhasdjkhasdjk

#--------- Login Credentials only for testing purposes
${email}    customer@practicesoftwaretesting.com
${password}    welcome01

#--------- Purchase details
${product}    Slip Joint Pliers
${payment_method}    Buy Now Pay Later
${monthly_installments}    3 Monthly Installments

*** Keywords ***
Set Screenshot Directory to Screenshotsfolder
    [Documentation]    This keyword sets the directory for the screenshots into the Screenshots folder for better structure.
    SeleniumLibrary.Set Screenshot Directory     ${screenshot_dir}
    Screenshot.Set Screenshot Directory     ${screenshot_dir}
