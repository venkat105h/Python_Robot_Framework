#------------------------------------------------------------------
#   Description       :      User defined Keywords for Site Defined Privilege
#   Project           :      Request Console Automation
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
Library         SeleniumLibrary  timeout=10.0
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/Operator_Locators.robot
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Designer_Keywords.robot
Resource        ../Locators/Admin_Locators.robot
Variables       ../Variables/${TESTENV}_Variable.py

*** Keywords ***
S360_RC_Click On Ship/Diagnostics
    [Documentation]  Enters name, data type, value, Description, Roles

    [Arguments]  ${Ship/Diag}

    @{Icons}=   Get WebElements    ${S360_GRAPH_ELEMENTS}
    ${TotalNumOfIcons}=  Get Length  ${Icons}
    ${SiteList}=  Create List
    # Click on site servers, so that it shows Line utilizations
    FOR    ${Elements}  IN  @{Icons}
        ${IndexNum}=  Get Index From List   ${Icons}  ${Elements}
        ${Index}=  Evaluate  ${IndexNum}+1
        ${AttributeVal}=   Get Element Attribute  ${S360_GRAPH_ELEMENTS} [${Index}]  href
        ${EnvStatus}=  Run Keyword And Return Status  Should Contain  ${AttributeVal}  Site_Server_Active
        ${ClassAttr}=  Get Element Attribute  ${S360_DIAGNOSTICS_ICON}  class
        ${IDAttr}=  Get Element Attribute  ${Elements}  id
        ${ClassAttrStatus}=  Run Keyword And Return Status  Should Not Contain  ${ClassAttr}  disabledShip
        Run Keyword If  '${ClassAttrStatus}'=='${TRUE}' and '${EnvStatus}'=='${TRUE}'  Run Keywords  Click Element  ${Elements}
        ...  AND  Sleep  2S
        ...  AND  Click Element  ${Ship/Diag}
        ...  AND  Exit For Loop
    END

    [Return]  ${IDAttr}

S360_RC_Navigate To Request Console Menu
    [Documentation]  Navigates To Request Console Menu

    Mouse Over  ${SEC/S360_HAMBURGER_MENU}
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_REQUEST_CONSOLE_HAM}
    Wait Until Element Is Visible  ${S360_RC_REQUESTOR_TEXT} [1]
    
S360_RC_Search Node Name
    [Documentation]    Searches for a node name    
    
    [Arguments]    ${NameOfNode}
    
    wait until keyword succeeds  5x  2s  Input Text  ${SEC/S360_SEARCH_BOX}  ${NameOfNode}
    Click Element  ${SEC/S360_SEARCH_BTN}
    Wait Until Element Is Visible  ${S360_RC_REQUESTOR_TEXT} [1]
    
    ${Total_Nodes}=  Get Element Count  ${S360_RC_NODE_NAME_TEXT}
    
    FOR    ${Index}  IN RANGE  1  ${Total_Nodes}+1
        ${NodeName_Text}=  Get Text  ${S360_RC_NODE_NAME_TEXT} [${Index}]
        Should Contain  ${NodeName_Text}  ${NameOfNode}
    END

SEC_RC_Enable Enterprise Notification in UniCloud
    [Documentation]    Enables enterprise notification in UniCloud for eng-svt
    
    