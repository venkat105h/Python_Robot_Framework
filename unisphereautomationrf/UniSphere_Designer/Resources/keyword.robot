#-----------------------------------------------------------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by Designer and Editor Testcase Robot scripts.
#	Project				:		UniSphere
#	Author				:		Satya R
#	© 2018 Systech International. All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           String
Library           robot.libraries.DateTime
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Resources/Locator.robot
Library           ../Resources/GenericMethods.py
Resource          ..${/}..${/}Resources${/}COMMON_RESOURCE.robot
#-----------------------------------------------------------------------------------------------------------------------
*** Variables ***
${BROWSER}                                                gc
${MULTIBROWSER}                                           ff
${URL}                                                    SVT
${BROWSERWIDTH}                                           1280
${BROWSERHEIGHT}                                          1024
${Solution}                                               UniSphere
${Role}                                                   Designer
${BASE_URL}                                               eng-${URL}.systechcloud.net
${LOGIN URL}                                              https://${BASE_URL}
${UNISECURE URL}                                          https://${BASE_URL}/UniSecure/#/
${UNITRACE URL}                                           https://${BASE_URL}/login/
${UNISPHERE URL}                                          https://${BASE_URL}/UniSphere
${Def}                                                    Scene
${IMAGEPLACEHOLDERSRC}                                    assets/img/image_place_holder.png
${UNISPHERE_ADMINISTRATOR_USERNAME}                       TestSatya
${UNISPHERE_ADMINISTRATOR_PASSWORD}                       !QAZ1qaz
${UNISPHERE_ADMIN_USERNAME1}                              ASatya
${UNISPHERE_ADMIN_PASSWORD1}                              !QAZ1qaz
${UNISPHERE_CARDFIRSTITEMNAME_XPATH}                      //*[@id="${Def}_itemName_0"]/span
#-----------------------------------------------------------------------------------------------------------------------
*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------------
##################################      UNISPHERE DESIGNER   EDITOR     ################################################
#-----------------------------------------------------------------------------------------------------------------------
Suite Setup for Editor
    [Documentation]     This keyword is used to setup the suite for Editor
    SOL_Open Browser with Solution Landing page
    SPH_DESN_Open Designer page
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Editor
    [Documentation]  This keyword is to navigate to the Editors (Scenes,Organizations, Sites, Environments, Clouds,
    ...              Site Servers and Data Sources)
    ...              ${Def_icon}  is used to provide the Definition icon of the HTML id.
    ...              ${Def_Item}  is used to provide the Definition item of the HTML id.
    [Arguments]  ${Def_icon}  ${Def_Item}
    SPH_DESN_Navigate to Definition    ${Def_icon}  ${Def_Item}  # Scene-icon   Scene-item
    SPH_DESN_Navigate to Editor from Definition
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Definition
    [Documentation]  This keyword is to navigate to the Left navigation link Definitions
    ...              (Scenes,Organizations, Sites, Environments, Clouds,
    ...              Site Servers and Data Sources)in the UniSphere Designer.
    ...              ${DefinitionIcon} is used to provide the Definition icon of the HTML id.
    ...              ${DefinitionITem} is used to provide the Definition item of the HTML id.
    [Arguments]    ${DefinitionIcon}  ${DefinitionITem}
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element   ${UNISPHERE_WELCOME_ID}
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_WELCOME_ID}
    wait until keyword succeeds  5x  2s  Mouse Over  ${DefinitionIcon}
    wait until keyword succeeds  5x  2s  Click Element   ${DefinitionITem}
    wait until keyword succeeds  5x  2s  wait until page contains element  ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Editor from Definition
    [Documentation]  This keyword is to navigate to Editor from the Definitions
    COMMON_Scroll to bottom of the page
    wait until keyword succeeds  5x  2s  click element   ${UNISPHERE_ADDNEWITEM_BTN}
    wait until keyword succeeds  10x  2s  Wait Until Page Contains Element  ${UNISPHERE_NAME_TEXTBOX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the UI of the Editor
    [Documentation]  This keyword is to check the UI of the ${Def} Editors(Scenes,Organizations, Sites,
    ...              Environments, Clouds,Site Servers and Data Sources).
    SPH_DESN_Check the Image, Introduction,Close button and Video
    SPH_DESN_Check the name field
    SPH_DESN_Check the Description field
    SPH_DESN_Check the Comments field
    SPH_DESN_Check the Update Image Field
    SPH_DESN_Check the Include section
    SPH_DESN_Check the Graphic section
    SPH_DESN_Click on Show Section
    SPH_DESN_Close the Show Section Field
    SPH_DESN_Check the Floating buttons in Editor
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Image, Introduction,Close button and Video
    [Documentation]  This keyword is to verify the Image, Introduction,Close button and Video in the ${Def} Editor
    Page Should Contain Element  ${UNISPHERE_EDITORASSETIMAGE_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORINTO_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCLOSE_BTN}
    Page Should Contain Element  ${UNISPHERE_VIDEO_ICON}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the name field
    [Documentation]  This keyword is to verify the name field in the ${Def} Editor
    Page Should Contain Element  ${UNISPHERE_EDITORNAME_LBL}
    Page Should Contain Element  ${UNISPHERE_NAME_TEXTBOX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Description field
    [Documentation]  This keyword is to verify the Description field in the ${Def} Editor
    Page Should Contain Element  ${UNISPHERE_EDITORDESCRIPTION_LBL}
    Page Should Contain Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Comments field
    [Documentation]  This keyword is to verify the Comments Field in the ${Def} Editor
    Page Should Contain Element  ${UNISPHERE_EDITORCOMMENTS_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Update Image Field
    [Documentation]  This keyword is to verify the Update image field in the ${Def} Editor
    Page Should Contain Element  ${UNISPHERE_EDITORIMAGEPRODUCT_ID}
    Page Should Contain Element  ${UNISPHERE_DESNEDITORUPLOADIMG_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Include section
    [Documentation]  This keyword is to verify the Include section in the ${Def} Editor
    Page Should Contain Element  ${UNISPHERE_EDITORINCLUDEDSUBORDINATE_LBL}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Graphic section
    [Documentation]  This keyword is to verify the Graphic section in the ${Def} Editor
    Page Should Contain Element  ${UNISPHERE_GRAPHICALTAB_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Show Section
    [Documentation]  This keyword is to Click on Show Section in the ${Def} Editor
    Wait Until Page Contains Element  ${UNISPHERE_SHOWSUBORDINATE_ID}
    Page Should Contain Element  ${UNISPHERE_SHOWSUBORDINATE_ID}
    Click Element   ${UNISPHERE_SHOWSUBORDINATE_ID}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#-----------------------------------------------------------------------------------------------------------------------
Check the Show Section Field
    [Documentation]  This keyword is to verify the Show Section field in the ${Def} Editor.
    wait until keyword succeeds  5x  5s   wait until page contains element  ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Page Should contain Element  ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Page Should contain Element  ${UNISPHERE_EDITORSUBORDINATECLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Close the Show Section Field
    [Documentation]  This keyword is to click and close the Show section in the ${Def} editor.
    Click Element   ${UNISPHERE_EDITORSUBORDINATECLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Floating buttons in Editor
    [Documentation]  This keyword is to verify the Floating buttons in the EditorScenes,Organizations
    ...              , Sites, Environments, Clouds,Site Servers and Data Sources).
    #wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_FLOATBTNICON_ID}
    #wait until keyword succeeds  5x  2s  Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Execute Javascript    $(document).scrollTop(10)
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Breadcrumb section in editor
    [Documentation]  This keyword is to verify the Breadcrumb section in the ${Def} Editor.
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element  ${UNISPHERE_EDITORBREADCRUMB_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORBREADCRUMB_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Breadcrumb Name
    [Documentation]  This keyword is used to check the Breadcrumb name in the Editor page.
    Wait Until Page Contains Element   ${UNISPHERE_NAME_TEXTBOX}
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    TestName
    Wait Until Page Contains Element  ${UNISPHERE_OBJECTNAME_ID}
    ${BreadcrumbName}=   Get Text   ${UNISPHERE_OBJECTNAME_ID}
    pass execution if  "${BreadcrumbName}"  == "TestName"
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Dirty Flag in page
    [Documentation]  This keyword is used to check the Dirty falg is displayed in the Editor page.
    Page should Contain Element   ${UNISPHERE_EDITORDIRTYFLAG_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on VA Play button
    [Documentation]  This keyword is used to click on the Video Assistance Play button.
    Page Should Contain Element  ${UNISPHERE_VIDEO_ICON}
    Click Element  ${UNISPHERE_VIDEO_ICON}
    wait until keyword succeeds  5x  2s   Wait Until Page contains Element  ${UNISPHERE_VIDEOONLINESECTION_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Online Video Assistance window
    [Documentation]  This keyword is used to check the Online Video assistance window is displayed.
    Wait Until Page Contains Element  ${UNISPHERE_VIDEOONLINESECTION_ID}
    Page Should Contain Element  ${UNISPHERE_VIDEOONLINESECTION_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Close the Online Video Assistance
    [Documentation]  This keyword is used to close the Online Video assistance window.
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}
    Set Focus To Element   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}
    Mouse Over   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}
    Click Button   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Parent breadcrumb navigation
    [Documentation]  This keyword is used to click on the Parent breadcrumb in the Editor page.
    COMMON_Scroll to bottom of the page
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element  ${UNISPHERE_BREADCRUMBPARENT_ID}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_BREADCRUMBPARENT_ID}
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element   ${UNISPHERE_TABLEVIEW_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate back to Designer
    [Documentation]     This keyword is used to navigate back to UniSphere Designer page.
    SPH_DESN_Open Designer page
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Open Designer page
    [Documentation]     This Keyword is used to navigate to Designer page from the Solution Landing page.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Designer/Operator   ${UNISPHERE_PREFERENCESDESIGNER_ROLE}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Close button in Add item with dirty flag
    [Documentation]  This keyword is used to clcik on the Close button in the Editor page.
    SPH_DESN_Enter input in name and description
    SPH_DESN_Check the Dirty Flag in page
    Wait Until Page Contains Element  ${UNISPHERE_EDITORCLOSE_BTN}
    Click Element  ${UNISPHERE_EDITORCLOSE_BTN}
    Page Should Contain Element  ${UNISPHERE_DELETCONFIRMPOPUP_ID}
    Click Element   ${UNISPHERE_DELETENOBTN_ID}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter Maximum Input in Name
    [Documentation]  This keyword is used to enter the maximum input in Name field in the Editor page.
    ...               ${MaximumLength} is used to specify the length of the name field.
    [Arguments]   ${MaximumLength}
    ${New_EditorName} =    SPH_DESN_Return Unique Editor name  ${MaximumLength}
    set global variable  ${New_EditorName}
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    ${New_EditorName}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter Maximum Input in Description
    [Documentation]  This keyword is used to enter the maximum input in Description field in the Editor page.
     ...               ${MaximumLength} is used to specify the length of the description field.
    [Arguments]   ${MaximumLength}
    ${New_DesName} =    SPH_DESN_Return Unique Description name    ${MaximumLength}
    set global variable  ${New_DesName}
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}   ${New_DesName}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Return Unique Editor name
    [Documentation]   This keyword is used to return the name field for Editor page.
    ...               ${MaximumLength} is used to specify the length of the Editor name field.
    [Arguments]   ${MaximumLength}  ${prefix}=EditorName    ${suffix}=1
    ${unique}=    generate random string    ${MaximumLength}    [LETTERS]
    ${result}=    Set Variable    ${prefix}${unique}${suffix}
    [Return]    ${result}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Return Unique Description name
    [Documentation]   This keyword is used to return the random Description field for Editor page.
    ...               ${MaximumLength} is used to specify the length of the Editor description field.
    [Arguments]   ${MaximumLength}   ${prefix}=EditorDescription   ${suffix}=1
    ${unique}=    generate random string     ${MaximumLength}    [LETTERS]
    ${result}=    Set Variable    ${prefix}${unique}${suffix}
    [Return]    ${result}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Maximum length
    [Documentation]   Check the Maximum length is 255
    [Arguments]  ${LocatorRef}   ${MaximumLength}
    ${EnteredText}=   Get value   ${LocatorRef}
    log to Console    ${EnteredText}
    ${LengthofEnteredText} =   Get Length   ${EnteredText}
    log to Console    ${LengthofEnteredText}
    Should Be Equal As Integers	${LengthofEnteredText}	${MaximumLength}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Upload an Image
    Wait Until Page Contains Element   ${UNISPHERE_DESNEDITORUPLOADIMG_ID}
    Set Focus To Element    ${UNISPHERE_DESNEDITORUPLOADIMG_ID}
    Sleep  5s
    Choose File    ${UNISPHERE_UPLOADIMAGE_ID}    ${CURDIR}/Koala.jpg
    Sleep  5s
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Image is uploaded
    Page Should not Contain Image   ${IMAGEPLACEHOLDERSRC}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Image is uploaded after saving the editor
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element   //*[@id="${UNISPHERE_EDITORIMAGEPRODUCT_ID}"]
    wait until keyword succeeds  5x  2s  Page Should not Contain Image   ${IMAGEPLACEHOLDERSRC}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Default Image placholder
    wait until keyword succeeds  5x  2s  Page Should Contain Image   ${IMAGEPLACEHOLDERSRC}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Comments
    Wait Until Page Contains Element  ${UNISPHERE_EDITORCOMMENTS_ID}
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_EDITORCOMMENTS_ID}
    wait until keyword succeeds  5x  2s   Page Should Contain Element  ${UNISPHERE_COMMENTSCONTENT_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the UI of the Open Comments
    Page Should Contain Element  ${UNISPHERE_COMMENTSLABEL_ID}
    Page Should Contain Element  ${UNISPHERE_NEWCOMMENTLABEL_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSCONTENT_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSADDBTN_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSOKBTN_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSCANCELBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Cancel button in Comments popup
    Wait Until Page Contains Element  ${UNISPHERE_COMMENTSCANCELBTN_ID}
    Click Element  ${UNISPHERE_COMMENTSCANCELBTN_ID}
    Wait Until Page Contains Element  ${UNISPHERE_EDITORCOMMENTS_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter comments in the New comment
    ${New_Comments} =    SPH_DESN_Return Unique Comments name
    set global variable  ${New_Comments}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_COMMENTSINPUT_XPATH}
    Input Text    ${UNISPHERE_COMMENTSINPUT_XPATH}   ${New_Comments}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Return Unique Comments name
    [Documentation]   Returns random comments
    ${unique}=    generate random string    5    [LETTERS]
    ${result}=    Set Variable   ${unique}
    [Return]    ${result}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Add button in Comments popup
    Wait Until Page Contains Element   ${UNISPHERE_COMMENTSADDBTN_ID}
    Click Element  ${UNISPHERE_COMMENTSADDBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the comments in the comments popup
    wait until keyword succeeds  10x  2s  Wait Until Page Contains Element  ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}
    wait until keyword succeeds  10x  2s  Click Element  ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}
    Clear Element Text   ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}
    Input Text   ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}   ${New_Comments}
    page should contain element   ${UNISPHERE_COMMENTSSEARCHDESC_XPATH}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Ok button in Comments popup
    Click Element  ${UNISPHERE_COMMENTSOKBTN_ID}
    Wait Until Page Contains Element   ${UNISPHERE_EDITORCOMMENTS_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Save button in Editor page
    #Mouse Over   ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  5x  2s  Click Element    ${UNISPHERE_SAVEBTN_ID}
    wait until keyword succeeds  5x  2s  Wait until page contains element  ${UNISECURE_MESSAGE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Publish button in Editor page
    #Wait until page contains element   ${UNISPHERE_FLOATBTNICON_ID}
    #wait until keyword succeeds  5x  2s  Mouse Over   ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  5x  2s  Mouse Over   ${UNISPHERE_PUBLISHBTN_ID}
    wait until keyword succeeds  5x  2s  Click Element    ${UNISPHERE_PUBLISHBTN_ID}
    wait until keyword succeeds  10x  2s  Wait until page contains element   ${UNISECURE_MESSAGE_ID}
    #added by Akash
    Wait Until Element Is Visible     ${UNISPHERE_MESSAGECENTERCLOSE_BTN}    timeout=20
    Click Element     ${UNISPHERE_MESSAGECENTERCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter input in name and description
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    TestName
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    TestDescription
    Sleep  5s
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter Random Input in Name and Description
    [Arguments]    ${Random_name}  ${Random_Description}
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    ${Random_name}
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Clear Element Text   ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------

SPH_DESN_Verify the Save Confirmation popup
    Wait Until Page Contains Element   ${UNISPHERE_DELETEYESBTN_ID}
    Page should Contain Element   ${UNISPHERE_DELETEYESBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on No button in the Save Confirmation popup
    Wait Until Page Contains Element   ${UNISPHERE_DELETENOBTN_ID}
    Page should Contain Element   ${UNISPHERE_DELETENOBTN_ID}
    Click Element  ${UNISPHERE_DELETENOBTN_ID}
    Wait Until Page Contains Element  ${UNISPHERE_ADDNEWITEM_BTN}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Yes button in the Save Confirmation popup
    Wait Until Page Contains Element   ${UNISPHERE_DELETEYESBTN_ID}
    Page should Contain Element   ${UNISPHERE_DELETEYESBTN_ID}
    Click Element  ${UNISPHERE_DELETEYESBTN_ID}
    Wait Until Page Contains Element  ${UNISPHERE_NAME_TEXTBOX}
    Page should Contain Element   ${UNISPHERE_NAME_TEXTBOX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Cancel button in the Floating buttons
    #Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Click Element   ${UNISPHERE_EDITORCANCEL_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Verify user is navigated back to Parent page
    Wait Until Page Contains Element  ${UNISPHERE_ADDNEWITEM_BTN}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Change the Grid View/List view
    [Arguments]  ${BUTTON}   ${SEARCHBOX}
   Wait Until Page Contains Element   ${BUTTON}
   wait until keyword succeeds  5x  2s  Click Element  ${BUTTON}
   wait until keyword succeeds  5x  2s  Wait until page contains element  ${SEARCHBOX}
   run keyword and ignore error  Click Element   ${BUTTON}
   wait until keyword succeeds  5x  2s  Wait Until Page Contains Element   ${BUTTON}
   Run Keyword If  '${BUTTON}' == '${UNISPHERE_CARDVIEW_BTN}'    wait until keyword succeeds  15x  2s  Wait Until Page Contains Element   ${UNISPHERE_CARDSPERPAGELIST_ID}
   Run Keyword If  '${BUTTON}' == '${UNISPHERE_TABLEVIEW_BTN}'    wait until keyword succeeds  15x  2s  Wait Until Page Contains Element   ${UNISPHERE_TABLEITEMSPERPAGELIST_XPATH}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save
    [Arguments]  ${Definition_Name}  ${Def_Item}
    wait until keyword succeeds  5x  2s  Wait until page contains element  ${UNISPHERE_CARDSSEARCH_BOX}
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    sleep  5s
    Wait until page contains element  ${Def_Item}_0
    wait until keyword succeeds  5x  2s  Page should contain element    ${Def_Item}_0
    wait until keyword succeeds  5x  2s  Wait until page contains element    ${UNISPHERE_CARDSPERPAGELIST_ID}
    wait until keyword succeeds  5x  2s  Page should contain element    ${UNISPHERE_CARDSPERPAGELIST_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save in Table view
    [Arguments]  ${Definition_Name}
    wait until keyword succeeds  5x  2s  Wait until page contains element  ${UNISPHERE_CARDSSEARCH_BOX}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    sleep  5s
    Wait until page contains element  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    Wait until page contains element  //datatable-row-wrapper/datatable-body-row/div[2]/datatable-body-cell[2]/div/div/label/span
    Page should contain element    //datatable-row-wrapper/datatable-body-row/div[2]/datatable-body-cell[2]/div/div/label/span
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save and Click the Item
    [Arguments]  ${Definition_Name}  ${Def_Item}
    Wait Until Page Contains Element  ${UNISPHERE_CARDVIEW_BTN}
    run keyword and ignore error  Click Element  ${UNISPHERE_CARDVIEW_BTN}
    wait until keyword succeeds  5x  2s  Wait until page contains element  ${UNISPHERE_CARDSSEARCH_BOX}
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    Wait until page contains element  ${Def_Item}_0
    wait until keyword succeeds  5x  2s  Page should contain element    ${Def_Item}_0
    wait until keyword succeeds  5x  2s  Wait until page contains element    ${UNISPHERE_ITESPERPAGE_ID}
    wait until keyword succeeds  5x  2s  Page should contain element    ${UNISPHERE_ITESPERPAGE_ID}
    wait until keyword succeeds  5x  2s  Wait until page contains element    ${Def_Item}_itemName_0
    wait until keyword succeeds  15x   2s   Click Element   ${Def_Item}_itemName_0
    sleep  5s
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Update the Image
    Wait Until Page Contains Element   ${UNISPHERE_DESNEDITORUPLOADIMG_ID}
    Set Focus To Element    ${UNISPHERE_DESNEDITORUPLOADIMG_ID}
    Sleep  5s
    Choose File    ${UNISPHERE_UPLOADIMAGE_ID}    ${CURDIR}/Lighthouse.jpg
#-----------------------------------------------------------------------------------------------------------------------

SPH_DESN_Declare Random variable for Description
    [Arguments]   ${MaximumLength}
    ${Random_Description} =    SPH_DESN_Return Unique Description name   ${MaximumLength}
    set global variable  ${Random_Description}
    log to console   ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Update Random Input in Description
    [Arguments]     ${Random_Description}
    Wait Until Page Contains Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Wait Until Element Is Visible   ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Sleep  3s
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the Updated description after save
    [Arguments]  ${Definition_Name}  ${Def_Item}
    Wait until page contains element  ${UNISPHERE_CARDSSEARCH_BOX}
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    wait until keyword succeeds  2x   2s   Page should contain element   ${Def_Item}_0
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Updated description in table view
    [Arguments]    ${Random_Description}  ${Def_Item}
   Wait Until Page Contains Element  ${UNISPHERE_TABLEVIEW_BTN}
   Click Element   ${UNISPHERE_TABLEVIEW_BTN}
   wait until keyword succeeds  5x  2s   Wait until page contains element   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
   ${Expected}=  get text  ${UNISPHERE_TABLEDESCRIPTIONCELL_XPATH}
   log to console  ${Expected}
   Should be equal as strings   ${Expected}    ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Add the Subordinates object
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element   //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Mouse Over    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Click Element    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    wait until keyword succeeds  15x  2s  Wait Until Page Contains Element   ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Wait Until Page Contains Element   ${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}
    Wait Until Page Contains Element   ${UNISPHERE_INCLUDESECTION_XPATH}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep  5s
    ${js}        Get File              ${CURDIR}/drag-n-drop.js
    sleep  10s
    ${result}    Execute Javascript    ${js};  return DragNDrop('${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}','${UNISPHERE_INCLUDESECTION_XPATH}');
    Scroll Page To Location    0    2000
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search and Add the Subordinates object
    [Arguments]     ${SubOrdinatename}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element   //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Mouse Over    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Click Element    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Wait Until Page Contains Element   ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Click Element   ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Input Text      ${UNISPHERE_SUBORDINATESEARCHBOX_ID}   ${SubOrdinatename}
    Click Element   ${UNISPHERE_SUBORDINATESEARCHBTN_XPATH}
    Wait Until Page Contains Element   ${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}
    Wait Until Page Contains Element   ${UNISPHERE_INCLUDESECTION_XPATH}
    ${SubOrdinateCount}=  Get Element Count   ${UNISPHERE_CHILDTITLE_CLASS}
    log to Console   ${SubOrdinateCount}
    FOR  ${k}  IN RANGE   ${SubOrdinateCount}
       ${ChildID}=   Evaluate  ${k}+1
       ${SubOrdinateText}=  Get Text  ${UNISPHERE_CHILDCARD_XPATH} [${ChildID}]
       Run Keyword If  "${SubOrdinateText}" == "${SubOrdinatename}"    exit for loop
    END
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep  2s
    ${js}        Get File              ${CURDIR}/drag-n-drop.js
    sleep  2s
    ${result}    Execute Javascript    ${js};  return DragNDrop('${UNISPHERE_CHILDCARD_XPATH} [${ChildID}]','${UNISPHERE_INCLUDESECTION_XPATH}');
    Scroll Page To Location    0    2000
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Add Multiple Subordinates object
    Click Element   //*[@id="leftmenuinner "]/div/div/a/span
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element   //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Mouse Over    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Click Element    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Wait Until Page Contains Element   ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Wait Until Page Contains Element   ${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}
    Wait Until Page Contains Element   ${UNISPHERE_INCLUDESECTION_XPATH}
    ${SubOrdinateCount}=  Get Element Count   ${UNISPHERE_CHILDTITLE_CLASS}
    log to Console   ${SubOrdinateCount}
    FOR  ${k}  IN RANGE   ${SubOrdinateCount}
       Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
       sleep  2s
       ${js}        Get File              ${CURDIR}/drag-n-drop.js
       sleep  2s
       ${result}    Execute Javascript    ${js};  return DragNDrop('${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}','${UNISPHERE_INCLUDESECTION_XPATH}');
       Scroll Page To Location    0    2000
    END
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Child Definition and delete a Subordinate
    [Arguments]   ${Definition}
    Run Keyword If   '${Definition}' == 'Scene'   Run keywords   SPH_DESN_Navigate to Definition  ${UNISPHERE_DESORGANIZATION_ICON}  ${UNISPHERE_DESORGANIZATION_ID}  AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Organization is a child
    Run Keyword If   '${Definition}' == 'Organization'  Run keywords   SPH_DESN_Navigate to Definition  ${UNISPHERE_DESSITE_ICON}  ${UNISPHERE_DESSITE_ID}  AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Organization is a child
    Run Keyword If   '${Definition}' == 'Site'   Run keywords   SPH_DESN_Navigate to Definition  ${UNISPHERE_DESENVIRONMENT_ICON}  ${UNISPHERE_DESENVIRONMENT_ID}  AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Organization is a child
    Run Keyword If   '${Definition}' == 'Environment'  Run keywords   SPH_DESN_Navigate to Definition  ${UNISPHERE_DESSITESERVER_ICON}  ${UNISPHERE_DESSITESERVER_ID}  AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Organization is a child
    Run Keyword If   '${Definition}' == 'SiteServer'   Run keywords   SPH_DESN_Navigate to Definition  ${UNISPHERE_DESCLOUD_ICON}  ${UNISPHERE_DESCLOUD_ID}  AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Organization is a child
    Run Keyword If   '${Definition}' == 'Cloud'        Run keywords   SPH_DESN_Navigate to Definition  ${UNISPHERE_DESORGANIZATION_ICON}  ${UNISPHERE_DESORGANIZATION_ID}  AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Organization is a child
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Remove the Subordinate object
    Wait Until Page Contains Element   ${UNISPHERE_EDITORINCLUDEDSUBORDINATE_LBL}
    Page Should Contain Element        ${UNISPHERE_EDITORINCLUDEDSUBORDINATE_LBL}
    wait until keyword succeeds    5s  2s   Mouse Over  ${UNISPHERE_CHILDSUBORDINATEREMOVE_ID}
    Mouse Over   ${UNISPHERE_INCLUDESECTION_XPATH}/div
    wait until keyword succeeds    5s  2s   Click Element   ${UNISPHERE_CHILDSUBORDINATEREMOVE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the error message for duplicate names
    [Documentation]  This test case is to check the error message for duplicate name save in the editor.
    wait until keyword succeeds  10x  1s   Wait Until Page Contains Element  ${UNISECURE_MESSAGE_ID}
    Page Should Contain   ${UNISPHERE_DUPLICATENAME_MESSAGEPREFIX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Definition name in the card view.
    [Arguments]   ${NAME}   ${CARDTITLEID}
    ${CardTitle}=  get element attribute  ${CARDTITLEID}@title
    Log To Console  ${CardTitle}
    should be equal as strings    ${NAME}  ${CardTitle}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Highlighted text in the card view.
    [Arguments]   ${NAME}   ${CARDTITLEID}   ${ITEMLENGTH}
    ${CardTitle}=  get text   ${CARDTITLEID}
    Log To Console  ${CardTitle}
    ${LengthofTitle}=  Get Length  ${CardTitle}
    log to console  ${LengthofTitle}
    should be equal as strings    ${NAME}  ${CardTitle}
    should be equal as numbers    ${LengthofTitle}  ${ITEMLENGTH}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on duplicate icon for Searched Item in table
    [Documentation]  This keyword is to check on the duplicate icon for the Searched Card Item
    wait until keyword succeeds  5x  2s  Wait Until Page contains element   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    wait until keyword succeeds  5x  5s  Select Checkbox   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    wait until keyword succeeds  5x  2s  Mouse Over  menu_options
    wait until keyword succeeds  5x  2s  Click Element   //*[@id="copy-menu-item"]
    wait until keyword succeeds  5x  2s  Wait Until Page contains element   ${UNISECURE_MESSAGE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Close the message center
    wait until keyword succeeds  5x  2s  Wait Until Page contains element   ${UNISECURE_MESSAGE_ID}
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_MESSAGECENTERCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the description in the card view.
    [Arguments]   ${Description}   ${DescriptionID}
    ${ActualDescription}=  get element attribute  ${DescriptionID}@title
    Log To Console  ${ActualDescription}
    should be equal as strings    ${Description}  ${ActualDescription}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the default asset image in the card view.
    [Documentation]  This keyword is to Check the default asset image in the card view.
    Page Should Contain Element    ${UNISPHERE_DEFAULTASSETIMAGE_XPATH}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the user added image in the card view.
    [Documentation]  This keyword is to Check the default asset image in the card view.
    Page Should Contain Element    ${UNISPHERE_DEFAULTASSETIMAGE_XPATH}
    ${ActualIMGSRC}=   get element attribute  ${UNISPHERE_DEFAULTASSETIMAGE_XPATH}@src
    log to console  ${ActualIMGSRC}
    ${RegularExpressionSRC}=  Get Regexp Matches  ${ActualIMGSRC}   scene_.*
    log to console   ${RegularExpressionSRC}
    ${SRC}=  Remove String Using Regexp   ${ActualIMGSRC}   scene_.*
    should be equal   ${SRC}   https://eng-svt.systechcloud.net/images/public/uniSphere/eng_svt/
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Declare Random variables for Editor Name and Description
    [Arguments]    ${NAMELENGTH}  ${DESCRIPTIONLENGTH}
    ${Random_name} =    Return Unique Editor NameInput  ${NAMELENGTH}
    set global variable  ${Random_name}
    log to console   ${Random_name}
    ${Random_Description} =    Return Unique Editor DescriptionInput    ${DESCRIPTIONLENGTH}
    set global variable  ${Random_Description}
    log to console   ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the added subodinates are displayed in Graphical tab
    [Arguments]  ${childsubordinate}
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element   ${UNISPHERE_CHILDTITLE_CLASS}
    ${ChildCount}=  Get Element Count  ${UNISPHERE_CHILDTITLE_CLASS}
    log to Console   ${ChildCount}
    ${ChildList}=  Create List
    FOR  ${k}  IN RANGE   ${ChildCount}
         Run Keyword If  ${k} == ${ChildCount}    exit for loop
         log to console  ${k}
         ${values}=    Get Text  //*[@id="includedChildName_${k}"]
         Append to List   ${ChildList}    ${values}
         log to console   ${ChildList}
    END

    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    ${GraphicalChildtext}=  Get Text   //*[@id="${childsubordinate}"]
    log to console     ${GraphicalChildtext}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Error message for Concurrent update
    [Documentation]  This keyword is to check the Error message
    Wait Until Page Contains Element    ${UNISECURE_MESSAGE_ID}
    Page Should Contain       A concurrent update has taken placeA concurrent update has taken place
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Error message for SubOrdinate Reference update
    [Documentation]  This keyword is to check the Error message
    Wait Until Page Contains Element    ${UNISECURE_MESSAGE_ID}
    Page Should Contain       One or more subordinate organizations have been deleted.  The reference(s) to those organization have been removed
#-----------------------------------------------------------------------------------------------------------------------















SPH_DESN_Check the Start, Publish, Required, Optional static images
    [Documentation]  This keyword is used to check the static images in the Welcome Designer dashboard
    Page Should Contain Element  ${UNISPHERE_DESHOMESTART_ID}
    Page Should Contain Element  ${UNISPHERE_DESHOMEPUBLISH_ID}
    Page Should Contain Element  ${UNISPHERE_DESHOMEREQUIRED_ID}
    Page Should Contain Element  ${UNISPHERE_DESHOMEOPTIONAL_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the navigation links in the home page
    [Documentation]  This keyword is to check clicking on the link user is navigating to the respective editor page.
    ...             ${NAVIGATIONID}  is the Designer definition HTML id's
    ...             ${EDITORELEMENT} is the Editor name or Description element.
    [Arguments]  ${NAVIGATIONID}   ${EDITORELEMENT}
    Wait Until Page Contains Element   ${NAVIGATIONID}
    Mouse Over   ${NAVIGATIONID}
    wait until keyword succeeds  5x  2s  Click Element  ${NAVIGATIONID}
    Wait Until Page Contains Element   ${EDITORELEMENT}
    Page Should Contain Element  ${EDITORELEMENT}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Published Scene
    [Documentation]  This keyword is used to navigate to the Published Scene in the Operator.
    Sleep  5s
    Click Element   ${UNISPHERE_WELCOME_ID}
    Mouse Over  ${UNISPHERE_PUBLISHEDICON_ID}
    sleep  1s
    Click Element   ${UNISPHERE_PUBLISHEDITEM_ID}
    wait until page contains element  ${UNISPHERE_PUBLISHEDFAMIL_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Save button disabled
    [Documentation]  This keyword is used to check the save button is disabled
    #Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Element Should Be Disabled   ${UNISPHERE_SAVEBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
Check the Publish button disabled
    [Documentation]  This keyword is used to check the Publish button is disabled
    #Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${UNISPHERE_PUBLISHBTN_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Element Should Be Disabled   ${UNISPHERE_PUBLISHBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Discard button enabled
    [Documentation]  This keyword is used to check the Discard button is Enabled
    #Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Element Should Be Enabled   ${UNISPHERE_EDITORCANCEL_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Discard button
    [Documentation]  This keyword is used to Click on the Discard button
    #Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Click Element   ${UNISPHERE_EDITORCANCEL_BTN}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Close button in Add item with out dirty flag
    [Documentation]  This keyword is used to Click on close button in the Editor page.
    Click Element  ${UNISPHERE_EDITORCLOSE_BTN}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the breadcrumbs navigation
    [Documentation]  This keyword is used to check the breadcrumb navigation in the Editor page.
    Click Element  ${UNISPHERE_BREADCRUMBPARENT_ID}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
    Click Element  ${UNISPHERE_EDITORDESIGNERBREADCRUMB_ID}
    Page Should Contain Image   ${UNISPHERE_EDITORUNISPHEREBREADCRUMB_ID}
#-----------------------------------------------------------------------------------------------------------------------
Check validation message in Name
    [Documentation]  This keyword is used to check the validation message on Name Field in the Editor page.
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    TestName
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    TestDescription
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    Sleep  5s
    page should contain element   requiredError
#-----------------------------------------------------------------------------------------------------------------------

Setup Default view to Card View
   Sleep   1s
   Mouse over   userDisplayImage
   Click Element  goToPreference
   wait until page contains element  preferenceCardHead_0
   Click Element  preferenceCardHead_0
   wait until page contains element  defaultLayoutList
   Click Element  defaultLayoutList
   Select From List By Index   xpath=//Select[@id="defaultLayoutList"]   1
   Select From List By Index   xpath=//Select[@id="defaultLayoutList"]   0
   #Mouse over  ${UNISPHERE_FLOATBTNICON_ID}
   Click Element   ${UNISPHERE_SAVEBTN_ID}
   Wait until page contains element  ${UNISECURE_MESSAGE_ID}  10s
#-----------------------------------------------------------------------------------------------------------------------
Check Records are dispalyed in Card View
    [Arguments]  ${CARD_ITEM_RECORD}
    Wait until page contains element   ${CARD_ITEM_RECORD}
    Page Should Contain Element   ${CARD_ITEM_RECORD}
#-----------------------------------------------------------------------------------------------------------------------
Check Records are dispalyed in List View
    Wait until page contains element  //*[@id="selectAllHeader"]
    Page Should Contain Element  //*[@id="selectAllHeader"]
#-----------------------------------------------------------------------------------------------------------------------
Setup Default view to List View
   Sleep   1s
   Mouse over   userDisplayImage
   Click Element  goToPreference
   wait until page contains element  preferenceCardHead_0
   Click Element  preferenceCardHead_0
   wait until page contains element  defaultLayoutList
   Click Element  defaultLayoutList
   Select From List By Index   xpath=//Select[@id="defaultLayoutList"]   0
   Select From List By Index   xpath=//Select[@id="defaultLayoutList"]   1
   #Mouse over  ${UNISPHERE_FLOATBTNICON_ID}
   Click Element   ${UNISPHERE_SAVEBTN_ID}
   Wait until page contains element  ${UNISECURE_MESSAGE_ID}  10s
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Edit icon for Searched Card Item
    Mouse down   ${UNISPHERE_CARDOPTIONS_MENU}
    set focus to element   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}
    Wait Until Page contains element  //i[@id="edit-menu-icon"]
    Mouse over   //i[@id="edit-menu-icon"]
    Sleep  3s
    Double Click Element   //i[@id="edit-menu-icon"]
    Sleep  3s
    Wait until page contains element   ${UNISPHERE_NAME_TEXTBOX}
#-----------------------------------------------------------------------------------------------------------------------
Click on delete icon for Searched Card Item
    Sleep  5s
    Mouse down   ${UNISPHERE_CARDOPTIONS_MENU}
    set focus to element   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}
    Wait Until Page contains element  ${UNISPHERE_CARDSDELETE_BTN}
    Mouse over  ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Double Click Element   ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Wait until page contains element   ${UNISPHERE_DELETEYESBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
Search the item after deletion
    [Arguments]  ${Updated_Scene}
    Wait until page contains element  ${UNISPHERE_CARDSSEARCH_BOX}
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Updated_Scene}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    Wait until page contains element  cards_noItemFound
    Page should contain element   cards_noItemFound
#-----------------------------------------------------------------------------------------------------------------------
Click Yes button in the Delete Confirmation popup
    Wait until page contains element   ${UNISPHERE_DELETEYESBTN_ID}
    Click Element  ${UNISPHERE_DELETEYESBTN_ID}
    Wait until page contains element  ${UNISECURE_MESSAGE_ID}
#-----------------------------------------------------------------------------------------------------------------------
Click No button in the Delete Confirmation popup
    Wait until page contains element   ${UNISPHERE_DELETENOBTN_ID}
    Click Element  ${UNISPHERE_DELETENOBTN_ID}
    Wait until page contains element  ${UNISPHERE_CARDSSEARCH_BOX}
#-----------------------------------------------------------------------------------------------------------------------
Click Close button in the Delete Confirmation popup
    Wait until page contains element   //button[@class='close ng-star-inserted']/span[1]
    Click Element  //button[@class='close ng-star-inserted']/span[1]
    Wait until page contains element  ${UNISPHERE_CARDSSEARCH_BOX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Update the Definition
    [Arguments]    ${Updated_Scene}  ${Updated_Description}
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    ${Updated_Scene}
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Clear Element Text   ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    ${Updated_Description}
    #Sleep  5s
    #Mouse Over   ${UNISPHERE_FLOATBTNICON_ID}
    Click Element    ${UNISPHERE_SAVEBTN_ID}
    Wait until page contains element  ${UNISECURE_MESSAGE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save in UniSphere Operator
    [Arguments]  ${Definition_Name}  ${Def_Item}
    wait until keyword succeeds  5x  2s  Wait until page contains element  ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCH}
    Click Element  ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCH}
    Input Text  ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCH}    ${Definition_Name}
    Click Element  ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHBTN}
    sleep  5s
    Wait until page contains element  ${Def_Item}_0
    wait until keyword succeeds  5x  2s  Page should contain element    ${Def_Item}_0
    wait until keyword succeeds  5x  2s  Wait until page contains element    ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHED}
    wait until keyword succeeds  5x  2s  Page should contain element    ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHED}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the published scene in UniSphere Operator
    [Arguments]  ${Definition_Name}  ${Def_Item}
    wait until keyword succeeds  5x  2s  Wait until page contains element   //input[@class="form-control ng-pristine ng-valid ng-touched"]
    Click Element   //input[@class="form-control ng-pristine ng-valid ng-touched"]
    Input Text  //input[@class="form-control ng-pristine ng-valid ng-touched"]    ${Definition_Name}
    Click Element  //div[@id='approvedSceneSorting']/search-sort-orderby-view/div[@id='option-panel' and @class='row']/div[@id='search' and @class='ng-star-inserted']/div[@id='searchInternal' and @class='input-group stylish-input-group']/span[@class='input-group-addon']/button/span[@class='fa fa-search']
    sleep  5s
    Wait until page contains element  ${Def_Item}_0
    wait until keyword succeeds  5x  2s  Page should contain element    ${Def_Item}_0
    Click Element   ${Def_Item}_0
    Wait Until Page Contains Element    ${UNISPHERE_GRAPHICALTAB_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Accept/Reject Button
    [Arguments]  ${Button}
    wait until keyword succeeds  2x   2s   Page should contain element   ${Button}
    wait until keyword succeeds  2x   2s   Mouse Over   ${Button}
    wait until keyword succeeds  2x   2s   Click Button   ${Button}
    Wait Until Page Contains Element   ${UNISECURE_MESSAGE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Select a item in the table and click on Delete
    [Documentation]  This keyword is to Select a item in the table and click on Restore
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    Wait Until Page Contains Element   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element    ${UNISPHERE_FIRSTITEMTABLE_XPATH}
    ${Deletetext}=  Get Text  ${UNISPHERE_FIRSTITEMTABLE_XPATH}
    Log To Console  ${Deletetext}
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}   ${Deletetext}
    Click Element    ${UNISPHERE_CARDSSEARCH_BTN}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    SPH_DESN_Click the Delete button
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Select a item in the table view and click on Delete button
    [Documentation]  This keyword is to Select a item in the table and click on Restore
    [Arguments]   ${Searcheditem}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    Wait Until Page Contains Element   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element    ${UNISPHERE_FIRSTITEMTABLE_XPATH}
    ${Deletetext}=  Get Text  ${UNISPHERE_FIRSTITEMTABLE_XPATH}
    Log To Console  ${Deletetext}
    should be equal  ${Searcheditem}    ${Deletetext}
    Select Checkbox   ${UNISPHERE_TRASHTABLEFIRST_CHKBX}
    #Mouse Over  ${UNISPHERE_DEFFLOATBTN_ID}
    Click Element   ${UNISPHERE_DEFDELETEFLOATBTN_ID}
    Wait until page contains element   ${UNISPHERE_DELETEYESBTN_ID}
    wait until keyword succeeds  5x  2s  Wait until page contains element   ${UNISPHERE_DELETEYESBTN_ID}
    run keyword and ignore error  Click Element  ${UNISPHERE_DELETEYESBTN_ID}
    wait until keyword succeeds  5x  2s  Wait until page contains element   ${UNISECURE_MESSAGE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click the Delete button
    [Documentation]  This keyword is to Click the Delete button
    Sleep  5s
    wait until keyword succeeds  5x  2s  Mouse down   ${UNISPHERE_CARDOPTIONS_MENU}
    Focus   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}
    Wait Until Page contains element  ${UNISPHERE_CARDSDELETE_BTN}
    Mouse over  ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Double Click Element   ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Wait until page contains element   ${UNISPHERE_DELETEYESBTN_ID}
    wait until keyword succeeds  5x  2s  Wait until page contains element   ${UNISPHERE_DELETEYESBTN_ID}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_DELETEYESBTN_ID}
    wait until keyword succeeds  5x  2s  Wait until page contains element   ${UNISECURE_MESSAGE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Graphical tab Elements
    [Arguments]  ${Def}  @{GraphicalElements}
    COMMON_Scroll to top of the page
    ${LENGTH}=  Get Length   ${GraphicalElements}
    log to console  ${LENGTH}
    FOR  ${i}  IN  @{GraphicalElements}
         Wait Until Page Contains Element   //*[@id="${i}"]
         wait until keyword succeeds  5x  2s   Page Should Contain Element   //*[@id="${i}"]
         Run keyword if  '${Def}'== 'SiteServer'      log to console   No Path links are displayed for Site Server
         Run keyword if  '${Def}'== 'Environment'     SPH_DESN_Check the Path links  ${LENGTH}
         Run keyword if  '${Def}'== 'Site'     SPH_DESN_Check the Path links ${LENGTH}
         Run keyword if  '${Def}'== 'Organization'     SPH_DESN_Check the Path links  ${LENGTH}
         Run keyword if  '${Def}'== 'Scene'     SPH_DESN_Check the Path links  ${LENGTH}
    END
    COMMON_Scroll to bottom of the page
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Path links
    [Arguments]  ${LENGTH}
   FOR  ${j}  IN RANGE  ${LENGTH}
         ${PATHID}=  evaluate    ${j}+1
         wait until keyword succeeds  5x  2s  Wait Until Page Contains Element  ${UNISPHERE_GRAPHICALELEMENTS_ID}${UNISPHERE_GRAPHICALPATHLINK_ID} [${PATHID}]
         Page Should Contain Element   ${UNISPHERE_GRAPHICALELEMENTS_ID}${UNISPHERE_GRAPHICALPATHLINK_ID} [${PATHID}]
   END
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    [Documentation]  This keyword is to click on Graphical tab
    Sleep  5s
    wait until keyword succeeds  15x  2s   Wait Until Page Contains Element  ${UNISPHERE_GRAPHICALTAB_ID}
    wait until keyword succeeds  15x  2s   Click Element   ${UNISPHERE_GRAPHICALTAB_ID}
    wait until keyword succeeds  15x  2s   Wait Until Page contains Element   ${UNISPHERE_GRAPHICALELEMENTS_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Nodes Tab in UniSphere Operator
    [Documentation]  This keyword is to click on Nodes tab
    Wait Until Page Contains Element  //label[@id='nodesTab']
    Click Element   //label[@id='nodesTab']
    Wait Until Page contains Element   //*[@id="squareNoteInsideNodeStatus"]
    Page Should Contain Element   //*[@id="arc_Active_1"]
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the SiteServer in the Node section
    [Arguments]  ${SiteServer}
    ${Nodes}=   Get Element Count    ${UNISPHERE_EXPANDCOLLAPSE_BTN}
    FOR  ${i}  IN RANGE  ${Nodes}
      ${SiteServerText}=  get text  //*[@id="component_${i}"]
      Run Keyword if   '${SiteServerText}' ==  '${SiteServer}'  Click Element   //*[@id="component_${i}"]
      exit for loop if    ${i} ==  ${Nodes}
    END
    wait until keyword succeeds  5x  2s  Wait Until Page Contains Element   //*[@id="itemTabDetails"]
#-----------------------------------------------------------------------------------------------------------------------
Create a new site server
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITESERVER_ICON}   ${UNISPHERE_DESSITESERVER_ID}
    SPH_DESN_Navigate to Editor from Definition
    COMMON_Declare Random variables for Editor Name and Description
    ${SiteServer_name}=    Set Variable   ${Random_name}
    set global variable  ${SiteServer_name}
    log to Console   ${SiteServer_name}
    ${SiteServer_Description}=    Set Variable   ${Random_Description}
    set global variable  ${SiteServer_Description}
    SPH_DESN_Enter Random Input in Name and Description   ${SiteServer_name}  ${SiteServer_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Click on Save button in Editor page
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_NEWSITESERVER_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${SiteServer_name}   Guardian
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    SPH_DESN_Check the Graphical tab Elements   SiteServer   ${SiteServer_name}
#-----------------------------------------------------------------------------------------------------------------------
Create a new environment
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    SPH_DESN_Navigate to Editor from Definition
    COMMON_Declare Random variables for Editor Name and Description
    ${Environment_name}=    Set Variable   ${Random_name}
    set global variable  ${Environment_name}
    log to Console   ${Environment_name}
    ${Environment_Description}=    Set Variable   ${Random_Description}
    set global variable  ${Environment_Description}
    SPH_DESN_Enter Random Input in Name and Description   ${Environment_name}  ${Environment_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Search and Add the Subordinates object  ${SiteServer_name}
    SPH_DESN_Click on Save button in Editor page
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_NEWENVIRONMENT_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Environment_name}   Environment
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    SPH_DESN_Check the Graphical tab Elements  Environment   ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
Create a new site
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
    SPH_DESN_Navigate to Editor from Definition
    COMMON_Declare Random variables for Editor Name and Description
    ${Site_name}=    Set Variable   ${Random_name}
    set global variable  ${Site_name}
    log to Console   ${Site_name}
    ${Site_Description}=    Set Variable   ${Random_Description}
    set global variable  ${Site_Description}
    SPH_DESN_Enter Random Input in Name and Description   ${Site_name}  ${Site_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Search and Add the Subordinates object  ${Environment_name}
    SPH_DESN_Click on Save button in Editor page
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_NEWSITE_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Site_name}   Site
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    SPH_DESN_Check the Graphical tab Elements   Site   ${Site_name}    ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
Create a new Organization
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    SPH_DESN_Navigate to Editor from Definition
    COMMON_Declare Random variables for Editor Name and Description
    ${Organization_name}=    Set Variable   ${Random_name}
    set global variable  ${Organization_name}
    log to Console   ${Organization_name}
    ${Organization_Description}=    Set Variable   ${Random_Description}
    set global variable  ${Organization_Description}
    SPH_DESN_Enter Random Input in Name and Description   ${Organization_name}  ${Organization_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Search and Add the Subordinates object  ${Site_name}
    SPH_DESN_Click on Save button in Editor page
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_NEWORGANIZATION_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Organization_name}   Organization
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    SPH_DESN_Check the Graphical tab Elements  Organization  ${Organization_name}  ${Site_name}    ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
Create a new Scene
    SPH_DESN_Navigate to Definition   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    SPH_DESN_Navigate to Editor from Definition
    COMMON_Declare Random variables for Editor Name and Description
    ${Scene_name}=    Set Variable   ${Random_name}
    set global variable  ${Scene_name}
    log to Console   ${Scene_name}
    ${Scene_Description}=    Set Variable   ${Random_Description}
    set global variable  ${Scene_Description}
    SPH_DESN_Enter Random Input in Name and Description   ${Scene_name}  ${Scene_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Search and Add the Subordinates object  ${Organization_name}
    SPH_DESN_Click on Save button in Editor page
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_NEWSCENE_MESSAGEPREFIX}
    SPH/SEC_Close the message center
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    SPH_DESN_Check the Graphical tab Elements   Scene   ${Scene_name}    ${Organization_name}  ${Site_name}    ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
Scroll Page To Location
    [Documentation]   This keyword is used to execute javascript to scroll the page.
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

##----------------------------------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------------------------------
