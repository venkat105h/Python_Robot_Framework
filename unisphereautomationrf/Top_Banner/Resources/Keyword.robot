#-----------------------------------------------------------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by other TopBanner scrits.
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
Library           SeleniumLibrary    timeout=20
Library           OperatingSystem
Resource          ..${/}..${/}..${/}Common_Preferences_Automation${/}Keywords${/}Generic_Keywords.robot
Resource          ..${/}..${/}Resources${/}COMMON_RESOURCE.robot
Resource          ..${/}..${/}Resources${/}SOL_RESOURCE.robot
Resource          ..${/}..${/}Resources${/}SPHSEC_RESOURCE.robot
Resource          ..${/}..${/}UniSphere_Designer${/}Resources${/}SPH_DESN.robot
Resource          ..${/}..${/}Resources${/}TRC_RESOURCE.robot
Resource          ..${/}..${/}Resources${/}UNICLOUD_RESOURCE.robot
Resource          ..${/}..${/}Locators${/}Locator_Solution_Landing_Page.robot
Resource          ..${/}..${/}Locators${/}Locator_UniCloud.robot
Resource          ..${/}..${/}Locators${/}Locator_UniTrace.robot
Resource          ..${/}..${/}Locators${/}Locator_UniSecure.robot
Resource          ..${/}..${/}Locators${/}Locator_UniSphere.robot
Resource          ../Resources/Common_Variable.robot
#-----------------------------------------------------------------------------------------------------------------------
*** Variables ***
${BROWSER}                                                gc
${ENV}                                                    SVT
${Solution}                                               Systech360
${BROWSERWIDTH}                                           1366
${BROWSERHEIGHT}                                          768
${BASE_URL}                                               eng-${ENV}.systechcloud.net
${LOGIN URL}                                              https://${BASE_URL}
${UNISECURE URL}                                          https://${BASE_URL}/UniSecure/#/
${UNITRACE URL}                                           https://${BASE_URL}/login/
${UNISPHERE URL}                                          https://${BASE_URL}/Systech360
${UNISERIES_USERNAME_ID}                                  userName
${UNISECURELINK}                                          //a[@id="unisecure-link"]
${UNISPHERELINK}                                          //*[@id="Systech360-link"]
${UNISERIESLINK}                                          //a[@id="systech360-link"]
${UNISPHEREUSERNAMEID}                                     userName
${UNISPHEREPRODUCTBGCOLOR}                                rgba(84, 154, 206, 1)
${UNISECUREPRODUCTBGCOLOR}                                rgba(0, 138, 221, 1)
${UNISECURE_ADMIN_USERNAME}                               ruleuser
${UNISECURE_ADMIN_PASSWORD}                               Test@101
${UNISECURE_ADMIN_ROLE}                                   Administrator
${UNISPHERE_ABOUT_IMG}                                     //*[@id="main-content"]//img[1]
${UNISPHERE_ABOUT_VERSION_LABEL}                           //*[@id="main-content"]//p[1]
${UNISPHERE_ABOUT_BUILD_LABEL}                             //*[@id="systech-about"]//p[2]
${UNISPHERE_ABOUTCOPYRIGHTS_LABEL}                         //*[@id="systech-about"]//p[3]
#-----------------------------------------------------------------------------------------------------------------------
*** Keywords ***
TOPBANNER_Check the Top Banner in Login
   [Documentation]  This keyword is used to check the Top Banner in Login page of the Solution
   Wait Until Element Is Visible   ${UNISPHERE_SYSTECH_LOGO}  timeout=20
   wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_SYSTECH_LOGO}
   wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_PRODUCT_ICON}
   wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_TOPBANNERLOGIN_ID}
   wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_ABOUT_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Top Banner after login
    [Documentation]  This keyword is to Check the Top Banner after login to UniSecure and UniSphere
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_HAMBURGER_ICON}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_WELCOME_ID}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_UNNISERIESTOP_ID}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_UNITRACETOP_ID}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_UNISECURE_TOPBANNER}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_ABOUT_ID}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_SEARCHTOP_BUTTON}
    wait until keyword succeeds  5x  2s   Page Should Contain Element    ${UNISPHERE_TOPBANNERVIDEO_ICON}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Hamburger icon
    [Documentation]  This keyword is to Check the Hamburger icon in the top banner
    Wait Until Element Is Visible    ${UNISPHERE_HAMBURGER_ICON}  timeout=20
    Mouse over  ${UNISPHERE_HAMBURGER_ICON}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_HAMBURGERBROWSE_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_HAMBURGERINFOCENTER_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_HAMBURGERSUPPORTCENTER_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_HAMBURGERTRAININGCENTER_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on Welcome button
    [Documentation]  This keyword is to Click on Welcome button with the argument of the element in the respective page.
    ...              ${UNISPHERE_PRODUCTCARD_ID}  is used to provide the Preferences Card id
    [Arguments]      ${UNISPHERE_PRODUCTCARD_ID}
    Wait Until Element Is Visible  ${UNISPHERE_WELCOME_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_WELCOME_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_PRODUCTCARD_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on UniSeries button
    [Documentation]  This keyword is to Click on UniSeries button
    wait until keyword succeeds  5x  2s  Mouse over   ${UNISPHERE_UNNISERIESTOP_ID}
    ${Status}=   run keyword and return status  Page Should Not Contain Element  ${UNISPHERE_UNISERIESANCHOR_LINK}
    log to console  ${Status}
    Run Keyword If  ${Status}== True     pass execution  UniSeries link is disabled
    Run Keyword If  ${Status}== False    run keywords
    ...       wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_UNNISERIESTOP_ID}
    ...       AND  Wait Until Element Is Visible   ${UNISERIES_USERNAME_ID}  timeout=20
    ...       AND  Page Should contain element   ${UNISERIES_USERNAME_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on UniTrace button
    [Documentation]  This keyword is to Click on UniTrace button in the top banner link
    wait until keyword succeeds  5x  2s  Mouse over   ${UNISPHERE_UNITRACETOP_ID}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_UNITRACETOP_ID}
    Wait Until Element Is Visible  ${TRC_USERNAME_TXTBOX}  timeout=20
    wait until keyword succeeds  5x  2s  Page Should Contain Element       ${TRC_USERNAME_TXTBOX}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on the UniSphere/UniSecure button
    [Documentation]  This keyword is to Click on the UniSphere/UniSecure button in the top banner
    wait until keyword succeeds  5x  2s   Mouse Over  ${UNISPHERE_UNISECURE_TOPBANNER}
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_UNISECURE_TOPBANNER}
	Sleep  3S
    #wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_WELCOME_ID}
    ${Count}=   Get Element Count   ${UNISPHERE_UNISECUREROLES_DRPDWN}
    log to console  ${Count}
    run keyword if  '${Solution}' == 'Systech360'   TOPBANNER_Check the Roles in the UniSphere
    run keyword if  '${Solution}' == 'UniSecure'    TOPBANNER_Check the Roles in the UniSecure
    run keyword if  '${Solution}' == 'UniSeries'    TOPBANNER_Check the Roles in the UniSeries
    Run keyword if  ${Count} >2  pass execution  UniSphere/UniSecure roles are displayed
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Roles in the UniSphere
    [Documentation]  This keyword is to check the roles in the UniSphere
    Page Should Contain Element      ${UNISPHERE_TOPBANNERADMIN_ID}
    Page Should Contain Element      ${UNISPHERE_TOPBANNERDESIGNER_ID}
    Page Should Contain Element      ${UNISPHERE_TOPBANNEROPERATOR_ID}
#    Page Should Contain Element      ${UNISPHERE_TOPBANNERBO_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Roles in the UniSecure
    [Documentation]  This keyword is to check the roles in the UniSecure
    Page Should Contain Element      ${UNISPHERE_TOPBANNERADMIN_ID}
    Page Should Contain Element      ${UNISPHERE_TOPBANNERDESIGNER_ID}
    Page Should Contain Element      ${UNISPHERE_TOPBANNEROPERATOR_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Roles in the UniSeries
    [Documentation]  This keyword is to check the roles in the UniSeries
    Page Should Contain Element      ${UNISPHERE_TOPBANNERADMIN_ID}
    Page Should Contain Element      ${UNISPHERE_TOPBANNERDESIGNER_ID}
    Page Should Contain Element      ${UNISPHERE_TOPBANNEROPERATOR_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the UniSphere/UniSecure roles in the dropdown
    [Documentation]  This keyword is to Check the UniSphere/UniSecure roles in the dropdown
    wait until keyword succeeds  5x  2s   Mouse over  ${UNISPHERE_UNISECURE_TOPBANNER}
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_UNISECURE_TOPBANNER}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on About popup
    [Documentation]  This keyword is to Click on About popup in the top banner
    wait until keyword succeeds  5x  2s   Mouse Over  ${UNISPHERE_ABOUT_ID}
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_ABOUT_ID}
    Wait Until Element Is Visible  ${UNISPHERE_ABOUT_VERSION_LABEL}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the UI of the About popup
    [Documentation]     This keyword is to Check the UI of the About popup in the top banner.
    Run Keyword If   '${Solution}' == 'Systech360'   Run keywords    Wait Until Element Is Visible  ${UNISPHERE_ABOUT_IMG}  timeout=20
    ...     AND     wait until keyword succeeds  5x  2s   Page Should Contain Element  ${UNISPHERE_ABOUT_IMG}
    Run Keyword If   '${Solution}' == 'UniSecure'   Run Keywords  Wait Until Element Is Visible    ${UNISECURE_ABOUT_IMG}   timeout=20
	...  AND  wait until keyword succeeds  5x  2s   Page Should Contain Element  ${UNISECURE_ABOUT_IMG}
    ...  AND  wait until keyword succeeds  5x  2s   Page Should Contain Element  ${UNISPHERE_ABOUT_VERSION_LABEL}
    ...  AND  wait until keyword succeeds  5x  2s   Page Should Contain Element  ${UNISPHERE_ABOUT_BUILD_LABEL}
    #...  AND  wait until keyword succeeds  5x  2s   Page Should Contain Element  ${UNISPHERE_ABOUTCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on Close button in the About Popup
    [Documentation]  This keyword is to Click on Close button of the About Popup
    #wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_ABOUTCLOSE_BTN}
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_WELCOME_ID}
    wait until keyword succeeds  5x  2s  Page Should Contain Element   ${UNISPHERE_PRODUCTCARD_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Select the role in the dropdown
    [Documentation]  This keyword is to Select the role in the dropdown
    ...              ${Preferences_Role} is used to specify the role(Administrator, Designer, operator and Business owner)
    [Arguments]   ${Preferences_Role}
    Wait Until Element Is Visible  ${UNISPHERE_USERDISPLAY_DRPDWN}  timeout=20
    wait until keyword succeeds  5x  2s  Mouse Over  ${UNISPHERE_USERDISPLAY_DRPDWN}
    run keyword and ignore error  wait until keyword succeeds  5x  2s  Click Element  ${Preferences_Role}
	Sleep  2s
    Wait Until Element Is Visible  ${UNISPHERE_WELCOME_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_WELCOME_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Role navigation in the Top Banner
    [Documentation]  This keyword is to Check the Role navigation in the Top Banner
    ...             ${TopBannerNavigation} is used to specify the role(Administrator, Designer, operator and Business owner)
    ...             and to navigate to the welcome page of the role from the About popup.
    [Arguments]   ${TopBannerNavigation}
    Wait Until Element Is Visible   ${TopBannerNavigation}  timeout=20
    wait until keyword succeeds  5x  2s   Mouse Over   ${TopBannerNavigation}
    wait until keyword succeeds  5x  2s   Click Element  ${TopBannerNavigation}
    Wait Until Element Is Visible  ${UNISPHERE_ABOUT_ID}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on Global Search Textbox
    [Documentation]  This keyword is to Click on Search button in the Top banner
    Wait Until Element Is Visible   ${UNISPHERE_SEARCHTOP_BUTTON}  timeout=20
    Mouse Over  ${UNISPHERE_SEARCHTOP_BUTTON}
    Click Element  ${UNISPHERE_SEARCHTOP_BUTTON}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Global Search Result with out entering any data
    [Documentation]  This keyword is to Check the Global Search Result with out entering any data
    TOPBANNER_Click on Global Search Textbox
    Wait Until Element Is Visible  ${UNISPHERE_EMPTYGLOBALSEARCH_ID}  timeout=20
    page should contain element  ${UNISPHERE_EMPTYGLOBALSEARCH_ID}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check Global search page displayed to the user
    [Documentation]  This keyword is to Check Global search page displayed to the user
    Wait Until Element Is Visible  ${UNISPHERE_GLOBALSEARCH_LABEL}  timeout=20
    page should contain element       ${UNISPHERE_GLOBALSEARCH_LABEL}
    SPH/SEC_Navigate to Welcome page
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch the data to search
    [Documentation]  This keyword is used to fetch the data in the Users/Group page.
    ...              ${SearchXpath} is used to specify the Xpath of the User/Group to search
    [Arguments]  ${SearchXpath}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible   ${SearchXpath}  timeout=20
    Page should contain element   ${SearchXpath}
	Sleep  2S
    ${Searchusername}=  get text  ${SearchXpath}
    ${SearchSinglename}=    Fetch From Left  ${Searchusername}  ${SPACE}
    ${Search}=    Strip String  ${SearchSinglename}
    log to console   ${SearchSinglename}
    [Return]  ${SearchSinglename}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch the Operator data to search
    [Documentation]  This keyword is used to fetch the UniSphere/UniSecure Operator data to do global search
    Run Keyword If   '${Solution}' == 'Systech360'   Run keywords
    ...     TOPBANNER_Fetch UniSphere Operator data  ${UNISPHERE_OPERATORVIEW_ICON}  ${UNISPHERE_OPERATORVIEW_ITEM}
    ...     ${UNISPHERE_GSVIEW_XPATH}   ${UNISPHERE_GSCARDITEMVIEW_XPATH}  ${UNISPHERE_GSCARDITEMDESC_XPATH}         AND
    ...     TOPBANNER_Fetch UniSphere Operator Published Scene data   ${UNISPHERE_OPERATORPUBLISCENE_ICON}
    ...     ${UNISPHERE_OPERATORPUBLISCENE_ITEM}  ${UNISPHERE_GSPUBSCENE_XPATH}  ${UNISPHERE_CARDNAMEOPERATORPUBSCENE_XPATH}
    ...     ${UNISPHERE_CARDDESCOPERATORPUBSCENE_XPATH}
    Run Keyword If   '${Solution}' == 'UniSecure'   Run keywords
    ...     TOPBANNER_Fetch UniSecure Designer data  ${UNISECURE_OPERATORACTION_ICON}  ${UNISECURE_OPERATORACTION_ITEM}
    ...     ${UNISECURE_GSACTION_XPATH}  ${UNISECURE_GSCARDITEMACTION_XPATH}   ${UNISPHERE_GSCARDITEMDESC_XPATH}     AND
    ...     TOPBANNER_Fetch UniSecure Operator Published Family data      ${UNISECURE_OPERATORFAMILY_ICON}
    ...     ${UNISECURE_OPERATORFAMILY_ITEM}   ${UNISECURE_GSPUBISHEDFAMILY_XPATH}   ${UNISECURE_CARDNAMEOPERATORPUBFAMILY_XPATH}
    ...     ${UNISECURE_CARDDESOPERATORPUBFAMILY_XPATH}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch the Designer data to search
    [Documentation]  This keyword is used to fetch the data in the UniSphere/UniSecure Designer pages.
    Run Keyword If   '${Solution}' == 'Systech360'   Run keywords
    ...     TOPBANNER_Fetch UniSphere Designer data   ${UNISPHERE_DESSCENE_ICON}   ${UNISPHERE_DESSCENE_ID}
    ...     ${UNISPHERE_GSSCENE_XPATH}    ${UNISPHERE_GSCARDITEMSCENE_XPATH}  ${UNISPHERE_GSCARDITEMDESC_XPATH}      AND
    ...     TOPBANNER_Fetch UniSphere Designer data  ${UNISPHERE_DESORGANIZATION_ICON}   ${UNISPHERE_DESORGANIZATION_ID}
    ...     ${UNISPHERE_GSORGAN_XPATH}    ${UNISPHERE_GSCARDITEMORGAN_XPATH}   ${UNISPHERE_GSCARDITEMDESC_XPATH}     AND
    ...     TOPBANNER_Fetch UniSphere Designer data  ${UNISPHERE_DESENVIRONMENT_ICON}   ${UNISPHERE_DESENVIRONMENT_ID}
    ...     ${UNISPHERE_GSENVIR_XPATH}   ${UNISPHERE_GSCARDITEMENVIR_XPATH}   ${UNISPHERE_GSCARDITEMDESC_XPATH}
    Run Keyword If   '${Solution}' == 'UniSecure'   run keywords
    ...     TOPBANNER_Fetch UniSecure Designer data   ${UNISECURE_DESIGNERFAMILY_ICON}  ${UNISECURE_DESIGNERFAMILY_ITEM}
    ...     ${UNISECURE_GSFAMILY_XPATH}  ${UNISECURE_GSCARDITMFAMILY_XPATH}    ${UNISECURE_GSCARDITEMDESC_XPATH}     AND
    ...     TOPBANNER_Fetch UniSecure Designer data   ${UNISECURE_DESIGNERPRODUCT_ICON}   ${UNISECURE_DESIGNERPRODUCT_ITEM}
    ...     ${UNISECURE_GSPRODUCT_XPATH}  ${UNISECURE_GSCARDITEMPRODUCT_XPATH}    ${UNISECURE_GSCARDITEMDESC_XPATH}  AND
    ...     TOPBANNER_Fetch UniSecure Designer data   ${UNISECURE_DESIGNERPACKAGE_ICON}   ${UNISECURE_DESIGNERPACKAGE_ITEM}
    ...     ${UNISECURE_GSPACKAGE_XPATH}  ${UNISECURE_GSCARDITEMPACKAGE_XPATH}   ${UNISECURE_GSCARDITEMDESC_XPATH}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch UniSphere Operator Published Scene data
    [Documentation]  This keyword is used to fetch the UniSphere Operator published scene data
    ...              ${ICON} is to specify the left menu navigation icon
    ...              ${ID} is to specify the left menu navigation item
    ...              ${SearchforDef} is to specify the global search id of the definition
    ...              ${CardItemName} is to specify the Card item name id
    ...              ${CardItemDes}  is to specify the Card item description id
    [Arguments]   ${ICON}  ${ID}  ${SearchforDef}   ${CardItemName}  ${CardItemDes}
    SPH_DESN_Navigate to Published Scene
    ${Defname}=  TOPBANNER_Fetch the data to search   ${UNISPHERE_CARDNAMEOPERATORPUBSCENE_XPATH}
    ${Defdescription}=  TOPBANNER_Fetch the data to search  ${UNISPHERE_CARDDESCOPERATORPUBSCENE_XPATH}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defname}
    TOPBANNER_Search the Designer definition in the global search
    ...             ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defname}   ${SearchforDef}   ${CardItemName}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defdescription}
#    TOPBANNER_Search the Designer definition in the global search
#    ...             ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defdescription}   ${SearchforDef}   ${CardItemDes}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch UniSecure Operator Published Family data
    [Documentation]  This keyword is used to fetch the UniSphere operator published family data
    ...              ${ICON} is to specify the left menu navigation icon
    ...              ${ID} is to specify the left menu navigation item
    ...              ${SearchforDef} is to specify the global search id of the definition
    ...              ${CardItemName} is to specify the Card item name id
    ...              ${CardItemDes}  is to specify the Card item description id
    [Arguments]   ${ICON}  ${ID}  ${SearchforDef}   ${CardItemName}  ${CardItemDes}
    TOPBANNER_Navigate to Published Scene   ${ICON}   ${ID}
    ${Defname}=  TOPBANNER_Fetch the data to search   ${UNISECURE_CARDNAMEOPERATORPUBFAMILY_XPATH}
    ${Defdescription}=  TOPBANNER_Fetch the data to search  ${UNISECURE_CARDDESOPERATORPUBFAMILY_XPATH}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defname}
    TOPBANNER_Search the Designer definition in the global search
    ...       ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defname}   ${SearchforDef}   ${CardItemName}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defdescription}
    TOPBANNER_Search the Designer definition in the global search
    ...       ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defdescription}   ${SearchforDef}   ${CardItemDes}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Navigate to Published Scene
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
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch UniSphere Designer data
    [Documentation]  This keyword is used to fetch the UniSphere Designer data
    ...              ${ICON} is to specify the left menu navigation icon
    ...              ${ID} is to specify the left menu navigation item
    ...              ${SearchforDef} is to specify the global search id of the definition
    ...              ${CardItemName} is to specify the Card item name id
    ...              ${CardItemDes}  is to specify the Card item description id
    [Arguments]   ${ICON}  ${ID}  ${SearchforDef}   ${CardItemName}  ${CardItemDes}
    SPH_DESN_Navigate to Definition   ${ICON}   ${ID}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    ${Defname}=  TOPBANNER_Fetch the data to search   ${UNISPHERE_TABLEFIRSTNAMECELL_XPATH}
    ${Defdescription}=  TOPBANNER_Fetch the data to search   ${UNISPHERE_TABLEFIRSTDESCELL_XPATH}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defname}
    TOPBANNER_Search the Designer definition in the global search
    ...        ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defname}   ${SearchforDef}   ${CardItemName}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defdescription}
    TOPBANNER_Search the Designer definition in the global search
    ...        ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defdescription}   ${SearchforDef}   ${CardItemDes}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch UniSphere Operator data
    [Documentation]  This keyword is used to fetch the UniSphere Designer data
    ...              ${ICON} is to specify the left menu navigation icon
    ...              ${ID} is to specify the left menu navigation item
    ...              ${SearchforDef} is to specify the global search id of the definition
    ...              ${CardItemName} is to specify the Card item name id
    ...              ${CardItemDes}  is to specify the Card item description id
    [Arguments]   ${ICON}  ${ID}  ${SearchforDef}   ${CardItemName}  ${CardItemDes}

	Wait Until Element Is Visible   ${UNISPHERE_MYVIEW_CARD_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_MYVIEW_CARD_ID}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    ${Defname}=  TOPBANNER_Fetch the data to search   ${UNISPHERE_TABLEFIRSTNAMECELL__XPATH}
    ${Defdescription}=  TOPBANNER_Fetch the data to search   ${UNISPHERE_TABLEFIRSTDESCELL_XPATH}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defname}
    TOPBANNER_Search the Designer definition in the global search
    ...        ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defname}   ${SearchforDef}   ${CardItemName}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defdescription}
    TOPBANNER_Search the Designer definition in the global search
    ...        ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defdescription}   ${SearchforDef}   ${CardItemDes}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Fetch UniSecure Designer data
    [Documentation]  This keyword is used to search the UniSecure Designer data.
    ...              ${ICON} is to specify the left menu navigation icon
    ...              ${ID} is to specify the left menu navigation item
    ...              ${SearchforDef} is to specify the global search id of the definition
    ...              ${CardItemName} is to specify the Card item name id
    ...              ${CardItemDes}  is to specify the Card item description id
    [Arguments]   ${ICON}  ${ID}  ${SearchforDef}   ${CardItemName}  ${CardItemDes}
    TOPBANNER_Navigate to UniSphere Designer links   ${ICON}   ${ID}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_TABLEVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    ${Defname}=  TOPBANNER_Fetch the data to search   ${UNISPHERE_TABLEFIRSTNAMECELL_XPATH}
    ${Defdescription}=  TOPBANNER_Fetch the data to search   ${UNISPHERE_TABLEFIRSTDESCELL_XPATH}
    SPH_DESN_Change the Grid View/List view    ${UNISPHERE_CARDVIEW_BTN}   ${UNISPHERE_CARDSSEARCH_BOX}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defname}
    TOPBANNER_Search the Designer definition in the global search
    ...     ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defname}   ${SearchforDef}   ${CardItemName}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Defdescription}
    TOPBANNER_Search the Designer definition in the global search
    ...     ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Defdescription}   ${SearchforDef}   ${CardItemDes}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Navigate to UniSphere Designer links
    [Documentation]  This keyword is used to navigate to UniSphere Designer links(Scene, organizaition,Site, Environment,
    ...               Site Server, Cloud and data sources ).
    ...               ${DefinitionIcon} is to specify the left menu navigation icon
    ...               ${DefinitionITem} is to specify the left menu navigation item
    [Arguments]    ${DefinitionIcon}  ${DefinitionITem}
    Wait Until Element Is Visible   ${UNISPHERE_WELCOME_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_WELCOME_ID}
    wait until keyword succeeds  5x  2s  Mouse Over  ${DefinitionIcon}
	Sleep  2S
    wait until keyword succeeds  5x  2s  Click Element   ${DefinitionITem}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${UNISPHERE_ADDNEWITEM_BTN}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Enter Input in the Searchbox and click Search button
    [Documentation]  This keyword is to Enter Input in the Searchbox and
    ...              click Search button with the argument of Search text.
    ...              ${SearchText} is to specify the text to enter in the searchbox
    [Arguments]    ${SearchText}
    wait until keyword succeeds  5x  5s  page should contain element   ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}
    Clear Element Text      ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}
    Click Element   ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}
    Input Text      ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}     ${SearchText}
    sleep     15s
    Click Element   ${UNISPHERE_SEARCHTOP_BUTTON}
    Wait Until Element Is Visible  ${UNISPHERE_GLOBALSEARCH_LABEL}  timeout=20
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Search the Designer definition in the global search
    [Documentation]  This keyword is used to search the definition in the global search.
    ...              ${Section} is to specify the Xpath of Global Search Section (Scene, Organization,Site, Site server, Cloud, Environemnt)
    ...              ${SearchText}  is to specify the Search text to appear in the global search
    ...              ${SearchResultforDef}  is to specify the global search id of the definition
    ...              ${CardTitle}  is to specify the Card view id of Name/Description
    [Arguments]    ${Section}   ${SearchText}   ${SearchResultforDef}   ${CardTitle}
    wait until keyword succeeds  5x  5s  page should contain element   ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}
    Clear Element Text      ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}
    Click Element   ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}
    Input Text      ${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}     ${SearchText}
    sleep     15s
    Click Element   ${UNISPHERE_SEARCHTOP_BUTTON}
    Wait Until Element Is Visible   ${Section}  timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_GLOBALSEARCH_LABEL}  timeout=20
    Page Should Contain Element    ${SearchResultforDef}
    ${SearchDesignernameDes}=  get text  ${CardTitle}
    log to console  ${SearchDesignernameDes}
    Should Contain    ${SearchDesignernameDes}   ${SearchText}  ignore_case=True
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Search the user in the global search
    [Documentation]  This keyword is to Search the user in the global search
    ...              with the arguments of locator of the element and the searched text.
    ...              ${Section} is to specify the Global search xpath of the User/Group
    ...              ${SearchText} is to specify the user and group to search
    [Arguments]    ${Section}   ${SearchText}
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible   ${Section} [1]  timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_GLOBALSEARCH_LABEL}  timeout=20
	Sleep  2S
    log to console    ${SearchText}
    ${ExpectedUsername}=   get text   ${Section} [1]
    log to console    ${ExpectedUsername}
    Should be equal as strings    ${ExpectedUsername}    ${SearchText}  ignore_case=True
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the help video section in the top banner
    [Documentation]  This keyword is to Check the help video section in the top banner
    Wait Until Element Is Visible  ${UNISPHERE_TOPBANNERVIDEO_ICON}  timeout=20
    wait until keyword succeeds  5x  2s   page should contain element  ${UNISPHERE_TOPBANNERVIDEO_ICON}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Click on the Help Video
    [Documentation]  This keyword is to Click on the Help Video in the top banner
    Wait Until Element Is Visible  ${UNISPHERE_TOPBANNERVIDEO_ICON}  timeout=50
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_TOPBANNERVIDEO_ICON}
    Wait Until Element Is Visible  ${UNISPHERE_VIDEOCATALOG_LIST}    timeout=60
    wait until keyword succeeds  5x  2s   page should contain element  ${UNISPHERE_VIDEO_TITLE}
    wait until keyword succeeds  5x  2s   page should contain element  ${UNISPHERE_VIDEOCATALOG_LIST}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Video catalog list
    [Documentation]  This keyword is to Check the Video catalog list in the Online Video Assistance
    Wait Until Element Is Visible   ${UNISPHERE_VIDEOCATALOG_LIST}  timeout=50
    ${Count}=   Get Element Count   ${UNISPHERE_VIDEOCATALOG_LIST}
    log to console  ${Count}
    Run keyword if  ${Count} == 9  pass execution  All Video Catalog list are displayed.
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Close the Video Online Assistance
    [Documentation]  This keyword is to Close the Video Online Assistance
    Wait Until Element Is Visible   ${UNISPHERE_VIDEOCLOSE_BTN}  timeout=60
    wait until keyword succeeds  5x  2s  Click Element    ${UNISPHERE_VIDEOCLOSE_BTN}
#-----------------------------------------------------------------------------------------------------------------------
TOPBANNER_Check the Solution for this testcase
    [Documentation]  This keyword is to check the Solution and execute the test cases
    run keyword if  '${Solution}' == 'Systech360'    Run Keywords
    ...              log to console  Product is UniSphere No Business Owner role   AND
    ...              pass execution  UniSphere dont have Business Owner
    run keyword if  '${Solution}' == 'UniSecure'    log to console  Business Owner role is available in this product
    run keyword if  '${Solution}' == 'UniSeries'    log to console  Business Owner role is available in this product
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
Search in Users/Groups
    [Documentation]  This keyword is to Search in Users/Groups
      [Arguments]   ${NameOfUsers}

     wait until keyword succeeds  5x  2s  input text    //*[@id="searchBox"]   ${NameOfUsers}     TRUE
     wait until keyword succeeds  5x  2s  click element     //*[@id="imageUser_0"]


Create And Publish Scene In Designer
    [Documentation]  This keyword is to Create And Publish Scene In Designer
    Wait Until Element Is Visible  //*[@id="pinNavigator"]/span
    Click Element    //*[@id="pinNavigator"]/span
    Wait Until Element Is Visible    (//*[@id="expandCollapse"])[1]
    sleep    3s
    wait until keyword succeeds    3x    0.5s    Click Element    id=Scene-item
    wait until keyword succeeds    3x    0.5s    Click Element    id=newScene

    Wait Until Element Is Visible  ${SEC/S360_NAME_TXT}  timeout=15
    Wait Until Element Is Visible  ${S360_PICKLIST_ITEM}  timeout=15
    wait until keyword succeeds  5x  2s  click element     (//*[@class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"])[2]
    Click Element  ${SEC/S360_NAME_TXT}
    Input Text     ${SEC/S360_NAME_TXT}  TopBanner
    Wait Until Element Is Visible   //*[@id="floatBtn_SaveTxt"]
    Click Element   //*[@id="floatBtn_SaveTxt"]
    Execute JavaScript    window.scrollTo    0,    0




