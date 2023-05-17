*** Settings ***
Documentation  Necessary Libraries and Resources file are mentioned below
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime
Library         ExcelLibrary
Library         OperatingSystem
Library         SeleniumLibrary  timeout=10.0
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Operator_Locators.robot
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/Operator_Software_Locators.robot
Variables       ../Variables/${TESTENV}_Variable.py
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Designer_Keywords.robot
Resource        ../Keywords/Operator_Keywords.robot
Resource        ../Keywords/Test_Data_Fetching_Keywords.robot

*** Keywords ***

S360_OP_Open View By Name
    [Documentation]  Clicks on view by Name
    [Arguments]    ${ViewName}

    ${index}=    S360_OP_Search for view    ${ViewName}
    wait until page contains element    ${S360_VIEW_CARD_NAME} [${index}]
    Click Element    ${S360_VIEW_CARD_NAME} [${index}]
    wait until page contains element    ${S360_OVERVIEW_TAB}    20s

S360_OP_Open software tab
    [Documentation]    Opens softawre tab and waits for loading

    wait until element is visible   ${S360_OP_SOFTWARE_TAB_BUTTON}    timeout=20s
    Click Element    ${S360_OP_SOFTWARE_TAB_BUTTON}
    wait until element is visible    ${S360_OP_SOFTWARE_TAB_VIEW}     timeout=20s

S360_OP_Click on dashboard
    wait until element is visible    ${S360_OP_DASHBOARD_TAB}
    wait until keyword succeeds  3x  2s   click element    ${S360_OP_DASHBOARD_TAB}
    wait until keyword succeeds  3x  2s   wait until element is visible   ${S360_OP_SOFTWARE_TAB_BUTTON}

S360_OP_Get Card Index
    [Documentation]    Returns the index of requested card in my views
    [Arguments]   ${ViewName}

    ${card_count}=    get element count  ${S360_VIEW_CARD_NAME}
    FOR    ${i}    IN RANGE    1    ${card_count}+1
        wait until page contains element    ${S360_VIEW_CARD_NAME} [${i}]
        ${text}=    get text    ${S360_VIEW_CARD_NAME} [${i}]
        ${index}=    set variable if    '${text}'=='${ViewName}'    ${i}
        exit for loop if   '${text}'=='${ViewName}'
    END

    [Return]    ${index}

S360_OP_Search for view
    [Documentation]    searches for keyword in views
    [Arguments]   ${ViewName}

    wait until element is visible    ${SEC/S360_SEARCH_BOX}

    clear element text  ${SEC/S360_SEARCH_BOX}
    press keys    ${SEC/S360_SEARCH_BOX}  ${ViewName}
    repeat keyword    10 times    S360_OP_Validate graphs on view cards
    Click Element  ${SEC/S360_SEARCH_BTN}

    wait until element is visible    ${S360_VIEW_CARD_NAME}
    ${card_count}=    get element count  ${S360_VIEW_CARD_NAME}
    FOR    ${i}    IN RANGE    1    ${card_count}+1
        ${text}=    get text    ${S360_VIEW_CARD_NAME} [${i}]
        should contain    ${text}    ${ViewName}
        ${index}=    set variable if    '${text}'=='${ViewName}'    ${i}
    END

    [Return]    ${index}

S360_OP_Validate graphs on view cards
    ${count}=   get element count    ${S360_OP_VIEWS_IMAGE}
    FOR     ${i}    IN RANGE   1    ${count}
        wait until element is visible    ${S360_OP_VIEWS_IMAGE} [${i}]
    END

S360_OP_Click overview tab in icw
    wait until element is visible    ${S360_OP_ICW_OVERVIEW_TAB}    timeout=20
    click element    ${S360_OP_ICW_OVERVIEW_TAB}

S360_OP_Click kb updates tab in icw
    click element    ${S360_OP_ICW_KB_UPDATES_TAB}

S360_OP_Click icw expand button
    wait until element is visible    ${S360_OP_ICW_EXPAND_BUTTON}
    click element       ${S360_OP_ICW_EXPAND_BUTTON}

S360_OP_Click icw retract button
    wait until element is visible    ${S360_OP_ICW_RETRACT_BUTTON} [2]
    click element    ${S360_OP_ICW_RETRACT_BUTTON} [2]

S360_OP_Click icw close button
    click element    ${S360_OP_ICW_CLOSE_BUTTON}

360_OP_Click on ribbon by version
    [Arguments]    ${requested}
    ${count}=   get element count    ${S360_TITLES}
    FOR     ${i}    IN RANGE    2    ${count}+1
        ${text}=    get text    ${S360_TITLES} [${i}]
        @{text}=    split string    ${text}     -
        run keyword if  '${text}[0]'=='${requested}'   run keywords    click element   ${S360_TITLES} [${i}]    AND     exit for loop
    END

360_OP_Click on node by text
    [Arguments]    ${requested}
    ${count}=   get element count    ${S360_OP_NODE_CONTENT}
    FOR     ${i}    IN RANGE    1    ${count}+1
        ${text}=    get text    ${S360_OP_NODE_CONTENT} [${i}]
        @{text_after}=    split string    ${text}     (
        ${final_text}=    strip string    ${text_after}[0]
        run keyword if  '${final_text}' == '${requested}'    click element   ${S360_OP_NODE_CONTENT} [${i}]
    END

S360_OP_Delete view from my views
    [Arguments]     ${ViewName}
    #search for the view
    S360_OP_Search for view    ${ViewName}
    Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME}
    # Deletes a view
    Mouse Over              ${SEC/S360_CARD_OPTION_MENU}
    Wait Until Element Is Visible    ${SEC/S360_DELETE_CARD_ICON}  timeout=15
#    click element    ${SEC/S360_DELETE_CARD_ICON}
    Execute Javascript      document.getElementById('${SEC/S360_DELETE_CARD_ICON}').click()
    Wait Until Element Is Visible    ${SEC/S360_DELETE_POP_BTN}  timeout=15
    Click Element           ${SEC/S360_DELETE_POP_BTN}
    wait until element is not visible    ${SEC/S360_DELETE_POP_BTN}
    wait until keyword succeeds  2x  2s  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}





S360_OP_Delete copy from my views
    [Arguments]     ${ViewName}
    #search for the view
    S360_OP_Search for view    ${ViewName}
    Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME}
    # Deletes a view
    Mouse Over              ${SEC/S360_CARD_OPTION_MENU}
    Wait Until Element Is Visible    ${SEC/S360_DELETE_CARD_ICON}  timeout=15
#    click element    ${SEC/S360_DELETE_CARD_ICON}
    Execute Javascript      document.getElementById('${SEC/S360_DELETE_CARD_2_ICON}').click()
    Wait Until Element Is Visible    ${SEC/S360_DELETE_POP_BTN}  timeout=15
    Click Element           ${SEC/S360_DELETE_POP_BTN}
    wait until element is not visible    ${SEC/S360_DELETE_POP_BTN}
    wait until keyword succeeds  2x  2s  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}



#===========================================================
#========================Validations========================
#===========================================================
S360_OP_Validate dashboard tab contents
    wait until element is visible   ${S360_OP_DASHBOARD_OVERVIEW_TAB}
    wait until element is visible    ${S360_OP_DASHBOARD_OVERVIEW_TAB_CIRCLE}
    click element    ${S360_OP_DASHBOARD_GRAPHICAL_TAB}
    wait until element is visible    ${S360_OP_DASHBOARD_GRAPHICAL_TAB_CHART}
    element should be visible    ${S360_OP_DASHBOARD_GRAPHICAL_TAB_CHART}
    click element    ${S360_OP_DASHBOARD_NODES_TAB}
    element should be visible    ${S360_OP_DASHBOARD_NODES_TAB_CONTENT}
    S360_OP_Open software tab

S360_OP_Validate software tab
    element should be visible    ${S360_OP_SOFTWARE_TAB_VIEW}
    element should be visible    ${S360_OP_REFINE_BY_VIEW}
    element should be visible    ${S360_OP_GROUP_BY_LABEL}
    element should be visible    ${S360_OP_OVERVIEW_RIBBON}
    element should be visible    ${S360_OP_NODES_RIBBONS}

S360_OP_Validate refine by
    element should be visible     ${S360_OP_REFINE_BY}
    element should be visible     ${S360_OP_REFINE_BY_SUPPORTED_VERSION}
    element should be visible     ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES}
    element should be visible     ${S360_OP_REFINE_BY_VERSION}
    element should be visible     ${S360_OP_REFINE_BY_NODE}

S360_OP_Validate empty refine by
    element should be visible        ${S360_OP_REFINE_BY}
    element should not be visible    ${S360_OP_REFINE_BY_SUPPORTED_VERSION}
    element should not be visible    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES}
    element should not be visible    ${S360_OP_REFINE_BY_VERSION}
#    element should not be visible    ${S360_OP_REFINE_BY_NODE}

S360_OP_Validate Nodes
    ${lines_count}=    get length    ${node_lines}
    ${site_servers_count}=    get length    ${node_site_servers}
    ${unitrace_count}=    get length    ${node_unitrace}

    run keyword if    ${lines_count} > 0    run keywords        element should be visible    ${S360_OP_REFINE_NODE_LINES}
    ...    AND    element should be visible    ${S360_OP_REFINE_NODE_LINES_COUNTS}
    ...    AND    element should contain     ${S360_OP_REFINE_NODE_LINES_COUNTS}    (${lines_count})
    ...    ELSE   element should not be visible    ${S360_OP_REFINE_NODE_LINES}

    run keyword if    ${unitrace_count} > 0    run keywords        element should be visible    ${S360_OP_REFINE_NODE_UNITRACE}
    ...    AND    element should be visible    ${S360_OP_REFINE_NODE_UNITRACE_COUNTS}
    ...    AND    element should contain     ${S360_OP_REFINE_NODE_UNITRACE_COUNTS}    (${unitrace_count})
    ...    ELSE   element should not be visible    ${S360_OP_REFINE_NODE_UNITRACE}

    run keyword if    ${site_servers_count} > 0    run keywords        element should be visible    ${S360_OP_REFINE_NODE_SITE_SERVERS}
    ...    AND    element should be visible    ${S360_OP_REFINE_NODE_SITE_SERVERS_COUNTS}
    ...    AND    element should contain     ${S360_OP_REFINE_NODE_SITE_SERVERS_COUNTS}    (${site_servers_count})
    ...    ELSE   element should not be visible    ${S360_OP_REFINE_NODE_SITE_SERVERS}

S360_OP_Validate supported version checkboxes
    ${supported_versions_count}=    get length    ${supported}
    ${unsupported_versions_count}=    get length    ${unsupported}
    run keyword if    ${unsupported_versions_count} > 0    run keywords        element should be visible    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO}    No
    ...    AND    element should be visible    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO_COUNTS}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO_COUNTS}    (${unsupported_versions_count})
    ...    ELSE   element should not be visible    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO}

    run keyword if    ${supported_versions_count} > 0    run keywords        element should be visible    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES}    Yes
    ...    AND    element should be visible    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES_COUNTS}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES_COUNTS}    (${supported_versions_count})
    ...    ELSE   element should not be visible    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES}

S360_OP_Validate current on updates checkboxes
    ${current_on_updates_versions_count}=    get length    ${current_on_updates}
    ${not_current_on_updates_versions_count}=    get length    ${not_current_on_updates}

    run keyword if    ${not_current_on_updates_versions_count} > 0    run keywords        element should be visible    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO}    No
    ...    AND    element should be visible    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO_COUNTS}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO_COUNTS}    (${not_current_on_updates_versions_count})
    ...    ELSE   element should not be visible    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO}

    run keyword if    ${current_on_updates_versions_count} > 0    run keywords        element should be visible    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES}    Yes
    ...    AND    element should be visible    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES_COUNTS}
    ...    AND    element should contain     ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES_COUNTS}    (${current_on_updates_versions_count})
    ...    ELSE   element should not be visible    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES}

S360_OP_Validate group by dropdown
    element should be visible       ${S360_GROUP_BY_DROPDOWN}
    @{drop_down_items}=    get list items       ${S360_GROUP_BY_DROPDOWN}
    ${list_length}=     get length    ${drop_down_items}
    should be true    ${list_length} == 3
    list should contain value    ${drop_down_items}     Release
    list should contain value    ${drop_down_items}     Supported
    list should contain value    ${drop_down_items}     Current On Updates

S360_OP_validate ribbons for currently on updates
    ${count}=   get element count    ${S360_TITLES}
    should be true   ${count} == 3
    element should contain    ${S360_TITLES} [1]   Overview

    ${is_on_updates_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [2]    Current
    ${is_not_on_updates_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [3]    Maintenance
    ${on_updates_ribbon_index}=    run keyword if    ${is_on_updates_ribbon}==True    set variable    2
    ...    ELSE    set variable    3
    ${not_on_updates_ribbon_index}=     run keyword if    ${is_not_on_updates_ribbon}==True    set variable    3
    ...    ELSE    set variable    2

    element should contain    ${S360_TITLES} [${on_updates_ribbon_index}]    Current On Updates
    element should contain    ${S360_TITLES} [${not_on_updates_ribbon_index}]    Maintenance Available

S360_OP_validate ribbons for supported versions
    ${supported_versions_count}=       get length    ${supported}
    ${unsupported_versions_count}=     get length    ${unsupported}
    ${count}=   get element count    ${S360_TITLES}
    run keyword if    '${supported_versions_count}'=='0' and '${unsupported_versions_count}'=='0'    should be true   ${count} == 1
    run keyword if    '${supported_versions_count}'=='0' or '${unsupported_versions_count}'=='0'    should be true   ${count} == 2
    ...    ELSE    should be true   ${count} == 3

    element should contain    ${S360_TITLES} [1]   Overview

    ${is_unsupported_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [2]    Unsupported
    ${is_supported_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [3]    Supported
    ${usupported_ribbon_index}=    run keyword if    ${is_unsupported_ribbon}==True    set variable    2
    ...    ELSE    set variable    3
    ${supported_ribbon_index}=     run keyword if    ${is_supported_ribbon}==True    set variable    3
    ...    ELSE    set variable    2

    run keyword if    '${unsupported_versions_count}'!='0'    element should contain    ${S360_TITLES} [${usupported_ribbon_index}]    Unsupported Software
    run keyword if    '${supported_versions_count}'!='0'    element should contain    ${S360_TITLES} [${supported_ribbon_index}]    Supported Software

S360_OP_validate release notes functionality
     [Arguments]    ${nodes}
    Execute JavaScript   window.scrollTo(0, 1000)
    ${count}=    get element count    ${S360_SERVER_NAME}

    FOR    ${i}    IN RANGE    2    ${count}+1
       ${first_text}=    get text    ${S360_SERVER_NAME} [${i}]
       ${stop_loop}=     run keyword and return status    should be equal as strings    '${nodes}'   '${first_text}'
       continue for loop if   ${stop_loop}==True

        ${is_line}=           run keyword and return status    should contain  ${first_text}    Lines
        ${is_site_server}=    run keyword and return status    should contain  ${first_text}    Site Servers
        ${is_unitrace}=       run keyword and return status    should contain  ${first_text}    Unitrace

        ${release_note_present}=    run keyword and return status    element should be visible    ${S360_OP_SOFTWARE_HEADER_TITLE} [${i}+1]${S360_OP_SOFTWARE_RELEASE_NOTES}
        continue for loop if    ${release_note_present}==False

        ${second_text}=    get text    ${S360_OP_SOFTWARE_HEADER_TITLE} [${i}+1]${S360_OP_SOFTWARE_RELEASE_NOTES}
        @{second_text}=    split string    ${second_text}    ,
        ${second_text}=    strip string    ${second_text}[0]
        ${second_text}=    split string from right    ${second_text}    ${SPACE}    1


        &{dict}=    run keyword if    ${is_line}==True    EXCEL_Get Release Note For Server    Advisor/Sentri    ${second_text}[1]    ${list_of_items_in_excel_release_notes}
                    ...    ELSE IF    ${is_site_server}==True    EXCEL_Get Release Note For Server    Guardian    ${second_text}[1]    ${list_of_items_in_excel_release_notes}
                    ...    ELSE       EXCEL_Get Release Note For Server    UniTrace    ${second_text}[1]    ${list_of_items_in_excel_release_notes}


        Click Element       ${S360_OP_SOFTWARE_HEADER_TITLE} [${i}+1]${S360_OP_SOFTWARE_RELEASE_NOTES}/span

        switch window    NEW   4s
        ${href}=    Get Location
        ${release_note_name}=    replace string    ${dict["Release Notes File Name"]}    (    %28
        ${release_note_name}=    replace string    ${release_note_name}    )    %29
        should contain    ${href}    ${release_note_name}

        close window
        switch window    MAIN    2s
        wait until page contains     Systech360
        ${tab_name}=    get title
        should be equal as strings    ${tab_name}  Systech360
    END

S360_OP_Validate headers inside overview
    ${count}=   get element count    ${S360_OP_OVERVIEW_RIBBON_HEADERS}
    should be true   ${count} == 5
    element should contain    ${S360_OP_OVERVIEW_RIBBON_HEADERS} [1]    Nodes on Supported Versions
    element should contain    ${S360_OP_OVERVIEW_RIBBON_HEADERS} [2]    Nodes Current on Updates
    element should contain    ${S360_OP_OVERVIEW_RIBBON_HEADERS} [3]    Nodes Current on KB Updates
    element should contain    ${S360_OP_OVERVIEW_RIBBON_HEADERS} [4]    Site Server Version Distribution
    element should contain    ${S360_OP_OVERVIEW_RIBBON_HEADERS} [5]    Line Version Distribution
    ${count}=   get element count    ${S360_OP_OVERVIEW_RIBBON_HEADERS_PERCENTAGES}
    should be true   ${count} == 3
    FOR     ${i}    IN RANGE    1    ${count}+1
        element should contain    ${S360_OP_OVERVIEW_RIBBON_HEADERS_PERCENTAGES} [${i}]     %
    END
    ${count}=   get element count    ${S360_OP_OVERVIEW_RIBBON_HEADERS_CHART}
    should be true   ${count} > 2

S360_OP_Validate supported unsupported ribons
    ${count}=   get element count    ${S360_TITLES}
    @{expanded}=    create list
    @{unexpanded}=    create list
    Execute JavaScript   window.scrollTo(0, 2000)
    FOR     ${i}    IN RANGE    2    ${count}+1
        ${attribute}=    get element attribute    ${S360_TITLES} [${i}]     aria-expanded
        Run Keyword If    '${attribute}' == 'true'      append to list   ${expanded}    ${i}
        ...    ELSE     append to list   ${unexpanded}    ${i}
        wait until element is visible    ${S360_OP_OVERVIEW_RIBBONS_NODE_COUNT} [${i}-1]
        element should be visible    ${S360_OP_OVERVIEW_RIBBONS_NODE_COUNT} [${i}-1]
        ${text}=    get text    ${S360_TITLES} [${i}]
        click element    ${S360_TITLES} [${i}]
        repeat keyword    2 times    wait until page contains element    ${S360_OP_SOFTWARE_RIBBONS_BODY} [${i}]
        ${attribute_after}=    get element attribute    ${S360_TITLES} [${i}]     aria-expanded
        ${is_changed}=    run keyword and return status    should not be equal as strings    ${attribute}      ${attribute_after}
        ${attribute_after}=    run keyword if    ${is_changed}==False    run keywords    get element attribute    ${S360_TITLES} [${i}]     aria-expanded
                                                                          ...     AND    should not be equal as strings    ${attribute}      ${attribute_after}
    END
    S360_OP_Expand all ribbons
    FOR     ${i}    IN    @{expanded}
        ${image}=       S360_OP_Get image source from software tab ribbons      ${i}
        should contain   ${image}   StateIcons_Failed
        ${count}=    get element count     xpath:${S360_TITLES_EXPANDED_CONTENT} [${i}]//div[2]/strong
        S360_OP_Validate list contains node name    ${count}    ${i}    ${not_current_on_updates}
    END
    FOR     ${i}    IN    @{unexpanded}
        ${image}=       S360_OP_Get image source from software tab ribbons      ${i}
        should contain   ${image}   StateIcons_ProcessCompleted
        ${count}=    get element count     xpath:${S360_TITLES_EXPANDED_CONTENT} [${i}]//div[2]/strong
        S360_OP_Validate list contains node name    ${count}    ${i}    ${current_on_updates}
    END

S360_OP_Validate list contains node name
    [Arguments]    ${count}    ${n}    ${list}

    FOR    ${i}    IN RANGE    1   ${count}+1
        wait until element is visible    xpath:(${S360_TITLES_EXPANDED_CONTENT} [${n}]//div[2]//strong) [${i}]
        ${text}=    get text    xpath:(${S360_TITLES_EXPANDED_CONTENT} [${n}]//div[2]//strong) [${i}]
        @{text}=    split string    ${text}    ${SPACE}
        list should contain value    ${list}    ${text}[0]
    END

S360_OP_Expand all ribbons
    ${count}=   get element count    ${S360_TITLES}
    FOR     ${i}    IN RANGE    2    ${count}+1

        ${attribute}=     get element attribute     ${S360_TITLES} [${i}]     aria-expanded
        continue for loop if    '${attribute}' == 'true'
        repeat keyword    5 times    wait until element is visible    ${S360_SERVER_NAME} [${i}-1]
        click element    ${S360_SERVER_NAME} [${i}-1]
        repeat keyword    2 times    wait until page contains element    ${S360_OP_SOFTWARE_RIBBONS_BODY} [${i}]
    END

S360_OP_Validate node contents
    S360_OP_Expand all ribbons
    #check node details time and name
    ${count}=       get element count   ${S360_OP_NODE_CONTENT}
    FOR    ${i}    IN RANGE   1    ${count}+1
        ${node_text}=   get text    ${S360_OP_NODE_CONTENT} [${i}]/strong
        @{node_text}=    split string   ${node_text}    ${SPACE}
        list should contain value    ${Status}    ${node_text}[1]
        ${node_time}=   get text    ${S360_OP_NODE_CONTENT_TIME} [${i}]
        should contain    ${node_time}    (s)
    END
    #check time stamp change
    reload page
    wait until keyword succeeds  3x  2s   wait until element is visible    ${S360_OP_DASHBOARD_OVERVIEW_TAB_CIRCLE}
    S360_OP_Open software tab
    wait until element is visible    ${S360_OP_NODE_CONTENT} [${count}]    timeout=30
    ${node_time_after_refresh}=      get text    ${S360_OP_NODE_CONTENT_TIME} [${count}]
    should not be equal as strings    ${node_time}    ${node_time_after_refresh}

360_OP_Validate nodes grouped by supported versions
    ${length_unsupported}=    get length    ${unsupported}
    ${length_supported}=      get length    ${supported}

    ### this part is different for QA and SVT environments (the ribbons are sorted in different order)

    ${is_unsupported_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [2]    Unsupported
    ${is_supported_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [3]    Supported
    ${usupported_ribbon_index}=    run keyword if    ${is_unsupported_ribbon}==True    set variable    2
    ...    ELSE    set variable    3
    ${supported_ribbon_index}=     run keyword if    ${is_supported_ribbon}==True    set variable    3
    ...    ELSE    set variable    2

    run keyword if    '${length_unsupported}'!='0'    element should contain    ${S360_TITLES} [${usupported_ribbon_index}]    (${length_unsupported})
    run keyword if    '${length_supported}'!='0'    element should contain    ${S360_TITLES} [${supported_ribbon_index}]    (${length_supported})
    run keyword if    '${length_supported}'!='0'    click element    ${S360_TITLES} [${supported_ribbon_index}]

    FOR     ${i}    IN RANGE   1    ${length_unsupported}+1
        ${text}=    get text    xpath:(${S360_OP_RIBBON_SOFTWARE_NODE_NAMES} [${usupported_ribbon_index}]//div[2]/strong) [${i}]
        @{text}=    split string   ${text}    ${SPACE}
        list should contain value    ${unsupported}    ${text}[0]
    END
    FOR     ${i}    IN RANGE   1    ${length_supported}+1
        ${text}=    get text    xpath:(${S360_OP_RIBBON_SOFTWARE_NODE_NAMES} [2]//div[2]/strong) [${i}]
        @{text}=    split string   ${text}    ${SPACE}
        list should contain value    ${supported}    ${text}[0]
    END

S360_OP_Validate nodes grouped by availabale maintenance
    ${length_not_on_updates}=    get length    ${not_current_on_updates}
    ${length_on_updates}=      get length    ${current_on_updates}

    ${is_on_updates_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [2]    Current
    ${is_not_on_updates_ribbon}=    run keyword and return status    element should contain    ${S360_TITLES} [3]    Maintenance
    ${on_updates_ribbon_index}=    run keyword if    ${is_on_updates_ribbon}==True    set variable    2
    ...    ELSE    set variable    3
    ${not_on_updates_ribbon_index}=     run keyword if    ${is_not_on_updates_ribbon}==True    set variable    3
    ...    ELSE    set variable    2

    element should contain    ${S360_TITLES} [${on_updates_ribbon_index}]    (${length_on_updates})
    element should contain    ${S360_TITLES} [${not_on_updates_ribbon_index}]    (${length_not_on_updates})
    click element    ${S360_TITLES} [${on_updates_ribbon_index}]

    FOR     ${i}    IN RANGE   1    ${length_not_on_updates}+1
        ${text}=    get text    xpath:(${S360_OP_RIBBON_SOFTWARE_NODE_NAMES} [${not_on_updates_ribbon_index}]//div[2]/strong) [${i}]
        @{text}=    split string   ${text}    ${SPACE}
        list should contain value    ${not_current_on_updates}    ${text}[0]
        ${image}=   get element attribute   xpath:(${S360_OP_RIBBON_SOFTWARE_IMAGES} [${not_on_updates_ribbon_index}]//img) [${i}]    src
        should contain   ${image}   StateIcons_Failed
    END
    FOR     ${i}    IN RANGE   1    ${length_on_updates}+1
        ${text}=    get text    xpath:(${S360_OP_RIBBON_SOFTWARE_NODE_NAMES} [${on_updates_ribbon_index}]//div[2]/strong) [${i}]
        @{text}=    split string   ${text}    ${SPACE}
        list should contain value    ${current_on_updates}    ${text}[0]
        ${image}=   get element attribute   xpath:(${S360_OP_RIBBON_SOFTWARE_IMAGES} [${on_updates_ribbon_index}]//img) [${i}]    src
        should contain   ${image}   StateIcons_ProcessCompleted
    END

S360_OP_Validate icw header
    [Arguments]    ${text}

    wait until element is visible    ${S360_OP_ICW_HEADER_TITLE}
    ${header_text}=     get text    ${S360_OP_ICW_HEADER_TITLE}
    element should be visible    ${S360_OP_ICW}
    element should be visible    ${S360_OP_ICW_HEADER_TITLE}
    should contain    ${header_text}    ${text}

S360_OP_Validate icw tabs
    element should be visible    ${S360_OP_ICW_OVERVIEW_TAB}
    ${overview_tab_text}=    get text    ${S360_OP_ICW_OVERVIEW_TAB}
    should be equal as strings  ${overview_tab_text}    Overview
    element should be visible    ${S360_OP_ICW_KB_UPDATES_TAB}
    ${kb_updates_tab_text}=    get text    ${S360_OP_ICW_KB_UPDATES_TAB}
    should be equal as strings  ${kb_updates_tab_text}    KB Updates

S360_OP_Validate icw overview tab content
    ${count}=       get element count    ${S360_TITLES}
    element should be visible    ${S360_OP_ICW_TABS_CONTENT}
    wait until element is visible  ${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img

    ${count_of_images}=    get element count    ${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img
    ${header_text}=     get text    ${S360_OP_ICW_HEADER_TITLE}//p

    &{dict}=    EXCEL_Get Server Data    ${header_text}    ${list_of_items_in_excel}
    ${CurrentDate}    Get Current Date    result_format=%Y-%m-%d

    FOR    ${i}    IN RANGE    1    ${count_of_images}+1
        wait until page contains element    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img) [${i}]
        element should be visible    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img) [${i}]
        ${image}=      wait until keyword succeeds    3x    1s    get element attribute    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img) [${i}]     src
        wait until page contains element   xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//div[2]) [${i}]
        element should be visible    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//div[2]) [${i}]
        ${component_name}=    wait until keyword succeeds    3x    1s    get text    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//div[${i}]/div[2])
        wait until page contains element    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//div[3]) [${i}]
        element should be visible    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]/div/div/div[${i}]/div[3])
        ${component_version}=    wait until keyword succeeds    3x    1s    get text    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]/div/div/div[${i}]/div[3])

        ${version}=   set variable    ${component_version}
        @{version}=    split string from right    ${version}   .    1
        ${version}=    set variable    ${version}[0].0

        &{item}=    run keyword if    '${dict["Type"]}'=='Advisor' or '${dict["Type"]}'=='Sentri'
        ...    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    Advisor/Sentri    ${version}
        ...    ELSE IF    '${dict["Type"]}'=='Cloud'    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    UniTrace    ${version}
        ...    ELSE IF    '${component_name}'=='Systech360 Agent'    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    ${dict["Type"]}     1.3.0
        ...    ELSE    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    ${dict["Type"]}     ${version}

        ${version}=   set variable    ${component_version}
        ${version}=    remove string    ${version}    .
        ${latest_version}=    run keyword and continue on failure    remove string    ${item["latestVersion"]}    .
        ${is_supported}=   run keyword and continue on failure    evaluate    ${latest_version}-${version}

        run keyword if    '${is_supported}' < '0' or '${is_supported}' == '0' or '${is_supported}' == 'None'    should contain   ${image}   StateIcons_ProcessCompleted
        ...    ELSE    should contain   ${image}   StateIcons_Failed
    END

    @{images_list}=    create list
    FOR    ${i}    IN RANGE    1    ${count_of_images}+1
        ${image}=      get element attribute    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img) [${i}]     src
        append to list    ${images_list}    ${image}
    END

    FOR    ${i}    IN RANGE    0    ${count_of_images}
        ${all_green}=    run keyword and return status    should not contain    ${images_list}[${i}]    StateIcons_Failed
        exit for loop if    ${all_green}==False
    END

    ${image}=        S360_OP_Get image source from selected node
    run keyword if    ${all_green}==True    should contain   ${image}   StateIcons_ProcessCompleted
    ...    ELSE    should contain   ${image}   StateIcons_Failed

S360_OP_Validate icw overview ribbon
    ${overview_ribon_text}=      get text    ${S360_OP_ICW_OVERVIEW_RIBBON} [1]
    should be equal as strings    ${overview_ribon_text}        Overview
    sleep    3s
     ### todo add locator
#    element should be visible    ${S360_OP_ICW_OVERVIEW_RIBBON_CONTENT}
    wait until element is visible    ${S360_OP_ICW_OVERVIEW_RIBBON} [2]
    click element    ${S360_OP_ICW_OVERVIEW_RIBBON} [2]
    wait until element is not visible    ${S360_OP_ICW_OVERVIEW_RIBBON_CONTENT}
    element should not be visible    ${S360_OP_ICW_OVERVIEW_RIBBON_CONTENT}
    click element    ${S360_OP_ICW_OVERVIEW_RIBBON} [2]


S360_OP_Validate icw kb updates tab content
    element should be visible    ${S360_OP_ICW_TABS_CONTENT}
    element should be visible    ${S360_OP_ICW_KB_UPDATES_TAB_TABLE_COLUMNS}
    ${count}=       get element count    ${S360_OP_ICW_KB_UPDATES_TAB_TABLE_COLUMNS}
    should be equal as numbers    ${count}     3
    wait until element is visible    ${SEC/S360_SEARCH_BTN}
    ${first_column_text}=   get text    ${S360_OP_ICW_KB_UPDATES_TAB_TABLE_COLUMNS} [1]
    ${second_column_text}=   get text    ${S360_OP_ICW_KB_UPDATES_TAB_TABLE_COLUMNS} [2]
    ${third_column_text}=   get text    ${S360_OP_ICW_KB_UPDATES_TAB_TABLE_COLUMNS} [3]
    should be equal    ${first_column_text}     Status
    should be equal    ${second_column_text}    ID
    should be equal    ${third_column_text}     Description

S360_OP_Validate icw expanding and retracting
    S360_OP_Click icw expand button
    wait until element is not visible    ${S360_OP_NODES_RIBBONS}
    element should not be visible    ${S360_OP_NODES_RIBBONS}
    S360_OP_Click icw retract button
    element should be visible    ${S360_OP_NODES_RIBBONS}

S360_OP_Validate icw closing
    S360_OP_Click icw close button
    element should not be visible    ${S360_OP_ICW}

S360_OP_Validate software tab alert icon
    element should be visible    ${S360_OP_SOFTWARE_TAB_ALERT_ICON}
    ${alert_text}=      get text    ${S360_OP_SOFTWARE_TAB_ALERT_ICON}
    ${not_up_to_date_nodes}=    get text    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO}
    should contain    ${not_up_to_date_nodes}       ${alert_text}

S360_OP_Generate number from versions
    [Documentation]    Convert Version Text (8.10.5) To Number (8,010,005) - 8  1,000,000 + 10  1,000 + 5 = 8,010,005
    [Arguments]    @{VersionText}    # 8.10.5
    @{lastNum}=     split string  ${VersionText}[2]     (
    ${VersionNumber}=    Evaluate    ${VersionText}[0]*1000000 + ${VersionText}[1]*1000 + ${lastNum}[0]
    [Return]    ${VersionNumber}    # 8010005

S360_OP_Validate version numbers and compare
    wait until element is visible    ${S360_OP_REFINE_BY_VERSION}
    ${size}=    get element count    ${S360_OP_REFINE_VERSIONS_LIST}
    @{numbers}=    create list
    FOR     ${i}    IN RANGE   1  ${size}
        ${text}=    get text    ${S360_OP_REFINE_VERSIONS_LIST} [${i} + 1]
        @{version}=    split string   ${text}    (
        ${version_number}=    strip string    ${version}[0]
        ${version_count}=    remove string    ${version}[1]    )
        log    ${versions_list}
        log     ${versions_list["${version_number}"]}
        should be equal as numbers    ${versions_list["${version_number}"]}    ${version_count}
        @{splitedText}=    split string    ${text}    .
        ${count}=   get length    ${splitedText}
        should be equal   '${count}'    '3'
        ${num}=    S360_OP_Generate number from versions    @{splitedText}
        append to list    ${numbers}    ${num}
    END
    ${size}=   get length    ${numbers}
    FOR     ${i}    IN RANGE  0  ${size} - 1
        should be true    ${numbers} [${i}] > ${numbers} [${i}+1]
    END

S360_OP_Check all versions
    ${size}=    get element count    ${S360_OP_REFINE_VERSIONS_LIST}
    FOR     ${i}    IN RANGE   1  ${size}
        click element    ${S360_OP_REFINE_VERSIONS_LIST} [${i} + 1]
    END

S360_OP_Get versions from refined by
    @{versions}=    create list
    ${count}=   get element count    ${S360_OP_REFINE_VERSIONS_LIST}
    FOR    ${i}    IN RANGE    2    ${count}+1
        ${word}=    get text    ${S360_OP_REFINE_VERSIONS_LIST} [${i}]
        @{items}=    split string    ${word}   (
        ${finalWord}=    strip string    ${items}[0]
        append to list    ${versions}    ${finalWord}
    END
    [Return]    @{versions}

S360_OP_Get disabled versions from refined by
    @{versions}=    create list
    ${count}=   get element count    ${S360_DISABLED_CHECKBOXES}
    FOR    ${i}    IN RANGE    2    ${count}+1
        ${word}=    get text    ${S360_DISABLED_CHECKBOXES} [${i}]
        @{items}=    split string    ${word}   (
        ${finalWord}=    strip string    ${items}[0]
        append to list    ${versions}    ${finalWord}
    END
    [Return]    @{versions}

S360_OP_Get checked versions from refined by
    @{versions}=    create list
    ${count}=   get element count    ${S360_CHECKED_VERSIONS}
    FOR    ${i}    IN RANGE    2    ${count}+1
        ${word}=    get text    ${S360_CHECKED_VERSIONS} [${i}]
        @{items}=    split string    ${word}   (
        ${finalWord}=    strip string    ${items}[0]
        append to list    ${versions}    ${finalWord}
    END
    [Return]    @{versions}

S360_OP_Get versions from ribbon
    @{titles}=  create list
    ${count}=   get element count    ${S360_TITLES}
    FOR    ${i}    IN RANGE    2    ${count}+1
        ${word}=    get text    ${S360_TITLES} [${i}]
        @{items}=    split string    ${word}   -
        append to list    ${titles}    ${items}[0]
    END
    @{titles}=      remove duplicates  ${titles}
    [Return]    @{titles}

S360_OP_Get first image source from icw overview node
    ${count}=       get element count    ${S360_TITLES}
    ${image}=      get element attribute    ${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img     src
    [Return]       ${image}

S360_OP_Get image source from software tab ribbons
    [Arguments]    ${index}
    ${image}=     get element attribute    ${S360_TITLES_EXPANDED_CONTENT} [${index}]//img     src
    [Return]       ${image}

S360_OP_Get image source from selected node
    ${image}=     get element attribute        ${S360_OP_SELECTED_NODE}//img     src
    [Return]       ${image}

S360_OP_Set default view
    [Documentation]    Sets a scene as default from navigator menu

    [Arguments]  ${DefaultViewName}

    S360_OP_Search for view      ${DefaultViewName}
    ${NumberOfViews}=  Get Element Count  ${S360_VIEW_CARD_NAME}
    FOR   ${Index}  IN RANGE  1  ${NumberOfViews}+1
        ${ViewName}=  Get Text  ${S360_VIEW_CARD_NAME} [${Index}]
        Run Keyword If  '${ViewName}'=='${DefaultViewName}'    Run Keywords     mouse over    ${SEC/S360_CARD_OPTION_MENU} [${Index}]
        ...  AND  Wait Until Element Is Visible  ${S360_OP_DEFAULT_MENU_ICON}  timeout=20
        ...  AND  Click Element  ${S360_OP_DEFAULT_MENU_ICON} [${Index}]
        ...  AND  Wait Until Element Is Visible  ${S360_OP_BOOKMARK_ICON}   timeout=20    #maybe not needed
    END

S360_OP_Go To Dashboard Software Tab And Set Default If Not Set
    [Documentation]    Navigates to dashboard and checks if the requested view is not the default,
                       ...  makes it default and navigate to software tab
    [Arguments]    ${view_name}

    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${SEC/S360_WELCOME_LINK}
    repeat keyword    2 times    Click Element  ${SEC/S360_WELCOME_LINK}
    wait until keyword succeeds  3x  2s  Wait Until Element Is Visible  ${S360_OP_MY_VIEWS_CARD}    timeout=20s

    S360_OP_Click on dashboard
    wait until element is visible    ${S360_OP_DASHBOARD_DEFAULT_SCENE_TEXT}
    ${is_Already_set}=    run keyword and return status    element should contain    ${S360_OP_DASHBOARD_DEFAULT_SCENE_TEXT}    ${view_name}
    run keyword if    ${is_Already_set}==False    run keywords    S360_OP_Navigate To View Scene
                        ...    AND    S360_OP_Set default view    ${view_name}
                        ...    AND    S360_OP_Click on dashboard
                        ...    AND    wait until element is visible   ${S360_OP_DASHBOARD_OVERVIEW_TAB_CIRCLE}
    S360_OP_Open software tab

Increment value in dictionary
    [Arguments]    ${dict}    ${key}    ${value}
    ${j}=    evaluate    ${value} + 1
    set to dictionary    ${dict}    ${key}   ${j}

S360_OP_Get node names
    ${count}=   get element count    ${S360_OP_SOFTWARE_NODE_NAMES}
    @{titles}=    create list
    FOR    ${i}    IN RANGE    1    ${count}+1
        ${name}=    get element attribute    ${S360_OP_SOFTWARE_NODE_NAMES} [${i}]    title
        append to list    ${titles}    ${name}
    END

    [Return]    @{titles}

S360_OP_Validate inputs are enabled
    ${supported_versions_count}=       get length    ${supported}
    ${unsupported_versions_count}=     get length    ${unsupported}
    ${curent_on_updates_count}=        get length    ${current_on_updates}
    ${not_curent_on_updates_count}=    get length    ${not_current_on_updates}
    run keyword if    '${supported_versions_count}'!='0'    element should be enabled    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES}_input
    run keyword if    '${unsupported_versions_count}'!='0'    element should be enabled    ${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO}_input
    run keyword if    '${curent_on_updates_count}'!='0'    element should be enabled    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES}_input
    run keyword if    '${not_curent_on_updates_count}'!='0'    element should be enabled    ${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO}_input
    element should be enabled    ${S360_OP_REFINE_NODE_LINES}
    element should be enabled    ${S360_OP_REFINE_NODE_SITE_SERVERS}
    element should be enabled    ${S360_OP_REFINE_NODE_UNITRACE}

Get List of Data
    ${is_already_set}=    run keyword and return status    variable should exist    ${list_of_items_in_json}
     return from keyword if   ${is_already_set}==True

    @{node_lines}=                              create list
    @{node_site_servers}=                       create list
    @{node_unitrace}=                           create list
    @{current_on_updates}=                      create list
    @{not_current_on_updates}=                  create list
    @{supported}=                               create list
    @{unsupported}=                             create list
    @{list_of_items_in_json}=                   create list
    @{list_of_items_in_excel}=                  create list
    @{list_of_items_in_excel_release_notes}=    create list
    &{versions_list}=                           create dictionary

    ${CurrentDate}    Get Current Date    result_format=%Y-%m-%d

    ###    create the List of Items from the Release Mapping JSON file
    @{list_of_items_in_json}=     JSON_Get List of Items    ${ReleaseMappingFile}

    ###    create the List of Items from the Manually managed Excel file
    ${environment_url}=    Get Location
    ${is_svt}=    run keyword and return status    should contain    ${environment_url}    ${SPH_SVT_URL}
    ${is_qa}=     run keyword and return status    should contain    ${environment_url}    ${SPH_QA_URL}
    run keyword if      ${is_svt}==True            Open Excel Document    ${NodesInfoFileSVT}    docid
    ...    ELSE IF      ${is_qa}==True             Open Excel Document    ${NodesInfoFileQA}    docid

    @{row}=             Read Excel Row       1    sheet_name=Nodes
    @{column}=          Read Excel Column    1    sheet_name=Nodes
    ${row_count}=       Get length    ${column}
    ${column_count}=    Get length    ${row}

    FOR    ${row_index}    IN RANGE    2    ${row_count}+1
        &{dict}=     EXCEL_Process a Row of a Sheet    Nodes    ${row_index}     ${column_count}
        append to list    ${list_of_items_in_excel}   ${dict}
    END

    @{row}=       Read Excel Row       1    sheet_name=Release_Notes
    @{column}=    Read Excel Column    1    sheet_name=Release_Notes
    ${row_count}=       Get length    ${column}
    ${column_count}=    Get length    ${row}

    FOR    ${row_index}    IN RANGE    2    ${row_count}+1
        &{dict}=     EXCEL_Process a Row of a Sheet    Release_Notes    ${row_index}     ${column_count}
        append to list    ${list_of_items_in_excel_release_notes}   ${dict}
    END
    Close All Excel Documents

    ##################################################################################################################
    ###    collect all the neccessary data about the nodes that are currently included in the "The Corporation" view
    ##################################################################################################################

    ###    collect the "Current on Updates" data
    ${count}=       get element count    ${S360_OP_NODE_CONTENT}
    SEC/S360_Scroll Page To Location  0  2000
    S360_OP_Expand all ribbons
    FOR     ${i}    IN RANGE    1    ${count}+1
        click element    ${S360_OP_NODE_CONTENT} [${i}]
#        wait until element is visible     ${S360_OP_NODE_CONTENT} [${i}]
#        clear element text      ${S360_OP_NODE_CONTENT} [${i}]
        sleep   0.5s    #cannot be replaced with wait at the moment, because of animations
        ${selected_node_name}=    get element attribute    ${S360_OP_SELECTED_NODE}//strong    title
        wait until element contains    ${S360_OP_ICW_HEADER_TITLE}    ${selected_node_name}
        ${on_update}=    S360_OP_Verify If Node Is On Update    ${selected_node_name}    ${list_of_items_in_excel}    ${list_of_items_in_json}
        run keyword if    ${on_update}==True    append to list    ${current_on_updates}    ${selected_node_name}
        ...    ELSE    append to list    ${not_current_on_updates}    ${selected_node_name}
    END

    ${count}=   get element count    ${S360_OP_SOFTWARE_NODE_NAMES}
    FOR    ${i}    IN RANGE    1    ${count}+1

        ### get information about each node from excel
        ${name}=    get element attribute    ${S360_OP_SOFTWARE_NODE_NAMES} [${i}]    title
        &{dict}=    EXCEL_Get server data    ${name}    ${list_of_items_in_excel}

        ### get versions list
        ${already_present}=    run keyword and return status    dictionary should contain key    ${versions_list}    ${dict["Version Number"]}
        run keyword if   ${already_present}==False   set to dictionary   ${versions_list}    ${dict["Version Number"]}    1
        ...    ELSE    Increment value in dictionary    ${versions_list}    ${dict["Version Number"]}    ${versions_list["${dict["Version Number"]}"]}

        ${version}=    set variable    ${dict["Version Number"]}
        @{version}=    split string from right    ${version}   .    1
        ${version}=    set variable    ${version}[0].0

        &{item}=    run keyword if    '${dict["Type"]}'=='Advisor' or '${dict["Type"]}'=='Sentri'
        ...    JSON_Get an Item from the List    ${list_of_items_in_json}    Software Version    Advisor/Sentri    ${version}
        ...    ELSE IF    '${dict["Type"]}'=='Cloud'    JSON_Get an Item from the List    ${list_of_items_in_json}    Software Version    UniTrace    ${version}
        ...    ELSE    JSON_Get an Item from the List    ${list_of_items_in_json}    Software Version    ${dict["Type"]}     ${version}

        ${is_supported}=    run keyword and continue on failure      Subtract Date From Date     ${item["endOfExtendedSupport"]}    ${CurrentDate}

#        ### TODO remove this part when data is added in JSON for '9.0.0' 'Software version'    QA Environment only
#        run keyword if    '${name}' == 'EDSPHADV05-02'    run keywords    append to list    ${supported}    ${name}
#        ...     AND    append to list    ${node_lines}    ${name}
#        ...     AND    continue for loop

        ### get supported nodes list
        run keyword if    '${is_supported}' < '0'    append to list    ${unsupported}    ${name}
        ...    ELSE    append to list    ${supported}    ${name}

        ### get refined by nodes list
        run keyword if    '${dict["Type"]}'=='Advisor' or '${dict["Type"]}'=='Sentri'  append to list    ${node_lines}    ${name}
        ...    ELSE IF    '${dict["Type"]}'=='Cloud'    append to list    ${node_unitrace}    ${name}
        ...    ELSE    append to list    ${node_site_servers}    ${name}
    END

    set global variable    @{node_lines}
    set global variable    @{node_site_servers}
    set global variable    @{node_unitrace}
    set global variable    @{current_on_updates}
    set global variable    @{not_current_on_updates}
    set global variable    @{supported}
    set global variable    @{unsupported}
    set global variable    @{list_of_items_in_json}
    set global variable    @{list_of_items_in_excel}
    set global variable    @{list_of_items_in_excel_release_notes}
    set global variable    &{versions_list}

    #reload the page to start clean test
    reload page
    S360_OP_Open software tab

S360_OP_Verify If Node Is On Update
    [Arguments]    ${selected_node_name}    ${list_of_items_in_excel}    ${list_of_items_in_json}

    ${count}=       get element count    ${S360_TITLES}
    log     ${S360_TITLES} [2]
    log     ${count}
    wait until page contains element    ${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img
    ${count_of_images}=    get element count    ${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img
    repeat keyword    3 times    wait until element is visible    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//img) [${count_of_images}]
    repeat keyword    3 times    wait until element is visible    xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//div[3]) [${count_of_images}]
    &{dict}=    EXCEL_Get Server Data    ${selected_node_name}    ${list_of_items_in_excel}

    @{red_images}=    create list

    FOR    ${i}    IN RANGE    1    ${count_of_images}+1
        wait until page contains element        xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//div[2]) [${i}]
        ${component_name}=    get text          xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]//div[${i}]/div[2])
        wait until page contains element        xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]/div/div/div[${i}]/div[3])
        ${component_version}=    get text       xpath:(${S360_OP_SOFTWARE_RIBBONS_BODY} [${count}]/div/div/div[${i}]/div[3])
        ${version}=    set variable       ${component_version}
        ${version}=    run keyword if    '${component_name}'!='Web Services'    split string from right    ${version}   .    1
        ${version}=    run keyword if    '${component_name}'!='Web Services'    set variable    ${version}[0].0
        ...    ELSE    set variable       ${component_version}
        &{item}=    run keyword if    '${dict["Type"]}'=='Advisor' or '${dict["Type"]}'=='Sentri'
        ...    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    Advisor/Sentri    ${version}
        ...    ELSE IF    '${dict["Type"]}'=='Cloud'    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    UniTrace    ${version}
        ...    ELSE IF    '${component_name}'=='Systech360 Agent'    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    ${dict["Type"]}  ${version}
        ...    ELSE    JSON_Get an Item from the List    ${list_of_items_in_json}    ${component_name}    ${dict["Type"]}     ${version}

        ${version}=   set variable    ${component_version}
        ${version}=    remove string    ${version}    .
        ${latest_version}=    run keyword and continue on failure    remove string    ${item["latestVersion"]}    .
        ${is_supported}=   run keyword and continue on failure    evaluate    ${latest_version}-${version}

        #Todo change when JSON data is updated
        ${is_on_latest_version}=    run keyword and return status    should be true    '${is_supported}'=='0' or '${is_supported}'=='None' or '${is_supported}'<'0'
        exit for loop if    ${is_on_latest_version} == False

    END

    [Return]    ${is_on_latest_version}


S360_OP_Get not release nodes
    wait until element is visible    ${S360_OP_SOFTWARE_ARIA_EXPENDED}
    ${not_expended_text}=    get text    ${S360_OP_SOFTWARE_ARIA_EXPENDED}
    ${not_expended_text}=    fetch from left   ${not_expended_text}    ${slicer}
    ${not_expended_text}=    strip string    ${not_expended_text}



   [Return]      ${not_expended_text}

