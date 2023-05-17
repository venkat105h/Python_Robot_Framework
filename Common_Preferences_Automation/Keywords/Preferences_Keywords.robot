#------------------------------------------------------------------
#   Description       :      User defined Keywords for Preferences
#   Project           :      Preferences Automation
#   Author            :      Dinesh Kumar
#   © 2019   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation  Necessary Libraries and Resources file are mentioned below
Library         BuiltIn
Library         Collections
Library         DateTime
Library         SeleniumLibrary  timeout=10.0
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Generic_Locators.robot
Resource        ../Keywords/Generic_Keywords.robot
Variables       ../Variables/${TESTENV}_Variable.py

*** Keywords ***
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


SEC/S360_Navigate to Card In Preferences Using Breadcrumb
    [Documentation]  Navigates to cards by clicking on parent breadcrumb

    [Arguments]  ${CardNameID}

    Click Element  ${SEC/S360_PARENT_BREADCRUMB}
    Wait Until Element Is Visible  ${CardNameID}  timeout=20
    Click Element  ${CardNameID}
    #Wait Until Element Is Visible  ${SEC/S360_FLOAT_OPTN_BTN}  timeout=20
    Sleep  1S


SEC/S360_Verify Item PerPage
    [Documentation]  Verifies Number of Items per page in List View/Cards view

    [Arguments]  ${DropDownID}  ${ItemID}  ${ExpectedValue}

    ${ActualValue}=  Get Text  ${DropDownID}
    ${TotalItemsCount}=  Get Element Count  ${ItemID}

    ${Result}=  Set Global Variable  ${FALSE}
    Run Keyword If  '${ActualValue}'=='${ExpectedValue}' and '${TotalItemsCount}'=='${ActualValue}'  Set Global Variable  ${Result}  ${TRUE}

    [Return]  ${Result}


SEC/S360_Select Values from Dropdown In Display Preferences
    [Documentation]  Selects the specified values from dropdown

    [Arguments]  ${DropdownID}  ${IndexValue}

    #Wait Until Element Is Visible  ${SEC/S360_FLOAT_OPTN_BTN}  timeout=20
    Select From List By Index  ${DropdownID}  ${IndexValue}
    Sleep  1S
    ${DirtyFlagVisibility}=  Run Keyword and Return Status  Element Should be Visible  ${SEC/S360_DIRTY_FLAG}

    [Return]  ${DirtyFlagVisibility}


SEC/S360_Select Value In Display Preference and Update in Account Info
    [Documentation]  Selects value in account preference and update in account info page to verify the changes
    ...  Used for message location and max messages before scroll scripts

    [Arguments]  ${DropdownID}  ${IndexValue}

    SEC/S360_Navigate to Card In Preferences Using Breadcrumb  ${SEC/S360_DISPLAY_CARD}
    SEC/S360_Select Value in Display preference and Save changes  ${DropdownID}  ${IndexValue}
    SEC/S360_Navigate to Account Info, Update Info and Save Changes


SEC/S360_Navigate to Account Info, Update Info and Save Changes
    [Documentation]  Navigates to Account Information card, updates the Last name field and save the changes

    SEC/S360_Navigate to Card In Preferences Using Breadcrumb  ${SEC/S360_ACC_INFO_CARD}
    Input Text  ${SEC/S360_PREF_LAST_NAME_FIELD}  ${LastName}
    SEC/S360_Save Changes


SEC/S360_Select Value in Display preference and Save changes
    [Documentation]  Selects value in display Preference and save the changes

    [Arguments]  ${DropdownID}  ${IndexValue}

    ${DirtyFlagExistStatus}=  SEC/S360_Select Values from Dropdown In Display Preferences  ${DropdownID}  ${IndexValue}
    ${cancelButtonPresence}=    run keyword and return status    element should be visible    ${SEC/S360_CLOSE_MSG_CENTER}
    Run keyword if    '${cancelButtonPresence}'=='${TRUE}'    run keywords    Click ELement   ${SEC/S360_CLOSE_MSG_CENTER}
    ...    AND    wait until element is not visible    ${SEC/S360_CLOSE_MSG_CENTER}
    Run Keyword If  '${DirtyFlagExistStatus}'=='${TRUE}'  SEC/S360_Save Changes


SEC/S360_Navigate To Different Role
    [Documentation]  Navigates to to Different Role

    [Arguments]  ${RoleID}

    Click Element  ${SEC/S360_WELCOME_LINK}
    Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    ${RoleStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${RoleID}
    Run Keyword if  '${RoleStatus}'=='${TRUE}'  Click Element  ${RoleID}
	Mouse Over  ${SEC/S360_WELCOME_LINK}


SEC/S360_Navigate To All Links and Verify Cards/List View
    [Documentation]  Navigate to all the menu present in navigator and verifies cards/List is displayed when the respective
    ...  is selected in Preferences

    [Arguments]  ${Cards/ListViewID}  ${ExpectedCount}

    Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_PIN_NAVIGATOR}
    Sleep  1S
    ${NumberOfLinks}=  Get Element Count  ${SEC/S360_NAV_LINKS}

    FOR    ${Index}    IN RANGE    1    ${NumberOfLinks}
        Click Element  ${SEC/S360_NAV_LINKS} [${Index}]
        Wait Until Keyword Succeeds  5x  2 sec  Wait Until Element Is Visible  ${Cards/ListViewID} [1]  timeout=20
        Sleep  1S
        Run Keyword And Continue On Failure  Element Should Be Visible  ${Cards/ListViewID}
        ${ItemCount}=  Get Element Count  ${Cards/ListViewID}
		${ItemCount}=  Convert To Integer  ${ItemCount}
        Run Keyword If  ${ItemCount}>${ExpectedCount}  Fail
    END

    [Teardown]  Click Element  ${SEC/S360_PIN_NAVIGATOR}


SEC/S360_Verify Cards/List View In Systech360 Operator
    [Documentation]  Verifies cards/List is displayed when the respective is selected in Preferences

    [Arguments]  ${Cards/ListViewID}  ${ExpectedCount}

    Log  ${Cards/ListViewID}

	Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_OP_MYVIEWS_CARD}  timeout=3
    Wait Until Element Is Visible  ${SEC/S360_OP_MYVIEWS_CARD}
	Click Element  ${SEC/S360_WELCOME_LINK}
	Sleep  5S
	${ViewName}=  Get Text  ${SEC/S360_OP_MYVIEWS_CARD}
	Log  ${ViewName}
    Wait Until Keyword Succeeds  10x  2s  Click Element  ${SEC/S360_OP_MYVIEWS_CARD}
    Wait Until Keyword Succeeds  10x  2s  Wait Until Element Is Visible  ${Cards/ListViewID} [1]  timeout=20
    Sleep  1S
    Run Keyword And Continue On Failure  Element Should Be Visible  ${Cards/ListViewID}
    ${ItemCount}=  Get Element Count  ${Cards/ListViewID}
	${ItemCount}=  Convert To Integer  ${ItemCount}
    Run Keyword If  ${ItemCount}>${ExpectedCount}  Fail


SEC/S360_Checks the Sorting Order
    [Documentation]  Navigates to to Different Role

	${Navigator_Link_Status}=  Run Keyword and Return Status  Wait Until Element Is Visible  ${SEC/S360_NAV_LINKS}  timeout=20
	Run Keyword if  '${Navigator_Link_Status}'=='${FALSE}'  wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_PIN_NAVIGATOR}
    Sleep  1S
    ${NumberOfLinks}=  Get Element Count  ${SEC/S360_NAV_LINKS}

    FOR    ${Index}    IN RANGE    1    ${NumberOfLinks}
        wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_NAV_LINKS} [${Index}]
	    Run Keyword And Continue On Failure  Wait Until Element Is Not Visible  id=iconLoading  timeout=20
	    Wait Until Element Is Visible  ${SEC/S360_LISTVIEW_BTN}  timeout=20
	    Select From List By Label  ${SEC/S360_SORT_BY_DD}  Updated On
	    Click Element  ${SEC/S360_LISTVIEW_BTN}
        Wait Until Element Is Visible  ${SEC/S360_LIST_NAME_ID} [1]  timeout=5
        Click Element  ${SEC/S360_ASCENDING_BTN}
        Wait Until Element Is Visible  ${SEC/S360_LIST_NAME_ID} [1]  timeout=5
        Sleep  1S
        ${OrderStatus}=  SEC/S360_Get Date Elements In List  ASC
        Run Keyword If  '${OrderStatus}'=='${FALSE}'  Fail
    END

    [Teardown]  Click Element  ${SEC/S360_PIN_NAVIGATOR}


SEC/S360_Checks the Sorting Order In Systech360
    [Documentation]  Navigates to to Different Role

    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_OP_MYVIEWS_CARD}  timeout=3
    Wait Until Element Is Visible  ${SEC/S360_OP_MYVIEWS_CARD}
	Click Element  ${SEC/S360_WELCOME_LINK}
	Sleep  5S
	${ViewName}=  Get Text  ${SEC/S360_OP_MYVIEWS_CARD}
	Log  ${ViewName}
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_OP_MYVIEWS_CARD}
    Run Keyword And Continue On Failure  Wait Until Element Is Not Visible  id=iconLoading  timeout=20
	Wait Until Element Is Visible  ${SEC/S360_LISTVIEW_BTN}  timeout=20
	Select From List By Label  ${SEC/S360_SORT_BY_DD}  Updated On
	Click Element  ${SEC/S360_LISTVIEW_BTN}
    Wait Until Element Is Visible  ${SEC/S360_LIST_NAME_ID} [1]  timeout=5
    Click Element  ${SEC/S360_ASCENDING_BTN}
    Wait Until Element Is Visible  ${SEC/S360_LIST_NAME_ID} [1]  timeout=5
    Sleep  1S
    ${OrderStatus}=  SEC/S360_Get Date Elements In List  ASC
    Run Keyword If  '${OrderStatus}'=='${FALSE}'  Fail


SEC/S360_Get Date Elements In List
    [Documentation]  Inserts all date elemnts into the list

    [Arguments]  ${ASC/DESC}

    ${DateElementCount}=  Get Element Count  ${SEC/S360_LIST_DATES_ID}
    ${OrderStatus}=  Set Global Variable  ${TRUE}

    FOR    ${DateIndex}    IN RANGE    1    ${DateElementCount}
        ${date1}=  Get Text    ${SEC/S360_LIST_DATES_ID} [${DateIndex}]
        ${date2}=  Get Text    ${SEC/S360_LIST_DATES_ID} [${DateIndex}+1]
        ${date1}=  Convert Date  ${date1}  result_format=%m/%d/%y, %I:%M %p  date_format=%m/%d/%y, %I:%M %p
        ${date2}=  Convert Date  ${date2}  result_format=%m/%d/%y, %I:%M %p  date_format=%m/%d/%y, %I:%M %p
        ${result}=  Subtract Date From Date  ${date1}  ${date2}  date1_format=%m/%d/%y, %I:%M %p  date2_format=%m/%d/%y, %I:%M %p
        Run Keyword If  '${ASC/DESC}'=='ASC' and ${result}>0  Run Keywords  Set Global Variable  ${OrderStatus}  ${FALSE}
        ...  AND  Exit For Loop
        ...  ELSE  Run Keyword If  '${ASC/DESC}'=='DESC' and ${result}<0  Run Keywords  Set Global Variable  ${OrderStatus}  ${FALSE}
        ...  AND  Exit For Loop
    END

    [Return]  ${OrderStatus}


SEC/S360_Enable/Disable Message Prefix
    [Documentation]  Enables/Disables the message prefix in the messages shown in message center

    [Arguments]  ${Enable/Disable}

    ${ClassAttributeValue}=  Get Element Attribute  ${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}/span  class
    ${EnableStatus}=  Run Keyword And Return Status  Should Contain  ${ClassAttributeValue}  true

    Run Keyword If  '${Enable/Disable}'=='Enable' and '${EnableStatus}'=='${FALSE}'  Run Keywords
    ...  Click Element  ${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}  AND  SEC/S360_Save Changes
    ...  ELSE  Run Keyword If  '${Enable/Disable}'=='Disable' and '${EnableStatus}'=='${TRUE}'  Run Keywords
    ...  Click Element  ${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}  AND  SEC/S360_Save Changes


SEC/S360_Check For Error Textbox
    [Documentation]  checks if error message is displayed when the fields are empty

    [Arguments]  ${Textfield}  ${InputText}

    ${InvalidStatus}=  Set Variable  ${FALSE}
    SEC/S360_Clear Text Field  ${Textfield}
    Sleep  1S
    ${Class_Attr_Val}=  Get Element Attribute  ${Textfield}  class
    ${InvalidStatus}=  Run Keyword And Return Status  Should Contain  ${Class_Attr_Val}  ng-invalid
    Run Keyword If  '${InvalidStatus}'=='${FALSE}'  Fail
    Element Should Be Disabled  ${SEC/S360_FLOAT_SAVE_BTN}


SEC/S360_Click Element And Verify Invalid Message
    [Documentation]  Click on Textbox and verified invalid message is displayed

    [Arguments]  ${ClickElement}  ${ExpectedMessageID}

    Click Element  ${ClickElement}
    ${MessageStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${ExpectedMessageID}
    Run Keyword If  '${MessageStatus}'=='${FALSE}'  Fail


SEC/S360_Verify Message Scrollbar
    [Documentation]  Inputs text and clicks on save button multiple times

    [Arguments]  ${MessageBeforeScroll}

    FOR    ${MaxValue}    IN RANGE    0    ${MessageBeforeScroll}
        Input Text  ${SEC/S360_PREF_LAST_NAME_FIELD}  ${LastName}
        SEC/S360_Save Changes
        Element Should Not be Visible  ${SEC/S360_SCROLL_MSG_CENTER}
        Wait Until Element Is Visible  ${SEC/S360_CLOSE_MSG_CENTER}  timeout=10
        Click Element  ${SEC/S360_CLOSE_MSG_CENTER}
    END


SEC/S360_Changes Values From Dropdown
    [Documentation]  Changes the default values from the dropdown

    [Arguments]  ${DefValue}  ${Dropdown}

    @{ListItems}=  Get List Items   ${Dropdown}
    ${IndexNum}=  Get Index From List  ${ListItems}  ${DefValue}
    Run Keyword If  ${IndexNum}==${0}  Select From List By Index  ${Dropdown}  1
    ...  ELSE  Select From List By Index  ${Dropdown}  0


SEC/S360_Reset To Default Values
    [Documentation]  Resets to Normal values which are used in the automation

    Select From List By Index  ${SEC/S360_PREF_MSGBAR_LOCATION_DD}  0
    Select From List By Index  ${SEC/S360_DEFAULT_LAYOUT_DD}        0
    Select From List By Index  ${SEC/S360_PREF_MAXMSG_LIST_DD}      2
    Select From List By Index  ${SEC/S360_PREF_CARDS_PERPAGE_DD}    1
    Select From List By Index  ${SEC/S360_PREF_DEFAULT_SORTING_DD}  0
    Select From List By Index  ${SEC/S360_PREF_RECORDS_PERLIST_DD}  0

    SEC/S360_Save Changes


SEC/S360_Suppress Popup
    [Documentation]  Navigates to cards by clicking on parent breadcrumb

    Click Element  ${SEC/S360_PARENT_BREADCRUMB}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${SEC/S360_POPUP_NO_BTN}  timeout=7
    Run Keyword And Ignore Error  Click Element  ${SEC/S360_POPUP_NO_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_POPUP_NO_BTN}  timeout=20
    Sleep  1S
