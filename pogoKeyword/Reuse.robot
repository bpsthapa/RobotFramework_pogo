*** Settings ***
Library    SeleniumLibrary
Resource   ../pogoKeyword/Reuse.robot
Resource   ../pogoKeyword/pgKeyword.robot

*** Variables ***
${Website}    https://www.pogo.com/
${browser}    chrome
${DriverLocation}    Driver/chromedriver
${username}    Bipin.thapa.sec@gmail.com
${password}    4f4DP111T!2ar&%6
${OUTPUT DIR}    RobotFramework_pogo/TestCases/ScreenShots

*** Keywords ***
Login to system
    Set Screenshot Directory    ${OUTPUT DIR}
    Visit url
    Click with log Display    //button[.//div[text()='Sign In']]    Sign In
    Wait Until Element Is Visible    email    10s
    Input Text    email    ${username}
    Click Element    content
    Click Element    logInBtn
    Wait Until Element Is Visible    password    10s
    Input Text    password    ${password}
    Click with log Display    logInBtn    LoginButton after Entering password
    Log To Console    ✅ *****LOGIN SUCCEED***** ✅

Visit url
    Open Browser    ${Website}    ${browser}    executable_path=${DriverLocation}
    Maximize Browser Window
    Log To Console    Website has opened

    


