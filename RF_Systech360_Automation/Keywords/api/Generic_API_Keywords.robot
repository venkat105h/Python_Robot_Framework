*** Settings ***
#Library    SeleniumLibrary    plugins=SeleniumTestability;True;30 Seconds;True
#Library    RequestsLibrary
#Library    Collections
#Library    JSONLibrary
Variables         ../../Configurations/api/api-global.yaml
#Variables         ../../testdata/api/api-request.yaml
Variables         ../../Variables/${TESTENV}_Variable.py
Variables         ../../testdata/api/api-${TESTENV}_request.yaml
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

S360_ALERT_Make API Call To Trigger Notification
    [Documentation]  generic keyword to make an api call to trigger notification

    #[Arguments]     ${Alert_Rule_User_List}

    ${response}=    get_Authentication_Token
    ${request_body}=    create_JSON_Object     NodeStatus     guardian    ENGDEVSPHGRD02    heartbeat    dd_systech_qa2
    ${headers}=     create_Header     ${response}       application/json
    ${api_response}=    make_API_Call       ${Request_Type}   ${Api_Url}  ${headers}    ${request_body}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 201     fail


S360_API_Create Request Header
    [Documentation]  generic keyword to create request header


    ${response}=    get_Authentication_Token
    ${headers}=     create_Header     ${response}       application/json

    [RETURN]    ${headers}

Get the token for admin login
    [Documentation]  keyword to get the token for admin login

     ${api_admin_login_url}=    create_admin_login_to_get_token_api_url      login_get_token_for_admin
     ${headers}=     create_Header_For_Admin_Login     ${Authorization}     true
     ${api_response}=    make_API_Call_For_Admin_Login       GET      ${api_admin_login_url}       ${headers}
     ${Token} =      set variable       ${api_response.headers}[token]
     set suite variable     ${Token}


