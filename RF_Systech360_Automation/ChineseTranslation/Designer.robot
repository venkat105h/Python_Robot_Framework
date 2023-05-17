#------------------------------------------------------------------
#   Description       :      TestSuite for testing Chinese translation of texts for Designer role
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
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/Designer_Locators.robot

Suite Setup     Run Keywords  SEC/S360_Open Browser And Enter URL   ${URL}
...  AND  Select From List by index  ${SEC/S360_LANGUAGE_SELECT_BOX}   ${SEC/S360_LANGUAGE_SELECT_VALUE}
...  AND  SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${DesignerRole}
...  AND  set screenshot directory    ${SEC/S360_SCREENSHOT_LOCATION}

Suite Teardown  Close Browser


*** Test Cases ***

TC_01 Verify Landing Page
    [Documentation]  Verifies translation of texts for the landing page
    [Tags]  TC01
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


TC_02 Verify Scenes Page
    [Documentation]  Verifies translation of texts for the Scenes page
    [Tags]  TC02
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


TC_03 Verify Add New Scenes Page
    [Documentation]  Verifies translation of texts for the Add New Scenes page
    [Tags]  TC03
#    mouse over    ${SEC/S360_TRASHCAN_ICON}
#    click element    ${S360_SCENE_ITEM}
    click element    ${S360_ADD_SCENE}
    wait until page contains element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
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


TC_04 Verify Organizations Page & Add Organizations window
    [Documentation]  Verifies translation of texts for the Organizations page & Add Organizations window
    [Tags]  TC04
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    sleep    2s
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


TC_05 Verify Sites Page & Add Sites window
    [Documentation]  Verifies translation of texts for the Sites Page & Add Sites window
    [Tags]  TC05
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    click element    ${S360_SITES_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Sites.png
	click element    ${S360_ADD_SCENE}
    wait until page contains element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Sites/AddNewSiteUpperHalf.png
	sec/s360_scroll page to location    0    1000
	Capture Page Screenshot    Designer/Sites/AddNewSiteLowerHalf.png
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until page contains element    ${SEC/S360_TRASHCAN_ICON}


TC_06 Verify Environments Page & Add Environments window
    [Documentation]  Verifies translation of texts for the Environments Page & Add Environments window
    [Tags]  TC06
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    click element    ${S360_ENV_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Environments.png
	click element    ${S360_ADD_SCENE}
    wait until page contains element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Environments/AddNewEnvironmentUpperHalf.png
	sec/s360_scroll page to location    0    1000
	Capture Page Screenshot    Designer/Environments/AddNewEnvironmentLowerHalf.png
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until page contains element    ${SEC/S360_TRASHCAN_ICON}


TC_07 Verify Clouds Page
    [Documentation]  Verifies translation of texts for the Clouds Page
    [Tags]  TC07
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    click element    ${S360_CLOUD_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/Clouds.png


TC_08 Verify Site Servers Page
    [Documentation]  Verifies translation of texts for the Site Servers Page
    [Tags]  TC08
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    click element    ${S360_SITE_SERVER_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/SiteServers.png


TC_09 Verify Data Sources Page & Add Data Sources window
    [Documentation]  Verifies translation of texts for the Data Sources Page & Add Data Sources window
    [Tags]  TC09
    mouse over    ${SEC/S360_TRASHCAN_ICON}
    click element    ${S360_DATA_SOURES_ITEM}
    wait until page contains element    ${S360_ITEMS_PER_PAGE_TEXT}
	Capture Page Screenshot    Designer/DataSourcesPage.png
	click element    ${S360_ADD_SCENE}
    wait until page contains element    ${S360_SCENES_ADD_NEW_COMMENTS_BTN}
	Capture Page Screenshot    Designer/Data Sources/AddNewDataSource.png
	click element    ${SEC/S360_FLOAT_CANCEL_BTN}
    wait until page contains element    ${SEC/S360_TRASHCAN_ICON}