#------------------------------------------------------------------
#   Description       :      User defined Keywords for Site Defined Privilege
#   Project           :      Site Defined Privilege Automation
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
Documentation  Necessary Libraries and Resources file are mentioned below
Library         BuiltIn
Library         Collections
Library         String
Library         SeleniumLibrary  timeout=20.0
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/SDP_Locators.robot
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Admin_Keywords.robot
Resource        ../Locators/Admin_Locators.robot
Variables       ../Variables/Variable.py

*** Keywords ***
SEC_SDP_Precondition For Privilege Access
    [Documentation]  Creates Groups ad assigns the groups to the user
    SEC/S360_Precondition for No Challenge Questions
    @{Roles_List}=    Create List   ${SEC/S360_ADMIN_ROLE}
    @{Roles_List1}=   Create List   ${SEC/S360_ADMIN_ROLE}  ${SEC/S360_DESIGNER_ROLE}  ${SEC/S360_OPERATOR_ROLE}
    @{User_Details}=  Split String  ${NewUser_Details_SDP}   ,
    @{Groups_List}=   Split String  ${UserGroup_Details_SDP}  ,
    Set Global Variable  @{Roles_List}
    Set Global Variable  @{Roles_List1}
    Set Global Variable  @{User_Details}
    Set Global Variable  @{Groups_List}
    # Create Groups
    SEC/S360_Navigate to User/Groups Page
    SEC/S360_Create New Group  ${Groups_List}[0]  ${Group_Description}  @{Roles_List}
    SEC/S360_Wait For Success Message
    SEC/S360_Create New Group  ${Groups_List}[1]  ${Group_Description}  @{Roles_List1}
    SEC/S360_Wait For Success Message
    # Create User with specific Groups assigned
    SEC/S360_Scroll Page To Location  0  0
    SEC/S360_Create New User  ${User_Details}  ${Groups_List}[0]
    SEC/S360_Switch Between UniSecure/Systech360   ${SEC/S360_NAV_GO_TO_ADMIN}  preferenceCardName_1
    SEC/S360_Click On User_Groups/Security Policies Card  User_Groups
    SEC/S360_Create New Group  ${Groups_List}[2]  ${Group_Description}   @{Roles_List}
    SEC/S360_Wait For Success Message
    SEC/S360_Update Groups Assigned For User  ${User_Details}[0]  Select  ${Groups_List}[2]
    SEC/S360_Switch Between UniSecure/Systech360   ${SEC/S360_NAV_GO_TO_ADMIN}  preferenceCardName_1

SEC_SDP_Enter SDP Details
    [Documentation]  Enters name, data type, value, Description, Roles
    [Arguments]  ${SDP_Name}  ${SDP_Data_Type}  ${SDP_Value}  ${SDP_Desc}  @{Roles}
    Wait Until Element Is Visible  ${SEC_SDP_NAME_INPUT}
    Input Text  ${SEC_SDP_NAME_INPUT}  ${SDP_Name}
    Select From List By Index  ${SEC_SDP_DATA_TYPE_INPUT}  ${SDP_Data_Type}
    Input Text  ${SEC_SDP_VALUE_INPUT}  ${SDP_Value}
    Input Text  ${SEC_SDP_DESCRIPTION_INPUT}  ${SDP_Desc}
    Click Element  ${SEC_SDP_ROLES_LIST}
    Wait Until Element Is Visible  ${SEC_SDP_ADMIN_ROLE_CHKBOX_ID}
    FOR    ${Role}  IN  @{Roles}
        ${admin_role}=  Run Keyword And Return Status  Should Contain  ${Role}  administrator
        ${operator_role}=  Run Keyword And Return Status  Should Contain  ${Role}  inspector
        ${designer_role}=  Run Keyword And Return Status  Should Contain  ${Role}  designer
        Run Keyword If  '${admin_role}'=='${TRUE}'  Click Element  ${SEC_SDP_ADMIN_ROLE_CHKBOX_ID}
        ...  ELSE IF  '${operator_role}'=='${TRUE}'  Click Element  ${SEC_SDP_OPERATOR_ROLE_CHKBOX_ID}
        ...  ELSE IF  '${designer_role}'=='${TRUE}'  Click Element  ${SEC_SDP_DESIGNER_ROLE_CHKBOX_ID}
    END
    Click Element  ${SEC_SDP_ROLES_LIST}

SEC_SDP_Click On Save SDP Button
    [Documentation]  Clicks on Save button and verifies message prefix
    Click Element  ${SEC_SDP_SAVE_CHANGES_BTN}
    Wait Until Element is Visible  ${SEC/S360_MSG_CENTER}

SEC_SDP_Click On Edit/Delete SDP Button
    [Documentation]  Clicks on Delete button
    [Arguments]  ${NameOfSDP}  ${Button_ID}
    SEC/S360_Scroll Page To Location    0    1000
    ${Total_Elements}=  Get Element Count  ${SEC_SDP_NAME_TEXT}
    FOR    ${Name_Index}  IN RANGE  1  ${Total_Elements}+1
        ${Name_Value}=  Get Text  ${SEC_SDP_NAME_TEXT} [${Name_Index}]
        ${Attr_Val}=  Run Keyword If  '${Name_Value}'=='${NameOfSDP}'  Get Element Attribute  ${SEC_SDP_NAME_TEXT} [${Name_Index}]  id
        ${Attr_Status}=  Run Keyword And Return Status  Should End With  ${Attr_Val}  Txt
        ${Index}=  Run Keyword If  '${Attr_Status}'=='${TRUE}'  Remove String  ${Attr_Val}  name_  _Txt
        Run Keyword If  '${Attr_Status}'=='${TRUE}'  Run Keywords  Click Element  ${Button_ID}${Index}
        ...  AND  Exit For Loop
    END
	SEC/S360_Scroll Page To Location    0   0
    [Return]  ${Attr_Status}

SEC_SDP_Navigate to Pages and Click on Edit/Delete Button
    [Documentation]  Navigate when multiple pages found
    [Arguments]  ${NameOfSDP}  ${Button_ID}
    ${Total_Pages_To_Navigate}=  SEC_SDP_Count the Number of Pages to Navigate
    FOR    ${Index}  IN RANGE  1  ${Total_Pages_To_Navigate}+1
        ${Attr_Status}=  SEC_SDP_Click On Edit/Delete SDP Button  ${NameOfSDP}  ${Button_ID}
        Exit For Loop If  '${Attr_Status}'=='${TRUE}'
        Click Element  ${SEC_SDP_NEXT_PAGE_BTN}
    END

SEC_SDP_Count the Number of Pages to Navigate
    [Documentation]  Returns the maximum number of pages to navigate
    ${Total_Pages_To_Navigate}=  Set Variable  ${EMPTY}
    ${Multiple_Pages_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC_SDP_NAVIGATION_PAGES}
    Run Keyword If  '${Multiple_Pages_Status}'=='${TRUE}'  Run Keywords  Click Element  ${SEC_SDP_LAST_PAGE_BTN}
    ...  AND  Sleep  2S
    ${Total_Pages_To_Navigate}=  Run Keyword If  '${Multiple_Pages_Status}'=='${TRUE}'  Get Text  ${SEC_SDP_ACTIVE_PAGE}
    Run Keyword If  '${Multiple_Pages_Status}'=='${TRUE}'  Run Keywords  Click Element  ${SEC_SDP_FIRST_PAGE_BTN}
    ...  AND  Sleep  2S
    ${Total_Pages_To_Navigate}=  Run Keyword If  '${Total_Pages_To_Navigate}'=='None'  Set Variable  1
    ...  ELSE    Set Variable  ${Total_Pages_To_Navigate}
    [Return]  ${Total_Pages_To_Navigate}

SEC_SDP_Update Existing SDP
    [Documentation]  Updates an existing spd with the new name and value
    [Arguments]  ${NameOfSDP}  ${ValueOfSdp}
    Wait Until Element Is Visible  ${SEC_SDP_NAME_INPUT}
    Set Focus To Element  ${SEC_SDP_NAME_INPUT}
    Input Text  ${SEC_SDP_NAME_INPUT}   ${NameOfSDP}
    Input Text  ${SEC_SDP_VALUE_INPUT}  ${ValueOfSdp}
    SEC_SDP_Click On Save SDP Button

SEC_SDP_Navigate to Support Center
    [Documentation]  Navigates to support center page
    Wait Until Element Is Visible  ${SEC/S360_HAMBURGER_MENU}
    Mouse Over  ${SEC/S360_HAMBURGER_MENU}
    Wait Until Element Is Visible  ${SEC/S360_HAMBURGER_MENU}
    Click Element  ${SEC/S360_SUPPORT_CENTER_HAM}
    Sleep  1S
    Wait Until Element Is Visible  ${SEC/S360_CASE_HISTORY_CARD}
    Mouse Over  ${SEC/S360_WELCOME_LINK}

SEC_SDP_Search For Created SDP
    [Documentation]  Searches for the required SDP name in the Roles tab and returns the found status
    [Arguments]  ${NameOfSDP}
    ${Total_Elements}=  Get Element Count  ${SEC_SDP_NAME_TEXT}
    ${Index_Number}=  Set Variable  0
    FOR  ${Name_Index}  IN RANGE  1  ${Total_Elements}+1
        ${Name_Value}=  Get Text  ${SEC_SDP_NAME_TEXT} [${Name_Index}]
        ${Index_Number}=  Set Variable If  '${Name_Value}'=='${NameOfSDP}'  ${Index_Number}+${Name_Index}  ${Index_Number}
        Run Keyword If  '${Name_Value}'=='${NameOfSDP}'  Exit For Loop
    END

    [Return]  ${Index_Number}

SEC_SDP_Search SDP in Roles Tab
    [Documentation]  Navigates to multiple pages and performs search operation
    [Arguments]  ${Role_Name}  ${NameOfSDP}
    SEC/S360_Scroll Page To Location    0    0
    Click Element  ${SEC/S360_ROLES_TAB}
    Click Element  ${Role_Name}
    Wait Until Element Is Visible  ${SEC_SDP_NAME_TEXT} [1]  timeout=10
    ${Total_Pages_To_Navigate}=  SEC_SDP_Count the Number of Pages to Navigate
    FOR  ${Index}  IN RANGE  1  ${Total_Pages_To_Navigate}+1
        ${Index_Number}  SEC_SDP_Search For Created SDP  ${NameOfSDP}
        Exit For Loop If  '${Index_Number}'>'0'
        Click Element  ${SEC_SDP_NEXT_PAGE_BTN}
    END

    [Return]  ${Index_Number}

SEC_SDP_Set Renewal Info And Case History Status
    [Documentation]  Sets the Show renewal info and Show case history status as enabled or disabled

    [Arguments]  ${NameOfGroup}  ${NameOfRole}  ${SCH_Status}  ${SRI_Status}
    ${SRI_Status}=  Set Variable If  '${SRI_Status}'=='Enable'  0  1
    ${SCH_Status}=  Set Variable If  '${SCH_Status}'=='Enable'  0  1
    ${Index_Number}  SEC/S360_Search UserGroup  ${NameOfGroup}
    SEC/S360_Scroll Page To Location  0  600
    Run Keyword If  '${Index_Number}'!='0'  Run Keywords  Click Element  ${SEC/S360_GROUP_NAME_TEXT} [${Index_Number}]
    ...  AND  Wait Until Element Is Visible  ${SEC_SDP_NAME_TEXT}    timeout=10
    ${Index_Number}  SEC_SDP_Search SDP in Roles Tab   ${NameOfRole}  Show renewal information
    Click Element  ${SEC_SDP_EDIT_BTN} [${Index_Number}]
    Select From List By Index  ${SEC_SDP_VALUES_DD} [1]  ${SRI_Status}
    Click Element  ${SEC_SDP_SAVE_CHANGES_BTN} [1]
    Sleep  2S
    ${Index_Number}  SEC_SDP_Search SDP in Roles Tab   ${NameOfRole}  Show case history
    Click Element  ${SEC_SDP_EDIT_BTN} [${Index_Number}]
    Select From List By Index  ${SEC_SDP_VALUES_DD} [1]  ${SCH_Status}
    Click Element  ${SEC_SDP_SAVE_CHANGES_BTN} [1]

    Click Element  ${SEC/S360_FLOAT_SAVE_BTN}
    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}
    wait until keyword succeeds  3x  2s  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}

SEC_SDP_Verify Renewal Info And Case History In Support Center
    [Documentation]  Verifies Show renewal info and Show case history are enabled or disabled in Support Center
    [Arguments]  ${SCH_Status}  ${SRI_Status}
    ${SRI_Status}=  Set Variable If  '${SRI_Status}'=='Enable'  ${TRUE}  ${FALSE}
    ${SCH_Status}=  Set Variable If  '${SCH_Status}'=='Enable'  ${TRUE}  ${FALSE}
    repeat keyword    3 times    Mouse Over  ${SEC/S360_HAMBURGER_MENU}
    wait until keyword succeeds    5x    1s    Mouse Over  ${SEC/S360_SUPPORT_CENTER_HAM}
    Sleep  2S
    Capture Page Screenshot
    ${CH_Ham_Clas_Attr}=  Get Element Attribute  ${SEC/S360_CASE_HISTORY_HAM}  class
    ${CH_Ham_Status}=  Run Keyword And Return Status  Should Contain  ${CH_Ham_Clas_Attr}  disabled
    ${RI_Ham_Clas_Attr}=  Get Element Attribute  ${SEC/S360_RENEWAL_INFO_HAM}  class
    ${RI_Ham_Status}=  Run Keyword And Return Status  Should Contain  ${RI_Ham_Clas_Attr}  disabled
    Run Keyword If  '${SCH_Status}'=='${CH_Ham_Status}' or '${SRI_Status}'=='${RI_Ham_Status}'  Fail
	Click Element  ${SEC/S360_SUPPORT_CENTER_HAM}
    Mouse Over  ${SEC/S360_WELCOME_LINK}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_CASE_HISTORY_CARD}
    Sleep  2S
    wait until element is visible    ${SEC/S360_CASE_HISTORY_CARD}
    ${CH_Card_Clas_Attr}=  Get Element Attribute  ${SEC/S360_CASE_HISTORY_CARD}  class
    ${CH_Card_Status}=  Run Keyword And Return Status  Should Contain  ${CH_Card_Clas_Attr}  grey
    ${RI_Card_Clas_Attr}=  Get Element Attribute  ${SEC/S360_RENEWAL_INFO_CARD}  class
    ${RI_Card_Status}=  Run Keyword And Return Status  Should Contain  ${RI_Card_Clas_Attr}  grey
    Run Keyword If  '${SCH_Status}'=='${CH_Card_Status}' or '${SRI_Status}'=='${RI_Card_Status}'  Fail

SEC_SDP_Verify Using Explicit URL
    [Documentation]  Verifies the page is accessible using explicit URL
    [Arguments]  ${Url_Info}  ${CH/RI_Status}
    ${Current_URL}=  Get Location
    GoTo  ${Current_URL}/${Url_Info}
    Sleep  4S
    ${ENG_URL}=  Remove String  ${Current_URL}  centers/support-center
    ${Status}=  Run Keyword and Return Status  Element Should Be Visible  ${SEC/S360_USERNAME_TXT}  timeout=20
    Run Keyword If  '${Status}'=='${TRUE}' and '${CH/RI_Status}'=='Disable'  Element Should be Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ...   ELSE IF  '${Status}'=='${FALSE}' and '${CH/RI_Status}'=='Enable'   Element Should Be Visible  ${SEC/S360_WELCOME_LINK}
    ...   ELSE  Fail
    [Teardown]  Run Keywords  GoTo  ${ENG_URL}
    ...  AND  SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${AdminRole}
    ...  AND  SEC_SDP_Navigate to Support Center

SEC_SDP_Validate Privilege Access
    [Documentation]  Validates the privilege access for case history and renewal info for single group
    [Arguments]  ${NameOfGroup}  ${CH_Status}  ${RI_Status}
    SEC/S360_Navigate to User/Groups Page
    SEC_SDP_Set Renewal Info And Case History Status  ${NameOfGroup}  ${Roles_List}[0]  ${CH_Status}   ${RI_Status}
    SEC/S360_Common Logout
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${AdminRole}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
    Run Keyword And Continue On Failure  SEC_SDP_Verify Renewal Info And Case History In Support Center  ${CH_Status}  ${RI_Status}
    SEC_SDP_Verify Using Explicit URL  case-history  ${CH_Status}
    SEC_SDP_Verify Using Explicit URL  renewal-information  ${RI_Status}

SEC_SDP_Validate Privilege Access For Multiple Group
    [Documentation]  Validates the privilege access for case history and renewal info for two different group
    [Arguments]  ${CH_Status1}  ${CH_Status2}  ${RI_Status1}  ${RI_Status2}
    SEC/S360_Navigate to User/Groups Page
    SEC_SDP_Set Renewal Info And Case History Status  ${Groups_List}[0]  ${Roles_List}[0]   ${CH_Status1}   ${RI_Status1}
    SEC/S360_Navigate Back To Users Page Using Parent Tab
    SEC_SDP_Set Renewal Info And Case History Status  ${Groups_List}[1]  ${Roles_List1}[0]  ${CH_Status2}   ${RI_Status2}
    SEC/S360_Common Logout
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${AdminRole}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
    ${CH_Status}=  Run Keyword If  '${CH_Status1}'=='Disable' or '${CH_Status2}'=='Disable'  Set Variable  Disable
    ...  ELSE  Set Variable  Enable
    ${RI_Status}=  Run Keyword If  '${RI_Status1}'=='Disable' or '${RI_Status2}'=='Disable'  Set Variable  Disable
    ...  ELSE  Set Variable  Enable
    Run Keyword And Continue On Failure  SEC_SDP_Verify Renewal Info And Case History In Support Center  ${CH_Status}  ${RI_Status}
    SEC_SDP_Verify Using Explicit URL  case-history  ${CH_Status}
    SEC_SDP_Verify Using Explicit URL  renewal-information  ${RI_Status}

SEC_SDP_Update SDP Value in User Groups
    [Documentation]  Updates the value of sdp in the roles table of user groups
    [Arguments]  ${Group_Name}  ${Role_Tab}  ${Sdp_Name}  ${value}
    SEC/S360_Navigate to User/Groups Page
    SEC/S360_Update Roles In Group    ${Group_Name}  ${Role_Tab}
    select checkbox    id=chkBoxRole_2
    Click Element  ${SEC/S360_OPERATOR_ROLE_TAB}
    SEC_SDP_Navigate to Pages and Click on Edit/Delete Button  ${Sdp_Name}  ${SEC_SDP_EDIT_BTN_ID}
    ${Val_Dropdown}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC_SDP_VALUES_DD}
    Run Keyword If  '${Val_Dropdown}'=='${TRUE}' and '${value}'=='Enable'    select from list by index  ${SEC_SDP_VALUES_DD}  0
    ...  ELSE  select from list by index  ${SEC_SDP_VALUES_DD}  1
    Click Element  ${SEC_SDP_SAVE_CHANGES_BTN}
    SEC/S360_Save Changes Without CLosing Message
    SEC/S360_Wait For Success Message

SEC_SDP_Restore Sdp To Default
    [Documentation]  Restores the default value to the given sdp
    [Arguments]  ${Sdp_Name}
    SEC/S360_Navigate to User/Groups Page
    ${Index_Number}=  SEC/S360_Search UserGroup  ${SDP_Group_Name}
    Click Element  ${SEC/S360_GROUP_NAME_TEXT} [${Index_Number}]
    Wait Until Element Is Visible  ${SEC_SDP_NAME_TEXT}  timeout=10
    Click Element  ${SEC/S360_ADMIN_ROLE}
    SEC_SDP_Navigate to Pages and Click on Edit/Delete Button  ${Sdp_Name}  ${SEC_SDP_RESTORE_BTN_ID}
    SEC/S360_Save Changes
    ${Index}=  SEC_SDP_Search SDP in Roles Tab  ${SEC/S360_ADMIN_ROLE}  ${Sdp_Name}
    ${Restored_Value}=  Get Text  ${SEC_SDP_VALUE_TEXT} [${Index}]
    [Return]  ${Restored_Value}

SEC_SDP_Search Privilege
    [Documentation]  Searchs for the sdp in security policies page
    [Arguments]  ${NameOfSDP}
    Input Text  ${SEC/S360_SEARCH_BOX}  ${NameOfSDP}
    Click Element  ${SEC/S360_SEARCH_BTN}
    Sleep  1S
    ${Sdp_count}=  Get Element Count  ${SEC_SDP_NAME_TEXT}
    FOR    ${Index}  IN RANGE  1  ${Sdp_count}+1
        ${name}=  Get Text  ${SEC_SDP_NAME_TEXT} [${Index}]
        Exit For Loop If  '${name}'=='${NameOfSDP}'
    END
    [Return]  ${Index}

SEC_SDP_Set Vault Status
    [Documentation]  Sets the Vault Status status as enabled or disabled
    [Arguments]  ${NameOfGroup}  ${NameOfRole}  ${Vault_Status}
    ${Vault_Status}=  Set Variable If  '${Vault_Status}'=='Enable'  0  1
    ${Index_Number}  SEC/S360_Search UserGroup  ${NameOfGroup}
    SEC/S360_Scroll Page To Location  0  600
    Run Keyword If  '${Index_Number}'!='0'  Run Keywords  Click Element  ${SEC/S360_GROUP_NAME_TEXT} [${Index_Number}]
    ...  AND  Wait Until Element Is Visible  ${SEC_SDP_NAME_TEXT}    timeout=10
   # ${Index_Number}  SEC_SDP_Search SDP in Roles Tab   ${NameOfRole}  Vault Access
    SEC/S360_Scroll Page To Location    0    0
    Click Element  ${SEC/S360_ROLES_TAB}
    Click Element  ${NameOfRole}
    Wait Until Element Is Visible  ${SEC_SDP_NAME_TEXT} [1]  timeout=10
    SEC/S360_Scroll Page To Location  0  1000
    Click Element  ${SEC_SDP_NEXT_PAGE_BTN}
    ${Index_Number}  SEC_SDP_Search For Created SDP  Vault Access
    Click Element  ${SEC_SDP_EDIT_BTN} [${Index_Number}]
    Select From List By Index  ${SEC_SDP_VALUES_DD} [1]  ${Vault_Status}
    Click Element  ${SEC_SDP_SAVE_CHANGES_BTN} [1]
    Sleep  2S
    Click Element  ${SEC/S360_FLOAT_SAVE_BTN}
    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}
    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${SEC/S360_FORM_CANCEL_BTN}
