*** Settings ***
Variables       ../../testdata/api/api-${TESTENV}_request.yaml
Variables       ../../testdata/api/api-${TESTENV}_response.yaml
#Variables         ../../Variables/${TESTENV}_Variable.py
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=60.0
Library           ../../Generic/api/ApiMethods.py
Library           ../../Generic/GenericMethods.py

*** Keywords ***

S360_OPEARATOR_API to fetch operator notification getfiles by valid notification id
    [Documentation]  keyword to validate operator productionlot with valid filter id

    [Arguments]     ${ValidNotificationID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_getfiles_by_notification_id    ${ValidNotificationID}
    ${headers}=     create_Header_For_Operator_API      ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail

S360_OPEARATOR_API to fetch operator notification getfiles by in-valid notification id
    [Documentation]  keyword to validate operator productionlot with in valid filter id

    [Arguments]     ${InValidNotificationID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_getfiles_by_notification_id    ${InValidNotificationID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notification getfiles by blank notification id
    [Documentation]  keyword to validate operator productionlot with blank filter id

    [Arguments]     ${BlankNotificationID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_getfiles_by_notification_id    ${BlankNotificationID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notification getfiles by valid notification id and invalid token
    [Documentation]  keyword to validate operator productionlot with valid filter id and invalid token

    [Arguments]     ${ValidNotificationID}
    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_getfiles_by_notification_id    ${ValidNotificationID}
    ${headers}=     create_Header_For_Operator_API     ${Token}+'abc'       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail


S360_OPEARATOR_API to fetch operator notification getfiles by valid notification id and blank token
    [Documentation]  keyword to validate operator productionlot with valid filter id and blank token
    [Arguments]     ${ValidNotificationID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_getfiles_by_notification_id    ${ValidNotificationID}
    ${headers}=     create_Header_For_Operator_API     ''       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator notification getfiles by valid notification id api attributes
    [Documentation]  keyword to validate operator productionlot by filter id attribute validation
    [Arguments]     ${ValidNotificationID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_getfiles_by_notification_id    ${ValidNotificationID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]
    #should be equal as integers    ${notification_getfiles_pkid}   ${api_response.json()}[dataValue][0][pkid]
    #should be equal as integers    ${notification_getfiles_uniObjectTypeId}   ${api_response.json()}[dataValue][0][uniObjectTypeId]

S360_OPEARATOR_API to fetch operator notification getfiles by valid notification id api schema validation
    [Documentation]  keyword to validate operator productionlot by filter id schema validation

    [Arguments]     ${ValidNotificationID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_getfiles_by_notification_id    ${ValidNotificationID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\notifications-getfiles-by-notificationID-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
