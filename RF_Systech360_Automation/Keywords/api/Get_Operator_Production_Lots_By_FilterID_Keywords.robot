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

S360_OPEARATOR_API to fetch operator productionlot by valid filterid
    [Documentation]  keyword to validate operator productionlot with valid filter id

    [Arguments]     ${ValidFilterID}

    Log to Console    ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lots_by_filter_id    ${ValidFilterID}
    ${headers}=     create_Header_For_Operator_API      ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail



S360_OPEARATOR_API to fetch operator productionlot by in-valid filterid
    [Documentation]  keyword to validate operator productionlot with in valid filter id

    [Arguments]     ${InValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lots_by_filter_id    ${InValidFilterID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail


S360_OPEARATOR_API to fetch operator productionlot by blank filterid
    [Documentation]  keyword to validate operator productionlot with blank filter id

    [Arguments]     ${BlankFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lots_by_filter_id    ${BlankFilterID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator productionlot by valid filterid and invalid token
    [Documentation]  keyword to validate operator productionlot with valid filter id and invalid token

    [Arguments]     ${ValidFilterID}
    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lots_by_filter_id    ${ValidFilterID}
    ${headers}=     create_Header_For_Operator_API     ${Token}+'abc'       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail


S360_OPEARATOR_API to fetch operator productionlot by valid filterid and blank token
    [Documentation]  keyword to validate operator productionlot with valid filter id and blank token
    [Arguments]     ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lots_by_filter_id    ${ValidFilterID}
    ${headers}=     create_Header_For_Operator_API     ''       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator productionlot by valid filterid api attributes
    [Documentation]  keyword to validate operator productionlot by filter id attribute validation
    [Arguments]     ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lots_by_filter_id    ${ValidFilterID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]
    should be equal as strings    ${entityType_Attribute}   ${api_response.json()}[entityType]
    should be equal as integers   ${pkid_Attribute}   ${api_response.json()}[data][0][pkid]


S360_OPEARATOR_API to fetch operator productionlot by valid filterid api schema validation
    [Documentation]  keyword to validate operator productionlot by filter id schema validation

    [Arguments]     ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lots_by_filter_id    ${ValidFilterID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\production-lot-by-filterID-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
