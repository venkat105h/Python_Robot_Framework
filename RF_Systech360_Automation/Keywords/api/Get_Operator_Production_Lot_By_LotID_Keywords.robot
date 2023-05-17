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

S360_OPEARATOR_API to fetch operator productionlot by valid lot id
    [Documentation]  keyword to validate operator productionlot with valid lot id

    [Arguments]     ${ValidLotID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lot_by_lot_id    ${ValidLotID}
    ${headers}=     create_Header_For_Operator_API      ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail



S360_OPEARATOR_API to fetch operator productionlot by in-valid lot id
    [Documentation]  keyword to validate operator productionlot with in valid lot id

    [Arguments]     ${InValidLotID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lot_by_lot_id    ${InValidLotID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail


S360_OPEARATOR_API to fetch operator productionlot by blank lot id
    [Documentation]  keyword to validate operator productionlot with blank lot id

    [Arguments]     ${BlankLotID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lot_by_lot_id    ${BlankLotID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator productionlot by valid lot id and invalid token
    [Documentation]  keyword to validate operator productionlot with valid lot id and invalid token

    [Arguments]     ${ValidLotID}
    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lot_by_lot_id    ${ValidLotID}
    ${headers}=     create_Header_For_Operator_API     ${Token}+'abc'       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail


S360_OPEARATOR_API to fetch operator productionlot by valid lot id and blank token
    [Documentation]  keyword to validate operator productionlot with valid lot id and blank token
    [Arguments]     ${ValidLotID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lot_by_lot_id    ${ValidLotID}
    ${headers}=     create_Header_For_Operator_API     ''       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator productionlot by valid lot id api attributes
    [Documentation]  keyword to validate operator productionlot by lot id attribute validation
    [Arguments]     ${ValidLotID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lot_by_lot_id    ${ValidLotID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]
    should be equal as strings    ${entityType_Attribute}   ${api_response.json()}[entityType]
    should be equal as integers   ${pkid_Attribute}   ${api_response.json()}[data][0][pkid]


S360_OPEARATOR_API to fetch operator productionlot by valid lot id api schema validation
    [Documentation]  keyword to validate operator productionlot by lot id schema validation

    [Arguments]     ${ValidLotID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_production_lot_by_lot_id    ${ValidLotID}
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\production-lot-by-lotID-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
