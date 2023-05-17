#------------------------------------------------------------------
#   Description       :      Test Cases Information Center
#   Project           :      UniSphere Operator Automation
#   Author            :      Dinesh Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation  Necessary Libraries and Resources file are mentioned below
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime
Variables       ../Variables/${TESTENV}_Variable.py
Library         SeleniumLibrary  timeout=${Selenium_Timeout}
Library         ExcelLibrary
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Designer_Locators.robot
Resource        ../Locators/Operator_Locators.robot
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/Operator_Software_Locators.robot
Resource        ../Keywords/Operator_Software_Keywords.robot
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Test_Data_Fetching_Keywords.robot


*** Keywords ***
Create And Publish Two Scenes In Designer
    [Documentation]  Creates and publishes a scene in designer
    ${trash_number}=    get text    ${SEC/S360_TRASHCAN_COUNT}
    ${trash_number}=    fetch number    ${trash_number}
    run keyword if    ${trash_number} > 0        SEC/S360_Empty Trash
    Set Global Variable  ${SceneTempName1}    ${TestSceneOp1}
    Set Global Variable  ${SceneTempName2}    ${TestSceneOp2}
    sleep    1s
    SEC/S360_Pin/Unpin Navigator Menu    Pin
    S360_DSG_Navigate To Navigator Items  ${S360_SCENE_ITEM}
    S360_DSG_Navigate To Add New Scene From Scene
    S360_DSG_Create And Publish A Scene In Designer  ${SceneTempName1}  ${SceneDesc1}
    S360_DSG_Create And Publish A Scene In Designer Using Existing Subordinates  ${SceneTempName2}  ${SceneDesc1}







Get List Of Data From Nodes Tab

    ${is_already_set}=    run keyword and return status    variable should exist    ${list_of_items_in_json}
    return from keyword if    ${is_already_set}==True

    @{node_lines}=    create list
    @{node_site_servers}=    create list
    @{node_unitrace}=    create list
    @{critical_nodes}=    create list
    @{normal_nodes}=    create list
    @{warning_nodes}=    create list
    @{active_nodes}=    create list
    @{available_nodes}=    create list
    @{offline_nodes}=    create list

    ###    get the json list
    @{list_of_items_in_json}=     JSON_Get List of Items    ${ReleaseMappingFile}

    ### get the data from excel

    # check the environment
    ${environment_url}=    Get Location
    ${is_svt}=    run keyword and return status    should contain    ${environment_url}    ${SPH_SVT_URL}
    ${is_qa}=     run keyword and return status    should contain    ${environment_url}    ${SPH_QA_URL}
    run keyword if      ${is_svt}==True            Open Excel Document    ${NodesInfoFileSVT}    docid
    ...    ELSE IF      ${is_qa}==True             Open Excel Document    ${NodesInfoFileQA}    docid

    @{SHEETS}=    Get List Sheet Names

    @{row}=       Read Excel Row       1
    @{column}=    Read Excel Column    1
    ${row_count}=       Get length    ${column}
    ${column_count}=    Get length    ${row}

    ### get all neccessary data about the nodes that are currently in the corporation view
    ${list_of_items_in_excel_nodes_sheet}=    create list
    ${count}=   get element count    ${S360_NODE_NAMES}
    FOR    ${i}    IN RANGE    1    ${count}+1
        ${name}=    get element attribute    ${S360_NODE_NAMES} [${i}]    title
        @{list}=    EXCEL_Get Data From All Sheets    @{SHEETS}    server_name=${name}

        &{dict}=    set variable    ${list}[0]
        append to list    ${list_of_items_in_excel_nodes_sheet}   ${dict}

        ### get refined by nodes list
        run keyword if    '${dict["Type"]}'=='Advisor' or '${dict["Type"]}'=='Sentri'  append to list    ${node_lines}    ${name}
        ...    ELSE IF    '${dict["Type"]}'=='Cloud'    append to list    ${node_unitrace}    ${name}
        ...    ELSE    append to list    ${node_site_servers}    ${name}

        ### get refined by escalation list
        run keyword if    '${dict["Heartbeat State"]}'=='CRITICAL'  append to list    ${critical_nodes}    ${name}
        ...    ELSE IF    '${dict["Heartbeat State"]}'=='WARNING'    append to list    ${warning_nodes}    ${name}
        ...    ELSE    append to list    ${normal_nodes}    ${name}

        ### get refined by status list
        run keyword if    '${dict["Heartbeat Status"]}'=='Available'  append to list    ${available_nodes}    ${name}
        ...    ELSE IF    '${dict["Heartbeat Status"]}'=='Offline'    append to list    ${offline_nodes}    ${name}
        ...    ELSE    append to list    ${active_nodes}    ${name}
    END

    close all excel documents

    set global variable    @{node_lines}
    set global variable    @{node_site_servers}
    set global variable    @{node_unitrace}
    set global variable    @{list_of_items_in_json}
    set global variable    @{list_of_items_in_excel_nodes_sheet}
    set global variable    @{offline_nodes}
    set global variable    @{available_nodes}
    set global variable    @{active_nodes}
    set global variable    @{warning_nodes}
    set global variable    @{normal_nodes}
    set global variable    @{critical_nodes}

    #reload the page to start clean test
    reload page
    Wait Until Element is visible   ${S360_NODE_TAB}
    Click Element  ${S360_NODE_TAB}


S360_OP_Search In Published Scene
    [Documentation]  Search in published scene
    [Arguments]   ${NameOfScene}

#    Run Keyword And Ignore Error   SEC/S360_Clear Text Field  ${S360_PUB_SEARCH_BOX}

    # Enter scene name in search box

    wait until keyword succeeds  5x  2s  input text    ${S360_PUB_SEARCH_BOX}    ${NameOfScene}    TRUE
    sleep    1s
    Press Keys    ${S360_PUB_SEARCH_BOX}    RETURN

    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_PUB_CARD_NAME} [1]
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_PUB_CARD_NAME} [1]

    FOR    ${Index}  IN RANGE  1  10
        Wait Until Element Is Visible  ${S360_PUB_CARD_NAME} [1]
        ${name}=  Get Text  ${S360_PUB_CARD_NAME} [1]
        ${Status}=  Run Keyword And Return Status  Should Contain  ${name}  ${NameOfScene}
        Exit For Loop If  '${Status}'=='${TRUE}'
        Sleep  2S
    END

    # Verifies the card name
    ${CardName}=  Get Text  ${S360_PUB_CARD_NAME} [1]
    Run Keyword If  '${CardName}'!='${NameOfScene}'  Fail

S360_OP_Search In Approved Scene
    [Documentation]  Search in approved scene

    [Arguments]   ${NameOfScene}

    SEC/S360_Scroll Page To Location  0  0

    Run Keyword And Ignore Error   SEC/S360_Clear Text Field  ${S360_APPR_SEARCH_BOX}

    # Enter scene name in search text box
    wait until keyword succeeds  5x  2s  input text    ${S360_APPR_SEARCH_BOX}         ${NameOfScene}    TRUE
    sleep    1s
    CLICK ELEMENT    ${S360_APPR_SEARCH_BUTTON}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_APP_CARD_NAME_APPR} [1]
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_APP_CARD_NAME_APPR} [1]
    ${Total_Element_Count}=  Get Element Count   ${S360_NEW_PUB_CARD_NAME}
    FOR    ${Index}  IN RANGE   0  ${Total_Element_Count- 1}
        Wait Until Element Is Visible    //*[@id="PublishedScene_itemName_${Index}"]
        ${name}=  Get Text  //*[@id="PublishedScene_itemName_${Index}"]
        ${Status}=  Run Keyword And Return Status  Should Contain  ${name}  ${NameOfScene}
        Exit For Loop If  '${Status}'=='${TRUE}'
        Sleep  2S
    END

    # Verifies the card name
    ${CardName}=   get webelements    ${S360_APP_CARD_FIRST_APPR_NAME}
    ${CardName}=    get text     ${CardName}
    Should Contain  '${CardName}'  '${NameOfScene}'

S360_OP_Search View In Operator
    [Documentation]  Search a card in view page
    [Arguments]   ${ViewName}
#    get text    ${S360_VIEW_CARD_FIRST_NAME}
    Run Keyword And Ignore Error   SEC/S360_Clear Text Field  ${SEC/S360_SEARCH_BOX}
    # Enter scene name in search text box
    wait until keyword succeeds  5x  2s  input text    ${SEC/S360_SEARCH_BOX}    ${ViewName}
    click element    ${SEC/S360_SEARCH_BTN}

    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_VIEW_CARD_NAME} [1]  timeout=3
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME} [1]  timeout=10
    FOR  ${Index}  IN RANGE  1  10
        Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME} [1]
        ${name}=  Get Text  ${S360_VIEW_CARD_NAME} [1]
        ${Status}=  Run Keyword And Return Status  Should Contain  ${name}  ${ViewName}
        Exit For Loop If  '${Status}'=='${TRUE}'
        Sleep  2S
    END
    # Verifies the card name
    ${CardName}=  Get Text  ${S360_VIEW_CARD_NAME} [1]
    Run Keyword If  '${CardName}'!='${ViewName}'  Fail

S360_OP_Search View In Operator List View
    [Documentation]  Search a card in view page
    [Arguments]   ${ViewName}
    Sleep  2s
    Run Keyword And Ignore Error   SEC/S360_Clear Text Field  ${SEC/S360_SEARCH_BOX}
    # Enter scene name in search text box
    wait until keyword succeeds  5x  2s  Press Keys  ${SEC/S360_SEARCH_BOX}    ${ViewName}
    Press Keys    ${SEC/S360_SEARCH_BOX}    RETURN
    #input text  ${SEC/S360_SEARCH_BOX}  ${ViewName}
    #click element  //button[@id='searchBtn']
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_VIEW_CARD_NAME} [1]  timeout=10
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME} [1]  timeout=10
    FOR    ${Index}  IN RANGE  1  10
        Wait Until Element Is Visible  ${S360_OP_LIST_VIEW_NAMES} [1]
        ${name}=  Get Text  ${S360_OP_LIST_VIEW_NAMES} [1]
        ${Status}=  Run Keyword And Return Status  Should Contain  ${name}  ${ViewName}
        Exit For Loop If  '${Status}'=='${TRUE}'
        Sleep  2S
    END
    # Verifies the card name
    ${CardName}=  Get Text  ${S360_OP_LIST_VIEW_NAMES} [1]
    Run Keyword If  '${CardName}'!='${ViewName}'  Fail

S360_OP_Navigate To Published Scene
    [Documentation]  Navigates to published scene

    SEC/S360_Scroll Page To Location  0  0
    Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_WELCOME_LINK}
    ${Status}=  Run Keyword And Return Status  click Element  ${S360_OP_MANAGE_SCENES_CARD}
    Run Keyword If  '${Status}'=='${False}'  Run Keywords   Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_WELCOME_LINK}
    ...  AND  Wait Until Element Is Visible  ${S360_OP_MANAGE_SCENES_CARD}
    ...  AND  Click Element  ${S360_OP_MANAGE_SCENES_CARD}
#    Wait Until Keyword Succeeds  10S  2S  Wait Until Element Is Visible    ${S360_PUB_CARD_ID}

S360_OP_Navigate To View Scene
    [Documentation]  Navigates to view scene page

#    SEC/S360_Scroll Page To Location  0  0
#    set selenium speed  2s
#    wait until keyword succeeds  3x  2s  Click Element  ${SEC/S360_WELCOME_LINK}
#    wait until keyword succeeds  3x  2s  Wait Until Element Is Visible  ${S360_OP_MY_VIEWS_CARD}    timeout=30s
#    Click Element  ${S360_OP_MY_VIEWS_CARD}
#    set selenium speed    0s
#    Wait Until Element Is Visible  ${S360_ADD_NEW_SCENE}  timeout=20
#    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME} [1]  timeout=5

    SEC/S360_Scroll Page To Location  0  0
    wait until keyword succeeds  3x  2s  Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}
    #repeat keyword    2 times    Click Element  ${SEC/S360_WELCOME_LINK}
    Click Element  ${SEC/S360_WELCOME_LINK}
    wait until keyword succeeds  3x  5s  Wait Until Element Is Visible  ${S360_OP_MY_VIEWS_CARD}
    Click Element  ${S360_OP_MY_VIEWS_CARD}
    Wait Until Element Is Visible  ${S360_ADD_NEW_SCENE}    timeout=20s
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME} [1]  timeout=5
    repeat keyword    6 times    S360_OP_Validate graphs on view cards

#################################### Approve, Reject, Retract Scenens ################
S360_OP_Reject Scene From Published Scene
    [Documentation]  Rejecting a scene from published scene

    [Arguments]   ${SceneName}

    S360_OP_Search In Published Scene  ${SceneName}

    # Click Element   ${SEC/S360_PublishedScene}
    Click Element  ${S360_REJECT_BUTTON}
    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20
    SEC/S360_Verify Success Message  ${RejectSuccMsgID}

    # Verifies Scene is not vsible in published scene after rejecting
    Element Should Not Be Visible  ${S360_PUB_REJECTED_CARD_NAME}  [1]

S360_OP_Approve Scene From Published Scene
    [Documentation]  Approving a scene from published scene

    [Arguments]   ${NameOfScene}

    S360_OP_Search In Published Scene  ${NameOfScene}

    # Click on Approve button
    Click Element  ${S360_APPROVE_BUTTON}

    ${PopupStatus}=  Run Keyword And Return Status    wait until element is visible    ${SEC/S360_POPUP_YES_BTN}    timeout=3
    Run Keyword If  '${PopupStatus}'=='${TRUE}'  Click Element  ${SEC/S360_POPUP_YES_BTN}

    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20

    SEC/S360_Verify Success Message  ${ApproveSuccMsgID}

    # Verifies Scene is not vsible in published scene after approving
#    Change after changing locator
#    Element Should Not Be Visible  ${S360_PUB_CARD_NAME} [0]

S360_OP_Retract Scene From Approved Scene
    [Documentation]  Retract a scene from Approved scene

    [Arguments]   ${NameOfScene}

    # Search for the card in approved scene
    S360_OP_Search In Approved Scene  ${NameOfScene}

    # Click on retract button
    wait until element is visible  ${S360_RETRACT_BUTTON}  timeout=20
    scroll element into view  ${S360_RETRACT_BUTTON}
    Click Element  ${S360_RETRACT_BUTTON}

    ${PopupStatus}=  Run Keyword And Return Status    wait until element is visible    ${SEC/S360_POPUP_YES_BTN}    timeout=3
    Run Keyword If  '${PopupStatus}'=='${TRUE}'  Click Element  ${SEC/S360_POPUP_YES_BTN}

    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20

    SEC/S360_Verify Success Message  ${RetractSuccMsgID}

    # Verifies Scene is not vsible in Approved scene after retracting
    Element Should Not Be Visible  ${SEC_OP_TEMP_SCENE_1}

    Click Element  ${S360_OP_NAV_DASHBOARD_BTN}
    Wait Until Element Is Visible  ${S360_DEFAULT_VIEW_NAME}  timeout=20

    ${DefaultViewName}=  Get Text  ${S360_DEFAULT_VIEW_NAME}
    Should Not Contain  ${DefaultViewName}  ${NameOfScene}

##################################### View ##########################################

S360_OP_Create A view without saving
    [Documentation]  Creates a new view
    [Arguments]  ${ViewName}  ${ViewDesc1}
    S360_OP_Navigate To View Scene
    # Clicks on add button
    Click Element   ${S360_ADD_NEW_SCENE}
    SEC/S360_Clear Text Field  ${SEC/S360_NAME_TXT}
    Input Text  ${SEC/S360_NAME_TXT}  ${ViewName}
    SEC/S360_Clear Text Field  ${SEC/S360_DESC_TXT}
    Input Text  ${SEC/S360_DESC_TXT}  ${ViewDesc1}
    sleep    4s
#    ${SceneStatus}=  Convert To Lower Case  ${ExpectedSceneYes/NO}
#    Run keyword If  "${SceneStatus}"== "yes"  Run Keywords  Click Element  ${S360_OP_MY_VIEW_SCENE_LIST}
#    ...  AND  wait until element is visible    ${S360_OP_MY_VIEW_SCENE_LIST}
##    ...  AND  Select From List By Label  ${S360_OP_MY_VIEW_SCENE_LIST}   ${ViewName}
#    ...  AND  Select From List By Label  ${S360_OP_MY_VIEW_SCENE_LIST}   ${OprSceneName}
    #changes by Akash
    #Click Element      id=close-all-button
    Click Element      id=form_closeBtn
    SEC/S360_Save Changes Without CLosing Message


S360_OP_Verify TestView Doest Exist
    [Documentation]  Creates a new view
     S360_OP_Navigate To View Scene
    wait until keyword succeeds  5x  2s  Press Keys  ${SEC/S360_SEARCH_BOX}   ${TestViewName}
    Press Keys    ${SEC/S360_SEARCH_BOX}    RETURN







S360_OP_Create A view
    [Documentation]  Creates a new view
    [Arguments]  ${ViewName}  ${ViewDesc1}  ${ExpectedSceneYes/NO}
    S360_OP_Navigate To View Scene
    # Clicks on add button
       # wait until keyword succeeds  3x  2s  Wait Until Element Is Visible  ${S360_OP_MY_VIEWS_CARD}
    #Click Element  ${S360_OP_MY_VIEWS_CARD} sneha s
    Wait Until Element Is Visible  ${S360_ADD_NEW_SCENE}    timeout=20s
    Click Element   ${S360_ADD_NEW_SCENE}
#    SEC/S360_Clear Text Field  ${SEC/S360_NAME_TXT}
    Input Text  ${SEC/S360_NAME_TXT}  ${ViewName}    TRUE
#    SEC/S360_Clear Text Field  ${SEC/S360_DESC_TXT}

    Input Text  ${SEC/S360_DESC_TXT}  ${ViewDesc1}    TRUE

    sleep    4s
#    ${SceneStatus}=  Convert To Lower Case  ${ExpectedSceneYes/NO}
#    Run keyword If    "${SceneStatus}" == "yes"    Run Keywords    Click Element  ${S360_OP_MY_VIEW_SCENE_LIST}
#    ...    AND    wait until element is visible    ${S360_OP_MY_VIEW_SCENE_LIST}
##    ...    AND    Select From List By Label  ${S360_OP_MY_VIEW_SCENE_LIST}   ${ViewName}
#    ...    AND    Select From List By Label  ${S360_OP_MY_VIEW_SCENE_LIST}   ${OprSceneName}
#    ...    AND    sleep    10s OprSceneName
#    # Save changes
    #Click Element      id=close-all-button
    SEC/S360_Save Changes Without CLosing Message





S360_OP_verify a view
    [Documentation]  Creates a new view
    [Arguments]  ${ViewName}  ${SceneDesc1}
    S360_OP_Navigate To View Scene
    # Clicks on add button
    Click Element   ${S360_ADD_NEW_SCENE}
    SEC/S360_Clear Text Field  ${SEC/S360_NAME_TXT}
    Input Text  ${SEC/S360_DESC_TXT}  ${SceneDesc1}
    ${Enable_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_DIRTY_FLAG}
    Run Keyword If  '${Enable_Status}'=='${TRUE}'  click element  ${SEC/S360_FLOAT_OPTN_BTN}
    Wait Until Element is Visible  ${SEC/S360_FLOAT_SAVE_BTN}  timeout=10
    Element Should Be Disabled  ${SEC/S360_FLOAT_SAVE_BTN}
    Input Text  ${SEC/S360_NAME_TXT}  ${ViewName}${SPACE}
    ${Enable_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_DIRTY_FLAG}
    Run Keyword If  '${Enable_Status}'=='${TRUE}'  click element  ${SEC/S360_FLOAT_OPTN_BTN}
    Wait Until Element is Visible  ${SEC/S360_FLOAT_SAVE_BTN}  timeout=10
    Element Should Be Disabled  ${SEC/S360_FLOAT_SAVE_BTN}
    SEC/S360_Clear Text Field  ${SEC/S360_NAME_TXT}
    Input Text  ${SEC/S360_NAME_TXT}  ${ViewName}
    SEC/S360_Clear Text Field  ${SEC/S360_DESC_TXT}
    Input Text  ${SEC/S360_DESC_TXT}  ${SceneDesc1}
    Click Element  ${S360_OP_MY_VIEW_SCENE_LIST}
    Select From List By Label  ${S360_OP_MY_VIEW_SCENE_LIST}   ${ViewName}
    SEC/S360_Save Changes
    SEC/S360_Verify Success Message  ${CreateViewSuccMsgID}


S360_OP_Update A View
    [Documentation]  Update the view
    [Arguments]  ${ViewName}  ${ViewUpdate}  ${SceneName}
    # Navigates to view scene
    S360_OP_Navigate To View Scene
    # Search for scene name
    wait until keyword succeeds  5x  2s  Press Keys  ${SEC/S360_SEARCH_BOX}    ${ViewName}
    Press Keys    ${SEC/S360_SEARCH_BOX}    RETURN
    # Click on view and update it
    Sleep  2s
    Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME}  timeout=20
    Click Element  ${S360_VIEW_CARD_NAME}
    Wait Until Element Is Visible  ${SEC/S360_NAME_TXT}  timeout=20
    Click Element     ${SEC/S360_NAME_TXT}
    Clear Element Text   ${SEC/S360_NAME_TXT}
    sleep    2s
    Input Text  ${SEC/S360_NAME_TXT}   ${ViewUpdate}
    sleep    2s
  # Save changes and verify success message
    SEC/S360_Save Changes Without CLosing Message
    SEC/S360_Verify Success Message  ${RenameSuccMsg}
    go back
    sleep    2s
    S360_OP_Search View In Operator  ${ViewUpdate}

S360_Verify Delete A View
    [Documentation]  Vertical content menu funtion Deletes/cancels a view
    ...  ${ViewName}: Name of the view to be deleted
    ...  ${MessageID}: Expected Message prefix
    ...  ${DeleteYes/DeleteNO}:  EXpected result to delete

    [Arguments]  ${ViewName}  ${MessageID}  ${DeleteYes/DeleteNO}

    # Navigates to view scene
    S360_OP_Navigate To View Scene
    S360_OP_Search View In Operator    ${ViewName}
    ${DELStatus}=  Convert To Lower Case  ${DeleteYes/DeleteNO}
    # Deletes a view
    Mouse Over  ${SEC/S360_CARD_OPTION_MENU}
    Wait Until Element Is Visible  ${SEC/S360_DELETE_CARD_ICON}  timeout=20
    Execute Javascript  document.getElementById('${SEC/S360_DELETE_CARD_ICON}').click()
    Wait Until Element Is Visible  ${SEC/S360_DELETE_POP_BTN}  timeout=20
    Run keyword IF  "${DELStatus}" == "no"  Click Element  ${SEC/S360_CANCEL_POP_BTN}
    ...  ELSE IF  "${DELStatus}" == "yes"  Run keywords  Click Element  ${SEC/S360_DELETE_POP_BTN}
    # Verifies success message
    ...  AND  SEC/S360_Verify Success Message  ${MessageID}


S360_OP_Copy a View
    [Documentation]  Creates a copy of a View
    [Arguments]  ${ViewName}  ${Cards/ListView}
    # Navigates to view scene
    S360_OP_Navigate To View Scene
    S360_OP_Search View In Operator    ${ViewName}
    ${View_Locator}=  Set Variable If  "${Cards/ListView}"=='Cards_View'  ${SEC/S360_CARDS_NAME_ID} [1]  ${SEC/S360_LIST_NAME_ID} [1]
    Run Keyword If  '${Cards/ListView}'=='Cards_View'  Click Element  ${SEC/S360_CARDS_VIEW_BTN}
    ...  ELSE  Click Element  ${SEC/S360_LIST_VIEW_BTN}
    Select From List By Index  ${SEC/S360_SORT_BY_DD}  2
    Click Element  ${SEC/S360_DESCENDING_BTN}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${View_Locator}
    # copies a view
    Run Keyword If  '${Cards/ListView}'=='Cards_View'  Run Keywords  Mouse Over  ${SEC/S360_CARD_OPTION_MENU} [1]
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_COPY_CARD_ICON}  timeout=20
    ...  AND  Execute Javascript  document.getElementById('${SEC/S360_COPY_CARD_ICON}').click()
    ...  ELSE  Run Keywords  Select Checkbox  checkBox_0
#    ...  AND  Mouse Over  ${SEC/S360_LV_FLOAT_OPTN_BTN}
    ...  AND  Click Element  ${SEC/S360_LV_FLOAT_COPY_BTN}
    Wait Until Page Contains Element  ${SEC/S360_MSG_CENTER}  timeout=20
    # Verifies success message
    ${Status}=  SEC/S360_Verify Success Message  ${CopyViewMsgID}
    Run Keyword If  '${Status}'=='${FALSE}'  Fail
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${View_Locator}
    ${ItemName}=  Get Text  ${View_Locator}
    Should Contain  ${ItemName}  ${ViewName}_Copy
#    Run Keyword If  '${Cards/ListView}'=='List_View'    click element    ${S360_NODE_ICW_CLOSEBTN}
    reload page
    wait until element is visible    ${SEC/S360_CARDS_VIEW_BTN}
    Click Element  ${SEC/S360_CARDS_VIEW_BTN}

S360_OP_Copy a View In List View
    [Documentation]  Creates a copy of a View
    [Arguments]  ${ViewName}  ${Cards/ListView}
    # Navigates to view scene
    S360_OP_Navigate To View Scene
    S360_OP_Search View In Operator List View    ${ViewName}
    ${View_Locator}=  Set Variable If  "${Cards/ListView}"=='Cards_View'  ${SEC/S360_CARDS_NAME_ID} [1]  ${SEC/S360_LIST_NAME_ID} [1]
    Run Keyword If  '${Cards/ListView}'=='Cards_View'  Click Element  ${SEC/S360_CARDS_VIEW_BTN}
    ...  ELSE  Click Element  ${SEC/S360_LIST_VIEW_BTN}
    Select From List By Index  ${SEC/S360_SORT_BY_DD}  2
    Click Element  ${SEC/S360_DESCENDING_BTN}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${View_Locator}
    # copies a view
    Run Keyword If  '${Cards/ListView}'=='Cards_View'  Run Keywords  Mouse Over  ${SEC/S360_CARD_OPTION_MENU} [1]
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_COPY_CARD_ICON}  timeout=20
    ...  AND  Execute Javascript  document.getElementById('${SEC/S360_COPY_CARD_ICON}').click()
    ...  ELSE  Run Keywords  Select Checkbox  checkBox_0
    ...  AND  Mouse Over  ${SEC/S360_LV_FLOAT_COPY_BTN}
    ...  AND  Click Element  ${SEC/S360_LV_FLOAT_COPY_BTN}
    Wait Until Page Contains Element  ${SEC/S360_MSG_CENTER}  timeout=20
    # Verifies success message
    ${Status}=  SEC/S360_Verify Success Message  ${CopyViewMsgID}
    Run Keyword If  '${Status}'=='${FALSE}'  Fail
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${View_Locator}
    ${ItemName}=  Get Text  ${View_Locator}
    Should Contain  ${ItemName}  ${ViewName}_Copy

S360_OP_Verify Video Play Button
    [Documentation]  Verifies video assistance popup appears when clicked on video button

    SEC/S360_Scroll Page To Location  0   0
    Wait Until Element Is Visible  ${SEC/S360_VIDEO_PLAY_BTN}
    Click Element   ${SEC/S360_VIDEO_PLAY_BTN}
    Wait Until Element Is Visible  ${S360_OP_POPUP_TITLE}
    click element    ${S360_OP_POPUP_TITLE}
    wait until element is visible    ${S360_OP_VIDEO_SECTION}    timeout=20s
    ${VisiblilityStatus}=  Run Keyword And Return Status  Element Should Be Visible    ${S360_OP_VIDEO_SECTION}

    [Return]  ${VisiblilityStatus}

S360_OP_Verify Restoring a View From Trashcan
    [Documentation]  Verifies restoring a deleted view is deleted from Trashcan

    [Arguments]  ${ViewName}

    SEC/S360_Scroll Page To Location  0  0
    Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_WELCOME_LINK}
    ${Status}=  Run Keyword And Return Status  Click Element  ${SEC/S360_TRASHCAN_ICON}
    Run Keyword If  '${Status}'=='${False}'  Run Keywords  Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_WELCOME_LINK}
    ...  AND  Wait Until Keyword Succeeds  5x  2S  Click Element  ${SEC/S360_TRASHCAN_ICON}
    Wait Until Keyword Succeeds  5x  2S  Input Text  ${SEC/S360_SEARCH_BOX}  ${ViewName}
    Click Element  ${SEC/S360_SEARCH_BTN}
    Wait Until Element Is Visible  ${SEC/S360_TRASH_CAN_NAMES} [1]  timeout=10

    wait until keyword succeeds  5x  2s  Input Text  ${SEC/S360_SEARCH_BOX}  ${ViewName}
    Click Element  ${SEC/S360_SEARCH_BTN}
    Wait Until Element Is Visible  ${SEC/S360_TRASH_CAN_NAMES} [1]  timeout=10

    ${NumOfItemsInTrash}=  Get Element Count  ${SEC/S360_TRASH_CAN_NAMES}
    ${IndexNumber}=  Set Variable
    FOR    ${Index}  IN RANGE  1  ${NumOfItemsInTrash}+1
        ${ItemName}=   Get Text  ${SEC/S360_TRASH_CAN_NAMES} [${Index}]
        ${contains_text}=    run keyword and return status    should contain   ${ItemName}    ${ViewName}
        ${IndexNumber}=  Run Keyword If  ${contains_text}==True   Run Keywords  S360_OP_Select Item In Trashcan  ${Index}
        ...  AND  Exit For Loop
    END

    Click Element  ${SEC/S360_OPTN_RESTORE_BTN}
    ${Status}=  SEC/S360_Verify Success Message  ${RestoreSuccMsgID}
    Run Keyword If  '${Status}'=='${FALSE}'  Fail

S360_OP_Select Item In Trashcan
    [Documentation]  Selects the Item name from Trashcan

    [Arguments]  ${Index}

    ${ItemName1}=  Get Element Attribute  ${SEC/S360_TRASH_CAN_NAMES} [${Index}]  id
    ${IndexNumber}=  Remove String  ${ItemName1}  name_  -Lbl
    Execute Javascript      document.getElementById('checkBox_${IndexNumber}').click()

    [Return]  ${IndexNumber}





S360_OP_Verify Deleted View In Trashcan
    [Documentation]  Verifies when a view is deleted, it moves to Trashcan

    [Arguments]  ${ViewName}

    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_WELCOME_LINK}
    wait until keyword succeeds  10x  2s  Click Element  ${SEC/S360_TRASHCAN_ICON}
    Wait Until Element Is Visible  ${SEC/S360_TRASH_CAN_NAMES} [1]  timeout=10

    wait until keyword succeeds  5x  2s  Input Text  ${SEC/S360_SEARCH_BOX}  ${ViewName}
    Click Element  ${SEC/S360_SEARCH_BTN}
    Wait Until Element Is Visible  ${SEC/S360_TRASH_CAN_NAMES} [1]  timeout=10

    ${NumOfItemsInTrash}=  Get Element Count  ${SEC/S360_TRASH_CAN_NAMES}
    ${Var}=  Set Variable
    FOR    ${Index}  IN RANGE  1  ${NumOfItemsInTrash}+1
        ${ItemName}=  Get Text  ${SEC/S360_TRASH_CAN_NAMES} [${Index}]
        ${Var}=  Set Variable If  '${ItemName}'=='${ViewName}'  '${TRUE}'  '${FALSE}'
        Run Keyword If  ${Var}=='${TRUE}'  Exit For Loop
    END

    [Return]  ${Var}

S360_OP_Set A Default View
    [Documentation]    Sets a scene as default from navigator menu

    [Arguments]  ${DefaultViewName}

    S360_OP_Navigate To View Scene
    S360_OP_Search View In Operator  ${DefaultViewName}
    ${NumberOfViews}=  Get Element Count  ${S360_VIEW_CARD_NAME}

    ${Status}=  Set Variable
    FOR    ${Index}  IN RANGE  1  ${NumberOfViews}+1
        ${ViewName}=  Get Text  ${S360_VIEW_CARD_NAME} [${Index}]
        Run Keyword If  '${ViewName}'=='${DefaultViewName}'  Run Keywords  Mouse Over  ${SEC/S360_CARD_OPTION_MENU} [${Index}]
        ...  AND  Sleep  1S
        ...  AND  Wait Until Element Is Visible  ${S360_OP_DEFAULT_MENU_ICON}  timeout=20
        ...  AND  Click Element  ${S360_OP_DEFAULT_MENU_ICON} [${Index}]
        ...  AND  Wait Until Element Is Visible  ${S360_OP_BOOKMARK_ICON}
        ...  AND  Exit For Loop
    END
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${S360_VIEW_DEFAULT_ICON}  timeout=10
    SEC/S360_Scroll Page To Location  0  0
    S360_OP_Search View In Operator  ${DefaultViewName}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${S360_VIEW_DEFAULT_ICON}  timeout=10

    # Verify Default Scene in Welcome page
    Click Element  ${S360_OP_NAV_DASHBOARD_BTN}
    Wait Until Element Is Visible  ${S360_DEFAULT_VIEW_NAME}  timeout=20

    ${DefaultViewText}=  Get Text  ${S360_DEFAULT_VIEW_NAME}
    log    ${DefaultViewText}

    Should Contain  ${DefaultViewText}  ${DefaultViewName}
    #Should Contain  ${DefaultViewText}  Default View


#################################### Published/Approved Scene ####################################

S360_OP_Set A Default Scene from Approved Scene
    [Documentation]    Sets a scene as default from navigator menu
    ...  ${SceneName}:  Name of the scene to be set as default

    [Arguments]  ${NameOfScene}

    S360_OP_Search In Approved Scene  ${NameOfScene}
    wait until element is visible     ${SEC_OP_TEMP_SCENE_1}
   	${ActualCardName}=    get text     ${SEC_OP_TEMP_SCENE_1}


    # Click On Set Default button
    SEC/S360_Scroll To Element  ${S360_SET_DEFAULT_BTN}
    wait until element is visible  ${S360_SET_DEFAULT_BTN}  timeout=20
    Scroll Element Into View  ${S360_SET_DEFAULT_BTN}
    Click Element  ${S360_SET_DEFAULT_BTN}
	SEC/S360_Scroll Page To Location  0  0
    Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=20
	Wait Until Element Is Visible  xpath=(//*[@id='close-all-button'])  timeout=20
	Click Element  xpath=(//*[@id='close-all-button'])
	Run Keyword and Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_MSG_CENTER}  timeout=10

    # Verify Default scene in Welcome page
    Click Element  ${S360_OP_NAV_DASHBOARD_BTN}
    Wait Until Element Is Visible  ${S360_DEFAULT_VIEW_NAME}  timeout=20

    ${DefaultViewName}=  Get Text  ${S360_DEFAULT_VIEW_NAME}
    Should Contain  ${DefaultViewName}  ${ActualCardName}

S360_OP_Verify Cancel button in Add Scene
    [Documentation]    Verifies working of cancel button in Add Scene page

    S360_OP_Navigate To View Scene

    # opens the first view
    wait until keyword succeeds  5x  2s  Click Element  ${S360_VIEW_CARD_NAME} [1]
    Wait Until Element Is Visible  ${SEC/S360_NAME_TXT}  timeout=20

    Input Text     ${SEC/S360_NAME_TXT}  Dummy
    Click Element  ${SEC/S360_FLOAT_CANCEL_BTN}
    Wait Until Element Is Visible  ${SEC/S360_POPUP_MODAL}  timeout=20

    # Fails if popup is not visible
    Element Should Be Visible  ${SEC/S360_POPUP_MODAL}

    [Teardown]  Run keywords  Click Element  ${SEC/S360_CANCEL_POP_BTN}  AND  Sleep  2S

S360_OP_Verify Clicking on Parent Breadcrumb with Dirty Flag
    [Documentation]  Verifies when parent breadcrumb is clicked when dirty flag appears

    S360_OP_Navigate To View Scene

    # opens the first view
    wait until keyword succeeds  5x  2s  Click Element  ${S360_VIEW_CARD_NAME} [1]
    Wait Until Element Is Visible  ${SEC/S360_NAME_TXT}  timeout=20

    Input Text     ${SEC/S360_NAME_TXT}  Dummy
    Click Element  ${SEC/S360_PARENT_BREADCRUMB}
    Wait Until Element Is Visible  ${SEC/S360_POPUP_MODAL}  timeout=20

     # Fails if popup is not visible
    Element Should Be Visible  ${SEC/S360_POPUP_MODAL}
    capture page screenshot

    [Teardown]  Run keywords  Click Element  ${SEC/S360_CANCEL_POP_BTN}  AND  Sleep  2S
    capture page screenshot


S360_OP_Verify Welcome Page Collapse/Expand
    [Documentation]  Verifies collapse and expand in operator welcome page and its

    Click Element  ${S360_OP_NAV_DASHBOARD_BTN}
    Wait Until Element Is Visible  ${S360_DASHBOARD}  timeout=20
    SEC/S360_Scroll Page To Location  0  0

    ${class_attr}=  Get Element Attribute  ${S360_WEL_PAGE_COL/EXP_BTN}  class
    ${Expand_Status}=  Run Keyword And Return Status  Should Contain  ${class_attr}  down
    Click Element  ${S360_WEL_PAGE_COL/EXP_BTN}

    Run Keyword If  '${Expand_Status}'=='${TRUE}'  Element Should Be Visible  ${S360_NODE_DETAILS_TABLE}
    ...  ELSE  Element Should Not Be Visible  ${S360_NODE_DETAILS_TABLE}

    SEC/S360_Common Logout
    SEC/S360_Enter Credentials and Login To Solution  ${OperatorUser}  ${Test_Password}  ${OperatorRole}
    wait until keyword succeeds  5x  2S  Click Element  ${S360_OP_NAV_DASHBOARD_BTN}

    Wait Until Element Is Visible   ${S360_WEL_PAGE_COL/EXP_BTN}  timeout=20

    Run Keyword If  '${Expand_Status}'=='${TRUE}'  Element Should Be Visible  ${S360_NODE_DETAILS_TABLE}
    ...  ELSE  Element Should Not Be Visible  ${S360_NODE_DETAILS_TABLE}

    Click Element  ${S360_WEL_PAGE_COL/EXP_BTN}
    Run Keyword If  '${Expand_Status}'=='${TRUE}'  Element Should Not Be Visible  ${S360_NODE_DETAILS_TABLE}
    ...  ELSE  Run Keywords  Element Should Be Visible  ${S360_NODE_DETAILS_TABLE}
    ...  AND  Click Element  ${S360_WEL_PAGE_COL/EXP_BTN}

S360_OP_Get Subordinates Count in Graphical Tab
    [Documentation]  Verifies the name of the View with the name of the Scene

    Click Element  ${S360_GRAPHICAL_TAB}
    S360_OP_Enable/Disable Node Details Switch  Disable
    Sleep  2S
    ${Icons}=   Get WebElements    ${S360_GRAPH_ELEMENTS}
    ${TotalNumOfIcons}=  Get Length  ${Icons}
    ${SiteList}=  Create List
    ${OrgList}=  Create List
    ${EnvList}=  Create List

    # Counts number of scenes, organisations, sites, environments icon in graphical tab
    FOR  ${Elements}  IN  @{Icons}
        ${IndexNum}=  Get Index From List   ${Icons}  ${Elements}
        ${AttributeVal}=   Get Element Attribute  ${S360_GRAPH_ELEMENTS} [${IndexNum}+1]  href
        ${OrgStatus}=   Run Keyword And Return Status  Should Contain Any  ${AttributeVal}  publishedorganization_  Organization_
        ${SiteStatus}=  Run Keyword And Return Status  Should Contain Any  ${AttributeVal}  publishedsite_  img/Sites_
        ${EnvStatus}=   Run Keyword And Return Status  Should Contain Any  ${AttributeVal}  publishedenvironment_  Environment_
        Run keyword If  '${SiteStatus}'=='${TRUE}'  Insert Into List  ${SiteList}  ${IndexNum}  ${AttributeVal}
        ...    ELSE  Run Keyword If  '${OrgStatus}'=='${TRUE}'  Insert Into List  ${OrgList}  ${IndexNum}  ${AttributeVal}
        ...    ELSE  Run Keyword If  '${EnvStatus}'=='${TRUE}'  Insert Into List  ${EnvList}  ${IndexNum}  ${AttributeVal}
    END

   ${SiteListLen}=  Get Length  ${SiteList}
   ${OrgListLen}=   Get Length  ${OrgList}
   ${EnvListLen}=   Get Length  ${EnvList}

   [Return]  ${SiteListLen}  ${OrgListLen}  ${EnvListLen}

S360_OP_Verify Node Count In Node Details Tab
    [Documentation]  Verifies the count in Node details table is equal to the count in refine by section
    [Arguments]    ${SceneName}

#    S360_OP_Navigate To Published Scene
    S360_OP_Search In Approved Scene  ${SceneName}
    wait until keyword succeeds  5x  2s  Click Element  ${S360_APP_CARD_NAME_APPR}
    Wait Until Element Is Visible  ${S360_NODE_DETAILS_TABLE}  timeout=20
    # Gets the text from Table and converts it to integer
    ${NodeCountInTable}=  Get Text  ${S360_NODE_COUNT_TABLE}
    ${NodeCountInTable}=  Convert To Integer  ${NodeCountInTable}
    Sleep  2S  # Not able to click on node tab
    Click Element  ${S360_NODE_TAB}
    Sleep  3S

    # Gets the count from the the list of nodes
    ${NodeCountInRefineBy}=  get element count    ${S360_NODE_TAB_RIBBON_IMAGE}

    Should Be Equal  ${NodeCountInTable}  ${NodeCountInRefineBy}

S360_OP_Verify Organisation, Sites, Environment Count
    [Documentation]  Verifies Organisation, Sites and Environment Count from Node tab with graphical view
    [Arguments]    ${SceneName}

    S360_OP_Search In Approved Scene  ${SceneName}
    wait until keyword succeeds  5x  2s  Click Element  ${S360_APP_CARD_NAME_APPR} [1]
    Wait Until Element Is Visible  ${S360_NODE_DETAILS_TABLE}  timeout=20

    ${SiteCount}=  Get Text  ${S360_SITE_COUNT_TABLE}
    ${SiteCount}=  Convert To Integer  ${SiteCount}

    ${OrgCount}=  Get Text  ${S360_ORGN_COUNT_TABLE}
    ${OrgCount}=  Convert To Integer  ${OrgCount}

    ${EnvCount}=  Get Text  ${S360_ENVR_COUNT_TABLE}
    ${EnvCount}=  Convert To Integer  ${EnvCount}

    Sleep  2S  # Not able to click on node tab
    Click Element  ${S360_NODE_TAB}
    SEC/S360_Scroll Page To Location    0    0
    wait until keyword succeeds  5x  2s  Click Element  ${S360_GRAPHICAL_TAB}
    Wait Until Element Is Visible  ${SEC/S360_NAME_TXT}  timeout=20

    ${SiteListLen}  ${OrgListLen}  ${EnvListLen} =  S360_OP_Get Subordinates Count in Graphical Tab

    Should Be Equal  ${SiteCount}  ${SiteListLen}
    Should Be Equal  ${OrgCount}   ${OrgListLen}
    Should Be Equal  ${EnvCount}   ${EnvListLen}

S360_OP_Verify Hearbeat Present in SortBy Dropdown
    [Documentation]  Verifies Hearbeat is present in SortBy dropdown and not Updated By
    [Arguments]    ${SceneName}

#   S360_OP_Navigate To Published Scene
    S360_OP_Search In Approved Scene  ${SceneName}
    wait until keyword succeeds  5x  2s  Click Element   ${SEC_OP_TEMP_SCENE_1}
    Wait Until Element Is Visible  ${S360_NODE_DETAILS_TABLE}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${S360_NODE_TAB}
    Sleep  3S
    wait until element is visible    ${SEC/S360_SORT_BY_DD}
    ${ListItems}=  Get List Items  ${SEC/S360_SORT_BY_DD}
    List Should Contain Value      ${ListItems}  Heartbeat
    List Should Not Contain Value  ${ListItems}  Updated By

S360_OP_Verify Packaging Line Utilization Count in Graphical Tab
    [Documentation]  Verify Packaging Line Utilization Count in Graphical Tab
    [Arguments]    ${SceneName}

    S360_OP_Navigate To Published Scene
    S360_OP_Search In Approved Scene  ${SceneName}
    wait until keyword succeeds  5x  2s  Click Element  ${SEC_OP_TEMP_SCENE_1}
    Wait Until Element Is Visible  ${S360_NODE_DETAILS_TABLE}  timeout=20
    Sleep  2S
    Click Element  ${S360_GRAPHICAL_TAB}
    Sleep  4S
    S360_OP_Enable/Disable Node Details Switch  Disable

    ${Icons}=   Get WebElements    ${S360_GRAPH_ELEMENTS}
    ${TotalNumOfIcons}=  Get Length  ${Icons}
    ${SiteList}=  Create List
    SEC/S360_Scroll Page To Location  0  500
    # Click on site servers, so that it shows Line utilizations
    FOR    ${Elements}  IN  @{Icons}
        ${IndexNum}=  Get Index From List   ${Icons}  ${Elements}
        ${Index}=  Evaluate  ${IndexNum}+1
        ${AttributeVal}=   Get Element Attribute  ${S360_GRAPH_ELEMENTS} [${Index}]  href
        ${EnvStatus}=   Run Keyword And Return Status  Should Contain  ${AttributeVal}  Site_Server_
        Run Keyword If  '${EnvStatus}'=='${TRUE}'   Click Element  ${Elements}
    END

    ${PLUCountInGraph}=  Get WebElements  ${S360_LINES_ICONS}

    # Counts number of Active Sentri items
    FOR    ${SentriEle}  IN  @{PLUCountInGraph}
        ${IndexNum}=  Get Index From List   ${PLUCountInGraph}  ${SentriEle}
        ${Index}=  Evaluate  ${IndexNum}+1
        ${Value}=   Get Element Attribute  ${S360_LINES_ICONS} [${Index}]  href
        ${SiteStatus}=   Run Keyword And Return Status  Should Contain  ${Value}  Sentri_Active
        Run keyword If  '${SiteStatus}'=='${TRUE}'  Insert Into List  ${SiteList}  ${IndexNum}  ${Value}
    END

    ${PLUCountInGraph}=  Get Length  ${SiteList}

    SEC/S360_Scroll Page To Location  0  0
    Click Element  ${S360_NODE_TAB}
    Sleep  2S

    Run Keyword If  ${PLUCountInGraph}==0  Element Should Not Be Visible  ${S360_PLU_ARC}
    ...  ELSE  S360_OP_Verify Count in Package Utilization Graph  ${PLUCountInGraph}

S360_OP_Verify Count in Package Utilization Graph
    [Documentation]  Compares the total count from the graphical view in the Nodes Table

    [Arguments]  ${GraphCount}

    ${IDValue}=  Get Element Attribute  ${S360_PLU_ARC}  id
    ${AvailableCountStr}=  Remove String  ${IDValue}  arc_Available_
    ${AvailableCountInt}=  Convert To Integer  ${AvailableCountStr}
    Should Be Equal  ${GraphCount}  ${AvailableCountInt}

S360_OP_Verify View Name in Graphical Tab
    [Documentation]  Base name should be a View name and not scene name

    [Arguments]  ${NameOfScene}

    Click Element  ${S360_GRAPHICAL_TAB}
    ${BaseName}=  Get Element Attribute  ${S360_GRAPH_ELEMENTS} [1]  id
    Should be Equal  ${NameOfScene}  ${BaseName}

S360_OP_Open Comment Popup
    [Documentation]  Opens the comment section popup in Scenes/View

    Wait Until Element Is Visible  ${S360_OPEN_COMMENTS_BTN}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${S360_OPEN_COMMENTS_BTN}
    Wait Until Element Is Visible  ${S360_COMMENTS_LABEL}  timeout=20

S360_OP_Verify UI of Comments Popup In View
    [Documentation]  Verifies UI of comment section, it should not contain Text area, Add button anc cancel button

    S360_OP_Open Comment Popup

    Element Should be Visible   ${S360_COMMENTS_TXT_AREA}
    Element Should be Visible   ${S360_COMMENTS_ADD_BTN}
    Element Should be Visible   ${S360_COMMENTS_CANCEL_BTN}
    Element Should be Visible   ${S360_COMMENTS_OK_BTN}
    Element Should be Visible   ${S360_COMMENTS_SEARCH_FIELD}

S360_OP_Verify UI of Comments Popup In Scenes
    [Documentation]  Verifies UI of comment section, it should not contain Text area, Add button anc cancel button

    S360_OP_Open Comment Popup

    Element Should be Visible   ${S360_COMMENTS_OK_BTN}
    Element Should be Visible   ${S360_COMMENTS_SEARCH_FIELD}
    Element Should Not be Visible  ${S360_COMMENTS_TXT_AREA}
    Element Should Not be Visible  ${S360_COMMENTS_ADD_BTN}
    Element Should Not be Visible  ${S360_COMMENTS_CANCEL_BTN}

S360_OP_Verify Diagnosis Feature
    [Documentation]  Verifies Diagnosis feature in Node details

    Click Element  ${S360_DIAGNOSIS_BTN}
    Wait Until Element Is Visible  ${S360_DIAGNOSIS_POPUP}  timeout=20
    Element Should Be Visible  ${S360_DIAGNOSIS_POPUP}
    [Teardown]  Click Element  ${SEC/S360_CANCEL_POP_BTN}

S360_OP_Verify Search in Node Details
    [Documentation]  Verifies search feature in node details
    [Arguments]  ${SearchText}  ${Expected_Item}
    Input Text     ${SEC/S360_SEARCH_BOX}   ${SearchText}
    Click Element  ${SEC/S360_SEARCH_BTN}
    ${TotalItems}=  Get Element Count  ${S360_COMPONENTS}
    FOR  ${Index}  IN RANGE  1  ${TotalItems}+1
        ${Actual_Item}=  Get Text  ${S360_COMPONENTS} [${Index}]
        @{Actual_Item}  Split string   ${Actual_Item}  ${SPACE}
        Should be equal  ${Actual_Item}[0]   ${Expected_Item}
    END

S360_OP_Verify Sorting Nodes By Name
    [Documentation]  Verifies Node names are sorted in the specified order
    Select From List By Index  ${SEC/S360_SORT_BY_DD}  0
    Click Element              ${SEC/S360_ASCENDING_BTN}
    ${ElementCount}=  Get Element Count  ${S360_COMPONENTS}
    sleep   2s
    FOR  ${Index}  IN RANGE  1  ${ElementCount}
         ${NextIndex}=      Evaluate    ${Index}+1
         ${FirstValue}=     Get Element Attribute  ${S360_COMPONENTS} [${Index}]  title
         ${SecondValue}=    Get Element Attribute  ${S360_COMPONENTS} [${NextIndex}]  title
         Run Keyword If  '${FirstValue}'>'${SecondValue}'  Fail
    END


S360_OP_Verify Search in Comments Popup
    [Documentation]  Verifies searching in comments popup

    [Arguments]  ${SearchText}

    S360_OP_Open Comment Popup

    Input Text  ${S360_COMMENTS_SEARCH_FIELD}  ${SearchText}

    ${Comments}=  Get WebElements  ${S360_COMMENTS_HIGHLIGHTED_TEXT}
    FOR    ${Comment}  IN  @{Comments}
        ${Text}=  Get Text  ${Comment}
        Should Contain  ${Text}  ${SearchText}
    END

S360_OP_Verify Adding Comments In Comments Popup
    [Documentation]  Verifies searching in comments popup

    [Arguments]  ${Comment}

    S360_OP_Open Comment Popup

    Input Text  ${S360_COMMENTS_TXT_AREA}  ${Comment}
    Click Element  ${S360_COMMENTS_ADD_BTN}

    ${FirstComment}=  Get Text  ${S360_COMMENTS_SECTION} [1]
    Click Element  ${S360_COMMENTS_OK_BTN}
    Wait Until Element Is Not Visible	${S360_COMMENTS_OK_BTN}  timeout=5
    Sleep  1S
    SEC/S360_Save Changes
    Should be Equal  ${FirstComment}  ${Comment}

S360_OP_Verify Nodes Images
    [Documentation]  Verifies the images in for Site Server, Data Sources and Clouds are displayed

    [Arguments]  ${NodeName}  ${CheckboxElement}  ${ExpectedCount}

    wait until element is visible    ${CheckboxElement}
    Execute JavaScript  document.getElementById('${CheckboxElement}_input').click()

    SEC/S360_Scroll To Element   ${CheckboxElement}

    ${TotalComponents}=  Get Element Count  ${S360_NODE_IMAGES}

    FOR    ${Components}  IN RANGE  1  ${TotalComponents}
        ${AttrValue}=  get element attribute    ${S360_NODE_TAB_RIBBON_IMAGE} [${Components}]    src
        Should Contain  ${AttrValue}  ${NodeName}
    END

    ${Value}=  Get Text   ${CheckboxElement}
    ${ActualCount}=  fetch number   ${Value}
    Should Be Equal  '${ActualCount}'  '${ExpectedCount}'

    Execute JavaScript  document.getElementById('${CheckboxElement}_input').click()

S360_OP_Enable/Disable Node Details Switch
    [Documentation]  Enables/Disables the node details switch in graphical tab

    [Arguments]  ${Enable/Disable}

    SEC/S360_Scroll Page To Location  0  0
    wait until element is visible    ${S360_NODE_DETAILS_SWITCH}
    ${ClassAttributeValue}=  Get Element Attribute  ${S360_NODE_DETAILS_SWITCH}  class
    ${EnableStatus}=  Run Keyword And Return Status  Should Contain  ${ClassAttributeValue}  true

    Run Keyword If  '${Enable/Disable}'=='Enable' and '${EnableStatus}'=='${FALSE}'  Click Element  ${S360_NODE_DETAILS_SWITCH}
    ...  ELSE  Run Keyword If  '${Enable/Disable}'=='Disable' and '${EnableStatus}'=='${TRUE}'  Click Element  ${S360_NODE_DETAILS_SWITCH}

S360_OP_Verify Navigation In Published Scene
    [Documentation]  Verifies navigation in published scene

    Click Element  ${S360_PUB_LAST_PAGE_LINK}
    Wait Until Element Is Visible  ${S360_PUB_ACTIVE_PAGE_LINK}  timeout=20
    ${Last_Page_Num}=  Get Text  ${S360_PUB_ACTIVE_PAGE_LINK}
    ${Last_Page_Num}=  Remove String  ${Last_Page_Num}  (current)
    ${Last_Page_Num}=  Convert To Integer  ${Last_Page_Num}
    Click Element  ${S360_PUB_FIRST_PAGE_LINK}
    Wait Until Element Is Visible  ${S360_PUB_ACTIVE_PAGE_LINK}  timeout=20
    @{NamesList}=  Create List

    FOR    ${Index}  IN RANGE  0  ${Last_Page_Num}
        @{NamesList}=  S360_OP_Get Card Names In List  ${S360_PUB_CARD_NAME}  @{NamesList}
        Click Element  ${S360_PUB_NEXT_PAGE_LINK}
        Wait Until Element Is Visible  ${S360_PUB_CARD_NAME}  timeout=20
    END

    List Should Not Contain Duplicates  ${NamesList}

S360_OP_Verify Navigation In Approved Scene
    [Documentation]  Verifies navigation in published scene

    wait until element is visible  ${S360_APPR_LAST_PAGE_LINK}  timeout=20
    scroll element into view  ${S360_APPR_LAST_PAGE_LINK}
    Click Element  ${S360_APPR_LAST_PAGE_LINK}
    Wait Until Element Is Visible  ${S360_APPR_ACTIVE_PAGE_LINK}  timeout=20
    ${Last_Page_Num}=  Get Text  ${S360_APPR_ACTIVE_PAGE_LINK}
    ${Last_Page_Num}=  Remove String  ${Last_Page_Num}  (current)
    ${Last_Page_Num}=  Convert To Integer  ${Last_Page_Num}
    Click Element  ${S360_APPR_FIRST_PAGE_LINK}
    Wait Until Element Is Visible  ${S360_APPR_ACTIVE_PAGE_LINK}  timeout=20
    @{NamesList}=  Create List

    FOR    ${Index}  IN RANGE  0  ${Last_Page_Num}
        @{NamesList}=  S360_OP_Get Card Names In List  ${S360_APP_CARD_NAME}  @{NamesList}
        Click Element  ${S360_APPR_NEXT_PAGE_LINK}
        Wait Until Element Is Visible  ${S360_APP_CARD_NAME}  timeout=20
    END

    List Should Not Contain Duplicates  ${NamesList}

S360_OP_Get Card Names In List
    [Documentation]  Retrieves cards names and put into list

    [Arguments]  ${CardNameID}  @{CardNamesList}

    ${Total_Cards_Count}=  Get Element Count  ${CardNameID}

    FOR    ${Index}  IN RANGE  1  ${Total_Cards_Count}+1
        ${Name}=  Get Text  ${CardNameID} [${Index}]
        Append To List  ${CardNamesList}  ${Name}
    END

    [Return]  @{CardNamesList}

S360_OP_Check Date Sorting Order
    [Documentation]  Checks the dates are sorted in Ascending order in Comments popup

    [Arguments]  ${DateElementsXpath}

    ${NumOfDateElements}=  Get Element Count  ${DateElementsXpath}

    FOR    ${Index}  IN RANGE  1  ${NumOfDateElements}
        ${FirstHeaderSection}=  Get Text  ${DateElementsXpath} [${Index}]
        ${NextHeaderSection}=  Get Text  ${DateElementsXpath} [${Index}+1]
        @{FirstDateSection}=  Get Regexp Matches  ${FirstHeaderSection}  [\\d/]+[, ]+[\\d: PAM]+
        @{NextDateSection}=   Get Regexp Matches  ${NextHeaderSection}   [\\d/]+[, ]+[\\d: PAM]+
        ${FirstDate}=  Convert Date  ${FirstDateSection}[0]  result_format=%m/%d/%Y, %I:%M:%S %p  date_format=%m/%d/%Y, %I:%M:%S %p
        ${NextDate}=   Convert Date  ${NextDateSection}[0]   result_format=%m/%d/%Y, %I:%M:%S %p  date_format=%m/%d/%Y, %I:%M:%S %p
        ${result}=  Subtract Date From Date  ${FirstDate}  ${NextDate}  date1_format=%m/%d/%Y, %I:%M:%S %p  date2_format=%m/%d/%Y, %I:%M:%S %p
        Run Keyword If  ${result}<0  Fail
    END

S360_OP_Get Total Number of Pages
    [Documentation]  Returns the total number of pages present in a page

    Click Element  ${S360_OP_LAST_PAGE_BTN}
    ${LastPageNumber}=  Get Text  ${S360_OP_ACTIVE_PAGE_NUMBER}
    ${LastPageNumber}=  Replace String  ${LastPageNumber}  (current)  ${EMPTY}
    ${LastPageNumber}=  convert to integer  ${LastPageNumber}
    Click Element  ${S360_OP_FIRST_PAGE_BTN}

    [Return]  ${LastPageNumber}

S360_OP_Navigate To Pages
    [Documentation]  Navigates to multiple pages if more than ten artifacts are present in a single page.
    ...  Takes Total number of pages to navigate and the Files present in first page
    ...  Returns the total numbers of files found after navigating to all the pages

    [Arguments]  ${TotalNumberOfPages}  ${FileCount}  ${Element}

    FOR    ${Page}    IN RANGE    1    ${TotalNumberOfPages}
        Click Element  ${S360_OP_NEXT_BTN}
        ${FileCountPerPage}=  Get Element Count  ${Element}
        ${FileCount} =  Evaluate  ${FileCountPerPage}+${FileCount}
    END

    [Return]  ${FileCount}

S360_OP_Refine By Section
    [Documentation]  Verifies Refine by section in Node Details page

    [Arguments]  ${CheckboxElement}  ${ElementToVerify}

    Sleep  2S
    wait until element is visible    ${CheckboxElement}_input
    Execute JavaScript  document.getElementById('${CheckboxElement}_input').click()

    ${Value}=  Get Text   ${CheckboxElement}
    ${ExpectedCount}=  fetch number   ${Value}

     # Counts the total number of artifacts present. If Total number of pages are more than 1, then it will navigate to all pages.
    ${InitialCount}=        Get Element Count  ${ElementToVerify}
    ${TotalNumberOfPages}=  S360_OP_Get Total Number of Pages
    ${MultiplePages}=       Evaluate  ${TotalNumberOfPages}>0

    ${InitialCount}=  Run Keyword If  '${MultiplePages}'=='${TRUE}'  S360_OP_Navigate To Pages  ${TotalNumberOfPages}  ${InitialCount}  ${ElementToVerify}
    ${Count}=    get element count    ${S360_REFINE_BY_NODE_SITE}
    # Unselects the checkbox
    Execute JavaScript  document.getElementById('${CheckboxElement}_input').click()

    Should Be Equal  ${ExpectedCount}  ${Count}


S360_OP_Verify item Per Page
    [Documentation]
    [Arguments]  ${ITEM_VALUE}  ${EXPECTED_PAGES}  ${ITEM_LIST_PATH}  ${CARD_PATH}  ${LAST_PAGE_NUM_LINK}
    Wait Until Element Is Visible  ${ITEM_LIST_PATH}  timeout=10
    ${EXPECTED_PAGES}=  Convert To Integer  ${EXPECTED_PAGES}
    Select From List By Value  ${ITEM_LIST_PATH}  ${ITEM_VALUE}
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
#    Wait Until Element Is Visible     ${SEC/S360_CARDS_VIEW_BTN}
    ${Total_Cards}=  Get Element Count  ${CARD_PATH}
    ${Total_Cards}=  Convert To Integer  ${Total_Cards}
    ${ITEM_VALUE}=  Convert To Integer  ${ITEM_VALUE}
    should be equal   ${Total_Cards}  ${ITEM_VALUE}
    wait until element is visible    ${LAST_PAGE_NUM_LINK}
    ${ACTUAL_PAGES}=  Get Text  ${LAST_PAGE_NUM_LINK}
    ${ACTUAL_PAGES}=  Convert To Integer  ${ACTUAL_PAGES}
    should be equal  ${ACTUAL_PAGES}  ${EXPECTED_PAGES}

S360_OP_Verify item Per Pages
    [Documentation]
    [Arguments]  ${ITEM_VALUE}  ${ITEM_LIST_PATH}  ${CARD_PATH}  ${LAST_PAGE_NUM_LINK}
    Wait Until Element Is Visible  ${ITEM_LIST_PATH}  timeout=10
    Select From List By Value  ${ITEM_LIST_PATH}  ${ITEM_VALUE}
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
    wait until element is visible     (//*[@aria-label="Last"][@class="page-link"])[1]
    click element    (//*[@aria-label="Last"][@class="page-link"])[1]
    wait until element is visible    ${LAST_PAGE_NUM_LINK}
    ${ACTUAL_PAGES}=  get element count  //*[@id="p_pagination"]/ul/li
    ${ACTUAL_PAGES}=  Convert To Integer  ${ACTUAL_PAGES}
    ${ACTUAL_PAGES}=    evaluate    ${ACTUAL_PAGES}- 4
    ${PAGES}=    evaluate    ${ACTUAL_PAGES}- 1
    ${mnacord}=    get element count    //*[@id="rejectBtn"]
    log    ${ITEM_VALUE}
    ${Total_Cards}=    evaluate   ${PAGES}* ${ITEM_VALUE} + ${mnacord}
    ${ITEM_VALUE}=  Convert To Integer     ${ITEM_VALUE}
    ${EXPECTED_PAGES}=   item_per_page     ${Total_Cards}    ${ITEM_VALUE}    ${mnacord}
    should be equal  ${ACTUAL_PAGES}  ${EXPECTED_PAGES}


S360_OP_Verify approved item Per Pages
    [Documentation]
    [Arguments]  ${ITEM_VALUE}  ${ITEM_LIST_PATH}  ${CARD_PATH}  ${LAST_PAGE_NUM_LINK}
    Wait Until Element Is Visible  ${ITEM_LIST_PATH}  timeout=10
    Select From List By Value  ${ITEM_LIST_PATH}  ${ITEM_VALUE}
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
    wait until element is visible     (//*[@aria-label="Last"][@class="page-link"])[1]
    click element    (//*[@aria-label="Last"][@class="page-link"])[2]
    wait until element is visible    ${LAST_PAGE_NUM_LINK}
    ${ACTUAL_PAGES}=  get element count  //*[@id="a_pagination"]/ul/li
    ${ACTUAL_PAGES}=  Convert To Integer  ${ACTUAL_PAGES}
    ${ACTUAL_PAGES}=    evaluate    ${ACTUAL_PAGES}- 4
    ${PAGES}=    evaluate    ${ACTUAL_PAGES}- 1
    ${mnacord}=    get element count    //*[@id="retractBtn"]
    log    ${ITEM_VALUE}
    ${Total_Cards}=    evaluate   ${PAGES}* ${ITEM_VALUE} + ${mnacord}
    ${ITEM_VALUE}=  Convert To Integer     ${ITEM_VALUE}
    ${EXPECTED_PAGES}=   item_per_page     ${Total_Cards}    ${ITEM_VALUE}    ${mnacord}
    should be equal  ${ACTUAL_PAGES}  ${EXPECTED_PAGES}

S360_OP_Verify item Per Page List_View
    [Documentation]
    [Arguments]  ${ITEM_VALUE}  ${EXPECTED_PAGES}  ${ITEM_LIST_PATH}  ${CARD_PATH}  ${LAST_PAGE_NUM_LINK}
    Wait Until Element Is Visible  ${ITEM_LIST_PATH}  timeout=10
    ${EXPECTED_PAGES}=  Convert To Integer  ${EXPECTED_PAGES}
    Select From List By Value  ${ITEM_LIST_PATH}  ${ITEM_VALUE}
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
#    Wait Until Element Is Visible     ${SEC/S360_CARDS_VIEW_BTN}
    ${Total_Cards}=  Get Element Count  ${CARD_PATH}
    ${Total_Cards}=  evaluate   ${Total_Cards} -    1
    ${Total_Cards}=  Convert To Integer  ${Total_Cards}
    ${ITEM_VALUE}=  Convert To Integer  ${ITEM_VALUE}
    should be equal   ${Total_Cards}  ${ITEM_VALUE}
    wait until element is visible    ${LAST_PAGE_NUM_LINK}
    ${ACTUAL_PAGES}=  Get Text  ${LAST_PAGE_NUM_LINK}
    ${ACTUAL_PAGES}=  Convert To Integer  ${ACTUAL_PAGES}
    should be equal  ${ACTUAL_PAGES}  ${EXPECTED_PAGES}



S360_OP_Navigates_To_List_view
    [Documentation]
    Wait Until Element Is Visible   ${SEC/S360_LIST_VIEW_BTN}  timeout=20
    Click Element  ${SEC/S360_LIST_VIEW_BTN}
    Select From List By Index  ${SEC/S360_SORT_BY_DD}  2
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_LIST_NAME_ID} [1]

S360_OP_Verify Sort Updated on
    [Arguments]    ${ITEM_LIST_PATH}  ${CARD_PATH}
    @{Actual_List} =  Create list
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
    Click Element  ${ITEM_LIST_PATH}
    Select From List By Index  ${ITEM_LIST_PATH}  5
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
    Wait Until Element Is Visible  ${CARD_PATH}  timeout=10
    ${Total_Cards}=  Get Element Count  ${CARD_PATH}
    FOR    ${Index}  IN RANGE  0  ${Total_Cards}
        ${Card_Name}=  Get Text    //*[@id="PublishedScene_itemName_${Index}"]
        Append To List  ${Actual_List}  ${Card_Name}
    END
    [Return]   ${Actual_List}


S360_OP_Verify Approved Sort Updated On
    [Arguments]    ${ITEM_LIST_PATH}  ${CARD_PATH}
    @{Actual_List} =  Create list
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
    Click Element  ${ITEM_LIST_PATH}
    Select From List By Index  ${ITEM_LIST_PATH}  5
    run keyword and ignore error  wait until element is visible  ${SEC_LOADINGICON}  timeout=5
    run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=10
    Wait Until Element Is Visible  ${CARD_PATH}  timeout=10
    ${Total_Cards}=  Get Element Count  ${CARD_PATH}
    FOR    ${Index}  IN RANGE  0  ${Total_Cards}
        ${Card_Name}=  Get Text     //*[@id="ApprovedScene_itemName_${Index}"]
        Append To List  ${Actual_List}  ${Card_Name}
    END
    [Return]   ${Actual_List}

S360_OP_Search View In Operator with Txt
    [Documentation]  Search a card in view page
    [Arguments]   ${SearchTxt}    ${ViewNameLIst}
    S360_OP_Search for view    ${SearchTxt}
    @{ViewNameLIst}=  Split String  ${ViewNameLIst}  ,
    ${TotalElements}=  get element count  ${S360_VIEW_CARD_NAME}
    FOR    ${Index}  IN RANGE  0  ${TotalElements}
        Wait Until Element Is Visible  ${S360_VIEW_CARD_NAME} [1]
        ${name}=  Get Text  ${S360_VIEW_CARD_NAME} [${Index}+1]
        should contain    ${name}  ${ViewNameLIst}[0]
    END

######################################################### Node Tab ##########################################################

S360_OP_Navigate To Tab In A View
    [Documentation]
    [Arguments]  ${Expected_Tab}  ${Expected_View}
    S360_OP_Navigate To View Scene
    S360_OP_Search View In Operator  ${Expected_View}
    Click ELement  ${S360_VIEW_CARD_NAME} [1]
    Wait Until Element is visible   ${Expected_Tab}
    Click Element  ${Expected_Tab}


S360_OP_Navigate To A Tab In Dashboard
    [Documentation]
    [Arguments]  ${Expected_Tab}
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Element is visible  ${S360_OP_DASHBOARD_TAB}
    Click Element  ${S360_OP_DASHBOARD_TAB}
    Wait Until Element is visible   ${Expected_Tab}
    Click Element  ${Expected_Tab}


S360_OP_Navigate To A Tab In Dashboards
    [Documentation]
    [Arguments]
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Element is visible  ${S360_OP_DASHBOARD_TAB}
    Click Element  ${S360_OP_DASHBOARD_TAB}


S360_OP_Verify Node Area
    [Documentation]
    Element Should be visible   ${S360_NODE_REFINE_BY_AREA}
    Element Should be visible   ${S360_NODE_VERTICAL_DIVIDER}
    Element Should be visible   ${S360_NODE_TAB INTERFACE}
    Element Should be visible   ${SEC/S360_SORT_BY_DD}
    Element Should be visible   ${SEC/S360_SEARCH_BTN}

S360_OP_Verify Node Tab feature
    [Documentation]
#    Run Keyword And Continue On Failure  Element Should be visible   ${S360_NODE_REFINE_BY_NODECLOUDS}
    ${lines_count}=    get length    ${node_lines}
    ${site_servers_count}=    get length    ${node_site_servers}
    ${unitrace_count}=    get length    ${node_unitrace}
    ${critical_count}=    get length    ${critical_nodes}
    ${warning_count}=    get length    ${warning_nodes}
    ${normal_count}=    get length    ${normal_nodes}
    ${active_count}=    get length    ${active_nodes}
    ${available_count}=    get length    ${available_nodes}
    ${offline_count}=    get length    ${offline_nodes}

    element should be visible    ${S360_OP_REFINE_NODE_LINES}
    element should be visible    ${S360_OP_REFINE_NODE_LINES_COUNTS}
    element text should be    ${S360_OP_REFINE_NODE_LINES_COUNTS}    (${lines_count})
    element should be visible    ${S360_OP_REFINE_NODE_SITE_SERVERS}
    element should be visible    ${S360_OP_REFINE_NODE_SITE_SERVERS_COUNTS}
    element text should be    ${S360_OP_REFINE_NODE_SITE_SERVERS_COUNTS}    (${site_servers_count})
    element should be visible    ${S360_OP_REFINE_NODE_UNITRACE}
    element should be visible    ${S360_OP_REFINE_NODE_UNITRACE_COUNTS}
    element text should be    ${S360_OP_REFINE_NODE_UNITRACE_COUNTS}    (${unitrace_count})

    ${is_critical_present}=    run keyword and return status    Element Should be visible   ${S360_NODE_TAB_ESCALATION_CRITICAL}
    run keyword if    ${is_critical_present}==True    run keyword and ignore error     element text should be    ${S360_NODE_TAB_ESCALATION_CRITICAL_COUNT}    (${critical_count})    ###not stable because not always the same as excel sheet data
    ${is_warning_present}=    run keyword and return status    Element Should be visible   ${S360_NODE_TAB_ESCALATION_WARNING}
    run keyword if    ${is_warning_present}==True    run keyword and ignore error     element text should be    ${S360_NODE_TAB_ESCALATION_WARNING_COUNT}    (${warning_count})    ###not stable because not always the same as excel sheet data
    ${is_normal_present}=    run keyword and return status    Element Should be visible   ${S360_NODE_TAB_ESCALATION_NORMAL}
    run keyword if    ${is_normal_present}==True    run keyword and ignore error     element text should be    ${S360_NODE_TAB_ESCALATION_NORMAL_COUNT}    (${normal_count})    ###not stable because not always the same as excel sheet data

    ${is_active_present}=    run keyword and return status    Element Should be visible   ${S360_NODE_TAB_STATUS_ACTIVE}
    run keyword if    ${is_active_present}==True    run keyword and ignore error     element text should be    ${S360_NODE_TAB_STATUS_ACTIVE_COUNT}    (${active_count})    ###not stable because not always the same as excel sheet data
    ${is_available_present}=    run keyword and return status    Element Should be visible   ${S360_NODE_TAB_STATUS_AVAILABLE}
    run keyword if    ${is_available_present}==True    run keyword and ignore error     element text should be    ${S360_NODE_TAB_STATUS_AVAILABLE}    (${available_count})    ###not stable because not always the same as excel sheet data
    ${is_offline_present}=    run keyword and return status    Element Should be visible   ${S360_NODE_TAB_STATUS_OFFLINE}
    run keyword if    ${is_offline_present}==True    run keyword and ignore error     element text should be    ${S360_NODE_TAB_STATUS_OFFLINE}    (${offline_count})    ###not stable because not always the same as excel sheet data
#    Run Keyword And Continue On Failure  Element Should be visible   ${S360_NODE_REFINE_BY_STATUS_MAINTENANCE}    #missing


S360_OP_Verify Unitrace In Node Tab Refined By
    ${count}=   get element count    ${S360_NODE_NAMES}
    FOR    ${i}    IN RANGE    1    ${count}+1
        ${name}=    get element attribute    ${S360_NODE_NAMES} [${i}]    title
        list should contain value    ${node_unitrace}    ${name}
    END

    element should be enabled    ${S360_NODE_TAB_ESCALATION_NORMAL}_input
    element should be enabled    ${S360_NODE_TAB_STATUS_ACTIVE}_input

S360_OP_Verify Site Servers In Node Tab Refined By
    ${count}=   get element count    ${S360_NODE_NAMES}
    FOR    ${i}    IN RANGE    1    ${count}+1
        ${name}=    get element attribute    ${S360_NODE_NAMES} [${i}]    title
        list should contain value    ${node_site_servers}    ${name}
    END

     ${disabled_checkbox_count}=   get element count    ${S360_DISABLED_CHECKBOX_NODE_COUNT}
     FOR    ${i}    IN RANGE    1    ${disabled_checkbox_count}+1
         ${disabled_text}=   get text    ${S360_DISABLED_CHECKBOX_NODE_COUNT} [${i}]
         should contain  ${disabled_text}  0
     END

S360_OP_Validate Site Server And Unitrace In Node Tab Refined By
    ${count}=   get element count    ${S360_NODE_NAMES}
    FOR    ${i}    IN RANGE    1    ${count}+1
        ${name}=    get element attribute    ${S360_NODE_NAMES} [${i}]    title
        ${is_site_server}=   run keyword and return status    list should contain value    ${node_site_servers}    ${name}
        run keyword if   ${is_site_server}==False    list should contain value    ${node_unitrace}    ${name}
    END

     ${disabled_checkbox_count}=   get element count    ${S360_DISABLED_CHECKBOX_NODE_COUNT}
     FOR    ${i}    IN RANGE    1    ${disabled_checkbox_count}+1
         ${disabled_text}=   get text    ${S360_DISABLED_CHECKBOX_NODE_COUNT} [${i}]
         should contain  ${disabled_text}  0
     END

S360_OP_Get Ribbons Text From Node Tab
    @{ribbons}=     create list
    ${ribbon_count}=    get element count    ${S360_NODE_TAB_RIBBONS}
    FOR    ${i}    IN RANGE    1    ${ribbon_count}+1
        append to list    ${ribbons}        ${S360_NODE_TAB_RIBBONS} [${i}]
    END
    [Return]    @{ribbons}

S360_OP_Validate Critical Function
    wait until page contains element    ${S360_NODE_IMAGES}
    ${ribbon_count}=    get element count    ${S360_NODE_TAB_RIBBONS}
    click element    ${S360_NODE_TAB_RIBBONS} [${ribbon_count}]
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT}
    click element    ${S360_NODE_ICW_HEARTBEAT}
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES}
    wait until element is visible    ${SEC/S360_SEARCH_BTN}
    ${state_text}=      get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES} [2]
    should be equal as strings    ${state_text}     CRITICAL
    FOR    ${i}    IN RANGE    1    ${ribbon_count}+1
        ${image_icon}=    get element attribute    ${S360_NODE_TAB_RIBBON_IMAGE} [${ribbon_count}]   src
        ${state}=      run keyword and return status    should contain   ${image_icon}   SiteServer_Critical
        run keyword if    '${state}'=='false'    run keywords    should contain   ${image_icon}   SiteServer_Offline
    END

S360_OP_Validate Warning Function
    ${ribbon_count}=    get element count    ${S360_NODE_TAB_RIBBONS}
    Execute JavaScript   window.scrollTo(0, 2000)
    wait until page contains element    ${S360_NODE_IMAGES}
    click element    ${S360_NODE_TAB_RIBBONS} [${ribbon_count}]
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT}
    click element    ${S360_NODE_ICW_HEARTBEAT}
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES}
    wait until element is visible    ${SEC/S360_SEARCH_BTN}
    ${state_text}=      get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES} [3]
    should be equal as strings    ${state_text}     WARNING
    ${warning_image_icon}=    get element attribute    ${S360_NODE_TAB_RIBBON_IMAGE} [${ribbon_count}]    src
    ${state}=      run keyword and return status    should contain   ${warning_image_icon}   SiteServer_Warinig
    run keyword if    '${state}'=='false'    run keywords    should contain   ${warning_image_icon}   SiteServer_Offline

S360_OP_Validate Normal Function
    Execute JavaScript   window.scrollTo(0, 2000)
    wait until element is visible    ${S360_NODE_IMAGES}
    ${ribbon_count}=    get element count    ${S360_NODE_TAB_RIBBONS}
    ${index}=        evaluate   int(${ribbon_count}/2)
    wait until element is visible    ${S360_NODE_TAB_RIBBONS} [${index}]
    repeat keyword    3 times    click element    ${S360_NODE_TAB_RIBBONS} [${index}]
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT}
    wait until keyword succeeds    5x    0.5s    click element    ${S360_NODE_ICW_HEARTBEAT}
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES}
    wait until element is visible    ${SEC/S360_SEARCH_BTN}
    ${state_text}=      get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES} [3]
    should be equal as strings    ${state_text}     NORMAL
    ${normal_image_icon}=    get element attribute    ${S360_NODE_TAB_RIBBON_IMAGE} [${ribbon_count}]    src
    ${state}=      run keyword and return status    should contain   ${normal_image_icon}   SiteServer_Active
    run keyword if    '${state}'=='false'    run keywords    should contain   ${normal_image_icon}   SiteServer_Offline


S360_OP_Verify Offline Status
    ${ribbon_count}=    get element count    ${S360_NODE_TAB_RIBBONS}
    Execute JavaScript   window.scrollTo(0, 2000)
    wait until page contains element    ${S360_NODE_IMAGES}
    ${index}=        evaluate   int(${ribbon_count}/2)
    click element    ${S360_NODE_TAB_RIBBONS} [5]
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT}
    click element    ${S360_NODE_ICW_HEARTBEAT}
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES}
    wait until element is visible    ${SEC/S360_SEARCH_BTN}
    ${key_names_count}=    get element count    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_NAME}
    FOR   ${i}  IN RANGE    1    ${key_names_count}
        ${key_name}=    get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_NAME} [${i}]
        ${state_text}=      run keyword if  '${key_name}'=='Status'    get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES} [${i}]
        exit for loop if    '${key_name}'=='Status'
    END
    should be equal as strings    ${state_text}     Offline

S360_OP_Verify Active Status
    ${ribbon_count}=    get element count    ${S360_NODE_TAB_RIBBONS}
    Execute JavaScript   window.scrollTo(0, 2000)
    wait until page contains element    ${S360_NODE_IMAGES}
    click element    ${S360_NODE_TAB_RIBBONS} [${ribbon_count}]
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT}
    click element    ${S360_NODE_ICW_HEARTBEAT}
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES}
    wait until element is visible    ${SEC/S360_SEARCH_BTN}
    ${key_names_count}=    get element count    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_NAME}
    FOR   ${i}  IN RANGE    1    ${key_names_count}
        ${key_name}=    get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_NAME} [${i}]
        ${state_text}=      run keyword if  '${key_name}'=='Status'    get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES} [${i}]
        exit for loop if    '${key_name}'=='Status'
    END
    should be equal as strings    ${state_text}     ACTIVE

S360_OP_Verify Available Status
    ${ribbon_count}=    get element count    ${S360_NODE_TAB_RIBBONS}
    Execute JavaScript   window.scrollTo(0, 2000)
    wait until page contains element    ${S360_NODE_IMAGES}
    click element    ${S360_NODE_TAB_RIBBONS} [${ribbon_count}]
    wait until page contains element    ${S360_NODE_IMAGES}
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT}
    click element    ${S360_NODE_ICW_HEARTBEAT}
    wait until element is visible    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES}
    wait until element is visible    ${SEC/S360_SEARCH_BTN}
    ${key_names_count}=    get element count    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_NAME}
    FOR   ${i}  IN RANGE    1    ${key_names_count}
        ${key_name}=    get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_NAME} [${i}]
        ${state_text}=      run keyword if  '${key_name}'=='Status'    get text    ${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES} [${i}]
        exit for loop if    '${key_name}'=='Status'
    END
    should be equal as strings    ${state_text}     AVAILABLE

S360_OP_Validate Ordering In Node Tab
    ${count}=   get element count    ${S360_NODE_TOP_NODES}
    @{list_beginning}=      create list
    FOR    ${i}    IN RANGE     1   ${count}+1
        ${text}=    get text    ${S360_NODE_TOP_NODES} [${i}]
        @{text}=    split string    ${text}    (
        append to list    ${list_beginning}  ${text}[0]
    END
    Click Element  ${SEC/S360_DESCENDING_BTN}
    @{list_desc}=   create list
    FOR    ${i}    IN RANGE     1   ${count}+1
        ${text}=    get text    ${S360_NODE_TOP_NODES} [${i}]
        @{text}=    split string    ${text}    (
        append to list    ${list_desc}  ${text}[0]
    END
    reverse list   ${list_desc}
    lists should be equal    ${list_beginning}      ${list_desc}
    Click Element  ${SEC/S360_ASCENDING_BTN}
    @{list_asc}=      create list
    FOR    ${i}    IN RANGE     1   ${count}+1
        ${text}=    get text    ${S360_NODE_TOP_NODES} [${i}]
        @{text}=    split string    ${text}    (
        append to list    ${list_asc}  ${text}[0]
    END
    lists should be equal    ${list_beginning}      ${list_asc}


######################################################### ICW ##########################################################

S360_OP_Selet A Site Server in Node Tab
    [Documentation]  This keyword use to select a node tile in node tab,it takes two argument node name and locator
    [Arguments]  ${Expected_Node_Name}  ${NODE_TILE}
    Wait Until Element is visible    //*[@id="refine_Node_Site_Servers_input"]


    ${Total_Element}=  Get Element Count  //*[@class="statusText"]
    FOR    ${INDEX}  IN RANGE  1  ${Total_Element}+1
        ${Actual_Node_Name}=  get element attribute    ${NODE_TILE} [${INDEX}]    title
        @{Actual_Node_Name}  Split String  ${Actual_Node_Name}  ${SPACE}
        Run Keyword IF  '${Actual_Node_Name}[0]'=='${Expected_Node_Name}'  Run Keywords  Click Element     ${NODE_TILE} [${INDEX}]
        ...  AND  Exit For Loop
    END
    sleep    4s


S360_OP_Select A Site Server in Node Tab
    [Documentation]  This keyword use to select a node tile in node tab,it takes two argument node name and locator
    [Arguments]    ${NODE_TILE}
    #wait until element is visible   (//*[@title="${NODE_TILE}"])[1]
    wait until element is visible   (//h6[contains(text(),"${NODE_TILE}")])[1]
    #wait until keyword succeeds  5x  2s  click element    (//*[@title="${NODE_TILE}"])[1]
    wait until keyword succeeds  5x  2s  click element    (//h6[contains(text(),"${NODE_TILE}")])[1]

S360_OP_Select A Site Server in Node Tab/Graph
    [Documentation]  This keyword use to select a node tile in node tab,it takes two argument node name and locator
    [Arguments]    ${NODE_TILE}
    Wait Until Element is visible    (//*[@id="${NODE_TILE}"])[1]

    wait until element is visible   (//*[@id="${NODE_TILE}"])[1]
    click element   (//*[@id="${NODE_TILE}"])[1]

S360_OP_Select A Lines
    [Documentation]  This keyword use to select a lines in Refined by
    wait until element is visible    //*[@id="refine_Node_Lines"]/div
    click element    //*[@id="refine_Node_Lines"]/div


S360_OP_Verify ICW Tab Names
    [Documentation]
    [Arguments]  ${ICW_TAB_NAMELIST}
    @{TAB_NAMELIST}=  Split String  ${ICW_TAB_NAMELIST}  ,
    ${TotalElements}=  Get Element Count  ${S360_NODE_ICW_TABS}
    FOR    ${Index}  IN RANGE  0  ${TotalElements- 1}
        continue for loop if    ' ${Index}' == '4'
        Wait Until Element is visible  ${S360_NODE_ICW_TABS} [${Index}+1]
        Click Element  ${S360_NODE_ICW_TABS} [${Index}+1]
        ${Tab_Name}  Get Text  ${S360_NODE_ICW_TABS} [${Index}+1]
        ${name1}=    fetch from left   ${Tab_Name}    ${slicer1}
        ${Tab_Name}=    set variable if    '${Index}'=='1'    ${name1}     ${Tab_Name}
        @{Tab_Names}  Split String  ${Tab_Name}  ${SPACE}
        Run Keyword And Continue On Failure  compare_string    ${Tab_Names}[0]  ${TAB_NAMELIST}[${Index}]
    END



S360_OP_Verify ICW Tab INFO
    [Documentation]
    [Arguments]  ${ICW_TABNIFO_LIST}
    SEC/S360_Scroll Page To Location  0  500
    @{ICW_TABNIFO_LIST}=  Split String  ${ICW_TABNIFO_LIST}  ,
    ${TotalElements}=  Get Element Count  ${S360_NODE_ICW_TABINFO}
    sleep    20s
    FOR    ${Index}  IN RANGE  0  ${TotalElements}
        exit for loop if   '${Index}' =='14'
        ${Tab_Info}  Get Text  ${S360_NODE_ICW_TABINFO} [${Index}+1]
        Run Keyword And Continue On Failure  Should be equal  ${Tab_Info}  ${ICW_TABNIFO_LIST}[${Index}]
    END

S360_OP_Click On ICW Tab
    [Documentation]
    [Arguments]  ${ICW_TAB}
    Wait Until Element is visible  ${ICW_TAB}  timeout=10s
    wait until keyword succeeds  5x  2s  Click Element  ${ICW_TAB}

S360_OP_Verify Search in Node ICW
    [Documentation]  Verifies search feature in node details
    [Arguments]  ${SearchText}
    wait until keyword succeeds  5x  2s  input text   ${S360_NODE_ICW_SEARCH_BOX} [2]     ${SearchText}    TRUE
    sleep    1s
    CLICK ELEMENT    ${S360_NODE_ICW_SEARCH_BTN} [2]
#    SEC/S360_Clear Text Field  ${S360_NODE_ICW_SEARCH_BOX} [2]
#    click element    ${S360_NODE_ICW_SEARCH_BOX} [2]
#    Input Text     (//*[@id="searchInternal"])[2]  ${SearchText}
#    Click Element  ${S360_NODE_ICW_SEARCH_BTN} [2]

S360_OP_Verify Search in Graphical ICW
    [Documentation]  Verifies search feature in node details
    [Arguments]  ${SearchText}
    wait until keyword succeeds  5x  2s  input text   ${S360_NODE_ICW_SEARCH_BOX}      ${SearchText}    TRUE
    sleep    1s
    CLICK ELEMENT    ${S360_NODE_ICW_SEARCH_BTN}

######################################################### Overview Tab  ##########################################################
S360_OP_Verify Cards in Overview Table
    [Documentation]  This keyword verify cards in table and takes one argument
    [Arguments]  ${Overview_Cards_String}
    @{Card_NameList}  Split String  ${Overview_Cards_String}  ,
    ${TotalElements}  Get Element Count  ${S360_OVERVIEW_TABLE_CARDS}
    FOR    ${Index}  IN RANGE  0  ${TotalElements}
        Wait Until Element is visible  ${S360_OVERVIEW_TABLE_CARDS} [${Index}+1]
        ${Card_Name}  Get Text  ${S360_OVERVIEW_TABLE_CARDS} [${Index}+1]
        Should be equal  ${Card_Name}  ${Card_NameList}[${Index}]
    END

S360_OP_Verify Cards Status Categories in Overview Table
    [Documentation]  This keyword verify cards in table and takes one argument
    [Arguments]  ${Overview_Status_List}  ${Card_Status}  ${Status_Color_List}  ${Card_Status_Color}
    @{Status_Color_List}  Split String  ${Status_Color_List}  ;
    @{Node_StatusList}  Split String  ${Overview_Status_List}  ,
    ${TotalElements}  Get Element Count  ${Card_Status}
    FOR    ${Index}  IN RANGE  0  ${TotalElements}
        Wait Until Element is visible  ${Card_Status} [${Index}+1]
        ${Node_Status}  Get Text  ${Card_Status} [${Index}+1]
        Should be equal  ${Node_Status}  ${Node_StatusList}[${Index}]
        ${attribute}  Get Element Attribute  ${Card_Status_Color} [${Index}+1]  style
        ${attribute_Value}  remove string  ${attribute}  fill:  ;
        ${actual_attribute_Value}  Strip String  ${attribute_Value}
        Should be equal  ${actual_attribute_Value}  ${Status_Color_List}[${Index}]
    END

S360_OP_Verify Active/Inative Node on Graph
   [Documentation]
    ${Total_GraphNode}=  Set Variable  0
    ${TotalElements}  Get Element Count  ${S360_OVERVIEW_TOTAL_NODES_ON_GRAPH}
    FOR    ${Index}  IN RANGE  0  ${TotalElements}
        ${Actual_GraphNode}  Get Text  ${S360_OVERVIEW_TOTAL_NODES_ON_GRAPH} [${Index}+1]
        ${Actual_GraphNode}  Convert To Integer  ${Actual_GraphNode}
        ${Total_GraphNode}     Evaluate  ${Total_GraphNode}+${Actual_GraphNode}
    END
    ${Actual_CardNode}  Get Text   ${S360_NODE_COUNT_TABLE}
    ${Actual_CardNode}  Convert To Integer  ${Actual_CardNode}
    should be equal   ${Actual_CardNode}  ${Total_GraphNode}

S360_OP_Verify Organisation,Sites,Environment,Nodes Count
    [Documentation]  Verifies Org,Sites,Env and Nodes Count from overview tab in table
    [Arguments]   ${Expected_Count_List}
    @{Expected_Count}  Split String  ${Expected_Count_List}  ,
    ${OrgCount}    Get Text  ${S360_ORGN_COUNT_TABLE}
    Should Be Equal    ${Expected_Count}[0]    ${OrgCount}
    ${SiteCount}   Get Text    ${S360_SITE_COUNT_TABLE}
    Should Be Equal    ${Expected_Count}[1]    ${SiteCount}
    ${EnvCount}    Get Text  ${S360_ENVR_COUNT_TABLE}
    Should Be Equal    ${Expected_Count}[2]    ${EnvCount}
    ${NodesCount}    Get Text  ${S360_NODE_COUNT_TABLE}
    Should Be Equal    ${Expected_Count}[3]    ${NodesCount}
