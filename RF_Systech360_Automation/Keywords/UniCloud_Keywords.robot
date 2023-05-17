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
Resource    ../Locators/UniCloud_Locators.robot
Resource    ../Keywords/SDP_Keywords.robot

*** Keywords ***
CLD_Enter Credentials and Login to Application
    [Documentation]  Launched browser, Navigates to specified URL and Logs in to the solution by entering username and password

    Input Text              ${CLD_USERNAME_TXT}      ${CLD_User}
    Input Text              ${CLD_PASSWORD_TXT}  ${CLD_Pass}
    Click Element           ${CLD_LOGIN_BTN}
    Wait Until Element Is Visible    ${CLD_WELCOME_LINK}

CLD_Navigate to Customers Card
    [Documentation]  Navigates to Customer Card

    Click Element  ${CLD_CUSTOMERS_CARD}
    Wait Until Element Is Visible  ${CLD_ADD_CUSTOMER_BTN}

CLD_Add and Enable Subscription Videos for Customer
    [Documentation]  Navigates to eng-qa summary page and enables subscription videos in UniSphere Training Center

	CLD_Navigate to Server  ${CLD_ENG_SVT_TEXT}  Engineering SVT  ${ENG_SVT_CUST_ID}
    Click Element  ${CLD_ADD_FEATURE_BTN}

    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [1]  ${CLD_UniSphere_Index}
    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [2]  ${CLD_Subs_Video_Index}
    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [3]  ${CLD_Sys_Resp_Index}

    Input Text      ${CLD_TABLE_VALUES_TEXTBOX} [1]  ${CLD_Tier_Name}
    Click Element   ${CLD_TABLE_TOGGLE_SWITCH}
    Click Element   ${CLD_TABLE_SAVE_BTN}1
    CLD_Save Changes
    
CLD_Add Enterprise Notification for Customer
    [Documentation]    Adds enterprise notificaion in Systech360 solution
    
    Wait Until Element Is Visible  ${CLD_EDIT_CUST_FEAT_BTN}1
    Click Element  ${CLD_ADD_FEATURE_BTN}
    
    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [1]  ${CLD_UniSphere_Index}
    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [2]  ${CLD_Entr_Noti_Index}
    Select From List By Index  ${CLD_TABLE_DROPDOWNS} [3]  ${CLD_Sys_Resp_Index}
    Click Element  ${CLD_TOGGLE_SWITCH}0')])

    Click Element   ${CLD_TABLE_SAVE_BTN}0
    CLD_Save Changes
    reload page
    
CLD_Enable/Disable a Feature in Customer
    [Documentation]    Clicks on toggle button and enables/disables a feature
    
    [Arguments]  ${Feature_Name}  ${Enable/Disable}

    wait until element is visible    //*[contains(@id, '${Feature_Name}')]
    ${EleID}=  Get Element Attribute  //*[contains(@id, '${Feature_Name}')]  id
	${Index}=  Remove String  ${EleID}  ${Feature_Name}-
#	${Index}=  convert to integer    ${Index}
#	${Index}=  evaluate    ${Index}-1
	wait until element is visible    ${CLD_EDIT_CUST_FEAT_BTN}${Index}
	Click Element  ${CLD_EDIT_CUST_FEAT_BTN}${Index}
	sleep    3s
	capture page screenshot
	${isEditOpened} =    run keyword and return status    element should be visible    xpath://select
	run keyword if    '${isEditOpened}'=='False'    Click Element  ${CLD_EDIT_CUST_FEAT_BTN}${Index}
	sleep    3s
	capture page screenshot
	${Switch_Status}=  Get Element Attribute  ${CLD_TOGGLE_SWITCH}${Index}')])  id
	${Enable_Status}=  Run Keyword And Return Status  Should Contain  ${Switch_Status}  1-
	Run Keyword If  '${Enable/Disable}'=='Enable' and '${Enable_Status}'=='${FALSE}'  wait until keyword succeeds    5x    1s    Click Element  ${CLD_TOGGLE_SWITCH}${Index}')])
	...  ELSE IF  '${Enable/Disable}'=='Disable' and '${Enable_Status}'=='${TRUE}'  wait until keyword succeeds    5x    1s    Click Element  ${CLD_TOGGLE_SWITCH}${Index}')])
	Click Element  ${CLD_TABLE_SAVE_BTN}${Index}
	CLD_Save Changes

CLD_Click on the Specific Server
    [Documentation]  Navigates to eng-svt customer server
    
    [Arguments]  ${ServerTxtID}  ${ServerName}  ${CustID}
    
    ${IDValue}=  Get Element Attribute  ${ServerTxtID}  id
    ${Index}=  Remove String  ${IDValue}  ${ServerName}-
    ${Index}=  Convert To Integer  ${Index}
    Click Element  ${CustID}-${Index}
    Wait Until Element Is Visible  ${CLD_ADD_FEATURE_BTN}
	SEC/S360_Scroll Page To Location  0  0


CLD_Click on Server
    [Documentation]  Navigates to eng-svt customer server

    [Arguments]  ${ServerTxtID}  ${ServerName}  ${CustID}

    wait until element is visible    ${CustID}
    Click Element  ${CustID}
    Wait Until Element Is Visible  ${CLD_ADD_FEATURE_BTN}
	SEC/S360_Scroll Page To Location  0  0

CLD_Disable/Delete Subscription Videos for eng-svt
    [Documentation]  Disbale subscription videos in eng-svt

	CLD_Navigate to Eng-svt Server
	
	${EleID}=  Get Element Attribute  ${CLD_SUBS_VIDEOS_FEATURE}  id
	${Index}=  Remove String  ${EleID}  Subscription Videos-
	Click Element  ${CLD_DELETE_FEATURE_BTN}${Index}
	CLD_Save Changes

CLD_Navigate to Server
    [Documentation]  Deletes the specific record from UniCloud
    
    [Arguments]  ${ServerTxtID}  ${ServerName}  ${CustID}
    
    # Navigate to last page
	SEC/S360_Scroll Page To Location  0  0
	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20
	
	${Total_Pages}=  SEC_SDP_Count the Number of Pages to Navigate
	
	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20
	SEC/S360_Scroll Page To Location  0  0
	wait until element is visible    ${ServerTxtID}

	# Navigate through pages till the artifact is visible
	FOR    ${IndividualPage}  IN RANGE  0  ${Total_Pages}
		${FoundStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${ServerTxtID}
		Run Keyword If  '${FoundStatus}' == '${TRUE}'  Run Keywords  CLD_Click on the Specific Server  ${ServerTxtID}  ${ServerName}  ${CustID}
		...  AND  Exit For Loop
		...  ELSE  Click Element  ${CLD_NEXT_PAGE_BTN}
    END


CLD_Navigate Server
    [Documentation]  Deletes the specific record from UniCloud

    [Arguments]  ${ServerTxtID}  ${ServerName}  ${CustID}

    # Navigate to last page
	SEC/S360_Scroll Page To Location  0  0
	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20

	${Total_Pages}=  SEC_SDP_Count the Number of Pages to Navigate

	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20
	SEC/S360_Scroll Page To Location  0  0
	wait until element is visible    ${ServerTxtID}

	# Navigate through pages till the artifact is visible
	FOR    ${IndividualPage}  IN RANGE  0  ${Total_Pages}
		${FoundStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${ServerTxtID}
		Run Keyword If  '${FoundStatus}' == '${TRUE}'  Run Keywords  CLD_Click on the Specific Server  ${ServerTxtID}  ${ServerName}  ${CustID}
		...  AND  Exit For Loop
		...  ELSE  Click Element  ${CLD_NEXT_PAGE_BTN}
    END

CLD_Save Changes
    [Documentation]  Saves the changes in video subscription card

    Mouse Over     ${CLD_FLOAT_OPTION_BTN}
    wait until keyword succeeds  5x  2s  Click Element  ${CLD_FLOAT_SAVE_BTN}
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Element Is Visible  ${CLD_SUCCESS_MESSAGE}
    wait until keyword succeeds  5x  2s  Click Element    ${SEC/S360_DISMISS_MSG_CNTR}
    
CLD_Enable/Disable EN In UniCloud Eng-svt
    [Documentation]    Navigates to eng-svt tenant and enables the enterprise notification for Systech360
    
    [Arguments]  ${Enable/Disable}
    
    GoTo  ${CLD_URL}
    CLD_Enter Credentials and Login to Application
    CLD_Navigate to Customers Card
    CLD_Navigate to Server    ${CLD_ENG_SVT_TEXT}  Engineering SVT  ${ENG_SVT_CUST_ID}
#    CLD_Add Enterprise Notification for Customer
    CLD_Enable/Disable a Feature in Customer   EnterpriseNotification   ${Enable/Disable}


Enable/Disable EN In UniCloud Eng-qa
    [Documentation]    Navigates to eng-svt tenant and enables the enterprise notification for Systech360

    [Arguments]  ${Enable/Disable}

    GoTo  ${UNICLOUD_URL}
    CLD_Enter Credentials and Login to Application
    CLD_Navigate to Customers Card
#    CLD_Navigate to Server    ${CLD_ENG_QA_TEXT}  Engineering QA  ${CLD_SERVER_NAME_QA}
#    CLD_Add Enterprise Notification for Customer
    wait until element is visible    //*[@id="100000002-1"]
    wait until keyword succeeds    3x  3s  click element    //*[@id="100000002-1"]
    CLD_Enable/Disable a Feature in Customer   EnterpriseNotification   ${Enable/Disable}
    CLD_Enable/Disable a Feature in Customer   Operations   ${Enable/Disable}