#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by other Robot scrits.
#	Project				:		UniSphere Operator Automation
#	Author				:		Dinesh Kumar
#	© 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable

*** Settings ***
Documentation     A Locator file with the element references

Library     SeleniumLibrary
Library     OperatingSystem
Library     String
Resource    ../Locators/Generic_Locators.robot
Resource    ../Locators/Designer_Locators.robot
Resource    ../Keywords/Generic_Keywords.robot

*** Keywords ***

S360_DSG_Navigate To Navigator Items
    [Documentation]  Navigate to scene
    [Arguments]  ${NavItem}
    Wait Until Element Is Visible  ${SEC/S360_TRASHCAN_COUNT}  timeout=10
    Wait until element is visible  ${SEC/S360_PIN_NAVIGATOR}
    Wait until keyword succeeds    3x    0.5s    SEC/S360_Pin/Unpin Navigator Menu    Pin
    Wait until element is visible    ${NavItem}
    sleep    3s
    wait until keyword succeeds    3x    0.5s    Click Element    ${NavItem}
    Wait Until Element Is Visible  ${S360_ADD_SCENE}  timeout=15


S360_DSG_Navigate To Add New Scene From Scene
    [Documentation]  Navigates to Add New Scene
    Click Element  ${S360_ADD_SCENE}
    Wait Until Element Is Visible  ${SEC/S360_NAME_TXT}  timeout=15
    Wait Until Element Is Visible  ${S360_PICKLIST_ITEM}  timeout=15


S360_DSG_Publish Scene
    [Documentation]  Publishes the scene

    Wait Until Element Is Visible  ${SEC/S360_FLOAT_PUBLISH_BTN}  timeout=15

#    sleep    1s
#    ${Disabled_Status}=    Run Keyword And Return Status    element should not be visible    ${SEC/S360_FLOAT_PUBLISH_DISABLED_BTN}
#    Run Keyword If  '${Disabled_Status}'=='${TRUE}'    [return]    fail

    Mouse Over     ${SEC/S360_FLOAT_PUBLISH_BTN}
    Click Element  ${SEC/S360_FLOAT_PUBLISH_BTN}
    sleep    10s
    Wait Until Element Is Visible    ${SEC/S360_MSG_CENTER}
#    Wait Until Element Is Visible    ${SEC/S360_MSG_CENTER}  timeout=240     #in case of a big scene it takes more than 2 minutes


S360_DSG_Search Scene In Designer
    [Documentation]  Search a card in Scene page
    [Arguments]   ${SceneName}
    Click Element  ${SEC/S360_CARDS_VIEW_BTN}
#    Run Keyword And Ignore Error   SEC/S360_Clear Text Field  ${SEC/S360_SEARCH_BOX}

    Sleep  1S
    # Enter scene name in search text box
    Input Text              ${SEC/S360_SEARCH_BOX}    ${SceneName}    TRUE
    Click Element           ${SEC/S360_SEARCH_BTN}
    Wait Until Element Is Visible    ${S360_SCENE_CARD_NAME} [1]  timeout=3
    Sleep  1S

    # Verifies the card name
    ${CardName}=  Get Text    ${S360_SCENE_CARD_NAME} [1]
    Run Keyword If  '${CardName}'!='${SceneName}'  Fail


S360_DSG_Delete An Item
    [Documentation]  Deletes a view
    ...  ${ViewName}: Name of the view to be deleted
    ...  ${MessageID}: Expected Message prefix
    [Arguments]  ${NavItem}  ${SceneName}  ${MessageID}

    # Navigates to view scene
    S360_DSG_Navigate To Navigator Items  ${NavItem}
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${SEC/S360_CLOSE_SUCCES_MASSEGE}
    Run Keyword If    ${present} == True    click element    ${SEC/S360_CLOSE_SUCCES_MASSEGE}

    Click Element  ${SEC/S360_CARDS_VIEW_BTN}
#    Run Keyword And Ignore Error  S360_DSG_Search Scene In Designer  ${SceneName}
    ${is_exist}=    run keyword and return status    S360_DSG_Search Scene In Designer    ${SceneName}
    return from keyword if    ${is_exist}==False

    # Deletes a view
    Mouse Over              ${SEC/S360_CARD_OPTION_MENU}
    Wait Until Element Is Visible    ${SEC/S360_DELETE_CARD_ICON}  timeout=15
    Execute Javascript      document.getElementById('${SEC/S360_DELETE_CARD_ICON}').click()
    Wait Until Element Is Visible    ${SEC/S360_DELETE_POP_BTN}  timeout=15
    Click Element           ${SEC/S360_DELETE_POP_BTN}
    Sleep  2S  # Till pop is dismissed and other elements are clickable

    ${PopupStatus}=  Run Keyword And Return Status  Element Should be Visible  ${SEC/S360_DELETE_POP_BTN}
    Run Keyword If  '${PopupStatus}'=='${TRUE}'  Click Element  ${SEC/S360_DELETE_POP_BTN}

    # Verifies success message
    SEC/S360_Verify Success Message  ${MessageID}


S360_DSG_Create And Publish A Scene In Designer
    [Documentation]  Creates a new scene and publish it
    [Arguments]     ${Name}     ${Description}

    # Selects the subordinate object
    S360_DSG_Add the Subordinates object    ${Name}     ${Description}

    # Publish the scene
    S360_DSG_Publish Scene
    SEC/S360_Verify Success Message  ${PublishedSuccMsgID}


S360_DSG_Create And Publish A Scene In Designer Using Existing Subordinates
    [Documentation]  Creates a new scene and publish it
    [Arguments]     ${Name}     ${Description}

    @{SceneSubs}  Create List  ${TestOrgOp}
    S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_SCENE_ITEM}  ${Name}  ${Description}  @{SceneSubs}

    # Publish the scene
    S360_DSG_Publish Scene
    SEC/S360_Verify Success Message  ${PublishedSuccMsgID}



S360_DSG_Add the Subordinates object
    [Documentation]  Add the subordinates to the scene
    [Arguments]     ${Name}     ${Description}

#    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#    Wait Until Element Is Visible   ${S360_SHOW_SUBORDINATES}  timeout=15
#
#    Click Element          ${S360_SHOW_SUBORDINATES}
#    Wait Until Element Is Visible   ${S360_FIRST_SUB_ITEM}  timeout=15
#
#    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#    ${js}        Get File              ${CURDIR}/drag-n-drop.js
#    Execute Javascript    ${js};  return DragNDrop('${S360_FIRST_SUB_ITEM}','${S360_DROP_PANEL}');
#    SEC/S360_Scroll Page To Location    0    0

    @{EnvSubs}  Create List  ${SiteServerName2}  ${SiteServerName3}

    Set Global Variable  ${EnvName}  ${TestEnvOp}
    S360_DSH_Create Scene/Org/Sites/Envs New   ${S360_ENV_ITEM}  ${EnvName}  ${TestDesc}  @{EnvSubs}

    @{SiteSubs}  Create List  ${EnvName}

    Set Global Variable  ${SiteName}  ${TestSiteOp}
    S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_SITES_ITEM}  ${SiteName}  ${TestDesc}  @{SiteSubs}

    @{OrgSubs}  Create List  ${SiteName}

    Set Global Variable  ${OrgName}  ${TestOrgOp}
    S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_ORGANIZATION_ITEM}  ${OrgName}  ${TestDesc}  @{OrgSubs}
    @{SceneSubs}  Create List  ${OrgName}

    S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_SCENE_ITEM}  ${Name}  ${Description}  @{SceneSubs}

S360_DSH_Create Scene/Org/Sites/Envs
    [Documentation]  This test case is to create Scene/Org/Sites/Env
    [Arguments]  ${NavLink}  ${Name}  ${Description}  @{SubordinateNames}
    Wait Until Element Is Visible  ${NavLink}  timeout=10
    wait until keyword succeeds  5x  3s  Click Element  ${NavLink}
    SEC/S360_Scroll Page To Location    0    0
    Wait Until Element Is Visible  ${S360_ADD_SCENE}  timeout=20
    S360_DSG_Navigate To Add New Scene From Scene

    # Enters Name and description
    Click Element  ${SEC/S360_NAME_TXT}
    Input Text     ${SEC/S360_NAME_TXT}  ${Name}
    Click Element  ${SEC/S360_DESC_TXT}
    Input Text     ${SEC/S360_DESC_TXT}  ${Description}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible   ${S360_SHOW_SUBORDINATES}  timeout=15

    Click Element          ${S360_SHOW_SUBORDINATES}
    Wait Until Element Is Visible   ${S360_FIRST_SUB_ITEM}  timeout=15

    FOR    ${SubNames}  IN  @{SubordinateNames}
        S360_DSG_Search and add the Subordinates  ${SubNames}
    END

    SEC/S360_Save Changes


S360_DSH_Create Scene/Org/Sites/Envs New
    [Documentation]  This test case is to create Scene/Org/Sites/Env
    [Arguments]  ${NavLink}  ${Name}  ${Description}  @{SubordinateNames}

    Wait Until Element Is Visible    ${NavLink}    timeout=10
    wait until keyword succeeds    5x    3s    Click Element    ${NavLink}
    SEC/S360_Scroll Page To Location    0    0
    Wait Until Element Is Visible    ${S360_ADD_SCENE}    timeout=20
    S360_DSG_Navigate To Add New Scene From Scene

    # Enters Name and description
    Click Element  ${SEC/S360_NAME_TXT}
    Input Text     ${SEC/S360_NAME_TXT}  ${Name}
    Click Element  ${SEC/S360_DESC_TXT}
    Input Text     ${SEC/S360_DESC_TXT}  ${Description}

    FOR    ${Name}    IN     @{SubordinateNames}
        SEC/S360_Scroll Page To Location  0  2000
        Wait Until Element Is Visible  ${S360_SearchAvailableOwnersTextField}  timeout=20
        Click Element  ${S360_SearchAvailableOwnersTextField}
        Input Text  ${S360_SearchAvailableOwnersTextField}    ${Name}
        Sleep  1S
        Click Element  ${S360_SelectSingleOwnerButton}
    END
    SEC/S360_Save Changes


S360_DSG_Search and add the Subordinates
    [Documentation]  Add the subordinates to the scene
    [Arguments]  ${SubordinateName}

    Click Element  ${S360_SEARCH_BOX}
    Input Text  ${S360_SEARCH_BOX}  ${SubordinateName}

    ${TotalMatchingNames}=  Get Element Count  ${S360_HIGHLIGHTED_SUB_NAMES}

    FOR    ${Index}  IN RANGE  1  ${TotalMatchingNames}+1
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        ${js}        Get File              ${CURDIR}/drag-n-drop.js
        Execute Javascript    ${js};  return DragNDrop('${S360_HIGHLIGHTED_SUB_NAMES}','${S360_DROP_PANEL}');
        SEC/S360_Scroll Page To Location    0    0
    END

    [Teardown]  SEC/S360_Clear Text Field  ${S360_SEARCH_BOX}


S360_DSH_Create Clouds and Data Sources
    [Documentation]  This test case is to create Clouds and Data Sources
    [Arguments]  ${NavLink}  ${Name}  ${Description}

    Click Element  ${NavLink}
    Wait Until Element Is Visible  ${S360_ADD_SCENE}  timeout=20
    S360_DSG_Navigate To Add New Scene From Scene

    # Enters Name and description
    Click Element  ${SEC/S360_NAME_TXT}
    Input Text     ${SEC/S360_NAME_TXT}  ${Name}
    Click Element  ${SEC/S360_DESC_TXT}
    Input Text     ${SEC/S360_DESC_TXT}  ${Description}
    SEC/S360_Save Changes


S360_DSG_Create Scene, Org, Env, Sites to Test In Operator
    [Documentation]   This test case is to create Scene with random subordinates
    SEC/S360_Pin/Unpin Navigator Menu  Pin
    Sleep  2S
    @{EnvSubs}  Create List  ${SiteServerName1}  ${SiteServerName2}  ${SiteServerName3}  ${SiteServerName4}
    Set Global Variable  ${EnvName}   ${Test_EnvName}
    S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_ENV_ITEM}  ${EnvName}  ${TestDesc}  @{EnvSubs}

    @{SiteSubs}  Create List  ${EnvName}
    Set Global Variable  ${SiteName}   ${Test_SiteName}
    S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_SITES_ITEM}  ${SiteName}  ${TestDesc}  @{SiteSubs}

    @{OrgSubs}  Create List  ${SiteName}
    Set Global Variable  ${OrgName}  ${Test_OrgName}
    S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_ORGANIZATION_ITEM}  ${OrgName}  ${TestDesc}  @{OrgSubs}

    @{SceneSubs}  Create List  ${OrgName}
    @{TestDesc_List}  Split String  ${TestDesc_List}  ,
    @{SceneName_List}=  Split String  ${SceneName_Details}  ,
    ${TotalElements}=  Get length  ${SceneName_List}
    FOR    ${Index}  IN RANGE  0  ${TotalElements}
        S360_DSH_Create Scene/Org/Sites/Envs New  ${S360_SCENE_ITEM}  ${SceneName_List}[${Index}]  ${TestDesc_List}[${Index}]  @{SceneSubs}
        S360_DSG_Publish Scene
        SEC/S360_Wait For Success Message
    END


S360_OP_Create Scenes,Orgs,Envs,Sites to Test In Operator
    [Documentation]   This test case is to create Scene with given Orgs,Envs,Sites
    [Arguments]   ${EnvNames}  ${SiteNames}  ${OrgNames}  ${SceneNameList}
    SEC/S360_Pin/Unpin Navigator Menu  Pin
    @{EnvSubs}  Create List  ${SiteServerName1}  ${SiteServerName2}  ${SiteServerName3}  ${SiteServerName4}
    S360_DSH_Create Scene/Org/Sites/Envs  ${S360_ENV_ITEM}  ${EnvName}  ${TestDesc}  @{EnvSubs}
    @{SiteSubs}=  Split String  ${EnvNames}  ,
    S360_DSH_Create Scene/Org/Sites/Envs  ${S360_SITES_ITEM}  ${SiteName}  ${TestDesc}  @{SiteSubs}
    @{OrgSubs}  =  Split String  ${SiteNames}  ,
    S360_DSH_Create Scene/Org/Sites/Envs  ${S360_ORGANIZATION_ITEM}  ${OrgName}  ${TestDesc}  @{OrgSubs}
    @{SceneSubs}  =  Split String  ${OrgNames}  ,
    @{SceneName_List}=  Split String  ${SceneName_Details}  ,
    FOR    ${SceneName}  IN  @{SceneName_List}
        S360_DSH_Create Scene/Org/Sites/Envs  ${S360_SCENE_ITEM}  ${SceneName}  ${TestDesc}  @{SceneSubs}
        S360_DSG_Publish Scene
        SEC/S360_Wait For Success Message
    END

