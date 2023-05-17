#------------------------------------------------------------------
#   Description       :      Common methods which can be called in any test case
#   Project           :      Preferences Automation
#   Author            :      Dinesh Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation     Common method used accross Test Suite

Variables         ../Variables/${TESTENV}_Variable.py
Library           BuiltIn
Library           SeleniumLibrary  timeout=10.0
Library           ../Generic/GenericMethods.py
Resource          ../Locators/Generic_Locators.robot


*** Keywords ***
SEC/S360_Open Browser And Enter URL
    [Documentation]  Launched browser, Navigates to specified URL

    [Arguments]  ${Var_URL}

    Wait Until Keyword Succeeds  10x  2s  Open Browser            ${Var_URL}          ${Browser_type}
    Set Window Size  		${WINDOW_WIDTH}  	${WINDOW_HEIGHT}

SEC/S360_Enter Credentials and Login To Solution
    [Documentation]  Enters the credentials and logs into the solution
    ...  Where  ${Var_Username} is Username to be entered
    ...  ${Var_Password}  is password to be entered
    ...  and ${RoleIndex} is the index number of role (1-Admin, 2-Operator, 3-Designer)

    [Arguments]  ${Var_Username}   ${Var_Password}  ${RoleIndex}

    # Enters Username and Password
    Input Text      ${SEC/S360_USERNAME_TXT}     ${Var_Username}
    Input Text      ${SEC/S360_PASSWORD_TXT}     ${Var_Password}

    # Selects role as UNI_Operator
    Wait Until Element Is Visible    id=welcomeToTxt
    Select From List By Index   ${SEC/S360_ROLE_LIST}  ${RoleIndex}

    # Clicks on Login button
    Click Element               ${SEC/S360_LOGIN_BTN}
    SEC/S360_Accept End User License Agreement
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10

SEC/S360_Accept End User License Agreement
    ${Status}=  Run Keyword and Return status   Wait Until Element Is Visible  ${SEC/S360_ACCEPT_BTN}
    Run Keyword If  '${Status}'=='${True}'  Run Keywords  SEC/S360_Scroll To Element  ${SEC/S360_ACCEPT_BTN}
    ...  AND   click Element  ${SEC/S360_ACCEPT_BTN}
    ...  AND   SEC/S360_Scroll Page To Location  0  0

SEC/S360_Scroll Page To Location
    [Documentation]  Scrolls to the location mentioned

	[Arguments]    ${x_location}    ${y_location}
	Execute JavaScript    window.scrollTo(${x_location},${y_location})

SEC/S360_Scroll To Element
    [Documentation]  Scrolls till element is visible

     [Arguments]  ${ElementLocator}

    FOR  ${Index}   IN RANGE  0  5
       ${Visibility}=  Run Keyword And Return Status  Element Should Not Be Visible  ${ElementLocator}
       Exit For Loop If  '${Visibility}'=='${FALSE}'
       Execute JavaScript    window.scrollTo(0, 2000)
       ${ElementAddress}=   RUN KEYWORD AND IGNORE ERROR  Get Webelement   ${ElementLocator}
       ${Status}=           Run Keyword And Return Status  Should Not Contain  ${ElementAddress}  FAIL
       Exit For Loop If  '${Status}'=='${TRUE}'
    END

SEC/S360_Navigate To Pages
    [Documentation]  Navigates to multiple pages if more than ten artifacts are present in a single page.
    ...  Takes Total number of pages to navigate and the Files present in first page
    ...  Returns the total numbers of files found after navigating to all the pages

    [Arguments]  ${TotalNumberOfPages}  ${FileCount}  ${Element}

    FOR    ${Page}    IN RANGE    1    ${TotalNumberOfPages}
       Click Element  ${UNI_NEXT_BTN}
       ${FileCountPerPage}=  Get Element Count  ${Element}
       ${FileCount} =  Evaluate  ${FileCountPerPage}+${FileCount}
    END
    [Return]  ${FileCount}

SEC/S360_Clear Text Field
    [Documentation]  Clears text present in text field

    [Arguments]   ${SearchFieldID}

    ${Text}=    Get Value  ${SearchFieldID}
    ${CharacterCount}=  Get Length  ${Text}

    FOR    ${Index}    IN RANGE    ${CharacterCount}
#        Press Key    ${SearchFieldID}    \\8
        Press Keys    ${SearchFieldID}    BACKSPACE
    END

SEC/S360_Common Logout
    [Documentation]  Logs out of the current application

    Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    Click Element  ${SEC/S360_LOGOUT_LINK}

SEC/S360_Verify Success Message
    [Documentation]  Verifies the message prefix in the message center

    [Arguments]  ${MessageID}

    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=10

    # Verifies success message
    ${SuccessMessage}=  Get Text  ${SEC/S360_MSG_CENTER}
    ${Status}=  Run Keyword And Return Status  Should Contain   ${SuccessMessage}  ${MessageID}
    Sleep  2S

    Click Element  ${SEC/S360_DISMISS_MSG_CNTR}
    [Return]  ${Status}

SEC/S360_Save Changes
    [Documentation]  Mouse hover on Options button and save changes

    #Mouse Over              ${SEC/S360_FLOAT_OPTN_BTN}
    Sleep  1S
    Click Element           ${SEC/S360_FLOAT_SAVE_BTN}
    ${PopupFoundStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_PREF_POPUP_SAVE_BTN}
    Run Keyword If  '${PopupFoundStatus}'=='True'  Click Element  ${SEC/S360_PREF_POPUP_SAVE_BTN}
    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20

SEC/S360_Generate Random Strings
    [Documentation]  Generates a string of 10 characters

    ${S_Name}=  Generate Random String  10  [LETTERS]
    [Return]  ${S_Name}
