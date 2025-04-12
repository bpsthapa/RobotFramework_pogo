*** Settings ***
Library    SeleniumLibrary
Library    GetSeleniumLibraryInstance
Library    String
Library    Collections
Resource   ../pogoKeyword/Reuse.robot

Test Setup    Login to system
Test Teardown    Close All Browsers

*** Variables ***
@{actual_toltip}
@{Expected_toltip}    search for more    pogi meter    gem balance    message & gift inbox    friends list

*** Test Cases ***
Validate ToolTip
    [Tags]    SmokeTest
    Identify and read all tooltips on the homepage
    Validate that each tooltip text is displayed and matches the expected content

*** Keywords ***
Identify and read all tooltips on the homepage
    Collect the looltip in list    //input[@placeholder='Search for games']    //*[text()='Search for More']
    Collect the looltip in list    //pogicountbackground[@class='pogiPointsBackground__1FGf2']    //*[text()='Pogi Meter']
    Collect the looltip in list    //div[@class='container__24P8Y gemCount__21UA-']    //*[text()='Gem Balance']
    Collect the looltip in list    //img[@alt='Inbox Header Navigation Icon']    //*[text()='Message & Gift Inbox']
    Collect the looltip in list    //img[@alt='Friends Header Navigation Icon']    //*[text()='Friends List']

    Log To Console    ${actual_toltip}
    Log To Console    ${expected_toltip}
   
Validate that each tooltip text is displayed and matches the expected content
    ${len}=    Get Length    ${Expected_toltip}
    FOR    ${i}    IN RANGE    ${len}
        ${expected}=    Get From List    ${Expected_toltip}    ${i}
        ${actual}=      Get From List    ${actual_toltip}      ${i}
        Should Be Equal    ${expected.lower()}    ${actual.lower()}    Tooltip mismatch at index ${i}
    END
    
Collect the looltip in list
    [Arguments]    ${hoverOn}    ${el}
    Wait Until Element Is Visible      ${hoverOn}    10s
    Mouse Over    ${hoverOn}
    Wait Until Element Is Visible    ${el}    5s
    ${Toltip}    Get Text    ${el}
    ${Toltip}=    Convert To Lower Case    ${Toltip}
    Append To List    ${actual_toltip}    ${Toltip}