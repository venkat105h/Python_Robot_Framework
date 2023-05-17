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

S360_OPEARATOR_API to fetch operator production view
    [Documentation]  keyword to validate operator production view

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_productionview      None
    ${headers}=     create_Header_For_Operator_API      ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail



S360_OPEARATOR_API to fetch operator production view with invalid token
    [Documentation]  keyword to validate operator production view with invalid token

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_productionview      None
    ${headers}=     create_Header_For_Operator_API     ${Token}+'abc'       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail


S360_OPEARATOR_API to fetch operator production view with blank token
    [Documentation]  keyword to validate operator production view with blank token

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_productionview      None
    ${headers}=     create_Header_For_Operator_API     ''       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator production view api attributes
    [Documentation]  keyword to validate operator production view attribute validation

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_productionview      None
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    Log to Console    ${api_response.json()}
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]
    should be equal as integers   ${productionview_count_Attribute}   ${api_response.json()}[count]


S360_OPEARATOR_API to fetch operator production view api schema validation
    [Documentation]  keyword to validate operator production view schema validation

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_productionview      None
    ${headers}=     create_Header_For_Operator_API     ${Token}       application/json
    ${api_response}=    make_API_Call       GET   ${api_operator_url}  ${headers}    {}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\production-view-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
