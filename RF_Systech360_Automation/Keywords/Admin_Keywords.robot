#------------------------------------------------------------------
#   Description       :      Keywords Related to Admin/User groups
#   Project           :      UniSecure/Systech360 Automation
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

Variables         ../Variables/Variable.py
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=60.0
Library           ../Generic/GenericMethods.py
Resource          ../Locators/Generic_Locators.robot
Resource          ../Keywords/SDP_Keywords.robot
Resource          ../Locators/SDP_Locators.robot
Resource          ../Locators/Admin_Locators.robot
Resource          ../Locators/Security_Policies_Locators.robot
Resource          ../Keywords/Generic_Keywords.robot



*** Keywords ***
SEC/S360_ADMIN_Login Precondition
    [Documentation]    Logs in with the default admin user
    [Arguments]    ${URL}
    SEC/S360_Login Precondition    ${URL}    ${Username}    ${Password}    ${AdminRole}


SEC/S360_Navigate Back To Users Page Using Parent Tab
    [Documentation]  Clicks on parent breadcrumb and navigates to User/Groups page

    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${SEC/S360_PARENT_BREADCRUMB}
    wait until keyword succeeds  10x  2s  Wait Until Element Is Visible  ${SEC/S360_EDIT_GROUP_BTN}
    wait until keyword succeeds  10x  2s  Wait Until Element Is Visible  ${SEC/S360_FIRST_USER_IMAGE}

SEC/S360_Navigate To Security Policies Page
    [Documentation]  Navigates to Security Policies card

    SEC/S360_Scroll Page To Location  0  0
    ${Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_SP_SAME_PWD_DD}
    Run Keyword If  '${Status}'=='${FALSE}'  Run Keywords  Click Element  ${SEC/S360_WELCOME_LINK}
    ...  AND  SEC/S360_Click On User_Groups/Security Policies Card  Security_Policies
    ...  AND  wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_REQ_SEC_QUES_CHKBOX}

SEC/S360_Navigate to User/Groups Page
    [Documentation]  Navigates to User/Groups card
    ${Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_FIRST_USER_IMAGE}
    #changes by Akash - Multiple keywords with name 'SPH/SEC_Scroll Page To Location' found . To fix this error.
    Run Keyword If  '${Status}'=='${FALSE}'  Run Keywords  Generic_Keywords.SEC/S360_Scroll Page To Location  0  0
    ...  AND  Click Element  ${SEC/S360_WELCOME_LINK}
    ...  AND  SEC/S360_Click On User_Groups/Security Policies Card  User_Groups
    ...  AND  wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_EDIT_GROUP_BTN}
    ...  AND  wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_FIRST_USER_IMAGE}

 SEC/S360_Create New Group
    [Documentation]  Creates New User Group

    [Arguments]  ${NameOfGroup}  ${Description}  @{Roles_ID}

    Click Element  ${SEC/S360_ADD_NEW_GROUP_BTN}
    wait until element is visible    ${SEC/S360_GROUP_NAME_TXT_BOX}
    Input Text  ${SEC/S360_GROUP_NAME_TXT_BOX}  ${NameOfGroup}
    Input Text  ${SEC/S360_GROUP_DESC_TXT_BOX}  ${Description}

    ${Roles_Length}=  Get Length  ${Roles_ID}

    FOR  ${Role}  IN  @{Roles_ID}
        ${js}        Get File              ${CURDIR}/drag-n-drop.js
        Execute Javascript    ${js};  return DragNDrop('${Role}','${SEC/S360_ROLES_TXT_BOX}');
    END

    Sleep  2S
    Click Element  ${SEC/S360_SAVE_GROUP_BTN}
    wait until keyword succeeds  5x  2s  wait until element is not visible    ${SEC/S360_DIRTY_FLAG}

SEC/S360_Update User Group
    [Documentation]  Updates the Groups name of the User Group

    [Arguments]  ${NameOfGroup}  ${UpdatedName}  ${Update/Cancel_Btn}

    ${Index_Number}=  SEC/S360_Search UserGroup  ${NameOfGroup}
	Sleep  3s
    Click Element  ${SEC/S360_EDIT_GROUP_BTN} [${Index_Number}]
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_UGROUP_NAME_TXT_BOX}
    sleep    5s
    wait until keyword succeeds  5x  2s  Input Text  ${SEC/S360_UGROUP_NAME_TXT_BOX}  ${UpdatedName}
    sleep    10s
    Click Element  ${Update/Cancel_Btn}
    SEC/S360_Scroll Page To Location  0  0

SEC/S360_Search UserGroup
    [Documentation]  Search the required UserGroup

    [Arguments]  ${Group_Name}

    ${Index_Number}=  Set Variable  0
    ${Found_Status}=  Set Variable  ${FALSE}
    Input Text  ${SEC/S360_GROUP_SEARCH_BOX}  ${Group_Name}

    ${Group_Name_Count}=  Get Element Count  ${SEC/S360_GROUP_NAME_TEXT}
    Log to console  ${Group_Name_Count}
    FOR  ${Index}  IN RANGE  1  ${Group_Name_Count}+1
       ${Name_Text}=  Get Text  ${SEC/S360_GROUP_NAME_TEXT} [${Index}]
       ${Found_Status}=  Run Keyword If  '${Name_Text}'=='${Group_Name}'  Set Variable  ${TRUE}
       ${Index_Number}=  Run Keyword If  '${Name_Text}'=='${Group_Name}'  Evaluate  ${Index_Number}+${Index}
       ...  ELSE  Evaluate  ${Index_Number}+0
       Run Keyword If  '${Name_Text}'=='${Group_Name}'  Exit For Loop
    END

    [Return]  ${Index_Number}

SEC/S360_Enters All new User Details
    [Documentation]  Creates a new user with an associated user group

    [Arguments]  @{User_Details_List}

    Wait Until Element Is Visible  ${SEC/S360_USERNAME_TXT_BOX}
    Input Text   ${SEC/S360_USERNAME_TXT_BOX}        ${User_Details_List}[0]
    Input Text   ${SEC/S360_PASSWORD_TXT_BOX}        ${User_Details_List}[1]
    Input Text   ${SEC/S360_VER_PASSWORD_TXT_BOX}    ${User_Details_List}[2]
    Input Text   ${SEC/S360_FIRST_NAME_TXT_BOX}      ${User_Details_List}[3]
    Input Text   ${SEC/S360_LAST_NAME_TXT_BOX}       ${User_Details_List}[4]
    Input Text   ${SEC/S360_EMAIL_TXT_BOX}           ${User_Details_List}[5]


SEC/S360_Enters new User Detail
    [Documentation]  Creates a new user with an associated user group

    [Arguments]  ${username}    ${password}     ${verify_password}      ${first_name}       ${last_name}       ${email}

    Wait Until Element Is Visible  ${SEC/S360_USERNAME_TXT_BOX}
    Input Text   ${SEC/S360_USERNAME_TXT_BOX}        ${username}
    Input Text   ${SEC/S360_PASSWORD_TXT_BOX}        ${password}
    Input Text   ${SEC/S360_VER_PASSWORD_TXT_BOX}    ${verify_password}
    Input Text   ${SEC/S360_FIRST_NAME_TXT_BOX}      ${first_name}
    Input Text   ${SEC/S360_LAST_NAME_TXT_BOX}       ${last_name}
    Input Text   ${SEC/S360_EMAIL_TXT_BOX}           ${email}



SEC/S360_Select Groups For the User
    [Documentation]  Selects the required groups for the user

    [Arguments]  ${Select/UnSelect}  @{User_Groups_Details_List}

    ${Total_Groups}=  Get Element Count  ${SEC/S360_USER_GROUP_NAME_TEXT}
    ${Group_Checked_Count}=  Set Variable  0
    FOR  ${Index}  IN RANGE  1  ${Total_Groups}+1
       ${Group_Name_Text}=  Get Text  ${SEC/S360_USER_GROUP_NAME_TEXT} [${Index}]
       ${Group_Found_Status}=  Run Keyword And Return Status  List Should Contain Value  ${User_Groups_Details_List}  ${Group_Name_Text}
       Run Keyword If  '${Group_Found_Status}'=='${TRUE}' and '${Select/UnSelect}'=='Select'  Select Checkbox  ${SEC/S360_USER_GROUP_CHK_BOX} [${Index}]
       ...  ELSE IF  '${Group_Found_Status}'=='${TRUE}' and '${Select/UnSelect}'=='UnSelect'  Unselect Checkbox  ${SEC/S360_USER_GROUP_CHK_BOX} [${Index}]
       ${Group_Checked_Count}=  Set Variable If  '${Group_Found_Status}'=='${TRUE}'  ${Group_Checked_Count}+1   ${Group_Checked_Count}
    END

    [Return]  ${Group_Checked_Count}

SEC/S360_Navigate to Pages And Select Group
    [Documentation]  Navigates to pages and selects the required group

    [Arguments]  ${Select/UnSelect}  @{User_Groups_Details_List}
    SEC/S360_Scroll Page To Location  0  500
    ${Total_Pages_To_Navigate}=  SEC_SDP_Count the Number of Pages to Navigate
    ${Total_Group_Checked_Count}=  Set Variable  0
    ${Total_User_Groups}=  Get Length  ${User_Groups_Details_List}

    FOR  ${Index}  IN RANGE  1  ${Total_Pages_To_Navigate}+1
       #SPH/SEC_Scroll Page To Location  0  500
       #changes by Akash - commented keyword and replaced with other keyword
       SEC/S360_Scroll Page To Location  0  500
       ${Group_Checked_Count}=  SEC/S360_Select Groups For the User  ${Select/UnSelect}  @{User_Groups_Details_List}
       ${Total_Group_Checked_Count}=  Evaluate  ${Group_Checked_Count}+${Total_Group_Checked_Count}
       Exit For Loop If  '${Total_Group_Checked_Count}'=='${Total_User_Groups}'
       Click Element  ${SEC_SDP_NEXT_PAGE_BTN}
    END

    Sleep  1S
    Click Element  xpath=(//div[contains(@class,'page-count')])
    Sleep  1S

SEC/S360_Create New User
    [Documentation]  Creates new user with all the mandatory fields

    [Arguments]  ${User_Details_List}  @{User_Groups_Details_List}

    SEC/S360_Scroll Page To Location  0  0
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_ADD_NEW_USER_BTN}
    SEC/S360_Enters All new User Details  @{User_Details_List}
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}
    SEC/S360_Navigate to Pages And Select Group  Select   @{User_Groups_Details_List}
    SEC/S360_Scroll Page To Location  0  0
    SEC/S360_Save Changes
    wait until keyword succeeds  5x  5s  Wait Until Element Is Not Visible  ${SEC/S360_DIRTY_FLAG}

SEC/S360_Seach An User
    [Documentation]  Search for specified user

    [Arguments]  ${NameOfUser}

    SEC/S360_Scroll Page To Location  0  0
    capture page screenshot
    wait until keyword succeeds  5x  2s  Input Text   ${SEC/S360_SEARCH_BOX}  ${NameOfUser}
    capture page screenshot
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_SEARCH_BTN}
    capture page screenshot
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${SEC/S360_FIRST_USER_IMAGE}
    ${Index_Number}=  Set Variable  0

    ${Usernames_Texts}=  Get Element Count  ${SEC/S360_USERNAMES_TEXT}

    FOR  ${Index}  IN RANGE  1  ${Usernames_Texts}+1
       ${Username_Text}=  wait until keyword succeeds    5x    2s    Get Text  ${SEC/S360_USERNAMES_TEXT} [${Index}]
       ${Index_Number}=  Run Keyword If  '${Username_Text}'=='${NameOfUser}'  Evaluate  ${Index_Number}+${Index}
       ...  ELSE  Evaluate  ${Index_Number}+${0}
       Exit For Loop If  '${Username_Text}'=='${NameOfUser}'
    END

    [Return]  ${Index_Number}

SEC/S360_Update Groups Assigned For User
    [Documentation]  Adds/Removes the groups for a user

    [Arguments]  ${NameOfUser}  ${Select/UnSelect}  @{User_Groups_Details_List}

    ${Index_Number}=  SEC/S360_Seach An User  ${NameOfUser}
    wait until keyword succeeds    5x    1s    Click Element   ${SEC/S360_USER_IMAGES} [${Index_Number}]
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}  timeout=15

    SEC/S360_Navigate to Pages And Select Group  ${Select/UnSelect}   @{User_Groups_Details_List}
    Wait Until Element Is Enabled  ${SEC/S360_FLOAT_SAVE_BTN}  timeout=20
    SEC/S360_Save Changes Without CLosing Message
    SEC/S360_Wait For Success Message

SEC/S360_Precondition for No Challenge Questions
    [Documentation]  Unselects the no challenge questions checkbox in security policies

    SEC/S360_Navigate To Security Policies Page
    UnSelect Checkbox  ${SEC/S360_REQ_SEC_QUES_CHKBOX}
    SEC/S360_Save Changes

SEC/S360_Delete Users
    [Documentation]  Deletes the user

    [Arguments]  @{NameOfUser}

    ${Total_Users}=  Get Length  ${NameOfUser}

    FOR  ${Index}  IN RANGE  0  ${Total_Users}
       ${Index_Number}=  SEC/S360_Seach An User  ${NameOfUser}[${Index}]
       Mouse Over  ${SEC/S360_USER_IMAGES} [${Index_Number}]
       Click Element  ${SEC/S360_DELETE_USER_BTN} [${Index_Number}]
       Wait Until Element Is Visible  ${SEC/S360_DELETE_POP_BTN}
       Click Element  ${SEC/S360_DELETE_POP_BTN}
       SEC/S360_Verify Success Message  ${Delete_User_Msg_ID}
    END

SEC/S360_Delete User Groups
    [Documentation]  Deletes the UserGroup

    [Arguments]  @{NameOfGroup}

    ${Total_Groups}=  Get Length  ${NameOfGroup}

    FOR  ${Index}  IN RANGE  0  ${Total_Groups}
       ${Index_Number}=  SEC/S360_Search UserGroup  ${NameOfGroup}[${Index}]
       Click Element  ${SEC/S360_DELETE_GROUP_BTN}
       Wait Until Element Is Visible  ${SEC/S360_DELETE_POP_BTN}
       Click Element  ${SEC/S360_DELETE_POP_BTN}
       SEC/S360_Verify Success Message  ${Delete_Group_Msg_ID}
    END

SEC/S360_Click On User_Groups/Security Policies Card
    [Documentation]  Waits util the card is displayed

    [Arguments]  ${NameOfCard}

    ${Current_URL}=  Get Location
    ${UniSecure_URL}=  Run Keyword And Return Status  Should Contain  ${Current_URL}  UniSecure  ignore_case=True
    ${UG_Card_Locator}=  Set Variable If  '${UniSecure_URL}'=='${TRUE}' and '${NameOfCard}'=='User_Groups'  ${SEC_USERGROUPS_CARD}  ${S360_USERGROUPS_CARD}
    ${SP_Card_Locator}=  Set Variable If  '${UniSecure_URL}'=='${TRUE}' and '${NameOfCard}'=='Security_Policies'  ${SEC_SECURITY_POLICIES_CARD}  ${S360_SECURITY_POLICIES_CARD}

    Run Keyword If  '${NameOfCard}'=='User_Groups'  Run Keywords  Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${UG_Card_Locator}
    ...  AND  Wait Until Element Is Visible  ${UG_Card_Locator}
    ...  AND  Click Element  ${UG_Card_Locator}
    ...  AND  wait until keyword succeeds  10x  2s  Wait Until Element Is Visible  ${SEC/S360_EDIT_GROUP_BTN}
    ...  AND  wait until keyword succeeds  10x  2s  Wait Until Element Is Visible  ${SEC/S360_FIRST_USER_IMAGE}
    ...  ELSE  Run Keywords  Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${UG_Card_Locator}
    ...  AND  Wait Until Element Is Visible  ${SP_Card_Locator}
    ...  AND  Click Element  ${SP_Card_Locator}
    ...  AND  wait until keyword succeeds  10x  2s  Wait Until Element Is Visible  ${SEC/S360_REQ_SEC_QUES_CHKBOX}

SEC/S360_Update Roles In Group
    [Documentation]  Adds/Removes the roles assigned in the Group

    [Arguments]  ${Group_Name}  ${Roles_List}

    ${Index_Number}=  SEC/S360_Search UserGroup  ${Group_Name}
    Click Element  ${SEC/S360_GROUP_NAME_TEXT} [${Index_Number}]
    Wait Until Element Is Visible  ${SEC_SDP_NAME_TEXT}
    ${Total_Roles}=  Get Element Count  ${SEC/S360_ROLES_IN_GROUPS}

    FOR    ${Index}  IN RANGE  1  ${Total_Roles}+1
        ${Icon_Desc}=  Get Element Attribute  ${SEC/S360_ROLES_IN_GROUPS_ICON} [${Index}]  src
        ${Role_Status}=  SEC/S360_Check For Roles In List  ${Roles_List}  ${Icon_Desc}
        Run Keyword If  '${Role_Status}'=='${TRUE}'  Run Keywords  Select Checkbox  ${SEC/S360_ROLES_IN_GROUPS_CHK_BOX} [${Index}]
        ...  AND  Click Element  ${SEC/S360_ROLES_IN_GROUPS_ICON} [${Index}]
        ...  ELSE  Unselect Checkbox  ${SEC/S360_ROLES_IN_GROUPS_CHK_BOX} [${Index}]
    END

    SEC/S360_Save Changes
	Run Keyword And Ignore Error  Wait Until Element is Visible  ${SEC/S360_DISMISS_MSG_CNTR}
	Run Keyword And Ignore Error  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}


SEC/S360_Update Role In Group
    [Documentation]  Adds/Removes the roles assigned in the Group

    [Arguments]  ${Group_Name}  ${Roles_List}

    ${Index_Number}=  SEC/S360_Search UserGroup  ${Group_Name}
    Click Element  ${SEC/S360_GROUP_NAME_TEXT} [${Index_Number}]
    Wait Until Element Is Visible  ${SEC_SDP_NAME_TEXT}
    Click Element  ${SEC/S360_OPERATOR_ROLE_ICON}
    SEC/S360_Save Changes
	Run Keyword And Ignore Error  Wait Until Element is Visible  ${SEC/S360_DISMISS_MSG_CNTR}
	Run Keyword And Ignore Error  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}


SEC/S360_Check For Roles In List
    [Documentation]  Checks if the roles are present in the roles list

    [Arguments]  ${Roles_List}  ${Icon_Name}

    ${Found_Status}=  Set Variable  ${FALSE}
    ${Role_List_Len}=  Get Length  ${Roles_List}

    FOR    ${Index}  IN RANGE  0  ${Role_List_Len}
        ${Found_Status}=  Run Keyword And Return Status  Should Contain  ${Icon_Name}  ${Roles_List}[${Index}]
        Exit For Loop If  '${Found_Status}'=='${TRUE}'
    END

    [Return]  ${Found_Status}

Delete_All_Users_Based_On_Partial_Name_Search
	[Documentation]  Deletes all the users searched using the partial name
	[Arguments]  ${PartialNameOfTheUser}
	COM_Navigate_To_Any_Card  (//*[contains(@id,'preferenceCardName_')])  Users/Groups
	Sleep  5s
	wait until keyword succeeds  5x  2s  Input Text   ${SEC/S360_SEARCH_BOX}  ${PartialNameOfTheUser}
	wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_SEARCH_BTN}
	Run Keyword And Ignore Error  Wait Until Element Is Visible  ${SEC/S360_FIRST_USER_IMAGE}
	${Card_Presence}=  Run Keyword And Return Status  Element Should be Visible  ${SEC/S360_FIRST_USER_IMAGE}
	${MaxValue}=  Run Keyword If  '${Card_Presence}'=='${TRUE}'  Set Variable  100  ELSE  Set Variable  0
	FOR    ${Index}  IN RANGE  0  ${MaxValue}
	    ${Card_Presence}=  Run Keyword And Return Status  Element Should be Visible  ${SEC/S360_FIRST_USER_IMAGE}
	    Exit For Loop If  '${Card_Presence}'=='${FALSE}'
	    ${Name_Of_User}=  Get Text  id=userName_0
	    ${Match_Status}=  Run Keyword And Return Status  Should Contain  ${Name_Of_User}  ${PartialNameOfTheUser}
	    Run Keyword If  '${Match_Status}'=='${TRUE}'  Run Keywords  Mouse Over  ${SEC/S360_FIRST_USER_IMAGE}  AND  Click Element  ${SEC/S360_DELETE_USER_BTN} [1]
	    Wait Until Element Is Visible  ${SEC/S360_DELETE_POP_BTN}  timeout=20
	    Click Element  ${SEC/S360_DELETE_POP_BTN}
	    Wait Until Element Is Not Visible  ${SEC/S360_DELETE_POP_BTN}  timeout=10
	    SEC/S360_Verify Success Message  ${Delete_User_Msg_ID}
    END

COM_Navigate_To_Any_Card
	[Documentation]  Navigates to the expected card in any role, but it should be in cards view
	[Arguments]  ${Card_Path}  ${EXP_Card_Name}
	wait until element is visible  ${Card_Path} [1]
	${Cards_Count}=  Get Element Count  ${Card_Path}
	FOR    ${Card_Num}  IN RANGE  1  ${Cards_Count}+1
	    ${Actual_Card_Name}=  Get Text  ${Card_Path} [${Card_Num}]
	    Run Keyword If  '${Actual_Card_Name}'=='${EXP_Card_Name}'  Run Keywords  Click Element  ${Card_Path} [${Card_Num}]  AND  Exit For Loop
    END
	run keyword and ignore error  wait until element is not visible  ${Card_Path} [${Card_Num}]  timeout=10
	run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
