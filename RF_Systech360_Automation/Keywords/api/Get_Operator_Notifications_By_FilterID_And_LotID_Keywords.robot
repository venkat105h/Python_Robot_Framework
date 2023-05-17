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

S360_OPEARATOR_API to fetch operator notifications by valid filter id and lot id
    [Documentation]  keyword to validate operator notifications by valid filter id and lot id.

    [Arguments]     ${ValidFilterID}   ${ValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id   ${ValidFilterID}   ${ValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}   {}  ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
S360_OPEARATOR_API to fetch operator notifications by in valid filter id and valid lot id
    [Documentation]  keyword to validate operator notifications by in valid filter id and valid lot id.

    [Arguments]     ${InValidFilterID}   ${ValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${InValidFilterID}   ${ValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications by valid filter id and in valid lot id
    [Documentation]  keyword to validate operator notifications by valid filter id and in valid lot id.

    [Arguments]     ${ValidFilterID}   ${InValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${ValidFilterID}   ${InValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications by in valid filter id and in valid lot id
    [Documentation]  keyword to validate operator notifications by in valid filter id and in valid lot id.

    [Arguments]     ${InValidFilterID}   ${InValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${InValidFilterID}   ${InValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications by blank filter id and valid lot id
    [Documentation]  keyword to validate operator notifications by blank filter id and valid lot id.

    [Arguments]     ${BlankFilterID}   ${ValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${BlankFilterID}   ${ValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications by valid filter id and blank lot id
    [Documentation]  keyword to validate operator notifications by valid filter id and blank lot id.

    [Arguments]     ${ValidFilterID}   ${BlankLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${ValidFilterID}   ${BlankLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications by blank filter id and blank lot id
    [Documentation]  keyword to validate operator notifications by blank filter id and blank lot id.

    [Arguments]     ${BlankFilterID}   ${BlankLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${BlankFilterID}   ${BlankLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 404     fail

S360_OPEARATOR_API to fetch operator notifications by valid filter id and valid lot id with in valid token
    [Documentation]  keyword to validate operator notifications by valid filter id and valid lot id with in valid token.

    [Arguments]     ${ValidFilterID}   ${ValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${ValidFilterID}   ${ValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}+'abc'
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator notifications by valid filter id and valid lot id with blank token
    [Documentation]  keyword to validate operator notifications by valid filter id and valid lot id with blank token.

    [Arguments]     ${ValidFilterID}   ${ValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${ValidFilterID}   ${ValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ''
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 401     fail

S360_OPEARATOR_API to fetch operator notifications by valid filter id and valid lot id response attributes validation
    [Documentation]  keyword to validate operator notifications by valid filter id and valid lot id response attributes validation.
    [Arguments]     ${ValidFilterID}   ${ValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${ValidFilterID}   ${ValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    Run Keyword If  ${api_response.status_code}!= 200     fail
    should be equal as strings    ${status_Attribute}   ${api_response.json()}[status]
    should be equal as integers    ${notifications_by_FL_pkid_Attribute}   ${api_response.json()}[dataValue][0][pkid]
    should be equal as integers   ${notifications_by_FL_uniObjectTypeId_Attribute}   ${api_response.json()}[dataValue][0][uniObjectTypeId]

S360_OPEARATOR_API to fetch operator notifications by valid filter id and valid lot id response schema validation
    [Documentation]  keyword to validate operator notifications by valid filter id and valid lot id response schema validation.

    [Arguments]     ${ValidFilterID}   ${ValidLotID}

    ${api_operator_url}=    create_api_url_with_multiple_path_parameters      operator_get_notifications_by_filter_id_and_lot_id       ${ValidFilterID}   ${ValidLotID}
    ${parameters} =   create dictionary    p_limit=${p_limit1}    p_offset=${p_offset1}   p_order=${p_order1}      p_sort=${p_sort1}
    ${headers}=     create_Header_Without_ContentTye      ${Token}
    ${api_response}=    make_API_Call_With_Parameters       GET   ${api_operator_url}  ${headers}    {}     ${parameters}
    Log to Console    ${api_response.status_code}
    validate_json_schema    input_json_response=${api_response.json()}  reference_schema_path=${CURDIR}\\..\\..\\testdata\\api\\schemafiles\\notifications-by-filterID-and-lotID-response-schema.json
    Run Keyword If  ${api_response.status_code}!= 200     fail
