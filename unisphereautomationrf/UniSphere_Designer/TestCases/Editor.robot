#-----------------------------------------------------------------------------------------------------------------------
#   Description   :      Test Cases for UniSphere Editor(Scenes, Organization, Sites, Environments, Site Server, Clouds)
#   Project       :      UniSphere (Designer Editor)
#   Author        :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation     Test Cases for UniSphere Designer Editor(Scene, Organization, Site, Environment, Site Server, Cloud)
Resource          ..${/}Resources${/}SPH_DESN.robot
Resource          ..${/}Resources${/}Locator.robot
Library           BuiltIn
Library           SeleniumLibrary
Library           Collections
Library           String
Library           robot.libraries.DateTime
Library           OperatingSystem
Suite Setup       Suite Setup for Editor
Suite Teardown    Close All Browsers
#-----------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
TC_01 Navigate to Editor and check the UI of the Editor
    [Documentation]  This test case is to verify user is able to navigate to the ${Def} Editor and the UI of the Editor
    [Tags]    TC_01
    SPH_DESN_Navigate to Editor    ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Check the UI of the Editor
    SPH_DESN_Check the Default Image placholder
    SPH_DESN_Check the Floating buttons in Editor
    SPH_DESN_Check the Breadcrumb section in editor
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_02 Verify the Video Assitance Play button in the Editor page.
    [Documentation]  This test case is to Verify the Video Assitance in the ${Def} Editor
    [Tags]    TC_02
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Click on VA Play button
    SPH_DESN_Check the Online Video Assistance window
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_03 Verify user is able to close the Editor
    [Documentation]  This test case is to verify user is able to close the ${Def} Editor
    [Tags]    TC_03
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Click on Close button in Add item with dirty flag
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed   SPH_DESN_Navigate back to Designer

TC_04 Verify the maximum length for Name and description Field
    [Documentation]  This test case is to verify the maximum length for Name and description Field in the ${Def} Editor page
    [Tags]    TC_04
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Enter Maximum Input in Name/Description   ${UNISPHERE_NAME_TEXTBOX}   ${MAXIMUMLENGTH}
    SPH_DESN_Check the Maximum length    ${UNISPHERE_NAME_TEXTBOX}  ${MAXIMUMLENGTH}
    SPH_DESN_Enter Maximum Input in Name/Description   ${UNISPHERE_DESCRIPTION_TEXTBOX}  ${MAXIMUMLENGTH}
    SPH_DESN_Check the Maximum length    ${UNISPHERE_DESCRIPTION_TEXTBOX}  ${MAXIMUMLENGTH}
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_05 Verify user is able to view the uploaded image after saving the definition
    [Documentation]  This test case is to verify user is able to view the
    ...              uploaded image after saving the definition in the ${Def} Editor page
    [Tags]    TC_05
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Check the Image is uploaded
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item   ${Random_name}   ${Def}
    SPH_DESN_Check the Image is uploaded
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_06 Verify user is able to open the Comments popup and close by clicking on Cancel button
    [Documentation]  This test case is to verify user is able to open the Comments popup in the ${Def} Editor page
    [Tags]    TC_06
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Click on Comments
    SPH_DESN_Check the UI of the Open Comments
    SPH_DESN_Click on Cancel button in Comments popup
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_07 Verify user is able to add new comments and search in the Comments popup
    [Documentation]  This test case is to verify user is able to
    ...             add new comments in the Comments popup in the ${Def} Editor page
    [Tags]    TC_07
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Click on Comments
    SPH_DESN_Enter comments in the New comment
    SPH_DESN_Click on Add button in Comments popup
    SPH_DESN_Search the comments in the comments popup
    SPH_DESN_Click on Ok button in Comments popup

TC_08 Verify added comment is displayed in the Comments popup
    [Documentation]  This test case is to Verify added comment is displayed
    ...              in the Comments popup in the ${Def} Editor page
    [Tags]    TC_08
    SPH_DESN_Click on Comments
    SPH_DESN_Search the comments in the comments popup
    SPH_DESN_Click on Ok button in Comments popup
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_09 Verify if save and discard button is enabled when user navigates to the Editor page with out entering inputs.
    [Documentation]  This test case is to Verify if save button is disabled and discard button is enabled
    ...               when user navigates to the ${Def} Editor page with out entering inputs.
    [Tags]    TC_09
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    Click Element   ${UNISPHERE_DESCRIPTION_TEXTBOX}
    SPH_DESN_Check the Save/Discard/Publish button enabled   ${UNISPHERE_EDITORCANCEL_BTN}
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_10 Verify if user is navigating back to parent page after clicking on Discard button in Editor page
    [Documentation]  This test case is to verify if user is navigating back to parent page
    ...             after clicking on Discard button in ${Def} Editor page
    [Tags]    TC_10
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Click on Discard button
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_11 Verify if user is navigating back to parent page after clicking on close button in Editor when dirty flag is displayed.
    [Documentation]  This test case is to verify if user is navigating back to parent page
    ...             after clicking on close button in ${Def} Editor page when dirty flag is displayed
    [Tags]    TC_11
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Click on Close button in Add item with dirty flag
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_12 Verify if user is navigating back to parent page after clicking on close button in Editor page.
    [Documentation]  This test case is to verify if user is navigating back to parent page
    ...             after clicking on close button in ${Def} Editor page when dirty flag is not displayed#
    [Tags]    TC_12
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Check the Image is uploaded
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    SPH_DESN_Search the new definition after save and Click the Item   ${Random_name}  ${Def}
    SPH_DESN_Click on Close button in Add item with out dirty flag
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_13 Verify if user is navigate back to Definition page by clicking on no button in the Save Connfirmation popup.
    [Documentation]  This test case is to verify if user is navigating back to parent page
    ...             after clicking on Breadcrumb link in ${Def} Editor page when dirty flag is displayed
    ...             and No button navigation in the Save Confirmation popup.
    [Tags]    TC_13
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Enter input in name and description
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Parent breadcrumb with dirty flag
    SPH_DESN_Verify the Save Confirmation popup
    SPH_DESN_Click on No button in the Save Confirmation popup
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_14 Verify if user is navigate back to editor page after clicking on Yes button in the Save Confirmation popup.
    [Documentation]  This test case is to verify if user is navigate back to ${Def} editor page
    ...             after clicking on Yes button in the Save Confirmation popup.
    [Tags]    TC_14
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Enter input in name and description
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Parent breadcrumb with dirty flag
    SPH_DESN_Verify the Save Confirmation popup
    SPH_DESN_Click on Yes button in the Save Confirmation popup
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_15 Verify if user is navigating back to parent page after clicking on Cancel button in Editor page when dirty flag is not displayed
    [Documentation]  This test case is to verify if user is navigating back to parent page
     ...            after clicking on Cancel button in ${Def} Editor page when dirty flag is not displayed
    [Tags]    TC_15
    SPH_DESN_Navigate to Definition  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Search the new definition after save and Click the Item   ${Random_name}  ${Def}
    SPH_DESN_Click on Cancel button in the Floating buttons
    SPH_DESN_Verify user is navigated back to Parent page
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_16 Verify if user is navigating back to parent page after clicking on Cancel button in Editor page when dirty flag is displayed
    [Documentation]  This test case is to verify if user is navigating back to parent page
     ...             after clicking on Cancel button in ${Def} Editor page when dirty flag is displayed
    [Tags]    TC_16
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Enter input in name and description
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Cancel button in the Floating buttons
    SPH_DESN_Verify the Save Confirmation popup
    SPH_DESN_Click on No button in the Save Confirmation popup
    SPH_DESN_Verify user is navigated back to Parent page
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_17 Verify if Dirty flag is getting appeared if user changes image in the editor page.
    [Documentation]  This test case is to verify if Dirty flag
    ...             is getting appeared if user changes image in the ${Def} editor page.
    [Tags]    TC_17
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Check the Image is uploaded
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item   ${Random_name}   ${Def}
    SPH_DESN_Update the Image
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Check the Image is uploaded
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer
    #Check the updated image is added or not

TC_18 Verify if Dirty flag is getting appeared if user changes description in the editor page.
    [Documentation]  This test case is to Verify if Dirty flag is getting appeared
    ...              if user changes description in the ${Def} editor page.
    [Tags]    TC_18
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item   ${Random_name}   ${Def}
    SPH_DESN_Declare Random variable for Description  5  #${MAXIMUMLENGTH}
    SPH_DESN_Update Random Input in Description   ${Random_Description}
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save in Table view    ${Random_name}
    SPH_DESN_Check the Updated description in table view  ${Random_Description}  ${Def}
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_19 Verify if Dirty flag is getting appeared if user removes any or all subordinate objects description in the editor page.
    [Documentation]  This test case is to verify if Dirty flag is getting
    ...              appeared if user removes any or all subordinate objects description in the ${Def} editor page.
    [Tags]    TC_19
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Add the Subordinates object
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item   ${Random_name}   ${Def}
    SPH_DESN_Remove the Subordinate object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_20 Verify if Dirty flag is getting appeared if user add new subordinate objects description in the editor page.
    [Documentation]  This test case is to verify if Dirty flag is getting
    ...              appeared if user add new subordinate objects description in the ${Def} editor page.
    [Tags]    TC_20
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Add the Subordinates object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Random_name}   ${Def}
    SPH_DESN_Add the Subordinates object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_21 Verify the Uniqueness of the Name in the Editor.
    [Documentation]  This test case is to verify if user inputs the existing name in the editor and tries to save it.
    [Tags]    TC_21
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Add the Subordinates object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item   ${Random_name}   ${Def}
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Click on Save button in Editor page
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_DUPLICATENAME_MESSAGEPREFIX}
#    SPH/SEC_Close the message center
    SPH_DESN_Navigate back to Designer
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_22 Each definition can have an default image persisted/associated with it and shown on the card view
    [Documentation]  This test case is to verify if user inputs the existing name in the editor and tries to save it.
    [Tags]    TC_22
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Add the Subordinates object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save   ${Random_name}   ${Def}
    SPH_DESN_Check the Definition name in the card view.  ${Random_name}   ${Def}_itemName_0
    SPH_DESN_Check the description in the card view.   ${Random_Description}    itemDescription
    SPH_DESN_Check the default asset image in the card view.
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_23 Each definition can have an User Added image persisted/associated with it and shown on the card view
    [Documentation]  This test case is to verify if user inputs the existing name in the editor and tries to save it.
    [Tags]    TC_23
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    COMMON_Declare Random variables for Editor Name and Description
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Check the Image is uploaded
    SPH_DESN_Add the Subordinates object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save   ${Random_name}   ${Def}
    SPH_DESN_Check the Definition name in the card view.  ${Random_name}   ${Def}_itemName_0
    SPH_DESN_Check the description in the card view.   ${Random_Description}    itemDescription
    SPH_DESN_Check the user added image in the card view.
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_24 Add 1-100 character description, save and return to card view Ensure card view has the 100-description,
    [Tags]    TC_24
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Declare Random variables for Editor Name and Description  30   100
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save   ${Random_name}   ${Def}
    SPH_DESN_Check the Highlighted text in the card view.  ${Random_name}    ${UNISPHERE_CARDFIRSTITEMNAME_XPATH}  30
    SPH_DESN_Search the new definition after save   ${Random_Description}   ${Def}
    SPH_DESN_Check the Highlighted text in the card view.  ${Random_Description}    ${UNISPHERE_CARDFIRSTITEMDESCRIP_XPATH}  100
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_25 Verify user is able to duplicate the definitions
    [Tags]    TC_25
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Declare Random variables for Editor Name and Description  5   5
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save in Table view    ${Random_name}
    SPH_DESN_Click on duplicate icon for Searched Item in table
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_COPY_MESSAGEPREFIX}
    SPH_DESN_Close the message center
    SPH_DESN_Search the new definition after save in Table view    ${Random_name}_Copy
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_ 26 Verify the Grapic Tabs
    [Tags]    TC_26
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Declare Random variables for Editor Name and Description  5   5
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}    ${Random_Description}
    SPH_DESN_Add Multiple Subordinates object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save and Click the Item    ${Random_name}   ${Def}
    SPH_DESN_Check the added subordinates are displayed in Graphical tab   ${Random_name}
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_27 To verify the Parent Definition message, if the Reference object is deleted
    [Tags]    TC_27
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Declare Random variables for Editor Name and Description  5   5
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}    ${Random_Description}
    SPH_DESN_Add Multiple Subordinates object
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Navigate to Child Definition and delete a Subordinate     ${Def}
    SPH_DESN_Navigate to Definition  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save and Click the Item     ${Random_name}   ${Def}
    [Teardown]  run keyword if test failed  SPH_DESN_Navigate back to Designer

TC_28 To Verify the Concurrent update of the Same Definition by two users
    [Tags]    TC_28
    SPH_DESN_Navigate to Editor  ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Declare Random variables for Editor Name and Description  5   5
    SPH_DESN_Enter Random Input in Name and Description   ${Random_name}  ${Random_Description}
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save and Click the Item    ${Random_name}   ${Def}
    SOL_Open Browser with Solution Landing page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product    ${UNISPHERE URL}
	Switch Browser    2
	Set Focus To Element  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISPHERE_ADMIN_USERNAME1}    ${UNISPHERE_ADMIN_PASSWORD1}   ${UNISPHERE_ADMINROLE_DRPDWN}
    SPH/SEC_Navigate to Designer/Operator   ${UNISPHERE_PREFERENCESDESIGNER_ROLE}
    SPH_DESN_Navigate to Definition    ${Def}${UNISPHERE_EDITORICON_ID}  ${Def}${UNISPHERE_EDITORITEM_ID}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${CARDSSEARCHBOX}
    SPH_DESN_Search the new definition after save and Click the Item    ${Random_name}   ${Def}
    Switch Browser    1
    SPH_DESN_Declare Random variables for Editor Name and Description  5   5
    SPH_DESN_Update Random Input in Description   ${Random_Description}
    log to console  ${Random_Description}
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page
    Switch Browser    2
    SPH_DESN_Declare Random variables for Editor Name and Description  5   5
    SPH_DESN_Update Random Input in Description   ${Random_Description}
    log to console  ${Random_Description}
    SPH_DESN_Check the Dirty Flag in page
    SPH_DESN_Click on Save button in Editor page with Dirty Flag
    SPH_DESN_Check the Error message for Concurrent update
    SPH_DESN_Click on Yes button in the Concurrent update modal popup
    wait until keyword succeeds  15x  2s  Wait until page contains element  ${UNISECURE_MESSAGE_ID}
    SPH_DESN_Check the Message Prefix for the Concurrent Update of Definition
    Close All Browsers
    [Teardown]  run keyword if test failed  Close All Browsers
##-----------------------------------------------------------------------------------------------------------------------
##-----------------------------------------------------------------------------------------------------------------------