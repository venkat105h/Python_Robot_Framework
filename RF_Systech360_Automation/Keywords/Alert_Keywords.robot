#------------------------------------------------------------------
#   Description       :      Keywords Related to Alert Subscription
#   Project           :      Systech360 Automation
#   © 2022   Systech International.  All rights reserved
#------------------------------------------------------------------

*** Settings ***
Documentation     Common method used accross Test Suite

Variables         ../Variables/Variable.py
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=60.0
Library           ../Generic/GenericMethods.py
Resource          ../Locators/Generic_Locators.robot
Resource          ../Locators/Alert_Locators.robot
Resource          ../Keywords/Generic_Keywords.robot



*** Keywords ***
S360_EN_Select Nodes For Alert
    [Documentation]  Selects required nodes for alert

    [Arguments]  ${NodeValue}

        Input Text  ${S360_ALERT_AVAILABLE_NODES_SEARCHBOX}  ${NodeValue}
        Click Element  ${S360_ALERT_NODE_SELECT_LIST} [1]
        Click Element  ${S360_ALERT_SINGLE_SELECT_BUTTON}



S360_ALERT_Create New Rule
    [Documentation]  Create a new Alert Rule

    [Arguments]    ${Alert_Rule_Details}

    @{Alert_Rule_Details}=  Split String   ${Alert_Rule_Details}  ,
    Wait Until Element Is Visible  ${S360_ADD_RULE_BUTTON}  timeout=30
    Click Element       ${S360_ADD_RULE_BUTTON}
    Wait Until Element Is Visible  ${S360_ALERT_NAME_TEXTBOX}  timeout=20
    Input Text      ${S360_ALERT_NAME_TEXTBOX}     ${Alert_Rule_Details}[0]${Alert_Rule_Details}[3]
    sleep   4s
    Select From List By Value   ${S360_ALERT_COMPONENT_LIST}       ${Alert_Rule_Details}[1]
    sleep   8s
    S360_EN_Select Nodes For Alert      ${Alert_Rule_Details}[2]
    Select From List By Value   ${S360_ALERT_EVENT_LIST}       ${Alert_Rule_Details}[3]
    Select From List By Value   ${S360_ALERT_CONDITION_LIST}      ${Alert_Rule_Details}[4]
    Input Text      ${S360_ALERT_COMMENT_BOX}      ${Alert_Rule_Details}[5]
    sleep   2s
    Click Element       ${S360_ALERT_ADD_RULE_BUTTON}

    [RETURN]    ${Alert_Rule_Details}


S360_ALERT_Count Rows
    [Documentation]  count Alert rows from table

    [Arguments]  ${TABLE_ROWS_LOCATOR}      ${Expected_Alert_Name}

        ${Rule_Row_Count}=  Get Element Count  ${TABLE_ROWS_LOCATOR}
        ${Alert_Index_Number}=  Set Variable     -1
        FOR    ${Index}  IN RANGE  1  ${Rule_Row_Count}+1
            ${Actual_Alert_Name}=  Get Text  //*[@id="extendedTable"]//datatable-body-row[${Index}]//datatable-body-cell[1]/div
            ${Alert_Index_Number}=  Set Variable If  '${Actual_Alert_Name}'=='${Expected_Alert_Name}'    ${Index}
            Run Keyword If  '${Actual_Alert_Name}'=='${Alert_Name}'     Exit For Loop
        END

        [RETURN]    ${Alert_Index_Number}


S360_ALERT_Delete Rule
    [Documentation]  delete a Alert Rule from rule tables

    [Arguments]  ${Index}

    Click Element      xpath=(//span[contains(@class,'fa-trash')])[${Index}]
    Click Element      ${S360_ALERT_DELETE_CONFIRM_OK}


S360_ALERT_Edit Rule
    [Documentation]  edit a Alert Rule from rule tables

    [Arguments]  ${Index}

    Click Element   xpath=(//span[contains(@class,'fa-pencil')])[${Index}]
    sleep   5s
    SEC/S360_Scroll Page To Location  0  100
    Wait Until Element Is Visible  ${S360_ALERT_CONDITION_LIST}  timeout=30
    Select From List By Value   ${S360_ALERT_CONDITION_LIST}      ${Alert_Condition_Edit_Value}
    Input Text      ${S360_ALERT_COMMENT_BOX}      ${Alert_Comment_Edit_Value}
    Click Element   ${S360_ALERT_ADD_RULE_BUTTON}


S360_ALERT_Logs Mark Selected As Read
    [Documentation]  verifes mark selected as read feature on alert logs

    [Arguments]  ${Row_Checkbox}      ${button_locator}

    Wait Until Element Is Visible  ${S360_ALERT_LOGS_DATATABLE}  timeout=20
    Select Checkbox     ${S360_ALERT_LOGS_UNREAD_CHECKBOX}
    sleep   5s
    ${Alert_Count}=  Execute Javascript    return document.getElementsByClassName('alert_count_single')[0].innerText;
    S360_ALERT_Logs button click    ${Row_Checkbox}     ${button_locator}
    ${Current_Alert_Count}=  Execute Javascript    return document.getElementsByClassName('alert_count_single')[0].innerText;
    Unselect Checkbox     ${S360_ALERT_LOGS_UNREAD_CHECKBOX}
    sleep   5s
    Unselect Checkbox     ${Row_Checkbox}
    Run Keyword If  ${Alert_Count}< (${Current_Alert_Count}+1)     fail


S360_ALERT_Logs Mark Selected As Unread
    [Documentation]  verifes mark selected as unread feature on alert logs

    [Arguments]  ${Row_Checkbox}      ${button_locator}

    Wait Until Element Is Visible  ${S360_ALERT_LOGS_DATATABLE}  timeout=20
    ${Alert_Count}=  Execute Javascript    return document.getElementsByClassName('alert_count_single')[0].innerText;
    S360_ALERT_Logs button click    ${Row_Checkbox}     ${S360_ALERT_LOGS_MARK_SELECTED_AS_UNREAD}
    ${Current_Alert_Count}=  Execute Javascript    return document.getElementsByClassName('alert_count_single')[0].innerText;
    sleep   5s
    Unselect Checkbox     ${Row_Checkbox}
    Run Keyword If  ${Alert_Count}!= (${Current_Alert_Count}-1)     fail

S360_ALERT_Logs Delete Selected
    [Documentation]  verifes mark delete selected feature on alert logs

    [Arguments]  ${Row_Checkbox}      ${button_locator}

    Wait Until Element Is Visible  ${S360_ALERT_LOGS_DATATABLE}  timeout=20
    Select Checkbox     ${S360_ALERT_LOGS_UNREAD_CHECKBOX}
    ${Alert_Count}=  Execute Javascript    return document.getElementsByClassName('alert_count_single')[0].innerText;
    sleep   5s
    Select Checkbox     ${Row_Checkbox}
    Click Element   ${button_locator}
    Wait Until Element Is Visible   xpath=//button[contains(@class,'primary')]   timeout=20
    Click Element   xpath=//button[contains(@class,'primary')]
    sleep   25s
    ${Current_Alert_Count}=  Execute Javascript    return document.getElementsByClassName('alert_count_single')[0].innerText;
    Unselect Checkbox     ${S360_ALERT_LOGS_UNREAD_CHECKBOX}
    sleep   5s
    Unselect Checkbox     ${Row_Checkbox}
    Run Keyword If  ${Alert_Count}< (${Current_Alert_Count}+1)     fail


S360_ALERT_Logs Delete Button
    [Documentation]  verifes mark delete selected feature on alert logs

    [Arguments]  ${Row_Checkbox}      ${button_locator}

    S360_ALERT_Logs Delete Selected     ${Row_Checkbox}      ${button_locator}

S360_ALERT_Navigate to Alert Logs
    [Documentation]  navigate to alert logs screen

    Wait Until Element Is Visible  ${SEC/S360_CHANGE_ROLE_DD}  timeout=20
    Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    Click Element  ${S360_GO_TO_ALERT_LOGS}


S360_ALERT Create Test Data for User Disabled Event
    [Documentation]  create test user and alert rule for user disabled event

    [Arguments]   ${Alert_Rule_Details}     ${Alert_Test_User}

    Wait Until Element Is Visible  ${S360_ALERT_SUBSCRIPTION_CARD}  timeout=20
    SEC/S360 Navigate to Card   ${S360_ALERT_SUBSCRIPTION_CARD}     ${S360_ADD_RULE_BUTTON}
    Go To       https://eng-svt.systechcloud.net/Systech360/#/Administrator/alertSubscription
    S360_ALERT_Create New Rule  ${Alert_Rule_Details}
    sleep   5s
    S360_ALERT Enable SMS And Email Service
    @{Alert_Test_User_List}=  Split String  ${Alert_Test_User}   ,
    SEC/S360_Navigate to User/Groups Page
    SEC/S360_Create New User  ${Alert_Test_User_List}  ${Admin_Group}

    [RETURN]    ${Alert_Test_User_List}

S360_ALERT Enable SMS And Email Service
    [Documentation]  enable sms and email alert servies

    Click Element   name=enableEmail
    Click Element   name=enableSMS
    Click Element   id=floatBtn_SaveTxt
    SEC/S360_Wait For Success Message



S360_ALERT Validate Alert Event Trigger
    [Documentation]  validate alert event is triggered

    [Arguments]   ${Alert_Count}     ${Expected_Alert_Rule_Name}

    S360_ALERT_Navigate to Alert Logs
    sleep   20s
    Click Element   ${S360_ALERT_LOGS_REFRESH}
    Log To Console     ${Expected_Alert_Rule_Name}
    ${Current_Alert_Count}=  Execute Javascript    return document.getElementsByClassName('alert_count_single')[0].innerText;
    ${AlertRuleName}=   Get Text    xpath=//*[@id="extendedTable"]//datatable-scroller/datatable-row-wrapper[1]//datatable-body-cell[4]/div
    Run Keyword If  '${AlertRuleName}'!='${Expected_Alert_Rule_Name}'    fail
    Run Keyword If  ${Current_Alert_Count}!=${Alert_Count}+1   fail

S360_ALERT_Logs Refresh
    [Documentation]  validate refresh button in alert logs

    Select Checkbox     ${S360_ALERT_LOGS_DATATABLE_CHECKBOX}
    Click Element       ${S360_ALERT_LOGS_EXPAND_ICON}
    ${Expand_Class}=    Get Element Attribute  ${S360_ALERT_LOGS_EXPAND_ICON}  class
    sleep   3s
    Should Contain  ${Expand_Class}  datatable-icon-down
    Click Element   ${S360_ALERT_LOGS_REFRESH}
    sleep   3s
    ${Expand_Class}=    Get Element Attribute  ${S360_ALERT_LOGS_EXPAND_ICON}  class
    Should Contain  ${Expand_Class}  datatable-icon-right


S360_ALERT Trigger User Account Disabled Event
    [Documentation]  trigger user account disabled event by disabling user

    [Arguments]     ${UserName}

    SEC/S360_Navigate to User/Groups Page
    ${Index}=  SEC/S360_Seach An User  ${UserName}
    Click Element  ${SEC/S360_USER_IMAGES} [${Index}]
    Wait Until Element Is Visible  ${SEC/S360_USER_GROUP_NAME_TEXT}
    sleep   2s
    Select Checkbox     id=chkAccountDisable
    Wait Until Element Is Enabled  ${SEC/S360_FLOAT_SAVE_BTN}  timeout=20
    SEC/S360_Save Changes Without CLosing Message
    SEC/S360_Wait For Success Message
    sleep   3s
    Unselect Checkbox     id=chkAccountDisable
    Wait Until Element Is Enabled  ${SEC/S360_FLOAT_SAVE_BTN}  timeout=20
    SEC/S360_Save Changes Without CLosing Message
    SEC/S360_Wait For Success Message
    sleep   3s




S360_ALERT Delete UserDisabled TestData
    [Documentation]  delete the alert user and alert rule

    [Arguments]     ${Alert_Rule_User_List}     ${Expected_Alert_Rule_Name}

    SEC/S360_Navigate to User/Groups Page
    SEC/S360_Delete Users   ${Alert_Rule_User_List}[0]
    Click Element   ${SEC/S360_WELCOME_LINK}
    sleep   2s
    SEC/S360 Navigate to Card   ${S360_ALERT_SUBSCRIPTION_CARD}     ${S360_ADD_RULE_BUTTON}
    ${Alert_Index_Number}=  S360_ALERT_Count Rows   ${S360_ALERT_EXISTING_RULES_ROW}     ${Expected_Alert_Rule_Name}
    sleep   1s
    Run Keyword If  ${Alert_Index_Number}== -1      fail
    S360_ALERT_Delete Rule  ${Alert_Index_Number}
    sleep   2s

S360_ALERT_Logs button click
    [Documentation]  generic keyword to perform button click on alert logs when a row is selected

    [Arguments]    ${DATA_ROW_LOCATOR}      ${ALERT_LOG_BUTTON_LOCATOR}

    Wait Until Element Is Visible  ${DATA_ROW_LOCATOR}   timeout=20
    Select Checkbox     ${DATA_ROW_LOCATOR}
    Click Element   ${ALERT_LOG_BUTTON_LOCATOR}
    sleep   25s

S360_ALERT_Make API Call To Trigger Notification
    [Documentation]  generic keyword to make an api call to trigger notification

    [Arguments]     ${Alert_Rule_User_List}

    ${response}=    get_AWS_Token
    ${request_body}=    create_JSON_Object     ${Alert_Rule_User_List}[1]     ${Alert_Rule_User_List}[2]    ${Alert_Rule_User_List}[3]    ${Alert_Rule_User_List}[4]    dd_systech_qa2
    ${headers}=     create_Header     ${response}       application/json
    ${api_response}=    make_API_Call       ${Request_Type}   ${Api_Url}  ${headers}    ${request_body}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 201     fail