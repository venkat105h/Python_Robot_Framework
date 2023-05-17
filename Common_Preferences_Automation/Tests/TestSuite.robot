#------------------------------------------------------------------
#   Description       :      TestSuite for Preferences, from where all the test cases are executed.
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
Documentation   Necessary Libraries and Resources file are mentioned below

Library         BuiltIn
Library         SeleniumLibrary  timeout=10.0    run_on_failure=Capture Page Screenshot
Variables       ../Variables/${TESTENV}_Variable.py
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Preferences_Keywords.robot
Resource        ../Locators/Preferences_Locators.robot
Resource        ../Locators/Generic_Locators.robot

Suite Teardown  Close Browser

*** Test Cases ***
TC_01 Verify Login
    [Documentation]      This is to Enter valid credentials and login as Operator
    SEC/S360_Open Browser And Enter URL   ${URL}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRoleIndex}


TC_02 Verify Message Bar Location in Preference
    [Documentation]  Verifies the location of Message Center

    SEC/S360_Navigate to Card In Preferences  ${SEC/S360_DISPLAY_CARD}
    SEC/S360_Select Value In Display Preference and Update in Account Info  ${SEC/S360_PREF_MSGBAR_LOCATION_DD}  ${BottomRightIndex}
    ${BottomVerticalPosition}=  Get Vertical Position  ${SEC/S360_MSG_CENTER}

    SEC/S360_Select Value In Display Preference and Update in Account Info  ${SEC/S360_PREF_MSGBAR_LOCATION_DD}  ${UpperRightIndex}
    ${TopVerticalPosition}=  Get Vertical Position  ${SEC/S360_MSG_CENTER}

    Run Keyword If  ${BottomVerticalPosition}<=${TopVerticalPosition}  Fail


TC_03 Verify Messages Before Scroll
    [Documentation]  Verifies scroll bar appears when message before scroll is set to specific value

    SEC/S360_Select Value In Display Preference and Update in Account Info  ${SEC/S360_PREF_MAXMSG_LIST_DD}  ${MessageBeforeScrollIndex}
    Wait Until Element Is Visible  ${SEC/S360_CLOSE_MSG_CENTER}  timeout=10
    sleep  1s  #not able to click element
    Click Element  ${SEC/S360_CLOSE_MSG_CENTER}
    Element Should Not be Visible  ${SEC/S360_SCROLL_MSG_CENTER}

    ${MessageBeforeScrollIndex}=  Convert To Integer  ${MessageBeforeScrollIndex}
    SEC/S360_Verify Message Scrollbar  ${MessageBeforeScrollIndex}

    Input Text  ${SEC/S360_PREF_LAST_NAME_FIELD}  ${LastName}
    SEC/S360_Save Changes
    Element Should be Visible  ${SEC/S360_SCROLL_MSG_CENTER}


TC_04 Verify Cards Layout and Cards per page
    [Documentation]  Verifies Default Layout as Card and Cards per page

    ${Sec_URL}=  Run Keyword And Return Status  Should Contain  ${URL}  UniSecure  ignore_case=true
    Set Global Variable  ${Sec_URL}
    Click Element  ${SEC/S360_WELCOME_LINK}
    SEC/S360_Navigate to Card In Preferences  ${SEC/S360_DISPLAY_CARD}
    SEC/S360_Select Value in Display preference and Save changes  ${SEC/S360_DEFAULT_LAYOUT_DD}      ${CardsViewIndex}
    SEC/S360_Select Value in Display preference and Save changes  ${SEC/S360_PREF_CARDS_PERPAGE_DD}  ${FourCardsPerPageIndex}
    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_OPERATOR}
    Run Keyword If  '${Sec_URL}'=='${TRUE}'  SEC/S360_Navigate To All Links and Verify Cards/List View  ${SEC/S360_CARDS_NAME_ID}  4
    ...  ELSE  SEC/S360_Verify Cards/List View In Systech360 Operator  ${SEC/S360_CARDS_NAME_ID}  4
    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_DESIGNER}
    SEC/S360_Navigate To All Links and Verify Cards/List View  ${SEC/S360_CARDS_NAME_ID}  4


TC_05 Verify List Layout and Records per List
    [Documentation]  Verifies Default Layout as Card and Cards per page

    Click Element  ${SEC/S360_WELCOME_LINK}
    SEC/S360_Navigate to Card In Preferences  ${SEC/S360_DISPLAY_CARD}
    SEC/S360_Select Value in Display preference and Save changes  ${SEC/S360_DEFAULT_LAYOUT_DD}        ${ListViewIndex}
    SEC/S360_Select Value in Display preference and Save changes  ${SEC/S360_PREF_RECORDS_PERLIST_DD}  ${TwentyRecordsPerListIndex}
    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_OPERATOR}
    Run Keyword If  '${Sec_URL}'=='${TRUE}'  SEC/S360_Navigate To All Links and Verify Cards/List View  ${SEC/S360_LIST_NAME_ID}  20
    ...  ELSE  SEC/S360_Verify Cards/List View In Systech360 Operator  ${SEC/S360_LIST_NAME_ID}  20
    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_DESIGNER}
    SEC/S360_Navigate To All Links and Verify Cards/List View  ${SEC/S360_LIST_NAME_ID}  20


TC_06 Verify Default Sorting By Name/Updated By
    [Documentation]  Verifies sorting in operator are according to default sorting in preferences

    Click Element  ${SEC/S360_WELCOME_LINK}
    SEC/S360_Navigate to Card In Preferences  ${SEC/S360_DISPLAY_CARD}
    SEC/S360_Select Value in Display preference and Save changes  ${SEC/S360_DEFAULT_LAYOUT_DD}        ${ListViewIndex}
    SEC/S360_Select Value in Display preference and Save changes  ${SEC/S360_PREF_DEFAULT_SORTING_DD}  2
    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_OPERATOR}

    ${OrderStatus}=  Run Keyword If  '${Sec_URL}'=='${TRUE}'  SEC/S360_Checks the Sorting Order
    ...  ELSE  SEC/S360_Checks the Sorting Order In Systech360

    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_DESIGNER}
    SEC/S360_Checks the Sorting Order


TC_07 Verify Enable/Disable Message Prefix
    [Documentation]  Verifies message prefix are displayed when it is enabled

    Click Element  ${SEC/S360_WELCOME_LINK}
    SEC/S360_Navigate to Card In Preferences  ${SEC/S360_DISPLAY_CARD}

    SEC/S360_Enable/Disable Message Prefix  Disable
    SEC/S360_Navigate to Account Info, Update Info and Save Changes
    ${Status}=  SEC/S360_Verify Success Message  ${SuccMsgID}
    Run Keyword If  '${Status}'=='${TRUE}'  Fail

    SEC/S360_Navigate to Card In Preferences Using Breadcrumb  ${SEC/S360_DISPLAY_CARD}
    SEC/S360_Enable/Disable Message Prefix  Enable
    SEC/S360_Navigate to Account Info, Update Info and Save Changes
    ${Status}=  SEC/S360_Verify Success Message  ${SuccMsgID}
    Run Keyword If  '${Status}'=='${FALSE}'  Fail


TC_08 Verify Mandatory Fields in Account Info Page
    [Documentation]  Verifies if any mandatory fields are empty, it should show an red mark in the text field

    SEC/S360_Navigate to Card In Preferences Using Breadcrumb   ${SEC/S360_ACC_INFO_CARD}
    Sleep  2S
    SEC/S360_Check For Error Textbox  ${SEC/S360_FNAME_TXT_FIELD}  ${Username}
    SEC/S360_Click Element And Verify Invalid Message  ${SEC/S360_LNAME_TXT_FIELD}  ${SEC/S360_FNAME_ERROR_MESSAGE}

    SEC/S360_Check For Error Textbox  ${SEC/S360_LNAME_TXT_FIELD}  ${LastName}
    SEC/S360_Click Element And Verify Invalid Message  ${SEC/S360_EMAIL_TXT_FIELD}  ${SEC/S360_LNAME_ERROR_MESSAGE}

    SEC/S360_Check For Error Textbox  ${SEC/S360_EMAIL_TXT_FIELD}  ${email}
    SEC/S360_Click Element And Verify Invalid Message  ${SEC/S360_PWD_TXT_FIELD}    ${SEC/S360_EMAIL_ERROR_MESSAGE}

    SEC/S360_Check For Error Textbox  ${SEC/S360_PWD_TXT_FIELD}    ${Password}


TC_09 Verify Password Validations Error Message
    [Documentation]  Verifies different password messages when different values are entered

    @{NamesList}=  Create List  ${Passowrd1}  ${Passowrd2}  ${Passowrd3}  ${Passowrd4}  ${Passowrd5}

    FOR    ${Index}    IN RANGE    0    5
       Input Text  ${SEC/S360_PWD_TXT_FIELD}  ${NamesList}[${Index}]
       ${Attr_Val}=  Get Element Attribute  ${SEC/S360_PWD_ERROR_MSG_LIST} [${Index}+${2}]  class
       Should Contain  ${Attr_Val}  invalid
    END

    [Teardown]  SEC/S360_Suppress Popup


TC_10 Verify Restoring Preferences to Defaults
    [Documentation]  Verifies when restore button is clicked, Display Settings

    SEC/S360_Navigate to Card In Preferences  ${SEC/S360_DISPLAY_CARD}
    ${DefVal1}=  Get Value  ${SEC/S360_PREF_MSGBAR_LOCATION_DD}
    SEC/S360_Changes Values From Dropdown  ${DefVal1}  ${SEC/S360_PREF_MSGBAR_LOCATION_DD}
    ${DefVal2}=  Get Value  ${SEC/S360_DEFAULT_LAYOUT_DD}
    SEC/S360_Changes Values From Dropdown  ${DefVal2}  ${SEC/S360_DEFAULT_LAYOUT_DD}
    ${DefVal3}=  Get Value  ${SEC/S360_PREF_MAXMSG_LIST_DD}
    SEC/S360_Changes Values From Dropdown  ${DefVal3}  ${SEC/S360_PREF_MAXMSG_LIST_DD}
    ${DefVal4}=  Get Value  ${SEC/S360_PREF_CARDS_PERPAGE_DD}
    SEC/S360_Changes Values From Dropdown  ${DefVal4}  ${SEC/S360_PREF_CARDS_PERPAGE_DD}
    ${DefVal5}=  Get Value  ${SEC/S360_PREF_DEFAULT_SORTING_DD}
    SEC/S360_Changes Values From Dropdown  ${DefVal5}  ${SEC/S360_PREF_DEFAULT_SORTING_DD}
    ${DefVal6}=  Get Value  ${SEC/S360_PREF_RECORDS_PERLIST_DD}
    SEC/S360_Changes Values From Dropdown  ${DefVal6}  ${SEC/S360_PREF_RECORDS_PERLIST_DD}

    Click Element  ${SEC/S360_PREF_RESTORE_DEFAULT_BTN}

    ${DefVal1After}=  Get Value  ${SEC/S360_PREF_MSGBAR_LOCATION_DD}
    ${DefVal2After}=  Get Value  ${SEC/S360_DEFAULT_LAYOUT_DD}
    ${DefVal3After}=  Get Value  ${SEC/S360_PREF_MAXMSG_LIST_DD}
    ${DefVal4After}=  Get Value  ${SEC/S360_PREF_CARDS_PERPAGE_DD}
    ${DefVal5After}=  Get Value  ${SEC/S360_PREF_DEFAULT_SORTING_DD}
    ${DefVal6After}=  Get Value  ${SEC/S360_PREF_RECORDS_PERLIST_DD}

    Should Be Equal  ${DefVal1}  ${DefVal1After}
    Should Be Equal  ${DefVal2}  ${DefVal2After}
    Should Be Equal  ${DefVal3}  ${DefVal3After}
    Should Be Equal  ${DefVal4}  ${DefVal4After}
    Should Be Equal  ${DefVal5}  ${DefVal5After}
    Should Be Equal  ${DefVal6}  ${DefVal6After}

    [Teardown]  SEC/S360_Reset To Default Values
