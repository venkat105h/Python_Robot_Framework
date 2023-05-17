#------------------------------------------------------------------
#   Description       :      Common methods which can be called in any test case
#   Project           :      UniSecure File Explorer
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

COMMON_Open Browser And Enter URL
    [Documentation]  Launched browser, Navigates to specified URL
    [Arguments]  ${Var_URL}

    wait until keyword succeeds  10x  2s  Open Browser            ${Var_URL}          ${Browser_type}
    Set Window Size  		${WINDOW_WIDTH}  	${WINDOW_HEIGHT}


COMMON_Enter Credentials and Login To Solution
    [Documentation]  Enters the credentials and logs into the solution
    ...  Where  ${Var_Username} is Username to be entered
    ...  ${Var_Password}  is password to be entered
    ...  and ${RoleIndex} is the index number of role (1-Admin, 2-Operator, 3-Designer)

    [Arguments]  ${Var_Username}   ${Var_Password}  ${RoleIndex}

    # Enters Username and Password
    Wait Until Element Is Visible  ${UNI_USERNAME_TXT}  timeout=10
    Input Text      ${UNI_USERNAME_TXT}     ${Var_Username}
    Input Text      ${UNI_PASSWORD_TXT}     ${Var_Password}

    # Selects role as UNI_Operator
    Select From List By Index   ${UNI_ROLE_LIST}  ${RoleIndex}

    # Clicks on Login button
    Click Element               ${UNI_LOGIN_BTN}
    COMMON_Accept End User License Agreement
    Wait Until Element Is Visible  ${UNI_WELCOME_LINK}  timeout=10


COMMON_Accept End User License Agreement
    ${Status}=  Run Keyword and Return status   Wait Until Element Is Visible  ${UNI_ACCEPT_BTN}
    Run Keyword If  '${Status}'=='${True}'  Run Keywords  COMMON_Scroll To Element  ${UNI_ACCEPT_BTN}
    ...  AND   click Element  ${UNI_ACCEPT_BTN}
    ...  AND   COMMON_Scroll Page To Location  0  0


COMMON_Scroll Page To Location
    [Documentation]  Scrolls to the location mentioned
	[Arguments]    ${x_location}    ${y_location}
	Execute JavaScript    window.scrollTo(${x_location},${y_location})


COMMON_Scroll To Element
    [Documentation]  Scrolls till element is visible
    [Arguments]  ${ElementLocator}

    FOR  ${Index}   IN RANGE  0  5
        ${Visibility}=  Run Keyword And Return Status  Element Should Not Be Visible  ${ElementLocator}
        Exit For Loop If  '${Visibility}'=='${FALSE}'
        Execute JavaScript    window.scrollTo(0, 2000)
        ${ElementAddress}=   Run Keyword And Ignore Error  Get Webelement   ${ElementLocator}
        ${Status}=           Run Keyword And Return Status  Should Not Contain  ${ElementAddress}  FAIL
        Exit For Loop If  '${Status}'=='${TRUE}'
    END


COMMON_Clear Text Field
    [Documentation]  Clears text present in text field
    [Arguments]   ${SearchFieldID}

    ${Text}=    Get Text  ${SearchFieldID}
    ${CharacterCount}=  Get Length  ${Text}

    FOR    ${Index}    IN RANGE    ${CharacterCount}
        Press Keys    ${SearchFieldID}    BACKSPACE
    END


COMMON_Common Logout from Application
    [Documentation]  Logs out of the current application
    Wait Until Element Is Visible  ${UNI_CHANGE_ROLE_DD}
    Sleep  1S
    Click Element  ${UNI_CHANGE_ROLE_DD}
    Click Element  ${UNI_LOGOUT_LINK}
    Wait Until Element Is Visible  ${UNI_USERNAME_TXT}  timeout=10


COMMON_Verify Success Message
    [Documentation]  Verifies the message prefix in the message center
    [Arguments]  ${MessageID}

    Wait Until Element Is Visible  ${UNI_MSG_CENTER}  timeout=10

    # Verifies success message
    ${SuccessMessage}=  Get Text  ${UNI_MSG_CENTER}
    ${Status}=  Run Keyword And Return Status  Should Contain   ${SuccessMessage}  ${MessageID}

    Click Element  ${UNI_DISMISS_MSG_CNTR}

    Run Keyword If  '${Status}'!='${TRUE}'  Fail


COMMON_Save Changes
    [Documentation]  Mouse hover on Options button and save changes
    #Mouse Over              ${UNI_FLOAT_OPTN_BTN}
    Sleep  1S
    Click Element           ${UNI_FLOAT_SAVE_BTN}
    Wait Until Element Is Visible  ${UNI_MSG_CENTER}  timeout=10


COMMON_Expand/Collapse in Navigator
    [Documentation]  Expands or collapse the navigator menu
    [Arguments]  ${Expand/Collapse}  ${NavID}

    Mouse Over  ${NavID}
    ${ClassAttr}=  Get Element Attribute  ${NavID}  class
    ${CollapseStatus}=  Run Keyword And Return Status  Should Contain  ${ClassAttr}  collapsed
    Run Keyword If  '${CollapseStatus}'=='${TRUE}' and '${Expand/Collapse}'=='Expand'  Click Element  ${NavID}
    Run Keyword If  '${CollapseStatus}'=='${FALSE}' and '${Expand/Collapse}'=='Collapse'  Click Element  ${NavID}

