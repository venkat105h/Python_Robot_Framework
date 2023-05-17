#------------------------------------------------------------------
#   Description       :      TestSuite for testing Chinese translation of texts for Administrator role
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
${URL}       https://dd-systech-qa2.systechcloud.net/Systech360/#/login


*** Settings ***
Documentation   Necessary Libraries and Resources file are mentioned below

Library         BuiltIn
Library         String
Library         SeleniumLibrary  timeout=10.0
Library         DateTime
Variables       ../Variables/${TESTENV}_Variable.py
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Admin_Keywords.robot
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/Admin_Locators.robot
Resource        ../Locators/Designer_Locators.robot


Suite Setup     Run Keywords  SEC/S360_Open Browser And Enter URL   ${URL}
...  AND  Select From List by label  ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
...  AND  SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRole}
# ...  AND  set screenshot directory    ${SEC/S360_SCREENSHOT_LOCATION}

Suite Teardown  Close Browser


*** Test Cases ***

# Administrator Role UI
TC_01 Verify Landing Page
    [Documentation]  Verifies translation of texts for the landing page
    [Tags]  TC01
	Capture Page Screenshot    Administrator/Landing Page/LandingPage.png


TC_02 Verify hover texts, menu and drop downs items
    [Documentation]  Verifies translation of all the hover texts, menu items and drop downs
    [Tags]  TC02
    mouse over    ${sec/s360_hamburger_menu}
    Wait Until Element Is Visible    ${SEC/S360_INFO_CENTER_HAM}
	Capture Page Screenshot    Administrator/Landing Page/HamburgerMenu.png
#	mouse over    ${SEC/S360_BROWSE_HAM}
#   Capture Page Screenshot    Administrator/Landing Page/HamburgerMenuBrowse.png
    mouse over    ${SEC/S360_INFO_CENTER_HAM}
    wait until element is visible    ${SEC/S360_INFO_CENTER_GENERAL_HAM}
    Capture Page Screenshot    Administrator/Landing Page/HamburgerMenuInfoCenter.png
    mouse over    ${SEC/S360_INFO_CENTER_GENERAL_HAM}
    sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/HamburgerMenuInfoCenterGeneral.png
    mouse over    ${SEC/S360_INFO_CENTER_PRODUCT_HAM}
    sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/HamburgerMenuInfoCenterProduct.png
    mouse over    ${SEC/S360_INFO_CENTER_SYSTECH_HAM}
    sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/HamburgerMenuInfoCenterSystechGAMP.png
    mouse over    ${SEC/S360_SUPPORT_CENTER_HAM}
    sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/HamburgerMenuSupportCenter.png
    mouse over    ${SEC/S360_TRAINING_CENTER_HAM}
    sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/HamburgerMenuTrainingCenter.png
    mouse over    ${SEC/S360_WELCOME_LINK}
	sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/WelcomeTT.png
    mouse over    ${SEC/S360_UNITRACE_HEADER}
	sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/UniTraceTT.png
    mouse over    ${SEC/S360_TOP_BANNER_SOL_DD}
    sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/UniSecureDropDown.png
    mouse over    ${SEC/S360_ABOUT_HEADER}
	sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/AboutTT.png
    mouse over    ${SEC/S360_MAIN_PLAY_VIDEO_ICON}
	sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/MainPlayVideoIconTT.png
    mouse over    ${SEC/S360_CHANGE_ROLE_DD}
	sleep    1s
    Capture Page Screenshot    Administrator/Landing Page/ChangeRoleDropDownTT.png


TC_03 Verify Users/Groups page
    [Documentation]  Verifies translation of texts for Users/Groups page
    [Tags]  TC03
    SEC/S360 Navigate to Card    ${S360_USERGROUPS_CARD}    ${SEC/S360_ADD_NEW_USER_BTN}
	Capture Page Screenshot    Administrator/Users Groups/UsersGroupsUpperHalf.png
	mouse over    ${SEC/S360_MSGCNTR_ICON}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/MessageCenterTT.png
    mouse over    ${SEC/S360_SHOW_HIDE_INTRO_ICON}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/ShowHideIntroTT.png
    click element    ${SEC/S360_FILTER_USER_DD}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/FilterDropDownList.png
    click element    ${SEC/S360_FILTER_USER_DD}
    mouse over    ${SEC/S360_ASCENDING_BTN}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/AscendingButtonTT.png
    mouse over    ${SEC/S360_DESCENDING_BTN}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/DescendingButtonTT.png
    sec/s360_scroll page to location    0    700
    Capture Page Screenshot    Administrator/Users Groups/UsersGroupsBottomHalf.png
    sec/s360_scroll page to location    0    0


TC_04 Verify Add New Group under Users/Groups page
    [Documentation]  Verifies translation for Add New Group functionality
    [Tags]    TC04
    #SEC/S360 Navigate to Card    ${S360_USERGROUPS_CARD}    ${SEC/S360_ADD_NEW_USER_BTN}
    sec/s360_scroll page to location    0    500
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible    ${SEC/S360_ADD_NEW_GROUP_BTN}    timeout=10
    click element    ${SEC/S360_ADD_NEW_GROUP_BTN}
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/NewGroupfields.png
    mouse over    ${SEC/S360_GROUP_NAME_TXT_BOX}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/GroupNamefieldTT.png
    mouse over    ${SEC/S360_GROUP_DESC_TXT_BOX}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/GroupDescfieldTT.png
    mouse over    ${SEC/S360_SAVE_GROUP_BTN}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/CreateGroupTT.png
    mouse over    ${SEC/S360_CANCEL_GROUP_BTN}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/CancelGroupTT.png
    mouse over    ${SEC/S360_OPERATOR_ROLE}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/OperatorTT.png
    mouse over    ${SEC/S360_DESIGNER_ROLE}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/DesignerTT.png
    mouse over    ${SEC/S360_ADMIN_ROLE}
    sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New Group/AdministratorTT.png
#    drag and drop    ${SEC/S360_ADMIN_ROLE}    ${SEC/S360_ROLES_TXT_BOX}
#    sleep    1s
#    click element    ${SEC/S360_SAVE_GROUP_BTN}
#    sleep    1s
#    Capture Page Screenshot    FieldEmptyWarningMessage.png
#    sleep    1s
#    click element    ${SEC/S360_CLOSE_LINK}
#    input text    ${SEC/S360_GROUP_NAME_TXT_BOX}    123MilindGrp
#    input password    ${SEC/S360_GROUP_DESC_TXT_BOX}    test
#    click element    ${SEC/S360_SAVE_GROUP_BTN}
#    sleep    1s
#    capture page screenshot    GroupCreationSuccessMessage.png
#    click element    ${SEC/S360_CLOSE_LINK}
#    click element    ${SEC/S360_DELETE_GROUP_BTN}
#    sleep    1s
#    capture page screenshot    GroupDeletionConfirmationMessage.png
#    click element    ${SEC/S360_CANCEL_POP_BTN}
#    wait until page contains element    ${SEC/S360_ADD_NEW_USER_BTN}
    sec/s360_scroll page to location    0    0


TC_05 Verify Add New User window under Users/Groups page
    [Documentation]  Verifies translation for Add New User window
    [Tags]    TC05
    #SEC/S360 Navigate to Card    ${S360_USERGROUPS_CARD}    ${SEC/S360_ADD_NEW_USER_BTN}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible    ${SEC/S360_ADD_NEW_USER_BTN}    timeout=10
    Click Element    ${SEC/S360_ADD_NEW_USER_BTN}
    @{User_Details_zh}=  split string    ${User_Details_zh}  ,
    SEC/S360_Enters All new User Details    @{User_Details_zh}
    sleep    2s
    scroll element into view    ${SEC/S360_USER_GROUP}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible    ${SEC/S360_USER_GROUP}    timeout=10
    click element    ${SEC/S360_USER_GROUP}
    mouse over    ${SEC/S360_FORM_CANCEL_BTN}               # close icon
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/CloseTT.png
    mouse over    ${SEC/S360_FLOAT_SAVE_BTN}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/SaveTT.png
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible    ${SEC/S360_FLOAT_SAVE_BTN}    timeout=10
    click element    ${SEC/S360_FLOAT_SAVE_BTN}
    wait until element is visible    ${S360_FILTER_MSG_DETAILS_DRPDOWNBTN}
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/NewUserSuccessMessage.png
    mouse over    ${SEC/S360_SEND_INVITE_BTN}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/SendInvitationTT.png
    mouse over    ${SEC/S360_SAVE_SEND_INVITE_BTN}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/SaveSendInvitationTT.png
    mouse over    ${SEC/S360_SAVE_SENDINVITE_CU_BTN}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/SaveSendInvitationCUTT.png
    mouse over    ${SEC/S360_FLOAT_CANCEL_BTN}
	sleep    1s
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/CancelTT.png
    sec/s360_scroll page to location    0    500
    Capture Page Screenshot    Administrator/Users Groups/Add New User window/AddNewUsersWindowBottomHalf.png
    click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until page contains element    ${SEC/S360_FIRST_PAGE_BTN}
    sec/s360_scroll page to location    0    0
    @{Users_List_zh}=  Split String  ${Delete_User_List_zh}  ,
    SEC/S360_Delete Users  @{Users_List_zh}


TC_06 Verify Security Policies page
    [Documentation]  Verifies translation for Security Policies page
    [Tags]    TC06
    wait until page contains element    ${S360_ADMINISTRATOR_RIBBON}
    click element    ${S360_ADMINISTRATOR_RIBBON}
    wait until page contains element    ${S360_SECURITY_POLICIES_CARD}
    SEC/S360 Navigate to Card    ${S360_SECURITY_POLICIES_CARD}     ${S360_ACTIVATE_SYSTECH360_SCOPE_POLICIES}
    Capture Page Screenshot    Administrator/Security Policies/SecurityPolicies.png


TC_07 Verify Scope Policy page
    [Documentation]  Verifies translation for Scope Policy page
    [Tags]   TC07
    click element    ${S360_ADMINISTRATOR_RIBBON_SEC_POLICY}
    wait until page contains element    ${S360_SCOPE_POLICY_CARD}
    SEC/S360 Navigate to Card    ${S360_SCOPE_POLICY_CARD}    ${SEC/S360_CARDS_ITEMS_PERPAGE_DD}
    Capture Page Screenshot    Administrator/Scope Policy/ScopePolicy.png


TC_08 Verify File Storage Utilization page
    [Documentation]  Verifies translation for File Storage Utilization page
    [Tags]   TC08
    click element    ${S360_ADMINISTRATOR_RIBBON}
    wait until page contains element    ${SEC/S360_ADMIN_FILE_STORAGE_UTILIZATION_CARD_zh}
    SEC/S360 Navigate to Card    ${SEC/S360_ADMIN_FILE_STORAGE_UTILIZATION_CARD_zh}    ${S360_FILE_STORAGE_UTILIZATION_DETAILS_TAB}    #${S360_FILE_STORAGE_UTILIZATION_DOCUMENTS_ROW}
    Capture Page Screenshot    Administrator/File Storage Utilization/FileStorageUtilizationGraphicalTabUpperHalf.png
    SEC/S360_Scroll Page To Location    0    500
    sleep    1s
    Capture Page Screenshot    Administrator/File Storage Utilization/FileStorageUtilizationGraphicalTabLowerHalf.png
    SEC/S360_Scroll Page To Location    0    0
    click element    ${S360_FILE_STORAGE_UTILIZATION_DETAILS_TAB}
    SEC/S360_Scroll Page To Location    0    500
    Capture Page Screenshot    Administrator/File Storage Utilization/FileStorageUtilizationDetailsTab.png
    click element    ${SEC/S360_SORT_BY_DD}
    Capture Page Screenshot    Administrator/File Storage Utilization/FileStorageUtilizationDetailsTabSortByList.png


TC_09 Verify Data Pool Categories page
    [Documentation]  Verifies translation for Data Pool Categories page
    [Tags]   TC09
    click element    ${S360_ADMINISTRATOR_RIBBON}
    wait until page contains element    ${SEC/S360_ADMIN_DATA_POOL_CATEGORIES_CARD_zh}
    SEC/S360 Navigate to Card    ${SEC/S360_ADMIN_DATA_POOL_CATEGORIES_CARD_zh}    ${S360_DATA_POOL_REFRESH_ICON_zh}
    wait until page contains element    ${S360_DATA_POOL_REFRESH_ICON_zh}
    Capture Page Screenshot    Administrator/Data Pool Categories/DataPoolCategories.png
    mouse over    ${S360_DATA_POOL_REFRESH_ICON_zh}
	sleep    1s
    Capture Page Screenshot    Administrator/Data Pool Categories/DataPoolRefreshIconTT.png


TC_10 Verify Audit page
    [Documentation]  Verifies translation for Audit page
    [Tags]   TC10
    click element    ${S360_ADMINISTRATOR_RIBBON}
    wait until page contains element    ${SEC/S360_ADMIN_AUDIT_CARD_zh}
    SEC/S360 Navigate to Card    ${SEC/S360_ADMIN_AUDIT_CARD_zh}      ${S360_AUDIT_FILTER_ICON}
    wait until page contains element    ${S360_AUDIT_FILTER_ICON}
    Capture Page Screenshot    Administrator/Audit/1.png
    click element    ${S360_AUDIT_FILTER_ICON}
    mouse over    ${SEC/S360_FLOAT_SAVE_BTN}
    sleep    1s
    Capture Page Screenshot    Administrator/Audit/AuditFilterSavebuttonTT.png
    mouse over    ${SEC/S360_ADMIN_AUDIT_FILTER_SAVE_zh}
    sleep    1s
    Capture Page Screenshot    Administrator/Audit/AuditFilterApplybuttonTT.png
    mouse over    ${SEC/S360_FLOAT_CANCEL_BTN}
    sleep    1s
    Capture Page Screenshot    Administrator/Audit/AuditFilterCancelbuttonTT.png
    SEC/S360_Scroll Page To Location    0    300
    Capture Page Screenshot    Administrator/Audit/2.png
    SEC/S360_Scroll Page To Location    0    950
    Capture Page Screenshot    Administrator/Audit/3.png
    SEC/S360_Scroll Page To Location    0    1500
    Capture Page Screenshot    Administrator/Audit/4.png
    mouse over    ${SEC/S360_AUDIT_FILTER_SEL_ITEM_2_SELECTED_zh}
    sleep    1s
    Capture Page Screenshot    Administrator/Audit/SelectedItem2SelectedTT.png
    mouse over    ${SEC/S360_AUDIT_FILTER_ALL_ITEM_2_SELECTED_zh}
    sleep    1s
    Capture Page Screenshot    Administrator/Audit/AllItem2SelectedTT.png
    mouse over    ${SEC/S360_AUDIT_FILTER_SEL_ITEM_2_AVAILABLE_zh}
    sleep    1s
    Capture Page Screenshot    Administrator/Audit/SelectedItem2AvailableTT.png
    mouse over    ${SEC/S360_AUDIT_FILTER_ALL_ITEM_2_AVAILABLE_zh}
    sleep    1s
    Capture Page Screenshot    Administrator/Audit/AllItem2AvailableTT.png


# Designer Role UI
TC_11 Verify Landing Page
    [Documentation]  Verifies translation of texts for the landing page
    [Tags]  TC11
    SEC/S360_Navigate To Different Role     ${SEC/S360_GO_TO_DESIGNER}
    wait until page contains element    ${S360_LANDING_PAGE_REQUIRED_LEGEND}
	Capture Page Screenshot    Designer/Landing Page/LandingPageUpperHalf.png
	sec/s360_scroll page to location    0    700
	Capture Page Screenshot    Designer/Landing Page/LandingPageLowerHalf.png
	mouse over    ${S360_LANDING_PAGE_PIN_NAVIGATOR}
    sleep    1s     # Remove sleep & Get the xpath of the tooltip and then capture
    Capture Page Screenshot    Designer/Landing Page/PinNavigatorToolTip.png
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    sleep    1s
    Capture Page Screenshot    Designer/Landing Page/DeletedAssestsToolTip.png


TC_12 Verify Scenes Page
    [Documentation]  Verifies translation of texts for the Scenes page
    [Tags]  TC12
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
#    SEC/S360_Navigate To Different Role     ${SEC/S360_GO_TO_DESIGNER}
    sleep    2s
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible    ${S360_SCENE_ITEM}
    click element    ${S360_SCENE_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Scenes/UpperHalf.png
	sec/s360_scroll page to location    0    1000
	Capture Page Screenshot    Designer/Scenes/LowerHalf.png
	sec/s360_scroll page to location    0    0
    click element    ${SEC/S360_SORT_BY_DD}
	Capture Page Screenshot    Designer/Scenes/SortByList.png
	click element    ${SEC/S360_SORT_BY_DD}
    mouse over    ${SEC/S360_ASCENDING_BTN}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/AscendingButtonTT.png
    mouse over    ${SEC/S360_DESCENDING_BTN}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/DescendingButtonTT.png
    mouse over    ${SEC/S360_CARDS_VIEW_BTN}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/GridViewButtonTT.png
    mouse over    ${SEC/S360_LIST_VIEW_BTN}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/GridViewButtonTT.png
    mouse over    ${SEC/S360_MSGCNTR_ICON}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/MessageCenterTT.png
    mouse over    ${S360_SCENES_ELLIPSIS_ICON}
	sleep    1s
	mouse over    ${S360_SCENES_ELLIPSIS_EDIT_ICON}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/EllipsesEditIconTT.png
    mouse over    ${S360_SCENES_ELLIPSIS_EXPORT_ICON}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/EllipsesExportIconTT.png
    mouse over    ${S360_SCENES_ELLIPSIS_DELETE_ICON}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/EllipsesDeleteIconTT.png
    mouse over    ${S360_SCENES_ELLIPSIS_PRINT_ICON}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/EllipsesPrintIconTT.png
    mouse over    ${S360_SCENES_ELLIPSIS_DUPLICATE_ICON}
	sleep    1s
    Capture Page Screenshot    Designer/Scenes/EllipsesDuplicateIconTT.png


TC_13 Verify Add New Scenes Page
    [Documentation]  Verifies translation of texts for the Add New Scenes page
    [Tags]  TC13
#    SEC/S360_Navigate To Different Role     ${SEC/S360_GO_TO_DESIGNER}
#    sleep    2s
#    mouse over    ${SEC/S360_TRASHCAN_ICON}
#    click element    ${S360_SCENE_ITEM}
    click element    ${S360_ADD_SCENE}
    Wait Until Element Is Visible    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Scenes/Add New Scene/UpperHalf.png
	sec/s360_scroll page to location    0    1000
	Capture Page Screenshot    Designer/Scenes/Add New Scene/LowerHalf.png
	sec/s360_scroll page to location    0    0
    mouse over    ${S360_SCENES_ADD_NEW_SHOW_HIDE_INTRO_ICON}
    sleep    2s
	Capture Page Screenshot    Designer/Scenes/Add New Scene/ShowHideIntroIconTT.png
	mouse over    ${SEC/S360_FORM_CANCEL_BTN}
    sleep    2s
	Capture Page Screenshot    Designer/Scenes/Add New Scene/CloseButtonTT.png
	mouse over    ${SEC/S360_FLOAT_SAVE_BTN}
    sleep    2s
	Capture Page Screenshot    Designer/Scenes/Add New Scene/SaveButtonTT.png
	mouse over    ${SEC/S360_FLOAT_PUBLISH_BTN}
    sleep    2s
	Capture Page Screenshot    Designer/Scenes/Add New Scene/PublishButtonTT.png
	mouse over    ${SEC/S360_FLOAT_CANCEL_BTN}
    sleep    2s
	Capture Page Screenshot    Designer/Scenes/Add New Scene/CancelButtonTT.png
	mouse over    ${SEC/S360_NAME_TXT}
    sleep    2s
	Capture Page Screenshot    Designer/Scenes/Add New Scene/NameFieldTT.png
	wait until element is visible    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	mouse over    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
    sleep    2s
	Capture Page Screenshot    Designer/Scenes/Add New Scene/CommentsButtonTT.png
	click element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	wait until element is visible    ${S360_SCENES_ADD_NEW_COMMENTS_FIELD}
	input text    ${S360_SCENES_ADD_NEW_COMMENTS_FIELD}    test
	click element    ${S360_SCENES_ADD_NEW_COMMENTS_FIELD_ADD_BTN}
	mouse over    ${S360_SCENES_ADD_NEW_COMMENTS_CLOSE_BTN}
	Capture Page Screenshot    Designer/Scenes/Add New Scene/CommentsModalWindow.png
	click element    ${S360_SCENES_ADD_NEW_COMMENTS_CANCEL_BTN}
	wait until page contains element    ${SEC/S360_FLOAT_CANCEL_BTN}
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
	wait until element is visible    ${SEC/S360_CANCEL_POP_BTN}
	Capture Page Screenshot    Designer/Scenes/Add New Scene/UnsavedChangesWindow.png
	click element    ${SEC/S360_CANCEL_POP_BTN}
	wait until element is visible    ${SEC/S360_TRASHCAN_ICON}


TC_14 Verify Organizations Page & Add Organizations window
    [Documentation]  Verifies translation of texts for the Organizations page & Add Organizations window
    [Tags]  TC14
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
    sleep    2s
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible    ${S360_ORGANIZATION_ITEM}
    click element    ${S360_ORGANIZATION_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Organizations.png
	click element    ${S360_ADD_SCENE}
	wait until element is visible    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Organizations/AddNewOrganizationUpperHalf.png
	sec/s360_scroll page to location    0    1000
	Capture Page Screenshot    Designer/Organizations/AddNewOrganizationLowerHalf.png
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
	wait until element is visible    ${SEC/S360_TRASHCAN_ICON}


TC_15 Verify Sites Page & Add Sites window
    [Documentation]  Verifies translation of texts for the Sites Page & Add Sites window
    [Tags]  TC15
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
    sleep    2s
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible    ${S360_SITES_ITEM}
    click element    ${S360_SITES_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Sites.png
	wait until keyword succeeds  5x  2s  Wait Until Element Is Visible    ${S360_ADD_SCENE}    timeout=10
	click element    ${S360_ADD_SCENE}
    wait until page contains element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Sites/AddNewSiteUpperHalf.png
	sec/s360_scroll page to location    0    1000
	Capture Page Screenshot    Designer/Sites/AddNewSiteLowerHalf.png
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until page contains element    ${SEC/S360_TRASHCAN_ICON}


TC_16 Verify Environments Page & Add Environments window
    [Documentation]  Verifies translation of texts for the Environments Page & Add Environments window
    [Tags]  TC16
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
    sleep    2s
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible    ${S360_ENV_ITEM}
    click element    ${S360_ENV_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Environments.png
	wait until keyword succeeds  5x  2s  Wait Until Element Is Visible    ${S360_ADD_SCENE}    timeout=10
	click element    ${S360_ADD_SCENE}
    wait until page contains element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Environments/AddNewEnvironmentUpperHalf.png
	sec/s360_scroll page to location    0    1000
	Capture Page Screenshot    Designer/Environments/AddNewEnvironmentLowerHalf.png
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until page contains element    ${SEC/S360_TRASHCAN_ICON}


TC_17 Verify Clouds Page
    [Documentation]  Verifies translation of texts for the Clouds Page
    [Tags]  TC17
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
    sleep    2s
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible    ${S360_CLOUD_ITEM}
    click element    ${S360_CLOUD_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Clouds.png


TC_18 Verify Site Servers Page
    [Documentation]  Verifies translation of texts for the Site Servers Page
    [Tags]  TC18
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
    sleep    2s
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible    ${S360_SITE_SERVER_ITEM}
    click element    ${S360_SITE_SERVER_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/SiteServers.png


TC_19 Verify Data Sources Page & Add Data Sources window
    [Documentation]  Verifies translation of texts for the Data Sources Page & Add Data Sources window
    [Tags]  TC19
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
    sleep    2s
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible    ${S360_DATA_SOURES_ITEM}
    click element    ${S360_DATA_SOURES_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/DataSourcesPage.png
	wait until keyword succeeds  5x  2s  Wait Until Element Is Visible    ${S360_ADD_SCENE}    timeout=10
	click element    ${S360_ADD_SCENE}
    wait until page contains element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Data Sources/AddNewDataSource.png
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until page contains element    ${SEC/S360_TRASHCAN_ICON}



# Operator Role UI
TC_20 Verify Landing Page of Operator
    [Documentation]  Verifies translation of texts for the landing page
    [Tags]  TC20
    SEC/S360_Navigate To Different Role     ${SEC/S360_GO_TO_OPERATOR}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_VAULT_CARD_DESC}
	Capture Page Screenshot    Operator/Landing Page/LandingPageUpperHalf.png
	mouse over    ${SEC/S360_TRASHCAN_ICON}
    sleep    2s
    Capture Page Screenshot    Operator/Landing Page/DeletedAssestsToolTip.png
	sec/s360_scroll page to location    0    700
	Capture Page Screenshot    Operator/Landing Page/LandingPageLowerHalf.png


TC_21 Verify Notification Rules Page
    [Documentation]  Verifies translation of texts for the Notification Rules page
    [Tags]  TC21
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${OperatorRole}
    Wait Until Element Is Visible    ${S360_OP_NOTI_RULES_CARD}
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


TC_22 Verify Enterprise Notification Summary Page
    [Documentation]  Verifies translation of texts for the Enterprise Notification Summary page
    [Tags]  TC22
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${OperatorRole}
    Wait Until Element Is Visible    ${S360_OP_EN_SUMM_CARD}
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


TC_23 Verify Production Page
    [Documentation]  Verifies translation of texts for the Production page
    [Tags]  TC23
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${OperatorRole}
    Wait Until Element Is Visible    ${SEC/S360_OPER_PRODUCTION_CARD_zh}
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


TC_24 Verify My Views Page
    [Documentation]  Verifies translation of texts for the My Views page
    [Tags]  TC24
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${OperatorRole}
    Wait Until Element Is Visible    ${S360_OP_MY_VIEWS_CARD}
    SEC/S360 Navigate to Card    ${S360_OP_MY_VIEWS_CARD}    ${S360_ITEMS_PER_PAGE_TEXT}
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
    wait until element is visible    ${SEC/S360_FLOAT_SAVE_BTN}
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


TC_25 Verify Manage Scenes Page
    [Documentation]  Verifies translation of texts for the Manage Scenes page
    [Tags]  TC25
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}    ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${OperatorRole}
    Wait Until Element Is Visible    ${SEC/S360_OPER_MANAGE_SCENES_CARD_zh}
    SEC/S360 Navigate to Card    ${SEC/S360_OPER_MANAGE_SCENES_CARD_zh}    ${S360_ITEMS_PER_PAGE_TEXT}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_ITEMS_PER_PAGE_TEXT}
    Capture Page Screenshot    Operator/Manage Scenes/UpperHalf.png
    sec/s360_scroll page to location    0    1000
    Capture Page Screenshot    Operator/Manage Scenes/LowerHalf.png
    sec/s360_scroll page to location    0    0
    click element    ${S360_OPERATOR_BREADCRUMB}
    wait until element is visible    ${S360_VAULT_CARD_DESC}


TC_26 Verify Vault Page
    [Documentation]  Verifies translation of texts for the Manage Scenes page
    [Tags]  TC26
    sec/s360_common logout
    select from list by label    ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${OperatorRole}
    Wait Until Element Is Visible    ${SEC/S360_OPER_VAULT_CARD_zh}
    SEC/S360 Navigate to Card    ${SEC/S360_OPER_VAULT_CARD_zh}    ${S360_AUDIT_FILTER_ICON}
    Wait Until Element Is Visible  ${S360_AUDIT_FILTER_ICON}
    Capture Page Screenshot    Operator/Vault/FullPage.png
    click element    ${S360_AUDIT_FILTER_ICON}
    Capture Page Screenshot    Operator/Vault/AddFiltertophalf.png
    sec/s360_scroll page to location    0    600
    Capture Page Screenshot    Operator/Vault/AddFilterbottomhalf.png
    sec/s360_common logout


