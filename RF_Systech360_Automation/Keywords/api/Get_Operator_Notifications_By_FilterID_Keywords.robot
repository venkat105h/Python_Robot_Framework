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

S360_OPEARATOR_API to fetch operator notifications can be fetched by valid filter id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${ValidFilterID}
    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_by_filter_id      ${ValidFilterID}
    ${parameters} =   create dictionary    p_limit=${p_limit}    p_offset=${p_offset}   p_order=${p_order}      p_sort=${p_sort}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}   {}  ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
S360_OPEARATOR_API to fetch operator notifications can be fetched by in valid filter id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${InValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_by_filter_id      InValidFilterID
    ${parameters} =   create dictionary    p_limit=${p_limit}    p_offset=${p_offset}   p_order=${p_order}      p_sort=${p_sort}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications can be fetched by blank filter id
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${BlankFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_by_filter_id      BlankFilterID
    ${parameters} =   create dictionary    p_limit=${p_limit}    p_offset=${p_offset}   p_order=${p_order}      p_sort=${p_sort}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications can be fetched by valid filter id and in-valid token
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_by_filter_id      ${ValidFilterID}
    ${parameters} =   create dictionary    p_limit=${p_limit}    p_offset=${p_offset}   p_order=${p_order}      p_sort=${p_sort}
    ${headers}=     create_Header_Without_ContentTye      ${Token}+'abc'
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator notifications can be fetched by valid filter id and blank token
    [Documentation]  keyword to validate entity topology by valid entity type and valid id

    [Arguments]     ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_by_filter_id      ${ValidFilterID}
    ${parameters} =   create dictionary    p_limit=${p_limit}    p_offset=${p_offset}   p_order=${p_order}      p_sort=${p_sort}
    ${headers}=     create_Header_Without_ContentTye      ''
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    should be equal as strings    ${error_status_Attribute}   ${api_response.json()}[status]
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator notifications can be fetched by valid filter id response attributes validation
    [Documentation]  keyword to validate operator productionlot by filter id attribute validation
    [Arguments]     ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_by_filter_id      ${ValidFilterID}
    ${parameters} =   create dictionary    p_limit=${p_limit}    p_offset=${p_offset}   p_order=${p_order}      p_sort=${p_sort}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]

S360_OPEARATOR_API to fetch operator notifications can be fetched by valid filter id response schema validation
    [Documentation]  keyword to validate operator productionlot by filter id schema validation

    [Arguments]     ${ValidFilterID}

    ${api_operator_url}=    create_get_productionlot_by_filteridlotid_api_url      operator_get_notifications_by_filter_id      ${ValidFilterID}
    ${parameters} =   create dictionary    p_limit=${p_limit}    p_offset=${p_offset}   p_order=${p_order}      p_sort=${p_sort}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\notifications-by-filterID-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
