*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${screenshot_directory}    ${CURDIR}/Screenshots
${browser}    edge
${url}    https://practicesoftwaretesting.com/#/

*** Test Cases ***
Test
    Open Browser    https://practicesoftwaretesting.com/#/    edge
    Maximize Browser Window
    Click Element     data-test=nav-sign-in
    #Input Text    name=q    test
    #Click Button    name=btnK
    Sleep    time_in_seconds=3