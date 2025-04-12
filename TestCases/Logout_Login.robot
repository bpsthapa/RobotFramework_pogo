*** Settings ***
Library    SeleniumLibrary
Resource   ../pogoKeyword/Reuse.robot

Test Setup    Login to system
Test Teardown    Close All Browsers

*** Variables ***

*** Test Cases ***
Log out and re-login the account
    [Tags]    SmokeTest
    logout from the system
    re-login to the system


*** Keywords ***
logout from the system
    Click with log Display    //img[@alt='Avatar Image']    Profile
    Sleep    2s
    Scroll Element Into View    //div[contains(text(),'Sign Out')]
    Click with log Display    //button[@class='default__1rbFd secondary__13sCi button__3Z-Ug']    SignOut
    Click with log Display    //button[@class='large__2-kkI primary__3GVte button__3Z-Ug']    CONTINUE to logout
    Wait Until Element Is Visible     //button[.//div[text()='Sign In']]    10s

    
re-login to the system
    Login to system
    

    
