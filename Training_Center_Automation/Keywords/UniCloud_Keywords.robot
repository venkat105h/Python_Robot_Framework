#------------------------------------------------------------------
#   Description       :      Test Cases for Training Center
#   Project           :      UniSphere Training Center Automation
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
Library     BuiltIn
Library     SeleniumLibrary
Library     String
Library     Collections
Resource    ../Locators/Generic_Locators.robot
Resource    ../Locators/UniCloud_Locators.robot
Resource    ../Locators/Training_Center_Locators.robot

*** Keywords ***
CLD_Enter Credentials and Login to Application
    [Documentation]  Launched browser, Navigates to specified URL and Logs in to the solution by entering username and password
    Input Text              ${CLD_USERNAME_TXT}      ${CLD_Username}
    Input Text              ${UNI_PASSWORD_TXT_BOX}  ${CLD_Password}
    Click Element           ${CLD_LOGIN_BTN}
    UNI_Wait For Element    ${CLD_WELCOME_LINK}

CLD_Navigate to Customers Card
    [Documentation]  Navigates to Customer Card
	Reload Page
    Click Element  ${CLD_CUSTOMERS_CARD}
	Sleep  2s
	UNI_Scroll Page To Location  0  0
	Sleep  2s
    UNI_Wait For Element  ${CLD_ADD_CUSTOMER_BTN}

CLD_Add and Enable Subscription Videos for Customer
    [Documentation]  Navigates to eng-qa summary page and enables subscription videos in UniSphere Training Center

	CLD_Navigate to Eng-svt Server
    Click Element  ${CLD_ADD_FEATURE_BTN}

    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [1]  ${CLD_UniSphere_Index}
    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [2]  ${CLD_Subs_Video_Index}
    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [3]  ${CLD_Sys_Resp_Index}

    Input Text      ${CLD_TABLE_VALUES_TEXTBOX} [1]  ${CLD_Tier_Name}
    Click Element   ${CLD_TABLE_TOGGLE_SWITCH}
    Click Element   ${CLD_TABLE_SAVE_BTN}
    CLD_Save Changes

CLD_Click on the Specific Server
    [Documentation]  Navigates to eng-svt customer server

    ${IDValue}=  Get Element Attribute  ${CLD_ENG_SVT_TEXT}  id
    ${Index}=  Remove String  ${IDValue}  Engineering SVT-
    ${Index}=  Convert To Integer  ${Index}
    Click Element  ${ENG_SVT_CUST_ID}-${Index}
    UNI_Wait For Element  ${CLD_ADD_FEATURE_BTN}
	UNI_Scroll Page To Location  0  0

CLD_Disable/Delete Subscription Videos for eng-svt
    [Documentation]  Disbale subscription videos in eng-svt

	CLD_Navigate to Eng-svt Server
	
	${EleID}=  Get Element Attribute  ${CLD_SUBS_VIDEOS_FEATURE}  id
	${Index}=  Remove String  ${EleID}  Subscription Videos-
	Click Element  ${CLD_DELETE_FEATURE_BTN}${Index}
	CLD_Save Changes

CLD_Navigate to Eng-svt Server
    [Documentation]  Deletes the specific record from UniCloud

    # Navigate to last page
	UNI_Scroll Page To Location  0  0
	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20
	${Multiple_Pages}=  Run Keyword And Return Status  Element Should Be Visible  ${CLD_LAST_PAGE_BTN}

	${LastPageNumber}=  Run Keyword If  '${Multiple_Pages}'=='${TRUE}'  Run Keywords  Click Element   ${CLD_LAST_PAGE_BTN}
    ...  AND  Get Text  ${CLD_LAST_PAGE_BTN_ELEMENT_ID}
    ...  AND  Click Element  ${CLD_FIRST_PAGE_BTN}

    ${LastPageNumber}=  Set Variable If  '${LastPageNumber}'=='None'  ${1}  ${LastPageNumber}
	
	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20
	UNI_Scroll Page To Location  0  0

	# Navigate through pages till the artifact is visible
	FOR   ${IndividualPage}  IN RANGE  0  ${LastPageNumber}
		${FoundStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${CLD_ENG_SVT_TEXT}
		Run Keyword If  '${FoundStatus}' == '${TRUE}'  Run Keywords  CLD_Click on the Specific Server
		...  AND  Exit For Loop
		...  ELSE  Click Element  ${CLD_NEXT_PAGE_BTN}
    END
CLD_Save Changes
    [Documentation]  Saves the changes in video subscription card

    Mouse Over     ${CLD_FLOAT_OPTION_BTN}
    Click Element  ${CLD_FLOAT_SAVE_BTN}
    UNI_Scroll Page To Location  0  0
    UNI_Wait For Element  ${CLD_SUCCESS_MESSAGE}