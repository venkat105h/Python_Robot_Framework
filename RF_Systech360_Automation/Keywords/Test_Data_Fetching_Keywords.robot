*** Settings ***
Library         BuiltIn
Library         ExcelLibrary
Library         Collections
Library         OperatingSystem

*** Keywords ***
JSON_Get List of Items
    [Documentation]    return list from json file
    [Arguments]    ${file_path}
    ${file}=    Get File    ${file_path}
    @{list_of_items}=     Evaluate     json.loads("""${file}""")    json

    [Return]    @{list_of_items}


JSON_Get Solutions and Components
    [Documentation]    Store the Solutions and Components from the list_of_items into the global variables @{SOLUTIONS} and @{COMPONENTS}
    [Arguments]    @{list_of_items}

    @{SOLUTIONS}=    create list
    @{COMPONENTS}=    create list
    ${size}=    Get length   ${list_of_items}

    FOR    ${i}    IN RANGE   0  ${size}
        &{dict}=       convert to dictionary    ${list_of_items}[${i}]
        ${is_already_added}=    run keyword and return status    list should not contain value    ${SOLUTIONS}    ${dict["solution"]}
        run keyword if    '${is_already_added}'=='True'    append to list    ${SOLUTIONS}    ${dict["solution"]}
        ${is_already_added}=    run keyword and return status    list should not contain value    ${COMPONENTS}    ${dict["component"]}
        run keyword if    '${is_already_added}'=='True'    append to list    ${COMPONENTS}    ${dict["component"]}
    END

    set global variable    @{SOLUTIONS}
    set global variable    @{COMPONENTS}


JSON_Get an Item from the List
    [Documentation]    Returns an Item from the ${list} containing ${component}, ${solution} and ${version}
    [Arguments]   ${list}    ${component}    ${solution}    ${version}

    ${size}=    Get length   ${list}
    FOR    ${i}    IN RANGE   0  ${size}
        &{dict}=       convert to dictionary    ${list}[${i}]
        ${is_requested}=    run keyword and return status    run keywords
        ...           should be equal as strings    ${dict["component"]}    ${component}
        ...    AND    should be equal as strings    ${dict["solution"]}     ${solution}
        ...    AND    should be equal as strings    ${dict["version"]}      ${version}
        run keyword if      ${is_requested}==True    log    ${dict}
        exit for loop if    ${is_requested}==True

        ### return no result in case there is no information about requested Item
        &{dict}=    create dictionary    Result    Not Found
    END

    [Return]    &{dict}


JSON_Get number of Solutions and Versions for the Component
    [Documentation]    Process all Solutions for the ${component} in the ${list}
    [Arguments]   ${list}    ${component}

    FOR    ${solution}    IN    @{SOLUTIONS}
        JSON_Process a Solution    ${list}    ${component}    ${solution}
    END


JSON_Process a Solution
    [Documentation]    Process the ${solution}
    [Arguments]    ${list}    ${component}     ${solution}

    ${size}=    Get length    ${list}
    @{list_of_versions}=    Create list
    @{list_of_nodes}=       Create list

    FOR    ${i}    IN RANGE    0    ${size}
        &{dict}=     convert to dictionary    ${list}[${i}]
        ${bool1}=    run keyword and return status   should be equal as strings    ${dict["component"]}    ${component}
        ${bool2}=    run keyword and return status   should be equal as strings    ${dict["solution"]}     ${solution}
        run keyword if    '${bool1}'=='True' and '${bool2}'=='True'    append to list    ${list_of_versions}    ${dict["version"]}
        run keyword if    '${bool1}'=='True' and '${bool2}'=='True'    append to list    ${list_of_nodes}       ${dict}
    END
    ${versions_size}=    Get length    ${list_of_versions}
    log to console    ${solution} (${versions_size}) @{list_of_versions}


EXCEL_Process a Row of a Sheet
    [Documentation]    Process the row ${row} of the sheet ${sheet_name}
    [Arguments]    ${sheet_name}    ${row}    ${column_count}

    &{dict}=     create dictionary
    FOR    ${column}    IN RANGE    2    ${column_count}+1
        ${val1}=     Read Excel Cell     1        ${column}    sheet_name=${sheet_name}
        ${val2}=     Read Excel Cell     ${row}   ${column}    sheet_name=${sheet_name}
        set to dictionary    ${dict}   ${val1}   ${val2}
    END

    [Return]    &{dict}

EXCEL_Get Release Note For Server
    [Documentation]    Returning data of the release note
    [Arguments]    ${server_type}    ${version}    ${list}

    ${size}=    Get length    ${list}
    FOR    ${i}    IN RANGE   0    ${size}
        &{dict}=       convert to dictionary    ${list}[${i}]
        ${is_requested}=    run keyword and return status    should be equal as strings    ${dict["Type"]}    ${server_type}
        ${is_requested_second}=    run keyword and return status    should be equal as strings    ${dict["Version Number"]}    ${version}
        run keyword if      '${is_requested}'=='True' and '${is_requested_second}'=='True'   log    ${dict}
        exit for loop if    '${is_requested}'=='True' and '${is_requested_second}'=='True'
        ### return no result in case there is no information about requested server
        &{dict}=    create dictionary    Result    Not Found
    END

    [Return]    &{dict}

EXCEL_Get Server Data
    [Documentation]    Returning data of the server ${server_name} from the ${list}
    [Arguments]    ${server_name}     ${list}

    &{dict}=    create dictionary    Result    Not Found
    ${size}=    Get length    ${list}
    FOR    ${i}    IN RANGE   0    ${size}
        &{dict}=       convert to dictionary    ${list}[${i}]
        ${is_requested}=    run keyword and return status    should be equal as strings    ${dict["Server Name"]}    ${server_name}
#        ${is_requested_second}=    run keyword and return status    should be equal as strings    ${dict["Node Name"]}    ${server_name}
#        run keyword if      '${is_requested}'=='True' or '${is_requested_second}'=='True'   log    ${dict}
#        exit for loop if    '${is_requested}'=='True' or '${is_requested_second}'=='True'
        exit for loop if    '${is_requested}'=='True'
    END

    [Return]    &{dict}


EXCEL_Get Data From All Sheets
    [Arguments]    @{sheets1}    ${server_name}

    #Add Nodes and Inspector_System_Health sheet to list
    @{Sheets}=    create list
    FOR    ${i}    IN    @{sheets1}
        run keyword if    '${i}'=='Nodes' or '${i}'=='Inspector_System_Health'    append to list    ${Sheets}    ${i}
    END

    ${row_to_print}=        set variable    1
    ${column_to_print}=     set variable    1
    @{list_of_information}=    create list

    log to console    Getting data about ${server_name} From ${Sheets} excelsheet
    FOR    ${sheet}    IN    @{Sheets}
        @{row}=       Read Excel Row       ${row_to_print}       sheet_name=${sheet}
        @{column}=    Read Excel Column    ${column_to_print}    sheet_name=${sheet}

        ${row_count}=       Get length    ${column}
        ${column_count}=    Get length    ${row}

       &{server_data}=    EXCEL_Process The Sheet and Get Data    sheet=${sheet}    row_count=${row_count}    column_count=${column_count}    server_name=${server_name}
       append to list    ${list_of_information}    ${server_data}
    END

    [Return]    @{list_of_information}


EXCEL_Process The Sheet and Get Data
    [Arguments]    ${sheet}    ${row_count}    ${column_count}    ${server_name}
    @{list}=    create list
    FOR    ${row_index}    IN RANGE    2    ${row_count}+1
        &{dict}=     EXCEL_Process a Row of a Sheet    sheet_name=${sheet}    row=${row_index}    column_count=${column_count}
        append to list    ${list}    ${dict}
    END
    &{server_data}=     EXCEL_Get Server Data      ${server_name}     ${list}

    [Return]    &{server_data}

