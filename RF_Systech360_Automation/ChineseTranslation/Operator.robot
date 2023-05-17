#------------------------------------------------------------------
#   Description       :      TestSuite for testing Chinese translation of texts for Operator role
#   Project           :      Systech 360 Automation
#   Author            :      Manas Milind Pratap Singh
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Variables ***
${URL}       https://eng-svt.systechcloud.net/Systech360/#/


*** Settings ***
Documentation   Necessary Libraries and Resources file are mentioned below

Library         BuiltIn
Library         String
Library         SeleniumLibrary  timeout=10.0
Library         DateTime
Variables       ../Variables/${TESTENV}_Variable.py
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/User_Groups_Keywords.robot
Resource        ../Keywords/Admin_Keywords.robot
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/Admin_Locators.robot
Resource        ../Locators/Designer_Locators.robot

Suite Setup     Run Keywords  SEC/S360_Open Browser And Enter URL   ${URL}
...  AND  Select From List by index  ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
...  AND  SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${OperatorRole}
...  AND  set screenshot directory    ${SEC/S360_SCREENSHOT_LOCATION}

Suite Teardown  Close Browser


*** Test Cases ***

TC_01 Verify Landing Page
    [Documentation]  Verifies translation of texts for the landing page
    [Tags]  TC01
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_VAULT_CARD_DESC}
	Capture Page Screenshot    Operator/Landing Page/LandingPageUpperHalf.png
	mouse over    ${SEC/S360_TRASHCAN_ICON}
    sleep    2s
    Capture Page Screenshot    Operator/Landing Page/DeletedAssestsToolTip.png
	sec/s360_scroll page to location    0    700
	Capture Page Screenshot    Operator/Landing Page/LandingPageLowerHalf.png


TC_02 Verify Notification Rules Page
    [Documentation]  Verifies translation of texts for the Notification Rules page
    [Tags]  TC02
    SEC/S360 Navigate to Card    ${S360_OP_NOTI_RULES_CARD}    ${S360_AUDIT_FILTER_ICON}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_AUDIT_FILTER_ICON}
	Capture Page Screenshot    Operator/Notification Rules/FullPage.png
	click element    ${S360_AUDIT_FILTER_ICON}
	wait until element is visible    ${S360_FILTER_NAME_INPUT}
	Capture Page Screenshot    Operator/Notification Rules/AddFilterUpperHalf.png
	input text    ${S360_FILTER_NAME_INPUT}     All_AUTO
	click element    ${S360_NOTI_RULES_FILTER_STATE_DROP_DOWN}
	wait until element is visible    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	Capture Page Screenshot    Operator/Notification Rules/AddFilteStateDropDownUpperHalf.png
	scroll element into view    ${S360_NOTI_RULES_FILTER_STATE_ACK_FAIL}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_NOTI_RULES_FILTER_STATE_ACK_FAIL}
    Capture Page Screenshot    Operator/Notification Rules/AddFilteStateDropDownLowerHalf.png
	click element    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	click element    ${SEC/S360_FLOAT_SAVE_BTN}
	wait until element is visible    ${S360_FILTER_MSG_DETAILS_DRPDOWNBTN}
	click element    ${S360_FILTER_MSG_DETAILS_DRPDOWNBTN}
	Capture Page Screenshot    Operator/Notification Rules/SuccessMessageDetailsWindow.png
	mouse over    ${S360_FILTER_MSG_DETAILS_DRPDOWNBTN}
    sleep    2s
    Capture Page Screenshot    Operator/Notification Rules/DetailsDropDownToolTip.png
    mouse over    ${S360_FILTER_MSG_DISMISS_ICON}
    sleep    2s
    Capture Page Screenshot    Operator/Notification Rules/DismissIconToolTip.png
    mouse over    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
    sleep    2s
    Capture Page Screenshot    Operator/Notification Rules/DismissAllIconToolTip.png
    click element    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
    wait until element is not visible    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
    click element    ${S360_FILTER_NEW_zh}
    wait until element is visible    ${S360_NODE_ICW_EXPAND}
    sec/s360_scroll page to location    0    300
	Capture Page Screenshot    Operator/Notification Rules/NotificationRulesRibbon.png
	mouse over    ${S360_NOTI_RULES_ICON}
    sleep    2s
    Capture Page Screenshot    Operator/Notification Rules/WorkflowIconToolTip.png
	click element    ${S360_NODE_ICW_EXPAND}
	wait until element is visible    ${ICW_COMMAND_TAB_SEND_ICON}
	mouse over    ${ICW_COMMAND_TAB_SEND_ICON}
    sleep    2s
    Capture Page Screenshot    Operator/Notification Rules/CommandTabSendIconToolTip.png
    mouse over    ${ICW_COMMAND_TAB_UPDATE_STATE_ICON}
    sleep    2s
    Capture Page Screenshot    Operator/Notification Rules/CommandTabUpdateStateIconToolTip.png
    click element    ${ICW_DETAILS_TAB}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
    Capture Page Screenshot    Operator/Notification Rules/DetailsTab.png
    click element    ${ICW_NOTES_TAB}
    wait until page contains element    ${S360_COMMENTS_ADD_BTN}
    Capture Page Screenshot    Operator/Notification Rules/NotesTab.png
    click element    ${ICW_FILES_TAB}
    Capture Page Screenshot    Operator/Notification Rules/FilesTab.png
    click element    ${S360_ICW_CLOSE_ICON}
    sec/s360_scroll page to location    0    0
    click element    ${S360_AUDIT_FILTER_ICON}
	wait until element is visible    ${S360_FILTER_NAME_INPUT}
    input text    ${S360_FILTER_NAME_INPUT}     All_AUTO
    click element    ${S360_NOTI_RULES_FILTER_STATE_DROP_DOWN}
	wait until element is visible    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	click element    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	click element    ${SEC/S360_FLOAT_SAVE_BTN}
	wait until element is visible    ${S360_FILTER_MSG_DETAILS_DRPDOWNBTN}
	click element    ${S360_FILTER_MSG_DETAILS_DRPDOWNBTN}
	Capture Page Screenshot    Operator/Notification Rules/DuplicateMessageWindow.png
	click element    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
	wait until element is not visible    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
#	mouse over    ${S360_FILTER_NEW_zh}
#	sleep    2s
#	click element    ${S360_FILTER_NAME_REMOVE_FILTER}
#	Capture Page Screenshot    Operator/Notification Rules/DeleteMessageWindow.png
    click element    ${S360_OPERATOR_BREADCRUMB}
    wait until element is visible    ${S360_VAULT_CARD_DESC}


TC_03 Verify Enterprise Notification Summary Page
    [Documentation]  Verifies translation of texts for the Enterprise Notification Summary page
    [Tags]  TC03
    SEC/S360 Navigate to Card    ${S360_OP_EN_SUMM_CARD}    ${S360_AUDIT_FILTER_ICON}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_AUDIT_FILTER_ICON}
    Capture Page Screenshot    Operator/Enterprise Notification Summary/FullPage.png
    click element    ${S360_AUDIT_FILTER_ICON}
    wait until element is visible    ${S360_FILTER_NAME_INPUT}
	input text    ${S360_FILTER_NAME_INPUT}     All_AUTO
	click element    ${S360_NOTI_RULES_FILTER_STATE_DROP_DOWN}
	wait until element is visible    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	click element    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	click element    ${SEC/S360_FLOAT_SAVE_BTN}
	wait until element is visible    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
	click element    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
	click element    ${S360_FILTER_NEW_zh}
	wait until page contains element    ${S360_ICW_CLOSE_ICON}
	click element    ${S360_ICW_CLOSE_ICON}
	wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	sec/s360_scroll page to location    0    200
	Capture Page Screenshot    Operator/Enterprise Notification Summary/NotificationsRibbon.png
	click element    ${SEC/S360_SORT_BY_DD}
	Capture Page Screenshot    Operator/Enterprise Notification Summary/SortByList.png
	sec/s360_scroll page to location    0    0
#	mouse over    ${S360_FILTER_NEW_zh}
#	sleep    2s
#	click element    ${S360_FILTER_NAME_REMOVE_FILTER}
	click element    ${S360_OPERATOR_BREADCRUMB}
    wait until element is visible    ${S360_VAULT_CARD_DESC}


TC_04 Verify Production Page
    [Documentation]  Verifies translation of texts for the Production page
    [Tags]  TC04
    SEC/S360 Navigate to Card    ${SEC/S360_OPER_PRODUCTION_CARD_zh}    ${S360_AUDIT_FILTER_ICON}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_AUDIT_FILTER_ICON}
    Capture Page Screenshot    Operator/Production/FullPage.png
    click element    ${S360_AUDIT_FILTER_ICON}
    sec/s360_scroll page to location    0    200
    Capture Page Screenshot    Operator/Production/FilterDetailsRibbon.png
    wait until element is visible    ${S360_FILTER_NAME_INPUT}
	input text    ${S360_FILTER_NAME_INPUT}     All_AUTO
	click element    ${S360_OP_PROD_LOT_RADIO_BTN}
	click element    ${S360_NOTI_RULES_FILTER_STATE_DROP_DOWN}
	wait until element is visible    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	Capture Page Screenshot    Operator/Production/LotDropDownList.png
	click element    ${S360_FILTER_DROP_DOWN_CHECKBOX}
	click element    ${SEC/S360_FLOAT_SAVE_BTN}
	wait until element is visible    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
	click element    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
	click element    ${S360_FILTER_NEW_zh}
	sec/s360_scroll page to location    0    250
	wait until element is visible    ${S360_PROD_NODE_ICW_EXPAND}
	Capture Page Screenshot    Operator/Production/LotSumarryRibbon.png
	click element    ${S360_PROD_NODE_ICW_EXPAND}
	Capture Page Screenshot    Operator/Production/ICW_OverviewTab.png
	click element    ${ICW_DETAILS_TAB}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
    Capture Page Screenshot    Operator/Production/ICW_DetailsTab.png
    click element    ${ICW_NOTES_TAB}
    wait until page contains element    ${S360_COMMENTS_ADD_BTN}
    Capture Page Screenshot    Operator/Production/ICW_NotesTab.png
    sec/s360_scroll page to location    0    0
#    mouse over    ${S360_FILTER_NEW_zh}
#    sleep    2s
#	click element    ${S360_FILTER_NAME_REMOVE_FILTER}
	click element    ${S360_OPERATOR_BREADCRUMB}
    wait until element is visible    ${S360_VAULT_CARD_DESC}


TC_05 Verify My Views Page
    [Documentation]  Verifies translation of texts for the My Views page
    [Tags]  TC05
    SEC/S360 Navigate to Card    ${SEC/S360_OPER_MY_VIEWS_CARD_zh}    ${S360_ITEMS_PER_PAGE_TEXT}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_ITEMS_PER_PAGE_TEXT}
    Capture Page Screenshot    Operator/My Views/UpperHalf.png
    click element    ${S360_ADD_NEW_BTN}
    wait until element is visible    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
    sec/s360_scroll page to location    0    0
    Capture Page Screenshot    Operator/My Views/AddViewUpperHalf.png
    input text    ${SEC/S360_NAME_TXT}    AUTO_VIEW    ${True}
    input text    ${SEC/S360_DESC_TXT}    Automation Test for Chinese translation
    sleep    2s
    select from list by label    ${SEC/S360_PUBLISHED_SCENE_DROP_DOWN}    国 China
    click element    ${SEC/S360_FLOAT_SAVE_BTN}
    wait until element is visible    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
    Capture Page Screenshot    Operator/My Views/NewViewSuccessMessage.png
    click element    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
    wait until element is not visible    ${S360_FILTER_MSG_DISMISS_ALL_ICON}
    sec/s360_scroll page to location    0    1000
    Capture Page Screenshot    Operator/My Views/OverviewTab.png
    click element    ${S360_GRAPHICAL_TAB}
    WAIT UNTIL ELEMENT IS VISIBLE    ${S360_NODE_ICW_DIAGNOSTICS_FUNTION}
    Capture Page Screenshot    Operator/My Views/GraphicalICW_CommandsTab.png
    click element       ${S360_ICW_MSGS_TAB}
    wait until element is visible    ${S360_NODE_ICW_MSG_RIBBON_zh}
    sec/s360_scroll page to location    0    400
    Capture Page Screenshot    Operator/My Views/GraphicalICW_MessagesTab.png
    click element    ${S360_NODE_ICW_HEARTBEAT_zh}
    wait until element is visible    ${ICW_TAB_HEARTBEAT_PROINFO_RIBBON_zh}
    Capture Page Screenshot    Operator/My Views/GraphicalICW_HeatbeatTab.png
    click element    ${S360_NODE_ICW_SYSTEMHEALTH_zh}
    wait until element is visible    ${ICW_TAB_SOFTWARE_RIBBON_zh}
    Capture Page Screenshot    Operator/My Views/GraphicalICW_SystemHealthTabUpperHalf.png
    scroll element into view    ${ICW_TAB_SOFTWARE_RIBBON_zh}
    Capture Page Screenshot    Operator/My Views/GraphicalICW_SystemHealthTabLowerHalf.png
    click element    ${S360_NODE_ICW_NOTES_TAB_zh}
    Capture Page Screenshot    Operator/My Views/GraphicalICW_NotesTab.png
    sec/s360_scroll page to location    0    0
    click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until element is visible    ${SEC/S360_CANCEL_POP_BTN}
    click element    ${SEC/S360_CANCEL_POP_BTN}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
    click element    ${S360_OPERATOR_BREADCRUMB}
    wait until element is visible    ${S360_VAULT_CARD_DESC}


TC_06 Verify Manage Scenes Page
    [Documentation]  Verifies translation of texts for the Manage Scenes page
    [Tags]  TC06
    SEC/S360 Navigate to Card    ${SEC/S360_OPER_MANAGE_SCENES_CARD_zh}    ${S360_ITEMS_PER_PAGE_TEXT}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_ITEMS_PER_PAGE_TEXT}
    Capture Page Screenshot    Operator/Manage Scenes/UpperHalf.png
    sec/s360_scroll page to location    0    1000
    Capture Page Screenshot    Operator/Manage Scenes/LowerHalf.png
    sec/s360_scroll page to location    0    0
    click element    ${S360_OPERATOR_BREADCRUMB}
    wait until element is visible    ${S360_VAULT_CARD_DESC}


TC_07 Verify Vault Page
    [Documentation]  Verifies translation of texts for the Manage Scenes page
    [Tags]  TC07
    SEC/S360 Navigate to Card    ${SEC/S360_OPER_VAULT_CARD_zh}    ${S360_AUDIT_FILTER_ICON}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_AUDIT_FILTER_ICON}
    Capture Page Screenshot    Operator/Vault/FullPage.png
    click element    ${S360_AUDIT_FILTER_ICON}
    sec/s360_scroll page to location    0    600