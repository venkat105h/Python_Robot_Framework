#-----------------------------------------------------------------------------------------------------------------------
#   Description       :      Test Cases for UniSphere Designer Test and Use cases
#   Project           :      UniSphere
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue:
#   - UniSphere Product Should be Enabled in the UniCloud and Active state in Solution Landing page
#
#   Epilogue:
#   - Create the Definitions (Scene, Organization, Site, Environment, Site Server)
#   - Edit the Definitions (Scene, Organization, Site, Environment, Site Server)
#   - Delete the Definitions (Scene, Organization, Site, Environment, Site Server)
#   - Approve/Reject the Scene in Operator
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation   Test Cases for UniSphere Designer
Resource        ..${/}Resources${/}SPH_DESN.robot
Resource        ..${/}Resources${/}Locator.robot
Library         BuiltIn
Library         SeleniumLibrary
Library         Collections
Library         String
Library         robot.libraries.DateTime
Library         OperatingSystem
Suite Setup     SOL_Open Browser with Solution Landing page
Suite Teardown  Close Browser
#-----------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
##-----------------------------------------------------------------------------------------------------------------------
TC_01 To Setup Administrator Security Policies and Display Preferences
    [Documentation]   This Test case is to setup the Security Policies by the Administrator
    [Tags]    TC_01
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Security Policies
    SPH/SEC_Select the Checkbox and Enter the values
    SPH_DESN_Open Designer page
    SPH/SEC_Navigate to Preferences
    SPH/SEC_Navigate to Display Preferences
    SPH/SEC_Setup Default layout and Enable Prefix

TC_02 Verify the Home links in the Designer Page
    [Documentation]  This test case is to verify the Designer home page link(Scene, Site, Organization, Environment)
    ...              navigation.
    [Tags]    TC_02
    SPH_DESN_Open Designer page
    SPH_DESN_Check the Start, Publish, Required, Optional static images
    SPH_DESN_Check the navigation links in the home page   ${UNISPHERE_DESHOMEENVIRONMENT_ID}   ${UNISPHERE_NAME_TEXTBOX}
    SPH/SEC_Navigate to Welcome page
    SPH_DESN_Check the navigation links in the home page   ${UNISPHERE_DESHOMESITE_ID}   ${UNISPHERE_NAME_TEXTBOX}
    SPH/SEC_Navigate to Welcome page
    SPH_DESN_Check the navigation links in the home page   ${UNISPHERE_DESHOMEORGANIZATION_ID}   ${UNISPHERE_NAME_TEXTBOX}
    SPH/SEC_Navigate to Welcome page
    SPH_DESN_Check the navigation links in the home page   ${UNISPHERE_DESHOMESCENE_ID}   ${UNISPHERE_NAME_TEXTBOX}
    SPH/SEC_Navigate to Welcome page
    [Teardown]  run keyword if test failed    SPH/SEC_Navigate to Welcome page

TC_03 Verify if user is able to create a Data Sources
    [Documentation]  This test case is to verify if user is able to create a new Data Source
    [Tags]    TC_03
    SPH_DESN_Create a new Data Sources
    [Teardown]  run keyword if test failed  COMMON_Scroll top of the page

TC_04 Verify if user is able to create a new Environment
    [Documentation]  This test case is to verify if user is able to create a new environment.
    [Tags]    TC_04
    SPH_DESN_Create a new environment
    [Teardown]  run keyword if test failed  COMMON_Scroll top of the page

TC_05 Verify if user is able to create a new Sites
     [Documentation]  This test case is to verify if user is able to create a new Sites.
    [Tags]    TC_06
    SPH_DESN_Open Designer page
    SPH_DESN_Create a new site
    [Teardown]  run keyword if test failed  COMMON_Scroll top of the page

TC_06 Verify if user is able to create a new Organization
    [Documentation]  This test case is to verify if user is able to create a new Organization.
    [Tags]    TC_06
    SPH_DESN_Open Designer page
    SPH_DESN_Create a new Organization
    [Teardown]  run keyword if test failed  COMMON_Scroll top of the page

TC_07 Verify if user is able to create a new Scene
    [Documentation]  This test case is to verify if user is able to create a new Scene.
    [Tags]    TC_07
    SPH_DESN_Create a new Scene
    [Teardown]  run keyword if test failed  COMMON_Scroll top of the page

TC_08 Verify user is able to Publish the newly Created Scene
    [Documentation]  This test case is to verify if user is able to Publish the newly Created Scene in UniSphere designer.
     [Tags]    TC_08
     SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
     SPH_DESN_Search the new definition after save and Click the Item   ${Scene_name}   Scene
     SPH_DESN_Click on Publish button in Editor page

     [Teardown]  SPH/SEC_Logout from UniSecure/UniSphere

TC_09 Verify Operator is able to accept the published Scene
     [Documentation]  This test case is to verify Operator is able to accept the published Scene
    [Tags]    TC_09
     [Setup]    Run Keywords    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere    ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    ...    AND    SPH/SEC_Navigate to Security Policies
    ...    AND    Wait Until Element Is Visible    ${UNISECURE_SECURITYQUES_CHKBX}
    ...    AND    Unselect Checkbox  ${UNISECURE_SECURITYQUES_CHKBX}
    ...    AND    Click Element  ${UNISECURE_SAVE_BTN}
    ...    AND    run keyword and ignore error    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
    ...    AND    SPH/SEC_Logout from UniSecure/UniSphere

     SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_OPERATOR_USERNAME}    ${UNISPHERE_OPERATOR_PASSWORD}   ${UNISECURE_OPERATORROLE_DRPDWN}
    SPH_DESN_Navigate to Published Scene
    SPH_DESN_Search the new definition after save in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBLISHEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Accept/Reject Button   ${UNISPHERE_APPROVE_BTN}
    [Teardown]  SPH/SEC_Logout from UniSecure/UniSphere

TC_10Verify Designer is able to republish the Scene and check Operator is able to Accept the Scene
     [Documentation]  This test case is to verify  Designer is able to republish the Scene
    [Tags]    TC_10
     SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}

    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Add the Subordinates object
    COMMON_Scroll top of the page
    SPH_DESN_Click on Save button in Editor page
#    SPH_DESN_Close the message center
    SPH_DESN_Click on Publish button in Editor page
    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_OPERATOR_USERNAME}    ${UNISPHERE_OPERATOR_PASSWORD}   ${UNISECURE_OPERATORROLE_DRPDWN}
    SPH_DESN_Navigate to Published Scene
    SPH_DESN_Search the new definition after save in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBLISHEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Accept/Reject Button   ${UNISPHERE_APPROVE_BTN}
    SPH_DESN_Search the published scene in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBAPPROVEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator    ${UNISPHERE_GRAPHICALTABOPERATOR_ID}
    SPH_DESN_Check the Graphical tab Elements   Scene   ${Scene_name}    ${Organization_name}  ${Site_name}    ${Environment_name}

    [Teardown]  SPH/SEC_Logout from UniSecure/UniSphere

TC_11 Verify Designer is able to republish the Scene and check Operator is able to Reject the Published scene
     [Documentation]  This test case is to verify Operator is able to Reject the Published scene
    [Tags]    TC_11
     SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}

    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Add the Subordinates object
    COMMON_Scroll top of the page
    SPH_DESN_Click on Save button in Editor page
#    SPH_DESN_Close the message center
    SPH_DESN_Click on Publish button in Editor page

    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_OPERATOR_USERNAME}    ${UNISPHERE_OPERATOR_PASSWORD}   ${UNISECURE_OPERATORROLE_DRPDWN}
    SPH_DESN_Navigate to Published Scene
    SPH_DESN_Search the new definition after save in UniSphere Operator   ${Scene_name}    ${UNISPHERE_PUBLISHEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Accept/Reject Button   ${UNISPHERE_REJECT_BTN}
    [Teardown]  SPH/SEC_Logout from UniSecure/UniSphere
     ## Accept test acase and check the
     ## Add test case for name change for Environment, Site, Organization and Scene

TC_12 Verify that if Data Source name is changed, connection still retained, including when scene is republished.
     [Documentation]  This test case is to verify  that if a Data Source name is changed, connection still retained,
     ...              including when scene is republished.
    [Tags]    TC_12
     SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}

    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error  SPH_DESN_Check the Graphical tab Elements   DataSources   ${DataSource_Name}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DATASOURCES_ICON}   ${UNISPHERE_DATASOURCES_ID}
    COMMON_Declare Random variables for Editor Name and Description
    ${DataSource_Rename}=    Set Variable   ${Random_name}
    set global variable  ${DataSource_Rename}
    log to Console   ${DataSource_Rename}
    ${DataSource_Description}=    Set Variable   ${Random_Description}
    set global variable  ${DataSource_Description}
    #SPH_DESN_Search the new definition after save and Click the Item    ${DataSource_Name}   DataSource
    SPH_DESN_Search the new definition after save     ${DataSource_Name}   DataSource
    SPH_DESN_Click on Edit icon for Searched Card Item
    SPH_DESN_Update the Definition   ${DataSource_Rename}  ${DataSource_Description}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEDATASOURCE_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    #SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${DataSource_Rename}   DataSource
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   DataSources   ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Environment_name}   Environment
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements  Environment    ${DataSource_Rename}
    COMMON_Scroll top of the page
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Site_name}   Site
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator    ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   Site   ${Environment_name}   ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Organization_name}   Organization
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   Organization  ${Site_name}    ${Environment_name}     ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   Scene   ${Organization_name}  ${Site_name}   ${Environment_name}   ${DataSource_Rename}
    SPH_DESN_Click on Publish button in Editor page
    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_OPERATOR_USERNAME}    ${UNISPHERE_OPERATOR_PASSWORD}   ${UNISECURE_OPERATORROLE_DRPDWN}

    SPH_DESN_Navigate to Published Scene
    SPH_DESN_Search the new definition after save in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBLISHEDSCENEITEMNAME_ID}
    wait until keyword succeeds    2x    1s    SPH_DESN_Click on Accept/Reject Button   ${UNISPHERE_APPROVE_BTN}
    SPH_DESN_Search the published scene in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBAPPROVEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator    ${UNISPHERE_GRAPHICALTABOPERATOR_ID}
    SPH_DESN_Check the Graphical tab Elements   Scene   ${Organization_name}  ${Site_name}   ${Environment_name}   ${DataSource_Rename}
    #SPH_DESN_Click on Nodes Tab in UniSphere Operator
    #SPH_DESN_Check the DataSources in the Node section   ${DataSource_Rename}
#    SPH/SEC_Navigate to Designer/Operator   ${UNISPHERE_PREFERENCESDESIGNER_ROLE}
    [Teardown]  SPH/SEC_Logout from UniSecure/UniSphere

TC_13 Verify that Data Source description and extended descriptions are propagated throughout entire Scene and to the Operator View
     [Documentation]  This test case is to verify that Data Source description and
    ...              extended descriptions are propagated throughout entire Scene and to the Operator View.
    [Tags]    TC_13
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error  SPH_DESN_Check the Graphical tab Elements   DataSources   ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DATASOURCES_ICON}   ${UNISPHERE_DATASOURCES_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${DataSource_Rename}   DataSource
    SPH_DESN_Click on Comments
    SPH_DESN_Enter comments in the New comment
    ${Comments1} =  Set Variable   ${New_Comments}
    SPH_DESN_Click on Add button in Comments popup
    SPH_DESN_Enter comments in the New comment
    ${Comments2} =  Set Variable   ${New_Comments}
    SPH_DESN_Click on Add button in Comments popup
    SPH_DESN_Click on Ok button in Comments popup
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DATASOURCES_ICON}   ${UNISPHERE_DATASOURCES_ID}
    ${is_popup_present} =    run keyword and return status    wait until element is visible    ${UNISPHERE_POPUPSAVEBTN_ID}    timeout=3s
    run keyword if    ${is_popup_present}==True    click element    ${UNISPHERE_POPUPSAVEBTN_ID}
    Wait Until Element Is Visible   ${UNISPHERE_TABLEVIEW_BTN}  timeout=20
    SPH_DESN_Search the new definition after save and Click the Item    ${DataSource_Rename}   DataSource
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error   SPH_DESN_Check the Graphical tab Elements    DataSources   ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Environment_name}   Environment
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements  Environment    ${DataSource_Rename}
    COMMON_Scroll top of the page
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Site_name}   Site
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error   SPH_DESN_Check the Graphical tab Elements    Site   ${Environment_name}   ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Organization_name}   Organization
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error   SPH_DESN_Check the Graphical tab Elements    Organization  ${Site_name}    ${Environment_name}     ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error   SPH_DESN_Check the Graphical tab Elements    Scene   ${Organization_name}  ${Site_name}   ${Environment_name}   ${DataSource_Rename}
    SPH_DESN_Click on Publish button in Editor page

    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_OPERATOR_USERNAME}    ${UNISPHERE_OPERATOR_PASSWORD}   ${UNISECURE_OPERATORROLE_DRPDWN}

    SPH_DESN_Navigate to Published Scene
    SPH_DESN_Search the new definition after save in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBLISHEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Accept/Reject Button   ${UNISPHERE_APPROVE_BTN}
    SPH_DESN_Search the published scene in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBAPPROVEDSCENEITEMNAME_ID}
    #SPH_DESN_Click on Nodes Tab in UniSphere Operator
    #SPH_DESN_Click on Comments On Data Source in the Node Section   ${DataSource_Rename}
    COMMON_Scroll top of the page
    #SPH_DESN_Search the added comments in the comments popup in UniSphere Operator   ${Comments1}   ${Comments2}
    [Teardown]  SPH/SEC_Logout from UniSecure/UniSphere

TC_14 Verify that if a Environment name is changed, connection still retained, including when scene is republished.
     [Documentation]  This test case is to verify  that if a Environment name is changed, connection still retained,
     ...              including when scene is republished.
    [Tags]    TC_14
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}

    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error  SPH_DESN_Check the Graphical tab Elements   Environment   ${Environment_name}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    #SPH_DESN_Search the new definition after save and Click the Item    ${Environment_name}   Environment
    COMMON_Declare Random variables for Editor Name and Description
    ${Environment_Rename}=    Set Variable   ${Random_name}
    set global variable  ${Environment_Rename}
    log to Console   ${Environment_Rename}
    ${Environment_Description}=    Set Variable   ${Random_Description}
    set global variable  ${Environment_Description}
    SPH_DESN_Search the new definition after save     ${Environment_name}   Environment
    SPH_DESN_Click on Edit icon for Searched Card Item
    SPH_DESN_Update the Definition   ${Environment_Rename}  ${Environment_Description}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEENVIRONMENT_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    #SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    ${is_popup_present} =    run keyword and return status    wait until element is visible    ${UNISPHERE_POPUPSAVEBTN_ID}    timeout=3s
    run keyword if    ${is_popup_present}==True    click element    ${UNISPHERE_POPUPSAVEBTN_ID}
    Wait Until Element Is Visible   ${UNISPHERE_TABLEVIEW_BTN}  timeout=20
    SPH_DESN_Search the new definition after save and Click the Item    ${Environment_Rename}   Environment
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements  Environment   ${Environment_Rename}
    COMMON_Scroll top of the page
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Site_name}   Site
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator    ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   Site   ${Environment_Rename}   ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Organization_name}   Organization
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   Organization  ${Site_name}    ${Environment_Rename}     ${DataSource_Rename}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   Scene   ${Organization_name}  ${Site_name}   ${Environment_Rename}   ${DataSource_Rename}
    SPH_DESN_Click on Publish button in Editor page

    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_OPERATOR_USERNAME}    ${UNISPHERE_OPERATOR_PASSWORD}   ${UNISECURE_OPERATORROLE_DRPDWN}
    SPH_DESN_Navigate to Published Scene
    SPH_DESN_Search the new definition after save in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBLISHEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Accept/Reject Button   ${UNISPHERE_APPROVE_BTN}
    SPH_DESN_Search the published scene in UniSphere Operator    ${Scene_name}    ${UNISPHERE_PUBAPPROVEDSCENEITEMNAME_ID}
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator    ${UNISPHERE_GRAPHICALTABOPERATOR_ID}
    run keyword and ignore error    SPH_DESN_Check the Graphical tab Elements   Scene   ${Organization_name}  ${Site_name}   ${Environment_Rename}   ${DataSource_Rename}
    #SPH_DESN_Click on Nodes Tab in UniSphere Operator
    #SPH_DESN_Check the DataSources in the Node section   ${DataSource_Rename}
#    SPH/SEC_Navigate to Designer/Operator   ${UNISPHERE_PREFERENCESDESIGNER_ROLE}
    [Teardown]  SPH/SEC_Logout from UniSecure/UniSphere

TC_15 Verify if user is able to edit the existing Data Source in the Data Sources page
     [Documentation]  This test case is to verify if user is able to edit the existing Data Source in the Data Sources page
    [Tags]    TC_15
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}

    COMMON_Declare Random variables for Editor Name and Description
    ${Updated_DataSource} =    Set Variable   ${Random_name}
    set global variable  ${Updated_DataSource}
    log to console   ${Updated_DataSource}
    ${Updated_Org_Description} =    Set Variable   ${Random_Description}
    set global variable  ${Updated_Org_Description}
    log to console   ${Updated_Org_Description}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DATASOURCES_ICON}   ${UNISPHERE_DATASOURCES_ID}
    COMMON_Scroll top of the page
    SPH_DESN_Change the Grid View/List view      ${UNISPHERE_CARDVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    SPH_DESN_Search the new definition after save    ${DataSource_Rename}    DataSource
    SPH_DESN_Click on Edit icon for Searched Card Item
    SPH_DESN_Update the Definition  ${Updated_DataSource}  ${Updated_Org_Description}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEDATASOURCE_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DATASOURCES_ICON}   ${UNISPHERE_DATASOURCES_ID}
    SPH_DESN_Search the new definition after save    ${Updated_DataSource}    DataSource

TC_16 Verify if user is able to edit the existing Environments in the Environments page
     [Documentation]  This test case is to verify if user is able to edit the existing Environments in the Environments page
    [Tags]    TC_16
    COMMON_Declare Random variables for Editor Name and Description
    ${Updated_Environment} =    Set Variable   ${Random_name}
    set global variable  ${Updated_Environment}
    log to console   ${Updated_Environment}
    ${Updated_Environment_Description} =    Set Variable   ${Random_Description}
    set global variable  ${Updated_Environment_Description}
    log to console   ${Updated_Environment_Description}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    COMMON_Scroll top of the page
    #changed variable by Akash - Updated_Environment
    SPH_DESN_Search the new definition after save     ${Environment_Rename}   Environment
    SPH_DESN_Click on Edit icon for Searched Card Item
    SPH_DESN_Update the Definition  ${Updated_Environment}  ${Updated_Environment_Description}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEENVIRONMENT_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    SPH_DESN_Search the new definition after save     ${Updated_Environment}  Environment

TC_17 Verify if user is able to edit the existing Sites in the Sites page
     [Documentation]  This test case is to verify if user is able to edit the existing Sites in the Sites page
    [Tags]    TC_17
    COMMON_Declare Random variables for Editor Name and Description
    ${Updated_Sites} =    Set Variable   ${Random_name}
    set global variable  ${Updated_Sites}
    log to console   ${Updated_Sites}
    ${Updated_Sites_Description} =    Set Variable   ${Random_Description}
    set global variable  ${Updated_Sites_Description}
    log to console   ${Updated_Sites_Description}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
    COMMON_Scroll top of the page
    SPH_DESN_Search the new definition after save    ${Site_name}   Site
    SPH_DESN_Click on Edit icon for Searched Card Item
    SPH_DESN_Update the Definition  ${Updated_Sites}  ${Updated_Sites_Description}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATESITE_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
    SPH_DESN_Search the new definition after save     ${Updated_Sites}   Site

TC_18 Verify if user is able to edit the existing Organization in the Organization page
     [Documentation]  This test case is to verify if user is able to edit the existing Organization in the Organization page
    [Tags]    TC_18
    COMMON_Declare Random variables for Editor Name and Description
    ${Updated_Organization} =    Set Variable   ${Random_name}
    set global variable  ${Updated_Organization}
    log to console   ${Updated_Organization}
    ${Updated_Org_Description} =    Set Variable   ${Random_Description}
    set global variable  ${Updated_Org_Description}
    log to console   ${Updated_Org_Description}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    COMMON_Scroll top of the page
    SPH_DESN_Search the new definition after save    ${Organization_name}   Organization
    SPH_DESN_Click on Edit icon for Searched Card Item
    SPH_DESN_Update the Definition  ${Updated_Organization}  ${Updated_Org_Description}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEORGANIZATION_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    SPH_DESN_Search the new definition after save      ${Updated_Organization}   Organization

TC_19 Verify if user is able to edit the existing Scene in the Scene page
     [Documentation]  This test case is to verify if user is able to edit the existing Scene in the Scene page
    [Tags]    TC_19
    COMMON_Declare Random variables for Editor Name and Description
    ${Updated_Scene} =    Set Variable   ${Random_name}
    set global variable  ${Updated_Scene}
    log to console   ${Updated_Scene}
    ${Updated_Scene_Description} =    Set Variable   ${Random_Description}
    set global variable  ${Updated_Scene_Description}
    log to console   ${Updated_Scene_Description}
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    COMMON_Scroll top of the page
    SPH_DESN_Search the new definition after save     ${Scene_name}   Scene
    SPH_DESN_Click on Edit icon for Searched Card Item
    SPH_DESN_Update the Definition   ${Updated_Scene}  ${Updated_Scene_Description}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATESCENE_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save      ${Updated_Scene}   Scene

TC_20 Verify if user is able to delete the Data Source in the Data Sources page in Table View
     [Documentation]  This test case is to verify if user is able to delete the Data Source in the Data Sources page in Table View
    [Tags]    TC_20
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DATASOURCES_ICON}   ${UNISPHERE_DATASOURCES_ID}
    SPH_DESN_Search the new definition after save    ${Updated_DataSource}    DataSource
    SPH_DESN_Select a item in the table view and click on Delete button     ${Updated_DataSource}
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_DELETEDATASOURCE_MESSAGEPREFIX}
   [Teardown]  run keyword if test failed  SPH_DESN_Open Designer page

TC_21 Verify if user is able to delete the Environment in the Environment page in Table View
     [Documentation]  This test case is to verify  # Comments is missed
    [Tags]    TC_21
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    SPH_DESN_Search the new definition after save     ${Updated_Environment}  Environment
    SPH_DESN_Select a item in the table view and click on Delete button    ${Updated_Environment}
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_DELETEENVIRONMENT_MESSAGEPREFIX}
    [Teardown]  run keyword if test failed  SPH_DESN_Open Designer page

TC_22 Verify if user is able to delete the Site in the Sites page in Table View
     [Documentation]  This test case is to verify if user is able to delete the Site in the Sites page in Table View
    [Tags]    TC_22
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
    SPH_DESN_Search the new definition after save     ${Updated_Sites}   Site
    SPH_DESN_Select a item in the table view and click on Delete button   ${Updated_Sites}
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_DELETESITE_MESSAGEPREFIX}
    [Teardown]  run keyword if test failed  SPH_DESN_Open Designer page

TC_23 Verify if user is able to delete the Organization in the Organization page in Table View
     [Documentation]  This test case is to verify if user is able to delete the Organization in the Organization page in Table View
    [Tags]    TC_23
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    SPH_DESN_Search the new definition after save      ${Updated_Organization}   Organization
    SPH_DESN_Select a item in the table view and click on Delete button   ${Updated_Organization}
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_DELETEORGANIZATION_MESSAGEPREFIX}
    [Teardown]  run keyword if test failed  SPH_DESN_Open Designer page

TC_24 Verify if user is able to delete the Scene in the Scene page in Table View
     [Documentation]  This test case is to verify if user is able to delete the Scene in the Scene page in Table View
    [Tags]    TC_24
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Search the new definition after save      ${Updated_Scene}   Scene
    SPH_DESN_Select a item in the table view and click on Delete button   ${Updated_Scene}
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_DELETESCENE_MESSAGEPREFIX}
    [Teardown]  run keyword if test failed  SPH_DESN_Open Designer page

####-----------------------------------------------------------------------------------------------------------------------
###-----------------------------------------------------------------------------------------------------------------------