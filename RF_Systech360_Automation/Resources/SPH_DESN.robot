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
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           String
Library           robot.libraries.DateTime
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ..${/}Resources${/}Locator.robot
Library           ..${/}Resources${/}GenericMethods.py
Resource          ..${/}Resources${/}COMMON_RESOURCE.robot
#-----------------------------------------------------------------------------------------------------------------------
*** Variables ***
${BROWSER}                                                gc
${MULTIBROWSER}                                           ff
${URI}                                                    SVT
${BROWSERWIDTH}                                           1280
${BROWSERHEIGHT}                                          1024
${Solution}                                               Systech360
${Role}                                                   Designer
${BASE_URL}                                               eng-${URI}.systechcloud.net
${LOGIN URL}                                              https://${BASE_URL}
${UNISECURE URL}                                          https://${BASE_URL}/UniSecure/#/
${UNITRACE URL}                                           https://${BASE_URL}/login/
${UNISPHERE URL}                                          https://${BASE_URL}/Systech360/#/
${UNISPHEREIMAGEFILE}                                     /images/public/Systech360
${Def}                                                    Scene
${IMAGEPLACEHOLDERSRC}                                    assets/img/image_place_holder.png
${UNISPHERE_ADMINISTRATOR_USERNAME}                       AdminUser1
${UNISPHERE_ADMINISTRATOR_PASSWORD}                       Test@101

${UNISPHERE_ADMIN_USERNAME}                               AdminUser2
${UNISPHERE_ADMIN_PASSWORD}                               Test@101

${UNISPHERE_DESIGNER_USERNAME}                            DesUser1
${UNISPHERE_DESIGNER_PASSWORD}                            Test@101

${UNISPHERE_OPERATOR_USERNAME}                            OprUser1
${UNISPHERE_OPERATOR_PASSWORD}                            Test@101

${UNISPHERE_ADMIN_USERNAME1}                              AdminUser1
${UNISPHERE_ADMIN_PASSWORD1}                              Test@101
${UNISPHERE_CARDFIRSTITEMNAME_XPATH}                      //*[@id="${Def}_itemName_0"]/span
${MAXIMUMLENGTH}                                          255
${IMAGEUPLOAD}                                            /Koala.jpg
${IMAGEUPDATE}                                            /Lighthouse.jpg
${SCENEIMAGEUPLOAD}                                       /Scene.jpg
${ORGIMAGEUPLOAD}                                         /Organization.jpg
${ENVIMAGEUPLOAD}                                         /Environment.jpg
${SITEIMAGEUPLOAD}                                        /Site.jpg
${SITESERIMAGEUPLOAD}                                     /Siteserver.jpg
${DRAGANDDROPFILE}                                        /drag-n-drop.js
${CONCURRENTUPDATE}                                       A concurrent update has taken place
${REMOVEDSUBORDINATE}                                     One or more subordinate organizations have been deleted.
#-----------------------------------------------------------------------------------------------------------------------
*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------------
##################################      UNISPHERE DESIGNER EDITOR     ##################################################
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
    Wait Until Element Is Visible   ${UNISPHERE_WELCOME_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_WELCOME_ID}
    wait until keyword succeeds  5x  2s  Mouse Over  ${DefinitionIcon}
    Sleep  2S
    wait until keyword succeeds  5x  2s  Click Element   ${DefinitionITem}
    Wait Until Element Is Visible  ${UNISPHERE_ADDNEWITEM_BTN}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Editor from Definition
    [Documentation]  This keyword is to navigate to Editor from the Definitions
    Scroll Page To Location    0    0
    wait until keyword succeeds  5x  2s  click element   ${UNISPHERE_ADDNEWITEM_BTN}
    ${Status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${UNISPHERE_NAME_TEXTBOX}  timeout=20
    Run Keyword If  '${Status}' == '${False}'  click element   ${UNISPHERE_ADDNEWITEM_BTN}
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
    Page Should Contain Element  ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Show Section
    [Documentation]  This keyword is to Click on Show Section in the ${Def} Editor
    Wait Until Element Is Visible  ${UNISPHERE_SHOWSUBORDINATE_ID}  timeout=20
    Page Should Contain Element  ${UNISPHERE_SHOWSUBORDINATE_ID}
    Click Element   ${UNISPHERE_SHOWSUBORDINATE_ID}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#-----------------------------------------------------------------------------------------------------------------------
Check the Show Section Field
    [Documentation]  This keyword is to verify the Show Section field in the ${Def} Editor.
    Wait Until Element Is Visible  ${UNISPHERE_SUBORDINATESEARCHBOX_ID}  timeout=20
    Page Should contain Element  ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Page Should contain Element  ${UNISPHERE_EDITORSUBORDINATECLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Close the Show Section Field
    [Documentation]  This keyword is to click and close the Show section in the ${Def} editor.
    Click Element   ${UNISPHERE_EDITORSUBORDINATECLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Default Image placholder
    [Documentation]  This keyword is used to check the Default Image placholder.
    wait until keyword succeeds  5x  2s  Page Should Contain Image   ${IMAGEPLACEHOLDERSRC}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Floating buttons in Editor
    [Documentation]  This keyword is to verify the Floating buttons in the EditorScenes,Organizations
    ...              , Sites, Environments, Clouds,Site Servers and Data Sources).
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  5x  2s  Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Execute Javascript    $(document).scrollTop(10)
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Breadcrumb section in editor
    [Documentation]  This keyword is to verify the Breadcrumb section in the ${Def} Editor.
    Wait Until Element Is Visible  ${UNISPHERE_EDITORBREADCRUMB_ID}  timeout=20
    Page Should Contain Element  ${UNISPHERE_EDITORBREADCRUMB_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Breadcrumb Name
    [Documentation]  This keyword is used to check the Breadcrumb name in the Editor page.
    Wait Until Element Is Visible   ${UNISPHERE_NAME_TEXTBOX}  timeout=20
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    TestName
    Wait Until Element Is Visible  ${UNISPHERE_OBJECTNAME_ID}  timeout=20
    ${BreadcrumbName}=   Get Text   ${UNISPHERE_OBJECTNAME_ID}
    pass execution if  "${BreadcrumbName}"  == "TestName"
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Dirty Flag in page
    [Documentation]  This keyword is used to check the Dirty flag is displayed in the Editor page.
    Page should Contain Element   ${UNISPHERE_EDITORDIRTYFLAG_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on VA Play button
    [Documentation]  This keyword is used to click on the Video Assistance Play button.
    Page Should Contain Element  ${UNISPHERE_VIDEO_ICON}
    Click Element  ${UNISPHERE_VIDEO_ICON}
    Wait Until Element Is Visible  ${UNISPHERE_VIDEOONLINESECTION_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Online Video Assistance window
    [Documentation]  This keyword is used to check the Online Video assistance window is displayed.
    Wait Until Element Is Visible  ${UNISPHERE_VIDEOONLINESECTION_ID}  timeout=20
    Page Should Contain Element  ${UNISPHERE_VIDEOONLINESECTION_ID}
    SPH_DESN_Close the Online Video Assistance
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Close the Online Video Assistance
    [Documentation]  This keyword is used to close the Online Video assistance window.
    Wait Until Element Is Visible   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}  timeout=20
    Set Focus To Element   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}
    Mouse Over   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}
    Click Button   ${UNISPHERE_VIDEOPOPUPCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Parent breadcrumb navigation
    [Documentation]  This keyword is used to click on the Parent breadcrumb in the Editor page.
    COMMON_Scroll to top of the page
    Wait Until Element Is Visible  ${UNISPHERE_BREADCRUMBPARENT_ID}  timeout=20
    wait until keyword succeeds  20x  2s  Click Element  ${UNISPHERE_BREADCRUMBPARENT_ID}
    Wait Until Element Is Visible   ${UNISPHERE_TABLEVIEW_BTN}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Parent breadcrumb with dirty flag
    [Documentation]  This keyword is used to click on the Parent breadcrumb in the Editor page.
    COMMON_Scroll to top of the page
    Wait Until Element Is Visible  ${UNISPHERE_BREADCRUMBPARENT_ID}  timeout=20
    wait until keyword succeeds  20x  2s  Click Element  ${UNISPHERE_BREADCRUMBPARENT_ID}
    Wait Until Element Is Visible  ${UNISPHERE_POPUPSAVEBTN_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate back to Designer
    [Documentation]     This keyword is used to navigate back to UniSphere Designer page.
    SPH_DESN_Open Designer page
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Open Designer page
    [Documentation]     This Keyword is used to navigate to Designer page from the Solution Landing page.

    ${Logout_Menu}=  Run Keyword And Return Status  Element Should Be Visible  ${UNISECURE_USERDISPLAY_IMAGE}
    Run Keyword If  '${Logout_Menu}'=='${TRUE}'  SPH/SEC_Logout from UniSecure/UniSphere
    ...  ELSE  GoTo  ${LOGIN URL}/${Solution}/
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Close button in Add item with dirty flag
    [Documentation]  This keyword is used to clcik on the Close button in the Editor page.
    SPH_DESN_Enter input in name and description
    SPH_DESN_Check the Dirty Flag in page
    Wait Until Element Is Visible  ${UNISPHERE_EDITORCLOSE_BTN}  timeout=20
    Click Element  ${UNISPHERE_EDITORCLOSE_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_DELETCONFIRMPOPUP_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_DELETCONFIRMPOPUP_ID}
    wait until keyword succeeds  15x  2s  Click Element   ${UNISPHERE_POPUPCANCELBTN_BTN}
    Wait Until Element Is Visible    ${UNISPHERE_ADDNEWITEM_BTN}  timeout=20
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter Maximum Input in Name/Description
    [Documentation]  This keyword is used to enter the maximum input in Name and description field in the Editor page.
    ...               ${MaximumLength} is used to specify the length of the name field.
    ...               ${Locatortextbox} is used to specify the textbox locator to enter the input.
    [Arguments]   ${Locatortextbox}  ${MaximumLength}
    ${New_EditorName} =    SPH_DESN_Return Unique Editor name  ${MaximumLength}
    wait until keyword succeeds  5x  2s  Click Element  ${Locatortextbox}
    Input Text    ${Locatortextbox}   ${New_EditorName}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Return Unique Editor name
    [Documentation]   This keyword is used to return the name field for Editor page.
    ...               ${MaximumLength} is used to specify the length of the Editor name field.
    [Arguments]   ${MaximumLength}  ${prefix}=EditorNameDescription    ${suffix}=1
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
    [Documentation]   Check the Maximum length of the entered text in the textbox
    ...               ${LocatorRef} is used to specify the Locator of the field.
    ...               ${MaximumLength}  is used to specify the Maximum length of the field.
    [Arguments]  ${LocatorRef}   ${MaximumLength}
    ${EnteredText}=   Get value   ${LocatorRef}
    log to Console    ${EnteredText}
    ${LengthofEnteredText} =   Get Length   ${EnteredText}
    log to Console    ${LengthofEnteredText}
    Should Be Equal As Integers	${LengthofEnteredText}	${MaximumLength}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Upload an Image
    [Documentation]  This keyword is used to Upload the image as per the definition.
    Wait Until Element Is Visible   ${UNISPHERE_DESNEDITORUPLOADIMG_ID}  timeout=20
    Set Focus To Element    ${UNISPHERE_DESNEDITORUPLOADIMG_ID}
    Run Keyword If  '${Def}'== 'Scene'   SPH_DESN_FILEUPLOADER    ${UNISPHERE_UPLOADIMAGE_ID}    ${SCENEIMAGEUPLOAD}
    ...    ELSE IF  '${Def}'== 'Organization'  SPH_DESN_FILEUPLOADER    ${UNISPHERE_UPLOADIMAGE_ID}    ${ORGIMAGEUPLOAD}
    ...    ELSE IF  '${Def}'== 'Site'  SPH_DESN_FILEUPLOADER    ${UNISPHERE_UPLOADIMAGE_ID}   ${SITEIMAGEUPLOAD}
    ...    ELSE IF  '${Def}'== 'Environment'  SPH_DESN_FILEUPLOADER    ${UNISPHERE_UPLOADIMAGE_ID}   ${ENVIMAGEUPLOAD}
    ...    ELSE IF  '${Def}'== 'DataSources'  SPH_DESN_FILEUPLOADER    ${UNISPHERE_UPLOADIMAGE_ID}   ${SITESERIMAGEUPLOAD}
    ...    ELSE     SPH_DESN_FILEUPLOADER    ${UNISPHERE_UPLOADIMAGE_ID}    ${CURDIR}${IMAGEUPLOAD}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_FILEUPLOADER
    [Documentation]  This keyword is used to upload the file.
    ...              ${UploaderID} is used to specify the Locator if the upload file.
    ...              ${Uploadfile} is used to specify the directory of the file.
    [Arguments]     ${UploaderID}   ${Uploadfile}
    Choose File    ${UploaderID}    ${CURDIR}${Uploadfile}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Image is uploaded
    [Documentation]  This keyword is used to check the Image is uploaded.
    Wait Until Element Is Visible   //*[@id="${UNISPHERE_EDITORIMAGEPRODUCT_ID}"]  timeout=20
    wait until keyword succeeds  10x  2s  Page Should not Contain Image   ${IMAGEPLACEHOLDERSRC}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Comments
    [Documentation]  This keyword is used to clcik on the Comments button in the Editor page.
    Wait Until Element Is Visible  ${UNISPHERE_EDITORCOMMENTS_ID}  timeout=20
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_EDITORCOMMENTS_ID}
    wait until keyword succeeds  5x  2s   Page Should Contain Element  ${UNISPHERE_COMMENTSCONTENT_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the UI of the Open Comments
    [Documentation]  This keyword is sued to check the UI of the Comments popup in the Editor page.
    Page Should Contain Element  ${UNISPHERE_COMMENTSLABEL_ID}
    Page Should Contain Element  ${UNISPHERE_NEWCOMMENTLABEL_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSCONTENT_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSADDBTN_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSOKBTN_ID}
    Page Should Contain Element  ${UNISPHERE_COMMENTSCANCELBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Cancel button in Comments popup
    [Documentation]  This keyword is used to click on Cancel button in the Comments popup.
    Wait Until Element Is Visible  ${UNISPHERE_COMMENTSCANCELBTN_ID}  timeout=20
    Click Element  ${UNISPHERE_COMMENTSCANCELBTN_ID}
    Wait Until Element Is Visible  ${UNISPHERE_EDITORCOMMENTS_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter comments in the New comment
    [Documentation]  This keyword is used to Enter comments in the Comments popup.
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
    [Documentation]  This keyword is used to click on Add button in the comments popup.
    Wait Until Element Is Visible   ${UNISPHERE_COMMENTSADDBTN_ID}  timeout=20
    Click Element  ${UNISPHERE_COMMENTSADDBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the comments in the comments popup
    [Documentation]  This keyword is used to Search the comments int eh Comment popup.
    Wait Until Element Is Visible  ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}  timeout=20
    wait until keyword succeeds  10x  2s  Click Element  ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}
    Clear Element Text   ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}
    Input Text   ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}   ${New_Comments}
    page should contain element   ${UNISPHERE_COMMENTSSEARCHDESC_XPATH}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Ok button in Comments popup
    [Documentation]  This keyword is used to Click on Ok button in the comments popup.
    Click Element  ${UNISPHERE_COMMENTSOKBTN_ID}
    Wait Until Element Is Visible   ${UNISPHERE_EDITORCOMMENTS_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Save button in Editor page
    [Documentation]  This keyword is used to Click on save button in the Editor page.
    Mouse Over   ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  15x  2s  Click Element    ${UNISPHERE_SAVEBTN_ID}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Save button in Editor page with Dirty Flag
    [Documentation]  This keyword is used to Click on save button in the Editor page.
    Mouse Over   ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  15x  2s  Click Element    ${UNISPHERE_SAVEBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Publish button in Editor page
    [Documentation]  This keyword is used to Click on Publish button in the Editor page.
    Wait Until Element Is Visible   ${UNISPHERE_FLOATBTNICON_ID}  timeout=20
    Mouse Over   ${UNISPHERE_FLOATBTNICON_ID}
    wait until keyword succeeds  5x  2s  Mouse Over   ${UNISPHERE_PUBLISHBTN_ID}
    Wait Until Element Is Enabled  ${UNISPHERE_PUBLISHBTN_ID}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_PUBLISHBTN_ID}
    wait until keyword succeeds  10x  2s  Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}
    #added by Akash
    Wait Until Element Is Visible   ${UNISPHERE_MESSAGECENTERCLOSE_BTN}    timeout=20
    Click Element   ${UNISPHERE_MESSAGECENTERCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter input in name and description
    [Documentation]  This keyword is used to Enter the input in name and description.
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    TestName
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    TestDescription
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Enter Random Input in Name and Description
    [Documentation]  This keyword is used to Enter the Random input in name and description.
    [Arguments]    ${Random_name}  ${Random_Description}
    wait until keyword succeeds  3x  2s  Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    ${Random_name}
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Clear Element Text   ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Verify the Save Confirmation popup
    [Documentation]  This keyword is used to Verify the Save Confirmation popup.
    Wait Until Page Contains Element   ${UNISPHERE_POPUPSAVEBTN_ID}  timeout=20
    Page should Contain Element   ${UNISPHERE_POPUPSAVEBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on No button in the Save Confirmation popup
    [Documentation]  This keyword is used to Click on No button in the Save Confirmation popup.
    Wait Until Element Is Visible   ${UNISPHERE_POPUPCANCELBTN_BTN}  timeout=20
    wait until keyword succeeds  5x  2s  Page should Contain Element   ${UNISPHERE_POPUPCANCELBTN_BTN}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_POPUPCANCELBTN_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_ADDNEWITEM_BTN}  timeout=20
    wait until keyword succeeds  5x  2s  Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Yes button in the Save Confirmation popup
    [Documentation]  This keyword is used to Click on Yes button in the Save Confirmation popup.
    Wait Until Element Is Visible   ${UNISPHERE_POPUPSAVEBTN_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Page should Contain Element   ${UNISPHERE_POPUPSAVEBTN_ID}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_POPUPSAVEBTN_ID}
    Wait Until Element Is Visible  ${UNISPHERE_NAME_TEXTBOX}  timeout=20
    wait until keyword succeeds  5x  2s  Page should Contain Element   ${UNISPHERE_NAME_TEXTBOX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Cancel button in the Floating buttons
    [Documentation]  This keyword is used to Click on Cancel button in the Floating buttons.
    Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Click Element   ${UNISPHERE_EDITORCANCEL_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Verify user is navigated back to Parent page
    [Documentation]  This keyword is used to verify if user is navigated back to Parent page.
    Wait Until Element Is Visible  ${UNISPHERE_ADDNEWITEM_BTN}  timeout=20
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Change the Grid View/List view
    [Documentation]  This keyword is used to Change the Grid View/List View
    ...              ${BUTTON} is used to Specify the Button of Card/list view
    ...              ${SEARCHBOX} is used to specify the Search box id
    [Arguments]  ${BUTTON}   ${SEARCHBOX}
    Wait Until Element Is Visible   ${BUTTON}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${BUTTON}
    Wait Until Element Is Visible  ${SEARCHBOX}  timeout=20
    Click Element   ${BUTTON}
    Wait Until Element Is Visible   ${BUTTON}  timeout=20
    Run Keyword If  '${BUTTON}' == '${UNISPHERE_CARDVIEW_BTN}'
    ...  Wait Until Element Is Visible   ${UNISPHERE_CARDSPERPAGELIST_ID}  timeout=20
    Run Keyword If  '${BUTTON}' == '${UNISPHERE_TABLEVIEW_BTN}'
    ...   Wait Until Page Contains Element   ${UNISPHERE_TABLEITEMSPERPAGELIST_XPATH}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save
    [Documentation]  This keyword is used to Search the new definition after saving the Definition.
    ...              ${Definition_Name} is to specify the name of the saved definition.
    ...              ${Def_Item} is to specify the locator of the Definition
    [Arguments]  ${Definition_Name}  ${Def_Item}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
	Sleep  2s
    Wait Until Element Is Visible  ${Def_Item}_itemName_0  timeout=20
    wait until keyword succeeds  15x  2s  Page should contain element    ${Def_Item}_itemName_0
    Wait Until Element Is Visible    ${UNISPHERE_CARDSPERPAGELIST_ID}  timeout=20
    wait until keyword succeeds  15x  2s  Page should contain element    ${UNISPHERE_CARDSPERPAGELIST_ID}
    Wait Until Element Is Visible  ${Def_Item}_itemName_0  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save in Table view
    [Documentation]  This keyword is used to Search the new definition after save in Table view.
    ...              ${Definition_Name} is to specify the name of Scene,Organization,Site,Site Server and Environments
    [Arguments]  ${Definition_Name}
	Wait Until Page Contains Element  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    sleep  5s
	Wait Until Page Contains Element  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}  timeout=20
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}  timeout=20
    Wait Until Element Is Visible  ${UNISPHERE_TABLE_ROWS}/label/span  timeout=20
    Page should contain element    ${UNISPHERE_TABLE_ROWS}/label/span
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save and Click the Item
    [Documentation]  This keyword is used to Search the new definition after save and Click the Item.
    ...              ${Definition_Name} is to specify the name of Scene,Organization,Site,Site Server and Environments
    ...              ${Def_Item} is to specify the locator of the Definition
    [Arguments]  ${Definition_Name}  ${Def_Item}

    Wait Until Element Is Visible  ${UNISPHERE_CARDVIEW_BTN}  timeout=20
	Scroll Page To Location    0    0
    Click Element  ${UNISPHERE_CARDVIEW_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${Def_Item}_itemName_0  timeout=5
    wait until keyword succeeds  10x  2s  Wait Until Element Is Visible  ${UNISPHERE_CARD_IMAGE_XPATH}
    wait until keyword succeeds  10x  2s  Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    wait until keyword succeeds  5x  2s  Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${Def_Item}_itemName_0  timeout=5
    wait until keyword succeeds  5x  2S  Wait Until Element Is Visible  ${UNISPHERE_CARD_IMAGE_XPATH}
    Wait Until Element Is Visible  ${UNISPHERE_ITESPERPAGE_ID}  timeout=20
    : For  ${Index}  IN RANGE  1  20
    \   ${name}=  Get Text  ${Def_Item}_itemName_0
    \   ${Status}=  Run Keyword And Return Status  Should Contain  ${name}  ${Definition_Name}
    \   Exit For Loop If  '${Status}'=='${TRUE}'
    \   Sleep  1S
    wait until keyword succeeds  15x   2s   Click Element   ${Def_Item}_itemName_0
#    sleep  5s
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Update the Image
    [Documentation]  This keyword is used to Updated the Image in the editor page.
    Wait Until Element Is Visible   ${UNISPHERE_DESNEDITORUPLOADIMG_ID}  timeout=20
    Set Focus To Element    ${UNISPHERE_DESNEDITORUPLOADIMG_ID}
    SPH_DESN_FILEUPLOADER    ${UNISPHERE_UPLOADIMAGE_ID}    ${IMAGEUPDATE}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Declare Random variable for Description
    [Documentation]  This keyword is sued to Declare the Random variabled for Description.
    ...              ${MaximumLength} is used to specify the length of the Description field.
    [Arguments]   ${MaximumLength}
    ${Random_Description} =    SPH_DESN_Return Unique Description name   ${MaximumLength}
    set global variable  ${Random_Description}
    log to console   ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Update Random Input in Description
    [Documentation]  This keyword is used to Update Random Input in Description.
    ...             ${MaximumLength} is used to specify the length of the name field.
    [Arguments]     ${Random_Description}
    Wait Until Element Is Visible  ${UNISPHERE_DESCRIPTION_TEXTBOX}  timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_DESCRIPTION_TEXTBOX}  timeout=20
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
	Clear Element Text  ${UNISPHERE_DESCRIPTION_TEXTBOX}
	Sleep  2s
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the Updated description after save
    [Documentation]  This keyword is used to Search the Updated description after save
     ...              ${Definition_Name} is to specify the name of Scene,Organization,Site,Site Server and Environments
     ...              ${Def_Item} is to specify the locator of the Definition
    [Arguments]  ${Definition_Name}  ${Def_Item}
    Wait Until Element Is Visible  ${UNISPHERE_CARDVIEW_BTN}  timeout=20
    Click Element  ${UNISPHERE_TABLEVIEW_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Definition_Name}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    wait until keyword succeeds  2x   2s   Page should contain element   ${Def_Item}_0
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Updated description in table view
    [Documentation]  This keyword is used to Check the Updated description in table view
     ...              ${Random_Description} is to specify the Random description
     ...              ${Def_Item} is to specify the locator of the Definition
    [Arguments]    ${Random_Description}  ${Def_Item}
   Wait Until Element Is Visible  ${UNISPHERE_TABLEVIEW_BTN}  timeout=20
   Click Element   ${UNISPHERE_TABLEVIEW_BTN}
   Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}  timeout=20
   Sleep  5s
   ${Expected}=  get text  //*[@id="description_0-cell"]
   log to console  ${Expected}
   Should be equal as strings   ${Expected}    ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Show Subordinate
    [Documentation]  This keyword is used to click on the Show Subordinate link.
	Scroll Page To Location    0    0
    Wait Until Element Is Visible   //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]  timeout=20
    Scroll Page To Location    0    500
	Mouse Over    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
    Click Element    //*[@id="${UNISPHERE_SHOWSUBORDINATE_ID}"]
	Scroll Page To Location    0    1000
    wait until element is visible   ${UNISPHERE_SUBORDINATESEARCHBOX_ID}  timeout=20
    wait until element is visible   ${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}  timeout=20
    wait until element is visible   ${UNISPHERE_INCLUDESECTION_XPATH}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Drag and Drop the subordinates
    [Documentation]  This keyword is used to drag and drop the subordinates in the Show Subordinate section.
    ${js}        Get File              ${CURDIR}${DRAGANDDROPFILE}
    ${result}    Execute Javascript    ${js};  return DragNDrop('${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}','${UNISPHERE_INCLUDESECTION_XPATH}');
    Scroll Page To Location    0    2000
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Add the Subordinates object
    [Documentation]  This keyword is used to Add the Subordinates (Child) object in the Editor page.
    SPH_DESN_Click on Show Subordinate
    SPH_DESN_Drag and Drop the subordinates
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search and Add the Subordinates object
    [Documentation]  This keyword is used to Search and Add the Subordinates (Child) object in the Editor page.
    ...              ${SubOrdinatename} is to specify the Sub ordinate name to search.
    [Arguments]     ${SubOrdinatename}
    SPH_DESN_Click on Show Subordinate
    Click Element   ${UNISPHERE_SUBORDINATESEARCHBOX_ID}
    Wait Until Element Is Visible   ${UNISPHERE_SUBORDINATESEARCHBOX_ID}  timeout=20
    Input Text      ${UNISPHERE_SUBORDINATESEARCHBOX_ID}   ${SubOrdinatename}
    Wait Until Element Is Visible    ${UNISPHERE_SUBORDINATESEARCHBTN_XPATH}  timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}  timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_INCLUDESECTION_XPATH}  timeout=20
    ${SubOrdinateCount}=  Get Element Count   ${UNISPHERE_CHILDTITLE_CLASS}
    log to Console   ${SubOrdinateCount}
    :FOR  ${k}  IN RANGE   ${SubOrdinateCount}
    \   ${ChildID}=   Evaluate  ${k}+1
    \   ${SubOrdinateText}=  Get Text  ${UNISPHERE_CHILDCARD_XPATH} [${ChildID}]
    \   Run Keyword If  "${SubOrdinateText}" == "${SubOrdinatename}"    exit for loop
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    ${js}        Get File              ${CURDIR}${DRAGANDDROPFILE}
    ${result}    Execute Javascript    ${js};  return DragNDrop('${UNISPHERE_CHILDCARD_XPATH} [${ChildID}]','${UNISPHERE_INCLUDESECTION_XPATH}');
    Scroll Page To Location    0    2000
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Add Multiple Subordinates object
    [Documentation]  This keyword is used to Add multiple Subordinates (Child) in the Editor page.
    Click Element   //*[@id="leftmenuinner "]/div/div/a/span
    SPH_DESN_Click on Show Subordinate
    ${SubOrdinateCount}=  Get Element Count  ${UNISPHERE_CHILDTITLE_CLASS}
    log to Console   ${SubOrdinateCount}
    ${SubOrdinateCount}=  Set variable If  ${SubOrdinateCount}>${10}  ${10}  ${SubOrdinateCount}
    :FOR  ${k}  IN RANGE   ${SubOrdinateCount}
    \   SPH_DESN_Drag and Drop the subordinates
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Child Definition and delete a Subordinate
    [Documentation]  This keyword is used to Navigate to Child Definition and delete a Subordinate.
    ...              ${Definition} is used to specify the Parent (Scene,Organization,Site,Environment,cloud,Site Server)
    [Arguments]   ${Definition}
    Run Keyword If   '${Definition}' == 'Scene'   Run keywords
    ...    SPH_DESN_Navigate to Definition  ${UNISPHERE_DESORGANIZATION_ICON}  ${UNISPHERE_DESORGANIZATION_ID}
    ...    AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Organization is a child
    Run Keyword If   '${Definition}' == 'Organization'  Run keywords
    ...    SPH_DESN_Navigate to Definition  ${UNISPHERE_DESSITE_ICON}  ${UNISPHERE_DESSITE_ID}
    ...    AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Site is a child
    Run Keyword If   '${Definition}' == 'Site'   Run keywords
    ...    SPH_DESN_Navigate to Definition  ${UNISPHERE_DESENVIRONMENT_ICON}  ${UNISPHERE_DESENVIRONMENT_ID}
    ...    AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Environment is a child
    Run Keyword If   '${Definition}' == 'Environment'  Run keywords
    ...    SPH_DESN_Navigate to Definition  ${UNISPHERE_DATASOURCES_ICON}  ${UNISPHERE_DATASOURCES_ID}
    ...    AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  SiteServer is a child
    Run Keyword If   '${Definition}' == 'DataSources'   Run keywords
    ...    SPH_DESN_Navigate to Definition  ${UNISPHERE_DESCLOUD_ICON}  ${UNISPHERE_DESCLOUD_ID}
    ...    AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  Cloud is a child
    Run Keyword If   '${Definition}' == 'Cloud'       Run keywords
    ...    SPH_DESN_Navigate to Definition  ${UNISPHERE_DESDATASOURCES_ICON}  ${UNISPHERE_DESDATASOURCES_ID}
    ...    AND   SPH_DESN_Select a item in the table and click on Delete   AND   log to console  DataSource is a child
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Remove the Subordinate object
    [Documentation]  This keyword is used to Remove the Subordinates (Child) in the Editor page.
    Wait Until Element Is Visible   ${UNISPHERE_EDITORINCLUDEDSUBORDINATE_LBL}  timeout=20
    Page Should Contain Element        ${UNISPHERE_EDITORINCLUDEDSUBORDINATE_LBL}
    Run Keyword And Ignore Error  wait until keyword succeeds    5x  2s   Mouse Over  ${UNISPHERE_CHILDSUBORDINATEREMOVE_ID}
    Run Keyword And Ignore Error  wait until keyword succeeds    5x  2s	  Mouse Over   ${UNISPHERE_INCLUDESECTION_XPATH}/div
    wait until keyword succeeds    5x  2s   Click Element   ${UNISPHERE_CHILDSUBORDINATEREMOVE_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the error message for duplicate names
    [Documentation]  This test case is to check the error message for duplicate name save in the editor.
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
    Page Should Contain   ${UNISPHERE_DUPLICATENAME_MESSAGEPREFIX}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Definition name in the card view.
    [Documentation]  This keyword is used to Check the Definition name in the card view.
     ...             ${NAME} is to specify the name of the Definition.
     ...             ${CARDTITLEID} is to specify the locator of the Card.
    [Arguments]   ${NAME}   ${CARDTITLEID}
    wait until keyword succeeds  10x  2s  page should contain   ${NAME}
    ${CardTitle}=  get element attribute  ${CARDTITLEID}  title
    Log To Console  ${CardTitle}
    should be equal as strings    ${NAME.strip()}  ${CardTitle.strip()}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Highlighted text in the card view.
    [Documentation]  This keyword is used to Check the Highlighted text in the card view is matching with the Searched.
    ...              ${NAME} is to Specify the Searched name.
    ...              ${CARDTITLEID} is to specify the locator of the card.
    ...              ${ITEMLENGTH} is to specify the length of the Searched name.
    [Arguments]   ${NAME}   ${CARDTITLEID}   ${ITEMLENGTH}
    ${CardTitle}=  get text   ${CARDTITLEID}
    Log To Console  ${CardTitle}
    ${LengthofTitle}=  Get Length  ${CardTitle}
    log to console  ${LengthofTitle}
    should be equal as strings    ${NAME}  ${CardTitle}
    should be equal as numbers    ${LengthofTitle}  ${ITEMLENGTH}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on duplicate icon for Searched Item in table
    [Documentation]  This keyword is to check on the duplicate (Copy) icon for the Searched Card Item
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}  timeout=20
    wait until keyword succeeds  5x  5s  Select Checkbox   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    wait until keyword succeeds  5x  2s  Mouse Over  ${UNISPHERE_DEFFLOATBTN_ID}
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_DEFCOPYFLOATBTN_ID}
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Close the message center
    [Documentation]  This keyword is to Close the message center
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_MESSAGECENTERCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the description in the card view.
    [Documentation]  This keyword is to Check the description in the card view.
    ...              ${Description} is to specify the Description string
    ...              ${DescriptionID} is to specify the locator of the Description.
    [Arguments]   ${Description}   ${DescriptionID}
    ${ActualDescription}=  get element attribute  ${DescriptionID}  title
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
    ${ActualIMGSRC}=   get element attribute  ${UNISPHERE_DEFAULTASSETIMAGE_XPATH}  src
    log to console  ${ActualIMGSRC}
    Run keyword if  '${Def}'== 'Guardian'  SPH_DESN_Setup a variable  guardian_.*
    Run keyword if  '${Def}'== 'Environment'  SPH_DESN_Setup a variable  environment_.*
    Run keyword if  '${Def}'== 'Site'    SPH_DESN_Setup a variable    site_.*
    Run keyword if  '${Def}'== 'Organization'    SPH_DESN_Setup a variable    organization_.*
    Run keyword if  '${Def}'== 'Scene'      SPH_DESN_Setup a variable    scene_.*
    ${RegularExpressionSRC}=  Get Regexp Matches  ${ActualIMGSRC}   ${DefImagename}
    log to console   ${RegularExpressionSRC}
    ${SRC}=  Remove String Using Regexp   ${ActualIMGSRC}   ${DefImagename}
    ${LowercaseURL}=  Convert To Lowercase  ${URL}
    ${LowercaseLoginURL}=  Convert To Lowercase    ${LOGIN URL}
    should be equal   ${SRC}   ${LowercaseLoginURL}${UNISPHEREIMAGEFILE}/eng_${LowercaseURL}/

SPH_DESN_Setup a variable
    [Documentation]  This keyword is used to setup a variable
    [Arguments]  ${globaldefvariable}
    ${DefImagename}=  set variable  ${globaldefvariable}
    set global variable   ${DefImagename}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Declare Random variables for Editor Name and Description
    [Documentation]  This keyword is Used to Declare the Random variabled of Editor name and Description.
    ...              ${NAMELENGTH} is to specify the length of the Name text
    ...              ${DESCRIPTIONLENGTH} is to specify the length of the Description text
    [Arguments]    ${NAMELENGTH}  ${DESCRIPTIONLENGTH}
    ${Random_name} =    Return Unique Editor NameInput  ${NAMELENGTH}
    set global variable  ${Random_name}
    log to console   ${Random_name}
    ${Random_Description} =    Return Unique Editor DescriptionInput    ${DESCRIPTIONLENGTH}
    set global variable  ${Random_Description}
    log to console   ${Random_Description}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the added subordinates are displayed in Graphical tab
    [Documentation]  This keyword is used to Check the added subordinates are displayed in Graphical tab.
    ...               ${childsubordinate} is to specify the name of the Sub ordinates
    [Arguments]  ${childsubordinate}
    Wait Until Element Is Visible   ${UNISPHERE_CHILDTITLE_CLASS}  timeout=20
    ${ChildCount}=  Get Element Count  ${UNISPHERE_CHILDTITLE_CLASS}
    log to Console   ${ChildCount}
    ${ChildList}=  Create List
    :FOR  ${k}  IN RANGE   ${ChildCount}
    \     Run Keyword If  ${k} == ${ChildCount}    exit for loop
    \     ${values}=    Get Text  //*[@id="includedChildName_${k}"]
    \     Append to List   ${ChildList}    ${values}
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    wait until keyword succeeds  5x  2s  Click Element  //*[@id="${childsubordinate}"]
    Element Should Be Visible   //*[@id="${childsubordinate}"]
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Error message for Concurrent update
    [Documentation]  This keyword is to check the Error message for Concurrent update
    Wait Until Element is Visible    ${UNISPHERE_CONCURRENTODALPOUP_ID}  timeout=20
    Page Should Contain Element    ${UNISPHERE_CONCURRENTODALPOUP_ID}
    Page Should Contain Element    ${UNISPHERE_CONCURRENTNO_BTN}
    Page Should Contain Element    ${UNISPHERE_CONCURRENTYES_BTN}

#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on No button in the Concurrent update modal popup
    [Documentation]  This keyword is to click  on No button in the Concurrent update modal popup
    Wait Until Element Is Visible   ${UNISPHERE_CONCURRENTNO_BTN  timeout=20
    Click Element   ${UNISPHERE_CONCURRENTNO_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Yes button in the Concurrent update modal popup
    [Documentation]  This keyword is to click  on Yes button in the Concurrent update modal popup
    Wait Until Element Is Visible   ${UNISPHERE_CONCURRENTYES_BTN}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_CONCURRENTYES_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Message Prefix for the Concurrent Update of Definition
    [Documentation]  This keyword is used to check the Message Prefix for the Concurrent Update of Definition
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
    Run keyword if  '${Def}'== 'Scene'
    ...    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATESCENE_MESSAGEPREFIX}
     Run keyword if  '${Def}'== 'Organization'
    ...    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEORGANIZATION_MESSAGEPREFIX}
     Run keyword if  '${Def}'== 'Site'
    ...    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATESITE_MESSAGEPREFIX}
     Run keyword if  '${Def}'== 'Environment'
    ...    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEENVIRONMENT_MESSAGEPREFIX}
     Run keyword if  '${Def}'== 'DataSources'
    ...    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHERE_UPDATEDATASOURCE_MESSAGEPREFIX}
    SPH/SEC_Close the message center
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Error message for SubOrdinate Reference update
    [Documentation]  This keyword is to check the Error message
    Wait Until Element Is Visible    ${UNISECURE_MESSAGE_ID}  timeout=20
    Page Should Contain       ${REMOVEDSUBORDINATE}
#-----------------------------------------------------------------------------------------------------------------------
########################################################  UNISPHERE DESIGNER TESTCASE ##################################
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Start, Publish, Required, Optional static images
    [Documentation]  This keyword is used to check the static images(Start Publish, Required Optional)
    ...              in the Welcome Designer dashboard.
    Wait Until Element Is Visible  ${UNISPHERE_DESHOMESTART_ID}  timeout=15
    Page Should Contain Element  ${UNISPHERE_DESHOMESTART_ID}
    Page Should Contain Element  ${UNISPHERE_DESHOMEPUBLISH_ID}
    Page Should Contain Element  ${UNISPHERE_DESHOMEREQUIRED_ID}
    Page Should Contain Element  ${UNISPHERE_DESHOMEOPTIONAL_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the navigation links in the home page
    [Documentation]  This keyword is to check clicking on the link user is navigating to the respective editor page.
    ...             ${NAVIGATIONID}  is the Designer definition(Scen Organization,Site,Environment) HTML id's
    ...             ${EDITORELEMENT} is the Editor name or Description element.
    [Arguments]  ${NAVIGATIONID}   ${EDITORELEMENT}
    Wait Until Element Is Visible   ${NAVIGATIONID}  timeout=20
    Mouse Over   ${NAVIGATIONID}
    wait until keyword succeeds  5x  2s  Click Element  ${NAVIGATIONID}
    Wait Until Element Is Visible   ${EDITORELEMENT}  timeout=20
    Page Should Contain Element  ${EDITORELEMENT}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Navigate to Published Scene
    [Documentation]  This keyword is used to navigate to the Published Scene in the Operator.
    Wait Until Element Is Visible  ${UNISPHERE_WELCOME_ID}  timeout=10
	wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_WELCOME_ID}
    Wait Until Element Is Visible   ${UNISPHERE_MANAGESCENE_CARD_ID}  timeout=20
    Click Element   ${UNISPHERE_MANAGESCENE_CARD_ID}
    Wait Until Element Is Visible  ${UNISPHERE_PUBLISHEDFAMIL_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Save/Discard/Publish button disabled
    [Documentation]  This keyword is used to check the save/discard/publish button is disabled
    ...              ${BTNDISABLED} is to specify the disabled button(Save/Discard/Publish).
    [Arguments]   ${BTNDISABLED}
    Wait Until Element Is Visible   ${UNISPHERE_FLOATBTNICON_ID}  timeout=20
    Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${BTNDISABLED}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Element Should Be Disabled   ${BTNDISABLED}
    Run keyword If  '${Def}'=='Scene'   Page Should Contain Element  ${UNISPHERE_PUBLISHBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Save/Discard/Publish button enabled
    [Documentation]  This keyword is used to check the Save/Discard button is Enabled
    ...              ${BTNENABLED} is to specify the enabled button(Save/Discard/Publish).
    [Arguments]   ${BTNENABLED}
    Wait Until Element Is Visible   ${UNISPHERE_FLOATBTNICON_ID}  timeout=20
    Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${BTNENABLED}   ${UNISPHERE_EDITORCANCEL_BTN}
    Element Should Be Enabled   ${BTNENABLED}
    Run keyword If  '${Def}'=='Scene'  Page Should Contain Element  ${UNISPHERE_PUBLISHBTN_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Discard button
    [Documentation]  This keyword is used to Click on the Discard button
    Wait Until Element Is Visible   ${UNISPHERE_FLOATBTNICON_ID}  timeout=20
    Mouse over   ${UNISPHERE_FLOATBTNICON_ID}
    Page Should Contain Element  ${UNISPHERE_SAVEBTN_ID}
    Page Should Contain Element  ${UNISPHERE_EDITORCANCEL_BTN}
    Click Element   ${UNISPHERE_EDITORCANCEL_BTN}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Close button in Add item with out dirty flag
    [Documentation]  This keyword is used to Click on close button in the Editor page.
    Wait Until Element Is Visible   ${UNISPHERE_EDITORCLOSE_BTN}  timeout=20
    Click Element  ${UNISPHERE_EDITORCLOSE_BTN}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on breadcrumbs navigation
    [Documentation]  This keyword is used to Click the breadcrumb navigation in the Editor page.
    Wait Until Element Is Visible    ${UNISPHERE_BREADCRUMBPARENT_ID}  timeout=20
    Click Element  ${UNISPHERE_BREADCRUMBPARENT_ID}
    Page should Contain Element   ${UNISPHERE_ADDNEWITEM_BTN}
    Click Element  ${UNISPHERE_EDITORDESIGNERBREADCRUMB_ID}
    Page Should Contain Image   ${UNISPHERE_EDITORUNISPHEREBREADCRUMB_ID}
#-----------------------------------------------------------------------------------------------------------------------
Check validation message in Name
    [Documentation]  This keyword is used to check the validation message on Name Field in the Editor page.
    Wait Until Element Is Visible    ${UNISPHERE_NAME_TEXTBOX}  timeout=20
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    TestName
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    TestDescription
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    page should contain element   ${UNISPHERE_REQERROR_ID}
#-----------------------------------------------------------------------------------------------------------------------
Check Records are dispalyed in Card View
    [Documentation]  This keyword is used to check the records are displayed in the card view.
    ...              ${CARD_ITEM_RECORD}  is to specify the Id of the Card.
    [Arguments]  ${CARD_ITEM_RECORD}
    Wait Until Element Is Visible   ${CARD_ITEM_RECORD}  timeout=20
    Page Should Contain Element   ${CARD_ITEM_RECORD}
#-----------------------------------------------------------------------------------------------------------------------
Check Records are dispalyed in List View
    [Documentation]  Thiskeyword is used to check the records are displayed in the list view.
    Wait Until Element Is Visible  ${UNISPHERE_TABLEHEADER_ID}  timeout=20
    Page Should Contain Element  ${UNISPHERE_TABLEHEADER_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Edit icon for Searched Card Item
    [Documentation]  This keyword is used to click on the Edit menu icon for the Searched Card item.
    Wait Until Element Is Visible   ${UNISPHERE_CARDOPTIONS_MENU}  timeout=20
    wait until keyword succeeds  5x  2s  Mouse down   ${UNISPHERE_CARDOPTIONS_MENU}
    Set Focus To Element   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${UNISPHERE_CARDSEDIT_BTN}  timeout=20
    wait until keyword succeeds  5x  2s  Mouse over   ${UNISPHERE_CARDSEDIT_BTN}
    Sleep  3s
    Double Click Element   ${UNISPHERE_CARDSEDIT_BTN}
    Sleep  3s
    Wait Until Element Is Visible   ${UNISPHERE_NAME_TEXTBOX}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
Click on delete icon for Searched Card Item
    [Documentation]  This keyword is used to click on the Delete menu icon for the Searched Card item.
    Wait Until Element Is Visible   ${UNISPHERE_CARDOPTIONS_MENU}  timeout=20
    Sleep  5s
    Mouse down   ${UNISPHERE_CARDOPTIONS_MENU}
    Set Focus To Element   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSDELETE_BTN}  timeout=20
    Mouse over  ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Double Click Element   ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Wait Until Element Is Visible   ${UNISPHERE_DELETEYESBTN_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
Search the item after deletion
    [Documentation]  This keyword is used to Search the deleted item and check the message for Not Found.
    ...              ${Deleted_Scene} is to specify the Definition (Scene, organization, etc) to delete
    [Arguments]  ${Deleted_Scene}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${Deleted_Scene}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_NOTFOUND_ID}  timeout=20
    Page should contain element   ${UNISPHERE_NOTFOUND_ID}
#-----------------------------------------------------------------------------------------------------------------------
Click Yes button in the Delete Confirmation popup
    [Documentation]  This keyword is used to click on yes button in the Delete Confirmation popup.
    Wait Until Element Is Visible   ${UNISPHERE_DELETEYESBTN_ID}  timeout=20
    Click Element  ${UNISPHERE_DELETEYESBTN_ID}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
Click No button in the Delete Confirmation popup
   [Documentation]  This keyword is used to click on No button in the Delete Confirmation popup.
    Wait Until Element Is Visible   ${UNISPHERE_POPUPCANCELBTN_BTN}  timeout=20
    Click Element  ${UNISPHERE_POPUPCANCELBTN_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
Click Close button in the Delete Confirmation popup
    [Documentation]  This keyword is used to click on Close button in the Delete Confirmation popup
    Wait Until Element Is Visible   ${UNISPHERE_DELETECONFPOPUP_ID}  timeout=20
    Click Element  ${UNISPHERE_DELETECONFPOPUP_ID}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Update the Definition
    [Documentation]  This keyword is used to Update the Definition(Scene, Organization, etc) with the name and Description
    ...              ${Updated_Scene} is to specify the Definition name to update
    ...              ${Updated_Description} is to specify the Definition description to update
    [Arguments]    ${Updated_Scene}  ${Updated_Description}
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Clear Element Text   ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    ${Updated_Scene}
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Clear Element Text   ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    ${Updated_Description}
    Mouse Over   ${UNISPHERE_FLOATBTNICON_ID}
    Click Element    ${UNISPHERE_SAVEBTN_ID}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the new definition after save in UniSphere Operator
    [Documentation]  This keyword is used to search the new definition in the UniSphere Operator.
    ...              ${Definition_Name} is used to specify the name of the Definiton (Scene, organization, etc)
    ...              ${Def_Item} is used to specify the ID of the Definition.
    [Arguments]  ${Definition_Name}  ${Def_Item}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${Def_Item}_0  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCH}
    wait until keyword succeeds  5x  2s  Input Text  ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCH}    ${Definition_Name}
    Click Element  ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHBTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${Def_Item}_0  timeout=2
    Wait Until Element Is Visible  ${Def_Item}_0  timeout=20
    wait until keyword succeeds  5x  2s  Page should contain element    ${Def_Item}_0
    Wait Until Element Is Visible    ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHED}  timeout=20
    wait until keyword succeeds  5x  2s  Page should contain element    ${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHED}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the published scene in UniSphere Operator
    [Documentation]  This keyword is used to Search the published scene in the Operator
    ...              ${Definition_Name} is used to specify the name of the Definiton (Scene, organization, etc)
    ...              ${Def_Item} is used to specify the ID of the Definition.
    [Arguments]  ${Definition_Name}  ${Def_Item}
    Wait Until Element Is Visible  ${Def_Item}  timeout=20
    Sleep  2S
    Click Element   ${UNISPHERE_OPERAPUBSEARCHINPUT_XPATH}
    Input Text   ${UNISPHERE_OPERAPUBSEARCHINPUT_XPATH}   ${Definition_Name}
    Click Element  ${UNISPHERE_OPERAPUBSCENESEARCHBTN_XPATH}
    Wait Until Element Is Visible  ${Def_Item}  timeout=20
    wait until keyword succeeds  5x  2s  Page should contain element    ${Def_Item}
    Click Element   ${Def_Item}
    Sleep  1S
    Wait Until Element Is Visible    ${UNISPHERE_GRAPHICALTABOPERATOR_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Accept/Reject Button
    [Documentation]  This keyword is used to click on Accept/Reject button in the Card view of the Definitions
    ...              ${Button} is to specify the button Id to click on.
    [Arguments]  ${Button}
    wait until keyword succeeds  2x   2s   Page should contain element   ${Button}
    wait until keyword succeeds  2x   2s   Mouse Over   ${Button}
    wait until keyword succeeds  2x   2s   Click Button   ${Button}
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Select a item in the table and click on Delete
    [Documentation]  This keyword is to Select a item in the table and click on Restore
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}  timeout=20
    Wait Until Element Is Visible    ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}  timeout=20
    ${Deletetext}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Log To Console  ${Deletetext}
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}   ${Deletetext}
    Click Element    ${UNISPHERE_CARDSSEARCH_BTN}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    SPH_DESN_Click the Delete button
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Select a item in the table view and click on Delete button
    [Documentation]  This keyword is to Select a item in the table and click on Restore
    ...              ${Searcheditem} is to specify the Defnition name to Search
    [Arguments]   ${Searcheditem}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}  timeout=20
    Wait Until Element Is Visible    ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}  timeout=20
    ${Deletetext}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Log To Console  ${Deletetext}
    should be equal  ${Searcheditem}    ${Deletetext}
    Select Checkbox   ${UNISPHERE_TRASHTABLEFIRST_CHKBX}
    Mouse Over  ${UNISPHERE_DEFFLOATBTN_ID}
    Click Element   ${UNISPHERE_DEFDELETEFLOATBTN_ID}
    Wait Until Element Is Visible   ${UNISPHERE_DELETECONFIRMATION_BTN}  timeout=20
    run keyword and ignore error  Click Element  ${UNISPHERE_DELETECONFIRMATION_BTN}
	Sleep  3S
	${PopupStatus}=  Run Keyword And Return Status  Element Should be Visible  ${UNISPHERE_DELETECONFIRMATION_BTN}
    Run Keyword If  '${PopupStatus}'=='${TRUE}'  Click Element  ${UNISPHERE_DELETECONFIRMATION_BTN}
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click the Delete button
    [Documentation]  This keyword is to Click the Delete button in the Card view.
    Sleep  5s
    wait until keyword succeeds  5x  2s  Mouse down   ${UNISPHERE_CARDOPTIONS_MENU}
    Set Focus To Element   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSDELETE_BTN}  timeout=20
    Mouse over  ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Double Click Element   ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Wait Until Element Is Visible   ${UNISPHERE_DELETECONFIRMATION_BTN}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_DELETECONFIRMATION_BTN}
    ${Status}  ${Message}  Run Keyword And Ignore Error  Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
	Run Keyword If  '${Status}'=='FAIL'  Run Keywords  Click Element  ${UNISPHERE_DELETECONFIRMATION_BTN}
	...  AND  Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Graphical tab Elements
    [Documentation]  This keyword is used to check the SVG Graphical tab elements
    ...              ${Def} is to specify the name of the Definition
    ...             @{GraphicalElements} is to specify the list of Grpahical elements to verify
    [Arguments]  ${Def}  @{GraphicalElements}
    COMMON_Scroll to bottom of the page
    ${LENGTH}=  Get Length   ${GraphicalElements}
    log to console  ${LENGTH}
    :FOR  ${i}  IN  @{GraphicalElements}
    \     Wait Until Element Is Visible   //*[@id="${i}"]  timeout=20
    \     wait until keyword succeeds  15x  2s   Page Should Contain Element   //*[@id="${i}"]
    \     Run keyword if  '${Def}'== 'DataSources'      log to console   No Path links are displayed for DataSources
    \     Run keyword if  '${Def}'== 'Environment'     SPH_DESN_Check the Path links  ${LENGTH}
    \     Run keyword if  '${Def}'== 'Site'     SPH_DESN_Check the Path links  ${LENGTH}
    \     Run keyword if  '${Def}'== 'Organization'     SPH_DESN_Check the Path links  ${LENGTH}
    \     Run keyword if  '${Def}'== 'Scene'     SPH_DESN_Check the Path links  ${LENGTH}
    COMMON_Scroll to top of the page
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the Path links
    [Documentation]  This keyword is used to check the Path links in the Graphical Elements
    [Arguments]  ${LENGTH}
   :FOR  ${j}  IN RANGE  ${LENGTH}
    \     ${PATHID}=  evaluate    ${j}+1
    \     Wait Until Element Is Visible
    ...    ${UNISPHERE_GRAPHICALIMAGE_ID} [${PATHID}]  timeout=20
    \     Page Should Contain Element   ${UNISPHERE_GRAPHICALIMAGE_ID} [${PATHID}]
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator
    [Documentation]  This keyword is to click on Graphical tab
    ...               ${Graphicaltab} is used to specify the ID of the Graphical tab for Designer and Operator.
    [Arguments]  ${Graphicaltab}
    Sleep  2S
    Wait Until Element Is Visible  ${Graphicaltab}  timeout=20
    wait until keyword succeeds  15x  2s   Click Element   ${Graphicaltab}
    Wait Until Element Is Visible   ${UNISPHERE_GRAPHICALELEMENTS_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Nodes Tab in UniSphere Operator
    [Documentation]  This keyword is to click on Nodes tab
    Wait Until Element Is Visible  ${UNISPHERE_OPERATORNODESTAB_ID}  timeout=20
    Click Element   ${UNISPHERE_OPERATORNODESTAB_ID}
    Wait Until Element Is Visible   ${UNISPHERE_OPERATORNODESTATUS_ID}  timeout=20
    Page Should Contain Element    ${UNISPHERE_OPERATORREFINENODEDATASOURCES_ID}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check the DataSources in the Node section
    [Documentation]  This keyword is used to check the Siteserver in the Node Section of UniSphered Operator.
    ...                ${DataSource} is to specify the name of the Data Source.
    [Arguments]  ${DataSource}
    ${Nodes}=   Get Element Count    ${UNISPHERE_EXPANDCOLLAPSE_BTN}
    :FOR  ${i}  IN RANGE  ${Nodes}
    \  ${DataSourceText}=  get text  //*[@id="component_${i}"]
    \  Run Keyword if   '${DataSourceText}' ==  '${DataSource}'  Click Element   //*[@id="component_${i}"]
    \  exit for loop if    ${i} ==  ${Nodes}
    Wait Until Element Is Visible   ${UNISPHERE_HEARTBEATITEMTABDETAILS_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Click on Comments On Data Source in the Node Section
    [Documentation]  This keyword is used to Open the Comments Popup on the Site Server in the Node Section.
    ...              ${DataSource} is to specify the name of the Data Source.
    [Arguments]  ${DataSource}
     ${Nodes}=   Get Element Count    ${UNISPHERE_EXPANDCOLLAPSE_BTN}
    :FOR  ${i}  IN RANGE  ${Nodes}
    \   ${DataSourceText}=  get text  //*[@id="component_${i}"]
    \  Run Keyword if   '${DataSourceText}' ==  '${DataSource}'
    ...    Click Element   //div[${i}]/div/ul/li[3]${UNISPHERE_EDITORCOMMENTS_ID}
    \  exit for loop if    ${i} ==  ${Nodes}
     Wait Until Element Is Visible   ${UNISPHERE_COMMENTSSEARCHBOX_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Check Message Center and Close
    [Documentation]  This keyword is the combination of Checking the messge center with the Message Prefix and Closing it.
    ...               ${UNISPHEREDESIGNERMESSAGEPREFIX} is to specify the Message Prefix ID
    [Arguments]   ${UNISPHEREDESIGNERMESSAGEPREFIX}
    SPH/SEC_Check the Message Prefix ID in message center   ${UNISPHEREDESIGNERMESSAGEPREFIX}
    SPH/SEC_Close the message center
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Create a new Data Sources
    [Documentation]  This keyword is used to create the new Cloud.
    SPH_DESN_Navigate to Editor   ${UNISPHERE_DATASOURCES_ICON}   ${UNISPHERE_DATASOURCES_ID}
    COMMON_Declare Random variables for Editor Name and Description
    ${DataSource_Name}=    Set Variable   ${Random_name}
    set global variable  ${DataSource_Name}
    ${DataSource_Description}=    Set Variable   ${Random_Description}
    set global variable  ${DataSource_Description}
    Sleep  3S
    SPH_DESN_Enter Random Input in Name and Description   ${DataSource_Name}  ${DataSource_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_NEWDATASOURCE_MESSAGEPREFIX}
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${DataSource_Name}   DataSource
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    SPH_DESN_Check the Graphical tab Elements   DataSources   ${DataSource_Name}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Create a new environment
    [Documentation]  This keyword is used to create the new environment.
    SPH_DESN_Navigate to Editor   ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    COMMON_Declare Random variables for Editor Name and Description
    ${Environment_name}=    Set Variable   ${Random_name}
    set global variable  ${Environment_name}
    log to Console   ${Environment_name}
    ${Environment_Description}=    Set Variable   ${Random_Description}
    set global variable  ${Environment_Description}
    SPH_DESN_Enter Random Input in Name and Description   ${Environment_name}  ${Environment_Description}
    SPH_DESN_Upload an Image
    SPH_DESN_Search and Add the Subordinates object  ${DataSource_Name}
    SPH_DESN_Click on Save button in Editor page
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_NEWENVIRONMENT_MESSAGEPREFIX}
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Environment_name}   Environment
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    SPH_DESN_Check the Graphical tab Elements  Environment   ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Create a new site
    [Documentation]  This keyword is used to create the new site.
    SPH_DESN_Navigate to Editor   ${UNISPHERE_DESSITE_ICON}   ${UNISPHERE_DESSITE_ID}
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
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_NEWSITE_MESSAGEPREFIX}
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Site_name}   Site
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    SPH_DESN_Check the Graphical tab Elements   Site   ${Site_name}    ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Create a new Organization
    [Documentation]  This keyword is used to create the new organization.
    SPH_DESN_Navigate to Editor   ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
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
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_NEWORGANIZATION_MESSAGEPREFIX}
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Organization_name}   Organization
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    SPH_DESN_Check the Graphical tab Elements  Organization  ${Organization_name}  ${Site_name}    ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Create a new Scene
    [Documentation]  This keyword is used to create the new scene.
    SPH_DESN_Navigate to Editor   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
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
    SPH_DESN_Check Message Center and Close   ${UNISPHERE_NEWSCENE_MESSAGEPREFIX}
    SPH_DESN_Click on Parent breadcrumb navigation
    SPH_DESN_Search the new definition after save and Click the Item    ${Scene_name}   Scene
    SPH_DESN_Click on Graphical Tab in UniSphere Designer/Operator   ${UNISPHERE_GRAPHICALTABDESIGNER_ID}
    SPH_DESN_Check the Graphical tab Elements   Scene   ${Scene_name}    ${Organization_name}  ${Site_name}    ${Environment_name}
#-----------------------------------------------------------------------------------------------------------------------
SPH_DESN_Search the added comments in the comments popup in UniSphere Operator
    [Documentation]  This keyword is used to Search the comments inthe Comment popup.
    [Arguments]  @{AddedComments}
    COMMON_Scroll to top of the page
    ${LENGTH}=  Get Length   ${AddedComments}
    log to console  ${LENGTH}
    :FOR  ${i}  IN  @{AddedComments}
    \     Wait Until Element Is Visible  ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}  timeout=20
    \     wait until keyword succeeds  10x  2s  Click Element  ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}
    \     Clear Element Text   ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}
    \     Input Text   ${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}   ${i}
    \     page should contain element   ${UNISPHERE_COMMENTSSEARCHDESC_XPATH}
#-----------------------------------------------------------------------------------------------------------------------
Scroll Page To Location
    [Documentation]   This keyword is used to execute javascript to scroll the page.
    ...               ${x_location} is to provide the coordinate to scroll to, along the x-axis (horizontal), in pixels
    ...               ${y_location} is to provide the coordinate to scroll to, along the y-axis (vertical), in pixels
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
##----------------------------------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------------------------------
COMMON_Scroll top of the page
    [Documentation]  This keyword is to scroll the page to the bottom
    Scroll Page To Location  0   0
##----------------------------------------------------------------------------------------------------------------------
