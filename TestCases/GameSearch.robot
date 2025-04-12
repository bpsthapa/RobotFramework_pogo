*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../pogoKeyword/Reuse.robot

Test Setup    Login to system
Test Teardown    Close All Browsers

*** Variables ***
${game}    solitaire
@{game_texts}
@{game_texts_2}

*** Test Cases ***
Validate the Game Search
    [Tags]    SmokeTest
    Search for a specific game
    Verify that the game appears in the search results
    Navigate to the game’s page and validate that the Play Now button is present

*** Keywords ***
Search for a specific game
    [Documentation]    This iwll perform the search on the Homepage
    Wait Until Element Is Enabled    //input[@placeholder='Search for games']
    Input Text    //input[@placeholder='Search for games']    ${game}
    Press Keys    //input[@placeholder='Search for games']    ENTER


Verify that the game appears in the search results
    [Documentation]    This will check all the search results with its title and sub titles and check if the 
    ...    search results are accurate.
    Sleep    4s
    Wait Until keyword Succeeds    10s    5    Scroll Element Into View    //a[normalize-space()='Home']
    #Title
    ${element_1}=    Get WebElements    //a[@class='link__2M5Vp gameName__31gZM']
    #Sub Title
    ${elements2}=    Get WebElements    //span[@class='categoryLabel__exxVq']
    
    ${count}=    Get Element Count    //a[@class='link__2M5Vp gameName__31gZM']
    
    Log To Console    The total found result is: ${count}
    #Get all the title of each results and store in list
    FOR    ${el}    IN    @{element_1}
        ${text}=    Get Text    ${el}
        ${lower_text}=    Convert To Lower Case    ${text}
        Append To List    ${game_texts}    ${lower_text}
	END
    Log To Console    ${game_texts}

    #Get all the sub title of each results and store in list
    FOR    ${el_2}    IN    @{elements2}
        ${text}=    Get Text    ${el_2}
        ${lower_text}=    Convert To Lower Case    ${text}
        Append To List    ${game_texts_2}    ${lower_text}
	END
    
    #check if each search results contain solitaire either in title or in sub-title
    ${length}=    Get Length    ${game_texts}
    FOR    ${index}    IN RANGE    ${length}
        ${val1}=    Get From List    ${game_texts}    ${index}
        ${val2}=    Get From List    ${game_texts_2}    ${index}
        IF    '${game}' in '${val1}' or '${game}' in '${val2}'
            Log To Console    ✅ Game Name found that matches with search keyword at index ${index}
        ELSE
            Fail    ❌ Game '${game}' incorrect search result found which is ${val1}
        END
    END

Navigate to the game’s page and validate that the Play Now button is present
    [Documentation]    This will open each search result in new tab and check if the there is Play Now button or not. 
    ...    If its dont found Play Now button in any of the game page then this test will failed
    Sleep    4s
    Wait Until keyword Succeeds    10s    5    Scroll Element Into View    //a[normalize-space()='Home']
    ${elements}=    Get WebElements    //a[@class='link__2M5Vp gameName__31gZM']

    FOR    ${el}    IN    @{elements}
        Wait Until keyword Succeeds    10s    5    Scroll Element Into View    ${el}
        Open game in new tab and check the playnow button   ${el}
	END

Open game in new tab and check the playnow button
    [Documentation]    Since some of the game has Try For Free insead of Play Now. 
    ...    I have check play icon to deal with both cases
    [Arguments]    ${el}
    ${gameName}=    Get Text    ${el}

    ${main_tab}    Get Window Handles
    ${main_tab}=    Set Variable    ${main_tab}[0]
    ${link}=    Get Element Attribute    ${el}    href
    Execute JavaScript    window.open("${link}", "_blank");
    Sleep    5s
    ${tabs}=    Get Window Handles
    #switch to new tab
    Switch Window    ${tabs}[-1]
    
    #Wait Until Element Is Visible    //*[text()='Play Now']    20    ****Play Now button is missing for: ${gameName}*****
    Wait Until Element Is Visible    css:.playIcon__3ndLd    20    ****Play Now or Try Now button is missing for: ${gameName}*****
    Close Window
    Sleep    5s

    #switch back to main tab
    Switch Window    ${main_tab}
    Set Screenshot Directory    NONE
    Run Keyword And Ignore Error    Click Element    //button[.//div[text()='Cancel']]
    Set Screenshot Directory    ${OUTPUT DIR}