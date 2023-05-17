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
Library          SeleniumLibrary    timeout=${Selenium_Timeout}    run_on_failure=Nothing
Library           ../Generic/GenericMethods.py
Resource          ../Locators/Generic_Locators.robot
Resource          ../Locators/Admin_Locators.robot
Resource          ../Keywords/Generic_Keywords.robot
Resource          ../Keywords/Admin_Keywords.robot


*** Keywords ***
SEC_S360_UG_Create New User
    [Documentation]  Creates new user with all the mandatory details

    [Arguments]  ${User_Details}  ${Groups_List}  ${Msg_ID}

    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${SEC/S360_ADD_NEW_USER_BTN}
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}  timeout=30
    SEC/S360_Enters All new User Details  @{User_Details}
    SEC/S360_Navigate to Pages And Select Group  Select  @{Groups_List}
    SEC/S360_Save Changes Without CLosing Message
    sleep    6s

#    ${Success_Status}=  SEC/S360_Verify Success Message In Two Parts  ${Msg_ID}
    ${Success_Status}=    SEC/S360_Verify Success Message    ${Msg_ID}

    [Return]  ${Success_Status}

#SEC_S360_UG_Create User
#    [Documentation]  Creates new user with all the mandatory details
#
#    [Arguments]  ${User_Details}  ${Groups_List}  ${Msg_ID}
#
#    SEC/S360_Scroll Page To Location  0  0
#    Click Element  ${SEC/S360_ADD_NEW_USER_BTN}
#    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}  timeout=10
#    SEC/S360_Enters All new User Details  @{User_Details}
#    SEC/S360_Navigate to Pages And Select Group  Select  @{Groups_List}
#    SEC/S360_Save Changes Without CLosing Message
#    ${Success_Status}=  SEC/S360_Verify Success Message In Two Parts  ${Msg_ID}
#
#    [Return]  ${Success_Status}

SEC_S360_UG_Create User
    [Documentation]  Creates new user with all the mandatory details

    [Arguments]  ${User_Details}  ${Groups_List}  ${Msg_ID}

    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${SEC/S360_ADD_NEW_USER_BTN}
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}  timeout=10
    SEC/S360_Enters All new User Details  @{User_Details}
    SEC/S360_Navigate to Pages And Select Group  Select  @{Groups_List}
    SEC/S360_Save Changes Without CLosing Message
    ${Success_Status}=  SEC/S360_Verify Success Message In Two Parts  ${Msg_ID}

    [Return]  ${Success_Status}


SEC/S360_UG_Click on Send Invitation and Verify Email
    [Documentation]  Enters all the details and verifies sending email with send invitation button

    [Arguments]  ${User_Details}  ${User_Groups_Details_List}

    SEC/S360_Enters All new User Details  @{User_Details}
    SEC/S360_Navigate to Pages And Select Group  Select   @{User_Groups_Details_List}
    Click Element  ${SEC/S360_FLOAT_SAVE_BTN}
    SEC/S360_Wait For Success Message

    Click Element  ${SEC/S360_SEND_INVITE_BTN}
    ${Success_Status}=  SEC/S360_Verify Success Message In Two Parts  ${Send_Invite_Msg_ID}
    Run Keyword If  '${Success_Status}'=='${FALSE}'  Fail

    # verify mail

SEC/S360_UG_Click on Save and Send Invitation and Verify Email
    [Documentation]  Enters all the details and verifies sending email with save and send invitation button

    [Arguments]  ${User_Details}  ${User_Groups_Details_List}

    SEC/S360_Enters All new User Details  @{User_Details}
    SEC/S360_Navigate to Pages And Select Group  Select   @{User_Groups_Details_List}
    Click Element  ${SEC/S360_SAVE_SEND_INVITE_BTN}
    ${Success_Status}=  SEC/S360_Verify Success Message In Two Parts  ${Send_Invite_Msg_ID}
    Run Keyword If  '${Success_Status}'=='${FALSE}'  Fail

    # verify mail

SEC/S360_UG_Click on Save and Send Invitation and Create User and Verify Email
    [Documentation]  Enters all the details and verifies sending email with save and send invitation and create new user button

    [Arguments]  ${User_Details}  ${User_Groups_Details_List}

    SEC/S360_Enters All new User Details  @{User_Details}
    SEC/S360_Navigate to Pages And Select Group  Select   @{User_Groups_Details_List}
    Click Element  ${SEC/S360_SAVE_SENDINVITE_CU_BTN}
    ${Success_Status}=  SEC/S360_Verify Success Message In Two Parts  ${Send_Invite_Msg_ID}
    Run Keyword If  '${Success_Status}'=='${FALSE}'  Fail

    # verify mail

SEC/S360_UG_Verify Form or Float or Parent Tab button By Entering Values
    [Documentation]  Verify Form Cancel, float cancel or parent tab button by entering all user details

    [Arguments]  ${User_Details}  ${Button_Name}  ${Popup_Yes_No_Btn}

    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${SEC/S360_ADD_NEW_USER_BTN}
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_CHK_BOX} [1]
    SEC/S360_Enters All new User Details  @{User_Details}
    @{Groups_List}=  Create List  ${Updated_Group_Name}
    SEC/S360_Navigate to Pages And Select Group  Select  @{Groups_List}
    Sleep  2S
    SEC/S360_Click Form Or Float Cancel Or Parent Tab  ${Button_Name}  ${Popup_Yes_No_Btn}  YES
    Run Keyword If  '${Popup_Yes_No_Btn}'=='Yes'  Run Keyword And Ignore Error   wait until keyword succeeds  5x  2s  Click Element    //*[@id="buttn_SaveTxt"]
    ...  ELSE  Run Keyword And Ignore Error    wait until keyword succeeds  5x  2s  Click Element    //*[@id="buttn_CancelTxt"]
    ${Index}=  SEC/S360_Seach An User  ${User_Details}[0]
#    Run Keyword If  '${Popup_Yes_No_Btn}'=='YES'  Should Not Be Equal  '${Index}'  '0'
#    ...  ELSE  Should Be Equal  '${Index}'  '0'
# todo check why not equal

    ${Index}=  SEC/S360_Seach An User  ${User_Details}[0]
    Run Keyword If  '${Popup_Yes_No_Btn}'=='YES'  Should Not Be Equal  '${Index}'  '0'
    ...  ELSE  Should Be Equal  '${Index}'  '0'

SEC/S360_UG_Verify Form or Float or Parent Tab button Without Entering Values
    [Documentation]  Verify Form Cancel, float cancel or parent tab button without entering all user details

    [Arguments]  ${Button_Name}

    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${SEC/S360_ADD_NEW_USER_BTN}
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_CHK_BOX} [1]
    SEC/S360_Click Form Or Float Cancel Or Parent Tab  ${Button_Name}  NO  NO
    Element Should Be Visible  ${SEC/S360_ADD_NEW_USER_BTN}

SEC/S360_UG_Update User Image
    [Documentation]  Verify Updating User Image and verify in Profile image

    [Arguments]  ${NameOfUser}

    ${Resource_Files_Path}=  Normalize Path  ${CURDIR}/../Resources/User_Image

    SEC/S360_Scroll Page To Location  0  0
    ${Index_Number}=  SEC/S360_Seach An User  ${NameOfUser}
    Click Element  ${SEC/S360_USER_IMAGES} [${Index_Number}]
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT} [1]  timeout=15
    Unselect Checkbox  ${SEC/S360_GRAVATOR_CHK_BOX}
    Choose File  ${SEC/S360_CHANGE_PIC_BTN}  ${Resource_Files_Path}/Penguins.jpg

SEC/S360_UG_Expire Password Or Disable User Account
    [Documentation]  Search the user and clicks on Expire password Checkbox

    [Arguments]  ${NameOfUser}  ${Disable/Expire_ChkBox}  ${Select/UnSelect}

    SEC/S360_Scroll Page To Location  0  0
    ${Index_Number}=  SEC/S360_Seach An User  ${NameOfUser}
    wait until keyword succeeds    3x    0.5s    Click Element  ${SEC/S360_USER_IMAGES} [${Index_Number}]
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}  timeout=10

    Run Keyword If  '${Select/UnSelect}'=='YES'  Select Checkbox   ${Disable/Expire_ChkBox}
    ...  ELSE  Unselect Checkbox   ${Disable/Expire_ChkBox}
    Sleep  2S

    ${Save_Btn_Status}=  Run Keyword And Return Status  Element Should Be Enabled  ${SEC/S360_FLOAT_SAVE_BTN}
    Run Keyword If  '${Save_btn_Status}'=='${TRUE}'  SEC/S360_Save Changes

SEC/S360_UG_Reset Expire Password
    [Documentation]  Enters Password and verifies logging in with the new password

    [Arguments]  ${New_Password}

    Wait Until Element Is Visible  ${SEC/S360_RESET_PWD_TXT_BOX}
    Input Text  ${SEC/S360_RESET_PWD_TXT_BOX}       ${New_Password}
    Input Text  ${SEC/S360_VER_RESET_PWD_TXT_BOX}   ${New_Password}
    Click Element  ${SEC/S360_RESET_NEXT_BTN}
    Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ${Class_Attr}=  Get Element Attribute  ${SEC/S360_LOGIN_ERROR_MSG_ID}  class
    Should Contain  '${Class_Attr}'  successTitle

SEC/S360_UG_Toggle Existing User And Existing Group
    [Documentation]  Toggles existing user tab and existing groups tab in User Groups page

    Click Element  ${SEC/S360_USER_TOGGLE_BTN}
	Sleep  2s
    Wait Until Element Is Not Visible  ${SEC/S360_FIRST_USER_IMAGE}  timeout=10
	Sleep  2s
    capture page screenshot
    Click Element  ${SEC/S360_USER_TOGGLE_BTN}
	Sleep  2s
    capture page screenshot
    run keyword and ignore error    Wait Until Element Is Visible  ${SEC/S360_FIRST_USER_IMAGE}  timeout=10
	Sleep  2s
    run keyword and ignore error  Wait Until Keyword Succeeds  5x  2s  Click Element  ${SEC/S360_GROUP_TOGGLE_BTN}
	Sleep  2s
    run keyword and ignore error   Wait Until Element Is Not Visible  ${SEC/S360_GROUP_SEARCH_BOX}  timeout=10
	Sleep  2s
    run keyword and ignore error   Click Element  ${SEC/S360_GROUP_TOGGLE_BTN}
	Sleep  2s
    run keyword and ignore error    Wait Until Element Is Visible  ${SEC/S360_GROUP_SEARCH_BOX}  timeout=10

SEC/S360_UG_Check For Invalid Fields
    [Documentation]  Checks if error message is displayed when the fields are empty

    [Arguments]  ${Textfield}  ${InputTexts}  ${ErrorMsgID}

    ${Total_Inputs}=  Get Length  ${InputTexts}

    FOR    ${Index}  IN RANGE  0  ${Total_Inputs}
        Input Text  ${Textfield}  ${InputTexts}[${Index}]
        ${Class_Attr_Val}=  Get Element Attribute  ${Textfield}  class
        ${InvalidStatus}=  Run Keyword And Return Status  Should Contain  ${Class_Attr_Val}  ng-invalid
        Run Keyword If  '${InvalidStatus}'=='${TRUE}'  Run Keywords  Element Should Be Disabled  ${SEC/S360_FLOAT_SAVE_BTN}
        ...  AND  Element Should Be Visible  ${ErrorMsgID}
        ...  ELSE  Fail
    END

SEC/S360_UG_Search By First/Last Name
    [Documentation]  Checks the users are sorted in ascending/descending order of their first/last name

    [Arguments]  ${FilterCriteria}  ${Textfield}  ${TextValue}
    
    Select From List By Value  ${SEC/S360_FILTER_USER_DD}   ${FilterCriteria}
    Input Text  ${SEC/S360_SEARCH_BOX}  ${TextValue}
    
    ${Users_Count}=  Get Element Count  ${SEC/S360_USER_IMAGES}
    @{Names_List}=  Create List
    
    ${Users_Count}=  Run Keyword If  ${Users_Count}>5  Set Variable  5
    ...  ELSE  Set Variable  ${Users_Count}
    
    FOR    ${Index}  IN RANGE  1  ${Users_Count}+1
        Wait Until Page Contains Element  ${SEC/S360_FIRST_USER_IMAGE}  timeout=10
        Click Element  ${SEC/S360_USER_IMAGES} [${Index}]
        Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}  timeout=10
        ${NameText}=  Get Value  ${Textfield}
        Should Contain  ${NameText}  ${TextValue}  ignore_case=true
        SEC/S360_Navigate Back To Users Page Using Parent Tab
        Select From List By Value  ${SEC/S360_FILTER_USER_DD}   ${FilterCriteria}
        Input Text  ${SEC/S360_SEARCH_BOX}  ${TextValue}
    END
