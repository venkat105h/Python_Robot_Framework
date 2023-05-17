*** Settings ***
Variables       ../../Configurations/api/api-global.yaml
Variables         ../../Variables/Variable.py
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=60.0
Library           ../../Generic/api/ApiMethods.py
Library           ../../Generic/GenericMethods.py
Resource          ../../Locators/Generic_Locators.robot
Resource          ../../Locators/Alert_Locators.robot
Resource          ../../Keywords/Generic_Keywords.robot



*** Keywords ***

S360_ALERT_API to fetch rules details by ruleId
    [Documentation]  keyword to fetch rule details by ruleId

    [Arguments]     ${Alert_Rule_Id}

    ${api_rule_url}=    create_api_url      alert_get_rule_by_id     ${Alert_Rule_Id}
    ${headers}=     S360_API_Create Request Header
    ${api_response}=    make_API_Call       GET      ${api_rule_url}       ${headers}        {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail


S360_ALERT_API to fetch rules by user and tenant
    [Documentation]  keyword to fetch rule details by user and tenant

    [Arguments]     ${user_id}        ${tenant_id}

    ${api_rule_url}=    create_tenant_userid_api_url      alert_get_rules_for_user_tenant     ${user_id}        ${tenant_id}
    ${headers}=     S360_API_Create Request Header
    ${api_response}=    make_API_Call       GET      ${api_rule_url}       ${headers}        {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail


S360_ALERT_API to create new rule
    [Documentation]  keyword to create new rule

    ${api_rule_url}=    create_api_url      alert_save_new_rule     ' '
    ${headers}=     S360_API_Create Request Header
    ${request_body}=    create_New_Rule_Request
    ${api_response}=    make_API_Call       POST      ${api_rule_url}       ${headers}        ${request_body}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail

    RETURN  ${api_response}


S360_ALERT_API to delete new rule
    [Documentation]  keyword to delete rule by ruleId

    [Arguments]     ${Alert_Rule_Id}

    ${api_rule_url}=    create_api_url      alert_delete_rule     ${Alert_Rule_Id}
    ${headers}=     S360_API_Create Request Header
    ${api_response}=    make_API_Call       DELETE      ${api_rule_url}       ${headers}        {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail



S360_ALERT_API to edit new rule
    [Documentation]  keyword to edit rule by ruleId

    [Arguments]     ${Alert_Rule_Id}

    ${api_rule_url}=    create_api_url      alert_edit_rule     ${Alert_Rule_Id}
    ${headers}=     S360_API_Create Request Header
    ${request_body}=    create_Edit_Rule_Request
    ${api_response}=    make_API_Call       PUT      ${api_rule_url}       ${headers}       ${request_body}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail


S360_ALERT_API to save user preferences
    [Documentation]  keyword to save user preferences


    ${api_rule_url}=    create_api_url      alert_save_user_preferences     ' '
    ${headers}=     S360_API_Create Request Header
    ${request_body}=    create_user_preferences_Request
    ${api_response}=    make_API_Call       POST      ${api_rule_url}       ${headers}       ${request_body}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail



S360_ALERT_API Call To Ingest Event
    [Documentation]  keyword to make an api call to trigger notification


    ${response}=    get_Authentication_Token
    ${request_body}=    GenericMethods.create_JSON_Object     NodeStatus     guardian    ENGDEVSPHGRD02    heartbeat    dd_systech_qa2
    ${headers}=     create_Header     ${response}       application/json
    ${api_response}=    make_API_Call       ${Request_Type}   ${Api_Url}  ${headers}    ${request_body}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 201     fail


S360_ALERT_API to fetch user preferences by user and tenant
    [Documentation]  keyword to fetch user preferences by user and tenant

    [Arguments]     ${user_id}        ${tenant_id}

    ${api_rule_url}=    create_tenant_userid_api_url      alert_get_user_preferences     ${user_id}        ${tenant_id}
    ${headers}=     S360_API_Create Request Header
    ${api_response}=    make_API_Call       GET      ${api_rule_url}       ${headers}        {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail