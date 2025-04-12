*** Settings ***
Library    SeleniumLibrary
Resource   ../pogoKeyword/Reuse.robot

*** Variables ***


*** Keywords ***
Click with log Display
    [Arguments]    ${element}    ${message}
    Log To Console    clicking on ${message}
    Wait Until Element Is Enabled    ${element}    10s
    Wait Until Element Is Visible    ${element}    10s
    Click Element    ${element}