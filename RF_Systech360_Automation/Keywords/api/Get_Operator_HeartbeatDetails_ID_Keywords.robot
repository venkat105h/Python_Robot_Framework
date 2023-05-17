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

S360_OPEARATOR_API to fetch operator heartbeat details valid id
    [Documentation]  keyword to validate operator heartbeat details valid id

    [Arguments]     ${ID_For_HeartBeatDetails}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_heartbeatdetails_by_id    ${ID_For_HeartBeatDetails}
    ${headers}=     create_Header_For_Operator_API      ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail

S360_OPEARATOR_API to fetch operator heartbeat details in-valid id
    [Documentation]  keyword to validate operator heartbeat details in-valid id

    [Arguments]     ${InValidID_For_HeartBeatDetails}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_heartbeatdetails_by_id    ${InValidID_For_HeartBeatDetails}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator heartbeat details blank id
    [Documentation]  keyword to validate operator heartbeat details blank id

    [Arguments]     ${BlankID_For_HeartBeatDetails}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_heartbeatdetails_by_id    ${BlankID_For_HeartBeatDetails}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator heartbeat details valid id and invalid token
    [Documentation]  keyword to validate operator heartbeat details valid id and invalid token

    [Arguments]     ${ID_For_HeartBeatDetails}
    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_heartbeatdetails_by_id    ${ID_For_HeartBeatDetails}
    ${headers}=     create_Header_For_Operator_API     ${Token}+'abc'       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail


S360_OPEARATOR_API to fetch operator heartbeat details valid id and blank token
    [Documentation]  keyword to validate operator heartbeat details valid id and blank token
    [Arguments]     ${ID_For_HeartBeatDetails}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_heartbeatdetails_by_id    ${ID_For_HeartBeatDetails}
    ${headers}=     create_Header_For_Operator_API     ''       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator heartbeat details valid id api attributes
    [Documentation]  keyword to validate operator heartbeat details valid id api attributes validation
    [Arguments]     ${ID_For_HeartBeatDetails}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_heartbeatdetails_by_id    ${ID_For_HeartBeatDetails}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]
    should be equal as integers    ${dataGroupId_Attribute}   ${api_response.json()}[data][0][dataGroupId]
    should be equal as strings   ${dataGroupName_Attribute}   ${api_response.json()}[data][0][dataGroupName]

S360_OPEARATOR_API to fetch operator heartbeat details valid id api schema validation
    [Documentation]  keyword to validate operator heartbeat details valid id api schema validation

    [Arguments]     ${ID_For_HeartBeatDetails}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_heartbeatdetails_by_id    ${ID_For_HeartBeatDetails}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\heartbeatdetails-by-ID-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
