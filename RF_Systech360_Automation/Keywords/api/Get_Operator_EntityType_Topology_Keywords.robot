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

S360_OPEARATOR_API to fetch operator entity topology by valid entity type and valid id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters} =   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}   {}  ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
S360_OPEARATOR_API to fetch operator entity topology by in valid entity type and valid id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator entity topology by valid entity type and in valid id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator entity topology by in valid entity type and in valid id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator entity topology by blank entity type and valid id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    should be equal as strings    ${error_status_Attribute}   ${api_response.json()}[status]
    Run Keyword If  ${api_response.status_code}!= 200     fail

S360_OPEARATOR_API to fetch operator entity topology by valid entity type and blank id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    should be equal as strings    ${error_status_Attribute}   ${api_response.json()}[status]
    Run Keyword If  ${api_response.status_code}!= 200     fail

S360_OPEARATOR_API to fetch operator entity topology by blank entity type and blank id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    should be equal as strings    ${error_status_Attribute}   ${api_response.json()}[status]
    Run Keyword If  ${api_response.status_code}!= 200     fail

S360_OPEARATOR_API to fetch operator entity topology by valid entity type and valid id with in valid token
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}+'abc'
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator entity topology by valid entity type and valid id with blank token
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ''
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator entity topology by valid entity type and valid id response attributes validation
    [Documentation]  keyword to validate operator productionlot by filter id attribute validation
    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]
    should be equal as integers    ${entitypkid_Attribute}   ${api_response.json()}[data][0][pkid]
    should be equal as integers   ${uniObjectTypeId_Attribute}   ${api_response.json()}[data][0][uniObjectTypeId]

S360_OPEARATOR_API to fetch operator entity topology by valid entity type and valid id response schema validation
    [Documentation]  keyword to validate operator productionlot by filter id schema validation

    [Arguments]     ${TopologyEntityType}   ${TopologyID}

    ${api_operator_url}=    create_admin_login_to_get_token_api_url      operator_entity_topology
    ${parameters}   create dictionary    entityType=${TopologyEntityType}    id=${TopologyID}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\entitytype-topology-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
