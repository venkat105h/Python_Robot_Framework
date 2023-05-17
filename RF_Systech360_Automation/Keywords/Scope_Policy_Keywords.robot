*** Settings ***
Documentation     Common method used accross Test Suite

Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Operator_Keywords.robot
#Resource        ../Tests/Scope_Policy.robot
Resource        ../Locators/Scope_Policy_Locators.robot


*** Variables ***

${Scope_Policy_Name_1} =    00Policy 5
${Scope_Policy_Name_0} =    Policy 0
#${Scope_Policy_Description} =  Policy 5 1-node


*** Keywords ***

Enable_Disable Scope Policies
    [Documentation]    Enable/Disable the Scope Policies
    [Arguments]    ${Enabe_Disable}
    SEC/S360 Navigate to Card    ${SEC/S360_ADMIN_SECURITY_POLICIES_CARD}    ${SEC/S360_ADMIN_SECURITY_POLICIES_HEADER}
    wait until element is visible    ${Activate_Scope_Policies_Chechkbox}
    ${checkbox_selected}=  checkbox should be selected  ${Activate_Scope_Policies_Chechkbox}
    Run Keyword If    '${Enabe_Disable}'=='Enable' and '${checkbox_selected}'!='False'    Click Element    ${Activate_Scope_Policies_Chechkbox}
    ...  ELSE    Run Keyword If    '${Enabe_Disable}'=='Disable' and '${checkbox_selected}'=='True'  Click Element  ${Activate_Scope_Policies_Chechkbox}
    Save Security Policies
    SEC/S360 Navigate To Landing Page


Activate Scope policy
    SEC/S360 Navigate to Card    ${SEC/S360_ADMIN_SECURITY_POLICIES_CARD}    ${SEC/S360_ADMIN_SECURITY_POLICIES_HEADER}
    wait until element is visible  ${Activate_Scope_Policies_Chechkbox}
    wait until keyword succeeds    3x    2s    click element  ${Activate_Scope_Policies_Chechkbox}
    Save Security Policies
    SEC/S360 Navigate To Landing Page


Activate Scope policy if disabled
    wait until element is visible  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until keyword succeeds    3x    2s    click element    ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    ${Result}  run keyword and return status  wait until element is visible    ${Scope_Policy_Header}
    run keyword if    '${Result}' == 'False'    Activate Scope policy


Validate that Scope Policies card is disabled
    SEC/S360 Navigate To Landing Page
    wait until element is visible  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until keyword succeeds    3x    2s    click element  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    page should not contain element  ${Scope_Policy_Header}


Disable Scope Policies card from Security Policies
    wait until element is visible  ${Activate_Scope_Policies_Chechkbox}
    wait until keyword succeeds    3x    2s    Unselect Checkbox  ${Activate_Scope_Policies_Chechkbox}
    Save Security Policies


Enable Scope Policies card from Security Policies
    wait until element is visible  ${Activate_Scope_Policies_Chechkbox}
    wait until keyword succeeds    3x    2s    Select Checkbox  ${Activate_Scope_Policies_Chechkbox}
    Save Security Policies
    wait until element is visible    //*[@id="homeSelected"]
    click element    //*[@id="homeSelected"]


Save Security Policies
    wait until element is visible  ${Security_Policies_Save_Changes_Button}
    wait until keyword succeeds    3x    2s    click element    ${Security_Policies_Save_Changes_Button}
    wait until element is not visible    ${SEC/S360_DIRTY_FLAG}
    wait until element is visible  ${Policies_Succesfully_Updated_Text}
    wait until element is visible  ${Dismiss_All_Messages_Button}
    wait until keyword succeeds    3x    2s    click element  ${Dismiss_All_Messages_Button}


Validate that Scope tab is hidden in the Group Editor
    wait until element is visible  ${SEC/S360_ADMIN_USERS_GROUPS_CARD}
    wait until keyword succeeds    3x    2s    click element  ${SEC/S360_ADMIN_USERS_GROUPS_CARD}
    wait until element is enabled    ${USer_Image_Forc_Click}
    wait until element is visible    ${Operator_Group_Edit_Tab}
    wait until element is enabled    ${Operator_Group_Edit_Tab}
    wait until keyword succeeds    3x    2s    click element  ${Operator_Group_Edit_Tab}
    wait until element is visible    ${Operator_Group_Edit_Roles_Tab}
    wait until element is enabled    ${Operator_Group_Edit_Roles_Tab}
    page should not contain  ${Operator_Group_Edit_Scope_Tab}


Go check if scope tab exist in group editor
    wait until element is visible  ${SEC/S360_ADMIN_USERS_GROUPS_CARD}
    wait until keyword succeeds    3x    2s    click element  ${SEC/S360_ADMIN_USERS_GROUPS_CARD}
    wait until element is enabled  ${USer_Image_Forc_Click}
    wait until element is visible  ${Operator_Group_Edit_Tab}
    wait until element is enabled  ${Operator_Group_Edit_Tab}
    wait until keyword succeeds    3x    2s    click element  ${Operator_Group_Edit_Tab}
    wait until element is visible  ${Operator_Group_Edit_Scope_Tab}


Input Security Questions
    wait until element is visible  ${Security_Question_1}
    input text  ${Security_Question_1}  1
    wait until element is visible  ${Security_Question_2}
    input text  ${Security_Question_2}  2
    wait until element is visible  ${Security_Question_3}
    input text  ${Security_Question_3}  3
    wait until element is visible  ${Security_Question_4}
    input text  ${Security_Question_4}  4
    wait until element is visible  ${Security_Question_5}
    input text  ${Security_Question_5}  5
    wait until element is visible  ${Security_Question_6}
    input text  ${Security_Question_6}  6
    wait until element is visible  ${Security_Question_7}
    input text  ${Security_Question_7}  7
    wait until element is visible  ${Security_Question_8}
    input text  ${Security_Question_8}  8
    wait until element is visible  ${Security_Question_9}
    input text  ${Security_Question_9}  9
    wait until element is visible  ${Security_Question_10}
    input text  ${Security_Question_10}  10
    wait until element is visible  ${Security_Question_11}
    input text  ${Security_Question_11}  11
    wait until element is visible  ${Security_Question_12}
    input text  ${Security_Question_12}  12
    wait until element is visible  ${Security_Question_Ok_button}
    wait until keyword succeeds    3x    2s    click element  ${Security_Question_Ok_button}
    wait until element is visible  ${Security_Questions_Save_button}
    mouse over  ${Security_Questions_Save_button}
    sleep  1s
    wait until keyword succeeds    3x    2s    click element  ${Security_Questions_Save_button}


Enable Role/Previleges dropdown
    wait until element is visible  ${Role/Previleges_Edit_Enable_button}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Edit_Enable_button}


Enable_Roles_For_Test064_Account
    wait until element is visible  ${Role/Privileges}
    wait until keyword succeeds    3x    2s    click element  ${Role/Privileges}
    wait until element is visible  ${Role/Previleges_Operator}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Operator}
    wait until element is visible  ${Role/Previleges_EN_Edit_Button}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_EN_Edit_Button}
    Enable Role/Previleges dropdown
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_EN_Save_Button}
    wait until element is visible  ${Role/Previleges_EN_Send_Comand_Edit_Button}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_EN_Send_Comand_Edit_Button}
    Enable Role/Previleges dropdown
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_EN_Send_Comand_Save_Button}
    wait until element is visible  ${Role/Previleges_EN_Update_Comand_Edit_Button}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_EN_Update_Comand_Edit_Button}
    Enable Role/Previleges dropdown
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_EN_Update_Comand_Save_Button}
    wait until element is visible  ${Role/Previleges_Show_Case_History_Edit_Button}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Show_Case_History_Edit_Button}
    Enable Role/Previleges dropdown
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Show_Case_History_Save_Button}
    wait until element is visible  ${Role/Previleges_Show_renewal_Information_Edit_Button}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Show_renewal_Information_Edit_Button}
    Enable Role/Previleges dropdown
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Show_renewal_Information_Save_Button}
    wait until element is visible  ${Role/Previleges_Second_page}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Second_page}
    wait until element is visible  ${Role/Previleges_Vault_Edit_Button}
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Vault_Edit_Button}
    Enable Role/Previleges dropdown
    wait until keyword succeeds    3x    2s    click element  ${Role/Previleges_Vault_Save_Button}
    wait until element is visible  ${Save_Button_User/Group}
    wait until keyword succeeds    3x    2s    click element  ${Save_Button_User/Group}
    wait until element is not visible    ${SEC/S360_DIRTY_FLAG}
    wait until element is visible  ${User/Groups_Header}
    scroll element into view  ${User/Groups_Header}
    wait until keyword succeeds    3x    2s    click element  ${User/Groups_Header}


Remove Filter
    [Arguments]  ${Card}  ${Filter_Name}
    wait until element is visible  ${Card}
    wait until keyword succeeds    3x    2s    click element  ${Card}
    wait until element is visible    ${Filter_button}/div['${Filter_Name}']
    mouse over    ${Filter_button}/div['${Filter_Name}']
    wait until element is visible  ${Remove_Filter}
    wait until keyword succeeds    3x    2s    click element    ${Remove_Filter}
    wait until page does not contain element    ${Filter_button}
    SEC/S360 Navigate To Landing Page


Remove View
    [Arguments]    ${ViewName}
    S360_Verify Delete A View    ${ViewName}    ${DeleteViewSuccMsgID}    yes
    SEC/S360_Empty Trash


Verify that Scope Policy card is enabled and return back to administrator
    SEC/S360 Navigate To Landing Page
    wait until element is visible  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until keyword succeeds    3x    2s    click element  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until element is visible  ${Scope_Policy_Header}
    wait until keyword succeeds    3x    2s    click element  ${Scope_Policy_Administrator_Header}


Go Check that Unisecure doesn't show scope policy
    wait until element is visible  ${unisecure_tab_locator}
    wait until keyword succeeds    3x    2s    click element  ${unisecure_tab_locator}
    wait until element is visible  ${Unisecure_Administrator_Tab}
    wait until keyword succeeds    3x    2s    click element  ${Unisecure_Administrator_Tab}
    wait until element is visible  ${Unisecure_User/Group}    timeout=30s
    wait until keyword succeeds    3x    2s    click element  ${Unisecure_User/Group}
    wait until element is visible  ${USer_Image_Forc_Click}
    #changed from ${unisecure_user/group_operator} to ${Unisecure_User/Group_O} by Akash
    #scroll element into view  ${unisecure_user/group_operator}
    #wait until keyword succeeds    3x    2s    click element  ${unisecure_user/group_operator}
    scroll element into view  ${Unisecure_User/Group_O}
    wait until keyword succeeds    3x    2s    click element  ${Unisecure_User/Group_O}
    page should not contain element  ${Scope_Policy_Header}


Verify that there are all needed nodes
#    wait until page contains element  ${Eng_Dev1}
    wait until page contains element  ${Eng_QA360}
    #wait until page contains element  ${Eng_QA6410}
    #wait until page contains element  ${Eng_Dev4}
    #wait until page contains element  ${Eng_Dev5}


Create Scope Policy
    [Arguments]  ${Node}  ${Scope_Policy_Name}  ${Scope_Policy_Description}
    wait until element is enabled  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until keyword succeeds    3x    2s    click element  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until element is visible  ${Scope_Policy_Header}
    run keyword and ignore error   Delete Scoppe_Policy   ${Scope_policy_card_prefix}${Scope_Policy_5}${Scope_policy_card_suffix}    ${Scope_policy_delete_prefix}${Scope_Policy_5}${Scope_policy_delete_suffix}
    wait until page contains element  ${Add_Scope_Policy}
    wait until keyword succeeds    3x    2s    click element  ${Add_Scope_Policy}
    wait until page contains element  ${Scope_Policy_'New'_Header}
    wait until element is visible  ${Scope_Policy_Name_Input_Field}
    input text  ${Scope_Policy_Name_Input_Field}  ${Scope_Policy_Name}
    wait until element is visible  ${Scope_Policy_Description_Input_Filed}
    input text  ${Scope_Policy_Description_Input_Filed}  ${Scope_Policy_Description}
    wait until element is visible  ${Node}
    wait until keyword succeeds    3x    2s    click element  ${Node}
    wait until keyword succeeds    3x    2s    click element  ${Scope_Policy_Select_Node_Button}
    wait until element is visible  ${Save_Scope_Policy_Button}
    wait until keyword succeeds    3x    2s    click element  ${Save_Scope_Policy_Button}
    wait until element is not visible    ${SEC/S360_DIRTY_FLAG}
    wait until element is visible  ${Scope_Policy_header_In_Add_Policy}
    wait until keyword succeeds    3x    2s    click element  ${Scope_Policy_header_In_Add_Policy}
    wait until element is visible   //*[@id="searchBox"]
    input text  //*[@id="searchBox"]    ${Scope_Policy_Name}
    wait until keyword succeeds    3x    2s    click element    //*[@id="searchBtn"]
    wait until page contains  ${Scope_Policy_Name}
    wait until element is visible  ${Scope_Policy_Administrator_Header}
    wait until keyword succeeds    3x    2s    click element  ${Scope_Policy_Administrator_Header}
    wait until element is enabled  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}


Create scope Policy 1,2,3,4
    Create Scope Policy  ${Eng_Dev1}  ${Scope_Policy_1}  ${Scope_Policy_1_node_1}
    Create Scope Policy  ${Eng_Dev2}  ${Scope_Policy_2}  ${Scope_Policy_2_node_1}
    Create Scope Policy  ${Eng_Dev3}  ${Scope_Policy_3}  ${Scope_Policy_3_node_1}
    Create Scope Policy  ${Eng_Dev4}  ${Scope_Policy_4}  ${Scope_Policy_4_node_1}


Enable Scope Policy for User Group
    [Arguments]  ${User_Group}  ${Scope-Policy_Checkbox}
    wait until element is visible  ${User_Group}
    scroll element into view  ${User_Group}
    wait until keyword succeeds    3x    2s    click element  ${User_Group}
    wait until element is visible  ${Scope-Policy_Tab_User/Group}
    wait until keyword succeeds    3x    2s    click element  ${Scope-Policy_Tab_User/Group}
    wait until element is visible  ${Scope-Policy_Checkbox}
    wait until keyword succeeds    3x    2s    click element  ${Scope-Policy_Checkbox}


Enable Scoppe Policy for User Group
    [Arguments]  ${User_Group}  ${Scope-Policy_Checkbox}
    wait until element is visible  ${User_Group}
    scroll element into view  ${User_Group}
    wait until keyword succeeds    3x    2s    click element  ${User_Group}
    wait until element is visible  ${Scope-Policy_Tab_User/Group}
    wait until keyword succeeds    3x    2s    click element  ${Scope-Policy_Tab_User/Group}
    wait until element is visible  ${Scope-Policy_Checkbox}
    wait until keyword succeeds    3x    2s    click element  ${Scope-Policy_Checkbox}
    wait until element is visible    //*[@id="Administrator"]
    click element    //*[@id="Administrator"]


Add New Filter
    [Arguments]    ${Filter_name}    ${Node}
    wait until element is visible  ${Add_Filter_EN_Button}
    wait until keyword succeeds    3x    2s    click element  ${Add_Filter_EN_Button}
    wait until element is visible  ${Filter_Name_Input_Field}
    input text  ${Filter_Name_Input_Field}  ${Filter_name}
    wait until element is visible  ${Node}
    wait until keyword succeeds    3x    2s    click element  ${Node}
    wait until element is visible  ${Filter_Dialogue_Right_Button}
    wait until keyword succeeds    3x    2s    click element  ${Filter_Dialogue_Right_Button}
    wait until element is visible  ${Filter_Dialogue_Apply_button}
    mouse over  ${Filter_Dialogue_Apply_button}
    wait until keyword succeeds    3x    2s    click element  ${Filter_Dialogue_Apply_button}


Correct visibility for NR
    [Arguments]    ${Filter_name}    ${Node}    ${Node_after_filter_apply}
    wait until element is visible  ${Notification_Rules_Card}
    wait until keyword succeeds    3x    2s    click element  ${Notification_Rules_Card}
    wait until element is visible  ${Notification_Rule_Header}
    Add New Filter    ${Filter_name}    ${Node}
    wait until element is visible    //*[@id="mat-tab-label-0-2"]
    click element    //*[@id="mat-tab-label-0-2"]
    wait until element is visible  ${Node_after_filter_apply}


Correct Visibility for EN Summary
    [Arguments]  ${Filter_Name}  ${Node}  ${Node_in_inspector_view}
    wait until element is visible  ${Enterprise_Notification_Summary_Card}
    wait until keyword succeeds    3x    2s    click element  ${Enterprise_Notification_Summary_Card}
    wait until element is visible  ${Enterprise_Notification_Summary_Header}
    Add New Filter    ${Filter_name}    ${Node}
    wait until element is visible  ${Inspector_View_Notes_Tab}
    wait until keyword succeeds    3x    2s    click element  ${Inspector_View_Notes_Tab}
    wait until page contains element  ${Node_in_inspector_view}


Correct Visibility for Production
    [Arguments]  ${Filter_name}  ${Node}
    wait until element is visible  ${Production_Card}
    wait until keyword succeeds    3x    2s    click element  ${Production_Card}
    wait until element is visible  ${Production_Header}
    Add New Filter    ${Filter_name}    ${Node}
    # ToDo validation part should be added when the data will be available on SVT


Correct Visibility for Views
    [Arguments]    ${Node}
    wait until element is visible  ${My_Views_Card}
    wait until keyword succeeds    3x    2s    click element  ${My_Views_Card}
    wait until element is visible  ${My_Views_Header}
    wait until element is visible  ${Add_View_Button}
    wait until keyword succeeds    3x    2s    click element  ${Add_View_Button}
    wait until element is visible  ${Add_View_Name_Input_Field}
    input text  ${Add_View_Name_Input_Field}    ${Scope_Policy_Test_View_Name}    ${True}
    input text  ${Scope_Policy_Description_Input_Filed}    ${Scope_Policy_Test_View_Description}    ${True}
    sleep    6s
    Select From List by Label    xpath=//select[@formcontrolname = 'assetItem']        Train 1_Dover${SPACE}Daddy
    Run Keyword And Ignore Error  Wait Until Element is Visible  ${SEC/S360_DISMISS_MSG_CNTR}    timeout=5
	Run Keyword And Ignore Error  Click Element  ${SEC/S360_DISMISS_MSG_CNTR}
    wait until element is visible  ${Add_View_Save_Button}
    mouse over  ${Add_View_Save_Button}
    wait until keyword succeeds    3x    2s    click element  ${Add_View_Save_Button}
    sleep    3s

    wait until element is visible  ${Back_To_View_Header}
    wait until keyword succeeds    3x    2s    click element  ${Back_To_View_Header}
    wait until element is visible  ${New1_View}
    wait until keyword succeeds    3x    2s    click element  ${New1_View}
    wait until element is visible  ${View_Graphical_Tab}
    wait until keyword succeeds    3x    2s    click element  ${view_graphical_tab}
    wait until element is visible  ${Node}
    wait until element is visible  ${view_nodes_tab}
    wait until keyword succeeds    3x    2s    click element  ${view_nodes_tab}
    wait until element is visible  ${view_node_02}


Check that given nodes don't exist
    [Arguments]  ${node1}  ${node2}  ${node3}  ${node4}
    wait until page does not contain    ${node1}
    wait until page does not contain    ${node2}
    wait until page does not contain    ${node3}
    wait until page does not contain    ${node4}


Correct visibility for scene
    [Arguments]  ${node}
    wait until element is visible  ${SEC/S360_OPER_MANAGE_SCENES_CARD}
    wait until keyword succeeds    3x    2s    click element  ${SEC/S360_OPER_MANAGE_SCENES_CARD}
    wait until element is visible  ${SEC/S360_OPER_MANAGE_SCENES_HEADER}
    operator_keywords.s360_op_search in published scene    New123
    wait until element is visible    ${Published_Scene_0}
    wait until keyword succeeds    3x    2s    click element  ${S360_PUB_CARD_ID}
    wait until element is visible  ${view_nodes_tab}
    wait until keyword succeeds    3x    2s    click element  ${view_nodes_tab}
    wait until page contains  ${node}


Choose scope policy for designer user group
    [Arguments]  ${User_Group}  ${Checkbox}
    wait until element is visible  ${User_Group}
    scroll element into view  ${User_Group}
    wait until keyword succeeds    3x    2s    click element  ${Test064_Designer_User_Group}
    wait until element is visible  ${Scope-Policy_Tab_User/Group}
    wait until keyword succeeds    3x    2s    click element  ${Scope-Policy_Tab_User/Group}
    wait until element is visible  ${Checkbox}
    wait until keyword succeeds    3x    2s    click element  ${Checkbox}
    wait until element is visible  ${Save_Button_User/Group}
    wait until keyword succeeds    3x    2s    click element  ${Save_Button_User/Group}
    wait until element is not visible    ${SEC/S360_DIRTY_FLAG}
    SPH/SEC_Scroll Page To Location  0  0
    wait until element is visible  ${User/Group_Test1_Header}
    wait until keyword succeeds    3x    2s    click element  ${User/Group_Test1_Header}


Check if designer site have only appropriate node
    [Arguments]  ${node1}  ${node2}  ${node3}  ${node4}  ${node5}  ${Site_server}
    Mouse Over  ${DefinitionIcon}
    wait until keyword succeeds    3x    2s    Click Element   ${DefinitionITem}
    wait until page contains  ${node2}
    Check that given nodes don't exist  ${node1}  ${node3}  ${node4}  ${node5}
    Mouse Over  ${DefinitionIcon}
    wait until keyword succeeds    3x    2s    click element  ${Expand/Collaps_Icon}
    wait until element is visible  ${Site_server}


Delete Scope Policy
    [Arguments]  ${Scope_Policy}  ${Delete}
    wait until element is visible  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until keyword succeeds    3x    2s    Click Element   //*[@id="preferenceCardName_2"]
    #added search policy steps before delete
    wait until element is visible   //*[@id="searchBox"]
    input text  //*[@id="searchBox"]    ${Scope_Policy_Name_0}
    wait until keyword succeeds    3x    2s    click element    //*[@id="searchBtn"]
    wait until element is visible  ${Scope_Policy}
    wait until page contains element    ${Delete}
    wait until element is visible  ${Delete}
    mouse over  ${Delete}
    wait until keyword succeeds    3x    2s    click element  ${Delete}//i[@id='delete-menu-icon']
    run keyword and ignore error    wait until element is visible    //*[@id="buttn_DeleteTxt"]
    click element    //*[@id="buttn_DeleteTxt"]


Delete Used Scope Policy
    [Arguments]  ${Scope_Policy}  ${Delete}
    wait until element is visible  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until keyword succeeds    3x    2s    Click Element   //*[@id="preferenceCardName_2"]
    #added search policy steps before delete
    wait until element is visible   //*[@id="searchBox"]
    input text  //*[@id="searchBox"]    ${Scope_Policy_Name_1}
    wait until keyword succeeds    3x    2s    click element    //*[@id="searchBtn"]
    wait until element is visible  ${Scope_Policy}
    wait until page contains element    ${Delete}
    wait until element is visible  ${Delete}
    mouse over  ${Delete}
    wait until keyword succeeds    3x    2s    click element  ${Delete}//i[@id='delete-menu-icon']
    run keyword and ignore error    wait until element is visible    //*[@id="buttn_DeleteTxt"]
    click element   //*[@id="buttn_OkTxt"]


Delete Scoppe_Policy
    [Arguments]  ${Scope_Policy}  ${Delete}
#    wait until element is visible  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until element is visible     (//*[@id="openMenuOnMouseEnter"])[4]
    #added search policy steps before delete
    wait until element is visible   //*[@id="searchBox"]
    input text  //*[@id="searchBox"]    ${Scope_Policy_Name_1}
    wait until keyword succeeds    3x    2s    click element    //*[@id="searchBtn"]
    wait until element is visible  ${Scope_Policy}
    wait until page contains element    ${Delete}
    wait until element is visible  ${Delete}
    mouse over  ${Delete}
    wait until keyword succeeds    3x    2s    click element  ${Delete}//i[@id='delete-menu-icon']
    run keyword and ignore error    wait until element is visible    //*[@id="buttn_DeleteTxt"]
    click element    //*[@id="buttn_DeleteTxt"]


Confirm deleting scope policy
    [Arguments]   ${Scope_policy_card}
    wait until element is visible  ${Scope_Polciy_Delete_confirming_button}
    wait until keyword succeeds    3x    2s    click element  ${Scope_Polciy_Delete_confirming_button}
    wait until element is visible  ${Scope_policy_card}


Rename scope Policy
    [Arguments]  ${Scope_policy_rename}  ${Scope_Policy_Name}
    wait until element is visible  ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until keyword succeeds    3x    2s    Click Element   ${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}
    wait until element is visible  ${Scope_Policy_Header}
    #added search policy steps before delete
    wait until element is visible   //*[@id="searchBox"]
    input text  //*[@id="searchBox"]    ${Scope_Policy_Name_1}
    wait until keyword succeeds    3x    2s    click element    //*[@id="searchBtn"]
    wait until page contains element    ${Scope_policy_rename}
    #changes by Akash - added sleep to let scope policy load after search
    sleep    5s
    mouse over  ${Scope_policy_rename}
    sleep    2s
    wait until element is visible  ${Scope_policy_rename}//i[@id='edit-menu-icon']
    wait until keyword succeeds    3x    2s    click element  ${Scope_policy_rename}//i[@id='edit-menu-icon']
    wait until element is visible  ${Scope_Policy_Name_Input_Field}
    click element     ${Scope_Policy_Name_Input_Field}
    clear element text     ${Scope_Policy_Name_Input_Field}
    sleep    2s
    input text  ${Scope_Policy_Name_Input_Field}  ${Scope_Policy_Name}
    sleep    2s
    wait until element is visible  ${Save_Scope_Policy_Button}
    click element  ${Save_Scope_Policy_Button}


Rename existing scope Policy
    [Arguments]  ${Scope_policy_rename}  ${Scope_Policy_Name}
    wait until element is visible  ${Scope_Policy_Header}
    wait until page contains element    ${Scope_policy_rename}
    mouse over  ${Scope_policy_rename}
    sleep    2s
    wait until element is visible  ${Scope_policy_rename}//i[@id='edit-menu-icon']
    wait until keyword succeeds    3x    2s    click element  ${Scope_policy_rename}//i[@id='edit-menu-icon']
    wait until element is visible  ${Scope_Policy_Name_Input_Field}
    click element     ${Scope_Policy_Name_Input_Field}
    clear element text     ${Scope_Policy_Name_Input_Field}
    sleep    2s
    input text  ${Scope_Policy_Name_Input_Field}  ${Scope_Policy_Name}
    sleep    2s
    wait until element is visible  ${Save_Scope_Policy_Button}
    click element  ${Save_Scope_Policy_Button}


Check if scope policy name changed in user/group
    [Arguments]  ${User_group}  ${Policy_name}
    wait until element is visible  ${User_group}
    scroll element into view  ${User_group}
    wait until keyword succeeds    3x    2s    click element  ${User_group}
    wait until element is visible  ${Scope-Policy_Tab_User/Group}
    wait until keyword succeeds    3x    2s    click element    ${Scope-Policy_Tab_User/Group}
    wait until page contains  ${Policy_name}


Correct visibility for en after disabled scope policy
    [Arguments]  ${Eng01}  ${Eng02}  ${Eng03}  ${Eng04}  ${Eng05}
    wait until element is visible  ${Add_Filter_EN_Button}
    wait until keyword succeeds    3x    2s    click element  ${Add_Filter_EN_Button}
#    wait until page contains  ${Eng01}
    wait until page contains  ${Eng02}
    wait until page contains  ${Eng03}
    wait until page contains  ${Eng04}
    wait until page contains  ${Eng05}


Check that designer have all nodes
    [Arguments]  ${node1}  ${node2}  ${node3}  ${node4}  ${node5}  ${Site_server_1}  ${Site_server_2}  ${Site_server_3}  ${Site_server_4}  ${Site_server_5}
    wait until page contains  ${DefinitionIcon}
    Mouse Over  ${DefinitionIcon}
    wait until keyword succeeds    3x    2s    Click Element   ${DefinitionITem}
#    wait until page contains  ${node1}
    wait until page contains  ${node2}
    wait until page contains  ${node3}
    wait until page contains  ${node4}
    wait until page contains  ${node5}
    Mouse Over  ${DefinitionIcon}
    wait until keyword succeeds    3x    2s    click element  ${Expand/Collaps_Icon}
#    wait until element is visible  ${Site_server_1}
    wait until element is visible  ${Site_server_2}
    wait until element is visible  ${Site_server_3}
    wait until element is visible  ${Site_server_4}
    wait until element is visible  ${Site_server_5}


Remove scope policy from security group
    [Arguments]  ${User_Group}  ${Checkbox}
    wait until element is visible  ${SEC/S360_ADMIN_USERS_GROUPS_CARD}
    wait until keyword succeeds    3x    2s    click element  ${SEC/S360_ADMIN_USERS_GROUPS_CARD}
    wait until element is visible  ${User_Group}
    wait until keyword succeeds    3x    2s    click element  ${User_Group}
    wait until element is visible  ${Operator_Group_Edit_Scope_Tab}
    wait until keyword succeeds    3x    2s    click element  ${Operator_Group_Edit_Scope_Tab}
    wait until element is visible  ${Checkbox}
    wait until keyword succeeds    3x    2s    click element  ${Checkbox}
    wait until element is visible  ${Save_Scope_Policy_Button}
    mouse over  ${Save_Scope_Policy_Button}
    wait until keyword succeeds    3x    2s    click element  ${Save_Scope_Policy_Button}
    wait until element is not visible    ${SEC/S360_DIRTY_FLAG}
    wait until element is visible  ${Back_To_View_Header}
    scroll element into view  ${Back_To_View_Header}
    SEC/S360 Navigate To Landing Page


Check Error message of EN
    [Arguments]  ${Filter}
    wait until element is visible  ${Notification_Rules}
    wait until keyword succeeds    3x    2s    click element  ${Notification_Rules}
    wait until element is visible  ${Filter}
    wait until keyword succeeds    3x    2s    click element  ${Filter}
    wait until element is visible  ${Error_Message}
    wait until element is visible  ${Error_Message_Ok_button}
    wait until keyword succeeds    3x    2s    click element  ${Error_Message_Ok_button}
    SEC/S360 Navigate To Landing Page


Check Error message of Notification Summary
    [Arguments]  ${Filter}
    wait until element is visible  ${Filter}
    wait until keyword succeeds    3x    2s    click element  ${Filter}
    wait until element is visible  ${Error_Message}
    wait until element is visible  ${Error_Message_Ok_button}
    wait until keyword succeeds    3x    2s    click element  ${Error_Message_Ok_button}
    SEC/S360 Navigate To Landing Page


Check Error message of Production
    [Arguments]  ${Filter}
    wait until element is visible  ${Filter}
    wait until keyword succeeds    3x    2s    click element  ${Filter}
    wait until element is visible  ${Remove scope policy from security group}
    wait until element is visible  ${Error_Message_Ok_button}
    wait until keyword succeeds    3x    2s    click element  ${Error_Message_Ok_button}
