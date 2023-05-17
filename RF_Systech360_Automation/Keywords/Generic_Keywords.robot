#------------------------------------------------------------------
#   Description       :      Common methods which can be called in any test case
#   Project           :      Common Keywords
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

Library           BuiltIn
Library           String
Library           Collections
Library           SeleniumLibrary    timeout=${Selenium_Timeout}    run_on_failure=Nothing
Library           DateTime
Library           ../Generic/GenericMethods.py
Resource          ../Locators/Generic_Locators.robot
Resource          ../Locators/Enterprise_Notification_Locators.robot
Resource          ../Locators/Operator_Locators.robot
Variables         ../Variables/Variable.py

*** Keywords ***

SEC/S360_Open Browser And Enter URL
    [Documentation]  Launched browser, Navigates to specified URL
    [Arguments]  ${Var_URL}
    wait until keyword succeeds  10x  2s  Open Browser  ${Var_URL}  ${Browser_type}
    maximize browser window
    # Set Window Size  		${WINDOW_WIDTH}  	${WINDOW_HEIGHT}


SEC/S360_Enter Credentials and Login To Solution
    [Documentation]  Enters the credentials and logs into the solution
    ...  Where  ${Var_Username} is Username to be entered
    ...  ${Var_Password}  is password to be entered
    ...  and ${RoleValue} is the index number of role (0-Admin, 1-Operator, 2-Designer)gi
    [Arguments]  ${Var_Username}   ${Var_Password}  ${RoleValue}
    # Enters Username and Password
    ${is_your_connection_not_private}=    run keyword and return status    element should not be visible      ${ADVANCED_BTN}
    run keyword if    '${is_your_connection_not_private}'=='False'   run keywords    click element    ${ADVANCED_BTN}
    Wait Until Element Is Visible  ${SEC/S360_USERNAME_TXT}
    ${is_account_field_present}=   run keyword and return status    element should not be visible      ${SEC/S360_ACC_ID}
    run keyword if    '${is_account_field_present}'=='False'    Input Text      ${SEC/S360_ACC_ID}           eng_ga8100
    Wait Until Element Is Visible    id=welcomeToTxt
    wait until keyword succeeds    3x    1s    Input Text      ${SEC/S360_USERNAME_TXT}     ${Var_Username}
    wait until keyword succeeds    3x    1s    Input Text      ${SEC/S360_PASSWORD_TXT}     ${Var_Password}

    # Selects role
    wait until keyword succeeds    3x    2s    Select From List By Value   ${SEC/S360_ROLE_LIST}  ${RoleValue}

    # Clicks on Login button
    Click Element               ${SEC/S360_LOGIN_BTN}
    run keyword and ignore error    wait until element is not visible    ${SEC/S360_LOGIN_BTN}    10s
    SEC/S360_Accept End User License Agreement


SEC/S360_Accept End User License Agreement
    [Documentation]  Accept end user license aggrement
    ${Status}=    Run Keyword and Return status    element should be visible    ${SEC/S360_ACCEPT_BTN}
    Run Keyword If  '${Status}'=='${True}'  Run Keywords  Scroll Element Into View  ${SEC/S360_ACCEPT_BTN}
    ...  AND   click Element  ${SEC/S360_ACCEPT_BTN}
    ...  AND   wait until element is not visible    ${SEC/S360_ACCEPT_BTN}
    ...  AND   SEC/S360_Scroll Page To Location  0  0


SEC/S360_Login Precondition
    [Documentation]    Logs in with the expected user
    [Arguments]    ${URL}    ${Username}    ${Password}    ${Role}
    Sleep    1s
    Go To    ${URL}
    SEC/S360_Enter Credentials and Login To Solution    ${Username}    ${Password}    ${Role}
    Wait Until Element Is Visible    ${SEC/S360_WELCOME_LINK}


SEC/S360_Common Logout
    [Documentation]  Logs out of the current application
    SEC/S360_Scroll Page To Location  0  0
    reload page
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_CHANGE_ROLE_DD}
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_LOGOUT_LINK}
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_LOGOUT_LINK}
    Wait Until Element Is Visible  ${SEC/S360_USERNAME_TXT}


SEC/S360_Scroll Page To Location
    [Documentation]  Scrolls to the location mentioned
	[Arguments]    ${x_location}    ${y_location}
	Execute JavaScript    window.scrollTo(${x_location},${y_location})


SEC/S360_Scroll To Element
    [Documentation]  Scrolls till element is visible
    [Arguments]  ${ElementLocator}
    FOR    ${Index}   IN RANGE  0  5
        ${Visibility}=  Run Keyword And Return Status  Element Should Not Be Visible  ${ElementLocator}
        Exit For Loop If  '${Visibility}'=='${FALSE}'
        Execute JavaScript   window.scrollTo(0, 2000)
        ${ElementAddress}=   Run Keyword And Ignore Error  Get Webelement   ${ElementLocator}
        ${Status}=   Run Keyword And Return Status  Should Not Contain  ${ElementAddress}  FAIL
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
    Input Text    ${SearchFieldID}    ${EMPTY}    TRUE
#    ${Text}=    Get Value  ${SearchFieldID}
#    ${CharacterCount}=  Get Length  ${Text}
#
#    FOR    ${Index}  IN RANGE  ${CharacterCount}
#        Press Keys    ${SearchFieldID}    \\8
#    END


Clear Field Of Characters
    [Arguments]    ${field}    ${character_count}
    [Documentation]    This keyword pushes the delete key (ascii: \8) a specified number of times in a specified field.

    FOR    ${Index}    IN RANGE    ${character_count}
        Press Keys    ${field}    BACKSPACE
   END

SEC/S360_Verify Success Message
    [Documentation]  Verifies the message prefix in the message center
    [Arguments]  ${MessageID}
	Wait Until Page Contains Element  ${SEC/S360_MSG_CENTER}  timeout=20
    # Verifies success message
    ${SuccessMessage}=  Get Text  ${SEC/S360_MSG_CENTER}
    wait until keyword succeeds  5x  2s    click element      ${S360_EN_APPROVE_BUTTON}
    ${Status}=  Run Keyword And Return Status  Should Contain   ${SuccessMessage}  ${MessageID}

    [Return]  ${Status}


SEC/S360_Verify Success Message In Two Parts
    [Documentation]  Verifies the message prefix in the message center
    [Arguments]  ${MessageID}
    @{Success_Message_ID_After_Match}=  Get Regexp Matches  ${MessageID}  [A-Za-z]{3}[0-9]{6}[A-Za-z]{1}
	${Success_Message_ID_After_Match_Length}=  Get Length  ${Success_Message_ID_After_Match}
	Run Keyword If  ${Success_Message_ID_After_Match_Length}<1  Fail  '${MessageID}' not valid Prefix ID to proceed
    Sleep  3s
	Wait Until Page Contains Element  ${SEC/S360_MSG_CENTER}  timeout=10
	${MsgID_Part1}=  Get Substring  ${MessageID}  0  6
	${MsgID_Part2}=  Get Substring  ${MessageID}  7  9
    # Verifies success message
    ${SuccessMessage}=  Get Text  ${SEC/S360_MSG_CENTER}
	${Status}=  Run Keyword And Return Status  Should Contain  ${SuccessMessage}  ${MsgID_Part1}
	${Status}=  Run Keyword And Return Status  Should Contain  ${SuccessMessage}  ${MsgID_Part2}

    wait until keyword succeeds  10x  2s  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}
    [Return]  ${Status}


SEC/S360_Wait For Success Message
    [Documentation]  Verifies the message prefix in the message center
    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}


SEC/S360_Save Changes
    [Documentation]  Mouse hover on Options button and save changes
    SEC/S360_Scroll Page To Location  0  0
    Sleep  2S
    #changes by Akash - to include pop up for save changes
    ${Enable_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_DIRTY_FLAG}
    Run Keyword If  '${Enable_Status}'=='${TRUE}'  Run Keywords  Wait Until Element is Visible  ${SEC/S360_FLOAT_SAVE_BTN}  timeout=10
    ...  AND  Click Element  ${SEC/S360_FLOAT_SAVE_BTN}
    Sleep   4s
    ${PopupFoundStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_PREF_POPUP_SAVE_BTN}
    Run Keyword If  '${PopupFoundStatus}'=='True'  Click Element  ${SEC/S360_PREF_POPUP_SAVE_BTN}
    Run Keyword If  '${Enable_Status}'=='${TRUE}'  Run Keywords   Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_CLOSE_MSG_CENTER}  timeout=20
    ...  AND  Click ELement   ${SEC/S360_CLOSE_MSG_CENTER}


SEC/S360_Save Changes Without CLosing Message
    [Documentation]  Mouse hover on Options button and save changes without closing the message
    SEC/S360_Scroll Page To Location  0  0
    Sleep  2S
    ${Enable_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_DIRTY_FLAG}
    Run Keyword If  '${Enable_Status}'=='${TRUE}'  Run Keywords  Wait Until Element is Visible  ${SEC/S360_FLOAT_SAVE_BTN}
    ...  AND  Click Element  ${SEC/S360_FLOAT_SAVE_BTN}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_CLOSE_MSG_CENTER}  timeout=20


SEC/S360_Generate Random Strings
    [Documentation]  Generates a string of 10 characters
    [Arguments]  ${Char_Len}=10

    ${S_Name}=  Generate Random String  ${Char_Len}  [LETTERS]
    [Return]  ${S_Name}


SEC/S360_Pin/Unpin Navigator Menu
    [Documentation]  Pins/Unpins the navigator menu
    [Arguments]  ${Pin/Unpin}

    ${AttrValue}=  Get Element Attribute  ${SEC/S360_PIN_NAVIGATOR}  class

    Run Keyword If  '${Pin/Unpin}'=='Pin' and '${AttrValue}'!='pin'  Click Element  ${SEC/S360_PIN_NAVIGATOR}
    ...  ELSE  Run Keyword If  '${Pin/Unpin}'=='Unpin' and '${AttrValue}'=='pin'  Click Element  ${SEC/S360_PIN_NAVIGATOR}


SEC/S360_Expand/Collapse in Navigator
    [Documentation]  Expands or collapse the navigator menu
    [Arguments]  ${Expand/Collapse}  ${NavID}

    Mouse Over  ${NavID}
    ${ClassAttr}=  Get Element Attribute  ${NavID}  class
    ${CollapseStatus}=  Run Keyword And Return Status  Should Contain  ${ClassAttr}  down
    Run Keyword If  '${CollapseStatus}'=='${TRUE}' and '${Expand/Collapse}'=='Collapse'  Click Element  ${NavID}
    Run Keyword If  '${CollapseStatus}'=='${FALSE}' and '${Expand/Collapse}'=='Expand'  Click Element  ${NavID}


S360_DSG_Navigate To Dropdown Menu Options
    [Documentation]  Navigates from preferences dropdown
    [Arguments]  ${Menu_Name}  ${Element_To_Visible}

    SEC/S360_Scroll Page To Location    0    0
    Wait Until Element Is Visible  ${SEC/S360_CHANGE_ROLE_DD}  timeout=15
    Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    ${Visibility}=  Run Keyword And Return Status  Element Should Be Visible  ${Menu_Name}
    Run Keyword If  '${Visibility}'=='${TRUE}'  Click Element  ${Menu_Name}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${Element_To_Visible}  timeout=3
    ${Card_name}  ${Status}  Run Keyword And Ignore Error  Get Text  ${Element_To_Visible}
    Wait Until Element Is Visible  ${Element_To_Visible}  timeout=15
    SEC/S360_Scroll Page To Location    0    0


SEC/S360_Verify Video Play Button
    [Documentation]  Verifies video assistance popup appears when clicked on video button
    SEC/S360_Scroll Page To Location  0   0
    Wait Until Element Is Visible  ${SEC/S360_VIDEO_PLAY_BTN}
    Click Element   ${SEC/S360_VIDEO_PLAY_BTN}
    Wait Until Element Is Visible  ${SEC/S360_POPUP_TITLE}
    ${VisiblilityStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_VIDEO_SECTION}

    [Return]  ${VisiblilityStatus}


SEC/S360_Switch Between UniSecure/Systech360
    [Documentation]   Navigates to UniSecure/Systech360 from top banner
    [Arguments]  ${Navigate_To_Role}   ${Visible_Element}

    Click Element  ${SEC/S360_TOP_BANNER_SOL_DD}
    ${Role_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${Navigate_To_Role}
    Run Keyword If  '${Role_Status}'=='${TRUE}'  Run Keywords  Click Element  ${Navigate_To_Role}
    ...  AND  Wait Until Element Is Visible  ${Visible_Element}  timeout=20
    ...  ELSE  Run Keywords  Click Element  ${SEC/S360_TOP_BANNER_SOL_DD}
    ...  AND  Click Element  ${Navigate_To_Role}
    ...  AND  Wait Until Element Is Visible  ${Visible_Element}  timeout=20


SEC/S360_Click Form Or Float Cancel Or Parent Tab
    [Documentation]  clicks on float cancel or form cancel button based on input.
    [Arguments]  ${FormOrFloatOrParentTab_Click_Btn}  ${Popup_YesOrNo_Btn}  ${With/Without_Details}
    sec/s360_scroll page to location    0    0
    Click Element  ${FormOrFloatOrParentTab_Click_Btn}
    sleep  2s

    Run Keyword If  '${With/Without_Details}'=='NO'  Element Should Not Be Visible  ${SEC/S360_ADM_POPUP_NO_BTN}
    ...  ELSE IF  '${Popup_YesOrNo_Btn}'=='YES'  Run Keywords  Wait Until Element Is Visible  ${SEC/S360_ADM_POPUP_YES_BTN}
    ...  AND  Click Element  ${SEC/S360_ADM_POPUP_YES_BTN}
    ...  ELSE  Run Keywords  Wait Until Element Is Visible  ${SEC/S360_ADM_POPUP_NO_BTN}
    ...  AND  Click Element  ${SEC/S360_ADM_POPUP_NO_BTN}


SEC/S360_Verify Approved Sort By Text
    [Documentation]  Verifies sort by text in Ascending or descending order
    [Arguments]  ${Element_Locator}  ${Asc/Desc}


    ${Total_Element_Count}=  Get Element Count  ${Element_Locator}
    FOR    ${Index}  IN RANGE  0  ${Total_Element_Count- 1}
        continue for loop if     "${Index}"=="${Total_Element_Count- 1}"
        Wait Until Element Is Visible    //*[@id="ApprovedScene_itemName_${Index}"]
        ${First_String}=  Get Text    //*[@id="ApprovedScene_itemName_${Index}"]
        ${First_String}=  Convert To Uppercase	${First_String}
#        Wait Until Page Contains Element  ${SEC/S360_FIRST_USER_IMAGE}  timeout=10
        Wait Until Page Contains Element  //*[@id="ApprovedScene_itemName_${Index+ 1}"]  timeout=10
        ${Next_String}=   Get Text   //*[@id="ApprovedScene_itemName_${Index+ 1}"]
        ${Next_String}=  Convert To Uppercase	${Next_String}
        Continue For Loop If  '${First_String}'=='${Next_String}'
        ${Result}=  compare_string  ${First_String}  ${Next_String}
        Run Keyword If  '${Asc/Desc}'=='ASC' and '${Result}'=='${TRUE}'  fail
        ...  ELSE IF  '${Asc/Desc}'=='DESC' and '${Result}'=='${FALSE}'  fail
        capture page screenshot
    END



SEC/S360_Verify New Published Sort By Text
    [Documentation]  Verifies sort by text in Ascending or descending order
    [Arguments]  ${Element_Locator}  ${Asc/Desc}

    ${Total_Element_Count}=  Get Element Count  ${Element_Locator}
    FOR    ${Index}  IN RANGE  0  ${Total_Element_Count- 1}
        continue for loop if     "${Index}"=="${Total_Element_Count- 1}"
        Wait Until Element Is Visible    //*[@id="PublishedScene_itemName_${Index}"]
        ${First_String}=  Get Text    //*[@id="PublishedScene_itemName_${Index}"]
        ${First_String}=  Convert To Uppercase	${First_String}
#        Wait Until Page Contains Element  ${SEC/S360_FIRST_USER_IMAGE}  timeout=10
        Wait Until Page Contains Element  //*[@id="PublishedScene_itemName_${Index+ 1}"]  timeout=10
        ${Next_String}=   Get Text   //*[@id="PublishedScene_itemName_${Index+ 1}"]
        ${Next_String}=  Convert To Uppercase	${Next_String}
        Continue For Loop If  '${First_String}'=='${Next_String}'
        ${Result}=  compare_string  ${First_String}  ${Next_String}
        Run Keyword If  '${Asc/Desc}'=='ASC' and '${Result}'=='${TRUE}'  fail
        ...  ELSE IF  '${Asc/Desc}'=='DESC' and '${Result}'=='${FALSE}'  fail
        capture page screenshot
    END

SEC/S360_Verify Sort By Text
    [Documentation]  Verifies sort by text in Ascending or descending order
    [Arguments]  ${Element_Locator}  ${Asc/Desc}


    ${Total_Element_Count}=  Get Element Count  ${Element_Locator}
    FOR    ${Index}  IN RANGE  0  ${Total_Element_Count- 1}
        continue for loop if     "${Index}"=="${Total_Element_Count- 1}"
        Wait Until Element Is Visible    //*[@id="publishedSceneFilter_itemName_${Index}"]
        ${First_String}=  Get Text    //*[@id="publishedSceneFilter_itemName_${Index}"]
        ${First_String}=  Convert To Uppercase	${First_String}
#        Wait Until Page Contains Element  ${SEC/S360_FIRST_USER_IMAGE}  timeout=10
        Wait Until Page Contains Element  //*[@id="publishedSceneFilter_itemName_${Index+ 1}"]  timeout=10
        ${Next_String}=   Get Text   //*[@id="publishedSceneFilter_itemName_${Index+ 1}"]
        ${Next_String}=  Convert To Uppercase	${Next_String}
        Continue For Loop If  '${First_String}'=='${Next_String}'
        ${Result}=  compare_string  ${First_String}  ${Next_String}
        Run Keyword If  '${Asc/Desc}'=='ASC' and '${Result}'=='${TRUE}'  fail
        ...  ELSE IF  '${Asc/Desc}'=='DESC' and '${Result}'=='${FALSE}'  fail
        capture page screenshot
    END


SEC/S360_Verify Summary Sort By Text
    [Documentation]  Verifies sort by text in Ascending or descending order
    [Arguments]  ${Element_Locator}  ${Asc/Desc}


    ${Total_Element_Count}=  Get Element Count  ${Element_Locator}
    FOR    ${Index}  IN RANGE  1  ${Total_Element_Count}
        continue for loop if     "${Index}"=="${Total_Element_Count- 1}"
        Wait Until Element Is Visible    (//*[@style="width: 32px;height: 32px"])[${Index}]
        ${First_String}=  Get Text    (//*[@style="width: 32px;height: 32px"])[${Index}]
        ${First_String}=  Convert To Uppercase	${First_String}
#        Wait Until Page Contains Element  ${SEC/S360_FIRST_USER_IMAGE}  timeout=10

        ${Next_String}=   Get Text   (//*[@style="width: 32px;height: 32px"])[${Index+ 1}]
        ${Next_String}=  Convert To Uppercase	${Next_String}
        Continue For Loop If  '${First_String}'=='${Next_String}'
        ${Result}=  compare_string  ${First_String}  ${Next_String}
        Run Keyword If  '${Asc/Desc}'=='ASC' and '${Result}'=='${TRUE}'  fail
        ...  ELSE IF  '${Asc/Desc}'=='DESC' and '${Result}'=='${FALSE}'  fail
        capture page screenshot
    END


SEC/S360_Empty Trash
    [Documentation]  Deletes the trash can contents
    # Clicks Trash can icon
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_WELCOME_LINK}
    ${Status}=  Run Keyword And Return Status  Click Element  ${SEC/S360_TRASHCAN_ICON}
    Run Keyword If  '${Status}'=='${False}'  Run Keywords  Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_WELCOME_LINK}
    ...  AND  Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_TRASHCAN_ICON}
    run keyword and ignore error    Wait Until Element Is Visible  ${SEC/S360_TRASH_CAN_NAMES}

    select from list by value    ${S360_ITEM_PER_PAGE}  60
    # Selects check box
    wait until element is visible    ${SEC/S360_SELECT_ALL_ITEMS}
    click element    ${SEC/S360_SELECT_ALL_ITEMS}

    # Click on delete button
    #Mouse Over     ${SEC/S360_FLOAT_OPTN_BTN}
    Click Element  ${SEC/S360_OPTN_DELETE}
    Wait Until Element Is Visible  ${SEC/S360_DELETE_POP_BTN}
    Click Element  ${SEC/S360_DELETE_POP_BTN}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}
    SEC/S360_Verify Success Message  ${TrashcanSuccMsgID}


SEC/S360_Find Visible Element Among Miltiple Matching Elements
    [Documentation]  Retrives all elemets maching for the locator and finds the visible element among them
    [Arguments]  ${Element_Loc}

    # Gets the total number of elements matching locator
    ${TotalElements}=  Get Element Count  ${Element_Loc}
    ${Index}=  Set Variable  0

    # finds the visible element
    FOR    ${ElementIndex}  IN RANGE  1  ${TotalElements}+1
        ${Index}=  Evaluate  ${Index}+1
        ${ElementStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${Element_Loc} [${ElementIndex}]
        Run Keyword If  '${ElementStatus}'=='${TRUE}'  Exit For Loop
    END

    [Return]  ${Index}


COM_Get_Custom_Page_Screenshot
	[Documentation]  Page screen shot taken by suffixing the sent filename value with the timestamp
	[Arguments]  ${Filename_Value}
	Sleep  2s
	${date}=  Get Current Date  result_format=%m%d%Y
	${time}=  Get Current Date  result_format=%H%M%S
	Capture Page Screenshot  filename=${Filename_Value}_${date}_${time}.png


SEC/S360_Enable/Disable Message Prefix
    [Documentation]  Enables/Disables the message prefix in the messages shown in message center
    [Arguments]  ${Enable/Disable}

    ${ClassAttributeValue}=  Get Element Attribute  ${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}/span  class
    ${EnableStatus}=  Run Keyword And Return Status  Should Contain  ${ClassAttributeValue}  true

    Run Keyword If  '${Enable/Disable}'=='Enable' and '${EnableStatus}'=='${FALSE}'  Run Keywords
    ...  Click Element  ${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}  AND  SEC/S360_Save Changes
    ...  ELSE  Run Keyword If  '${Enable/Disable}'=='Disable' and '${EnableStatus}'=='${TRUE}'  Run Keywords
    ...  Click Element  ${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}  AND  SEC/S360_Save Changes


SEC/S360_Navigate To Different Role
    [Documentation]  Navigates to Different Role
    [Arguments]  ${RoleID}
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Keyword Succeeds  3x  2S  Click Element  ${SEC/S360_WELCOME_LINK}
    Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    ${RoleStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${RoleID}
    Run Keyword if  '${RoleStatus}'=='${TRUE}'  Click Element  ${RoleID}
	Mouse Over  ${SEC/S360_WELCOME_LINK}


SEC/S360 Navigate To Landing Page
    [Documentation]  Navigates to Landing Page
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}
    Wait Until Keyword Succeeds  3x  2s  Click Element  ${SEC/S360_WELCOME_LINK}
    Wait Until Element Is Visible  ${SEC/S360_FIRST_CARD}


SEC/S360 Navigate to Card
    [Documentation]    Navigate to respective card
    [Arguments]    ${CardLocator}    ${ValidationLocator}
    ${Status}=    element should be visible    ${CardLocator}
	run keyword if    ${Status}=='False'    SEC/S360 Navigate To Landing Page
    Wait Until Element Is Visible    ${CardLocator}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${CardLocator}
    sleep    2s
    Wait Until Element Is Visible    ${ValidationLocator}


SEC/S360_Navigate to Card In Preferences
    [Documentation]  Navigate to respective card in the Preferences
    [Arguments]  ${CardNameID}
	Sleep  2s
    Wait Until Element Is Visible  ${SEC/S360_CHANGE_ROLE_DD}  timeout=20
    Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    Wait Until Element Is Visible  ${SEC/S360_GO_TO_PREFERENCES}  timeout=20
    Click Element  ${SEC/S360_GO_TO_PREFERENCES}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${CardNameID}  timeout=4
    Wait Until Element Is Visible  ${CardNameID}  timeout=20
    Click Element  ${CardNameID}
    #Wait Until Element Is Visible  ${SEC/S360_FLOAT_OPTN_BTN}  timeout=20


SEC/S360_Verify intro Section
    [Documentation]   This keyword is used verify intro icon,intro text and intro video
    Wait Until Element Is Visible   ${SEC/S360_INTRO_ICON}   timeout=10
    Wait Until Element Is Visible   ${SEC/S360_MSGCNTR_ICON}
    ${Status}=  Run keyword and return status  Element should Be Visible  ${SEC/S360_VIDEO_PLAY_ICON}
    Run Keyword IF  '${Status}'=='${False}'  Click Element  ${SEC/S360_INTRO_ICON}
    Element should Be Visible  ${SEC/S360_VIDEO_PLAY_ICON}


SEC/S360_Fetch

    ${name}=    fetch from left      ${S360_NODE_ICW_TABS} [${Index}+1]    ${slicer}


SPH/SEC_Scroll Page To Location
    [Documentation]  Scrolls to the location mentioned
	Sleep  2S
	[Arguments]    ${x_location}    ${y_location}
	Execute JavaScript    window.scrollTo(${x_location},${y_location})


#changes by Akash - added to cancel save operation
SEC/S360_Cancel Save Changes
    [Documentation]  Mouse hover on Options button and save changes

    #Mouse Over              ${SEC/S360_FLOAT_OPTN_BTN}
    Sleep  1S
    Click Element           ${SEC/S360_FLOAT_CANCEL_BTN}
    ${PopupFoundStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_PREF_POPUP_SAVE_BTN}
    Run Keyword If  '${PopupFoundStatus}'=='${TRUE}'  Click Element  ${SEC/S360_CANCEL_POP_BTN}
