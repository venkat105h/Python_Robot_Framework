#-----------------------------------------------------------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by Solution Landing page.
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
Documentation     A resource file with reusable keywords and variables related to Solution landing page.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library      BuiltIn
Variables    ../Variables/${TESTENV}_Variable.py
Library      SeleniumLibrary    timeout=${Selenium_Timeout}    run_on_failure=Nothing
Resource        ../Locators/Locator_Solution_Landing_Page.robot
Resource        ../Locators/Locator_UniSecure.robot
Resource        ../Locators/Locator_UniSphere.robot
Resource        ../Locators/Locator_UniTrace.robot
Resource        ../LandingPage/Resources/resource.robot
#-----------------------------------------------------------------------------------------------------------------------
*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------------
########################################### SOLUTION LANDING PAGE #####################################################
#-----------------------------------------------------------------------------------------------------------------------
SOL_Open Browser with Solution Landing page
    [Documentation]     This keyword is used to Open the browser, set the browser window size
     ...                and navigate to the Login URL specified in the variable.
    wait until keyword succeeds  10x  2s  Open Browser    ${LOGIN URL}   ${BROWSER}
    Set Window Size  ${BROWSERWIDTH}  ${BROWSERHEIGHT}
	#${width}    ${height}=  Get Window Size
    #Maximize Browser Window

SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product
    [Documentation]     This keyword is used to navigaate to the url specified in the arguments
    ...                 ${URL} is used to provide the URL of the page
    [Arguments]   ${URL}
    Go To   ${URL}

SOL_Select Solution from the Landing page
    [Documentation]  This keyword is to Select Solution from the Landing page with Solution as arguments.
    ...              ${Solution} is used to specify the product name (UniSphere, UniSecure, Uniseries)
    [Arguments]   ${Solution}
    Run Keyword If   '${Solution}' == 'Systech360'
    ...               SOL_Click on Product in the Solution Landing page
    ...               ${SOL_UNISPHERE_LINK}    ${UNISPHERE_USERNAME_TXTBOX}
    Run Keyword If   '${Solution}' == 'UniSecure'
    ...               SOL_Click on Product in the Solution Landing page
    ...              ${SOL_UNISECURE_LINK}    ${UNISECURE_USERNAME_TXTBOX}
    Run Keyword If   '${Solution}' == 'UniSeries'
    ...               SOL_Click on Product in the Solution Landing page
    ...              ${SOL_UNISERIES_LINK}    ${UNISECURE_USERNAME_TXTBOX}
    log to console    ${Solution}

SOL_Click on Product in the Solution Landing page
    [Documentation]  This keyword is to Click on Product(UniSphere,UniSecure and UniSeries)link in Solution Landing page
    ...               ${PRODUCTLINK} is used to provide the Product card link in Solution landing page
    ...               ${PRODUCTUSERNAMEXTBOX} is used to provide the Username textbox id  of the product.
    [Arguments]     ${PRODUCTLINK}  ${PRODUCTUSERNAMEXTBOX}
	Run Keyword and Ignore Error  Wait Until Element Is Visible  xpath=(//*[text()='Next'])  timeout=20
	Run Keyword and Ignore Error  wait until element is visible  xpath=(//video)[2]  timeout=10
    Wait Until Element Is Visible   ${PRODUCTLINK}  timeout=30
    wait until keyword succeeds  15x  2s   Mouse Over   ${PRODUCTLINK}
    wait until keyword succeeds  15x  2s   Click Element  ${PRODUCTLINK}
    Wait Until Element Is Visible   ${PRODUCTUSERNAMEXTBOX}  timeout=30

SOL_Check the Disabled product
    [Documentation]     This keyword is to verify UniSeries product is inactive
    ...              ${SOL_UNISERIES_LINK}  is used to provide the Uniseries product link
    [Arguments]    ${SOL_UNISERIES_LINK}
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  2x  2s     Element Should Be Visible    ${SOL_UNISERIES_LINK}
    ${Expected}=  get element attribute  xpath= ${SOL_UNISERIES_DATASTATUS}  data-status
    Should be equal as strings    ${Expected}    inactive

SOL_Check the Tooltip on the disabled product
    [Documentation]     This keyword is to verify tooltip of the UniSeries product.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  2x  2s     Element Should Be Visible    ${SOL_UNISERIES_LINK}
    ${Expected}=  get element attribute  ${SOL_UNISERIES_IMG}  title
    Should be equal as strings    ${Expected}    ${DISABLEDTOOLTIP}

SOL_Check the UniSphere/UniTrace/UniSecure/UniSphere product navigation
    [Documentation]     This keyword is to navigate to UniSphere/UniTrace/UniSecure/UniSphere product
    ...                 ${PRODUCTLINK} is used to provide the Product links
    ...                 ${LOGINUSERNAMEID} is used to provide the Product username textbox id
    [Arguments]    ${PRODUCTLINK}   ${LOGINUSERNAMEID}
	Sleep  2s
	Run Keyword and Ignore Error  Wait Until Element Is Visible  xpath=(//*[text()='Next'])  timeout=20
    Run Keyword and Ignore Error  Wait Until Page Contains Element  xpath=(//video)[2]  timeout=20
    Wait Until Element Is Visible  ${SOL_ABOUT_LINK}  timeout=20
    Wait Until Element Is Visible  ${PRODUCTLINK}  timeout=20
    wait until keyword succeeds  2x  2s  Click Element    ${PRODUCTLINK}
    Wait Until Element Is Visible  ${LOGINUSERNAMEID}  timeout=20
    Element Should Be Visible      ${LOGINUSERNAMEID}

SOL_Click on Systech Logo link
    [Documentation]     This keyword is to Click on Systech logolink.
    Wait Until Element Is Visible   ${SOL_LOGO_LINK}  timeout=20
    Page Should Contain Element   ${SOL_LOGO_LINK}
    wait until keyword succeeds  2x  2s  Click Element   ${SOL_LOGO_LINK}
    Wait Until Element Is Visible   ${SOL_SYSTECHONE_LINK}  timeout=20

SOL_Click on SystechOne link
    [Documentation]      This keyword is to Click on SystechOnelink
    Wait Until Page Contains Element   ${SOL_SYSTECHONE_LINK}
    Page Should Contain Element  ${SOL_SYSTECHONE_LINK}
    Run Keyword And Ignore Error  Mouse Over  ${SOL_HAMBUGER_ICON}
	Run Keyword And Ignore Error  Click Element  ${SOL_HAMBUGER_ICON}
    wait until keyword succeeds  10x  2s   Mouse Over   ${SOL_SYSTECHONE_LINK}
    wait until keyword succeeds  10x  2s   Click Element   ${SOL_SYSTECHONE_LINK}
    COMMON_Focus on New Tab
    wait until keyword succeeds  15x  2s    Wait Until Page Contains Element   ${SOL_SYSTECHONELOGO_LINK}

SOL_Check the UI of the About popup
    [Documentation]     This keyword is to Check the UI of the About popup.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=40
    SOL_Verify Autoplay in the market marquee section
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=40
    Mouse Over    ${SOL_ABOUT_LINK}
    wait until keyword succeeds  5x  2s     Click Element   ${SOL_ABOUT_LINK}
	Wait Until Element Is Visible   ${UNISPHERE_ABOUT_IMG}  timeout=40
    Element Should Be Visible  ${UNISPHERE_ABOUT_IMG}
    Element Should Be Visible  ${UNISPHERE_ABOUT_VERSION_LABEL}
    Element Should Be Visible  ${UNISPHERE_ABOUT_BUILD_LABEL}
    Element Should Be Visible  ${UNISPHERE_ABOUTCOPYRIGHTS_LABEL}
#    Element Should Be Visible  ${UNISPHERE_ABOUTCLOSE_BTN}

SOL_Click on About link
    [Documentation]   This keyword is to click on About link in the solution landing page
    ${Reload}=  Run Keyword And Return Status   Element Should Be Visible   ${SOL_ABOUT_LINK}
    Run Keyword If    ${Reload} != ${True}     Reload Page
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  2x  2s  SOL_Verify Autoplay in the market marquee section
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=40
    Mouse Over    ${SOL_ABOUT_LINK}
    wait until keyword succeeds  5x  2s     Click Element   ${SOL_ABOUT_LINK}

SOL_Check the Version number
    [Documentation]  This keyword is to check the Version number
    Wait Until Element Is Visible   ${UNISPHERE_ABOUT_IMG}  timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_ABOUT_VERSION_LABEL}  timeout=20
    ${ExpectedVersion} =  Get Text  ${UNISPHERE_ABOUT_VERSION_LABEL}
    ${ExpectedVersionNo}=  Split String  ${ExpectedVersion}  ${Space}
    log to console     ${ExpectedVersionNo}[1]
    Should be equal    ${ExpectedVersionNo}[1]  ${UNISPHERE_BUILD_VERSIONNO}
Check the Build number
    [Documentation]  This keyword is to check the build number
    Wait Until Element Is Visible   ${UNISPHERE_ABOUT_IMG}  timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_ABOUT_BUILD_LABEL}  timeout=20
    ${ExpectedBuild} =  Get Text     ${UNISPHERE_ABOUT_BUILD_LABEL}
    ${ExpectedBuildNo}=  Split String  ${ExpectedBuild}  ${Space}
    log to console     ${ExpectedBuildNo}[1]
    Should be equal    @{ExpectedBuildNo}[1]  ${UNISPHERE_BUILD_NUMBER}

# OLD Keyword-2018
#SOL_Check the Copyrights
#    [Documentation]  This keyword is to verify the Copyrights in the about popup
#    Wait Until Element Is Visible   ${UNISPHERE_ABOUT_IMG}  timeout=20
#    Wait Until Element Is Visible   ${UNISPHERE_ABOUT_VERSION_LABEL}  timeout=20
#    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d %H:%M:%S.%f
#    ${datetime}=	Convert Date  ${CurrentDate}  datetime
#    log to console   ${datetime.year}
#    ${Year}=   Convert To String   ${datetime.year}
#    log to console   ${Year}
#    #Page Should Contain   ${Year}
#	Page Should Contain   2018

SOL_Check the Copyrights
    [Documentation]  This keyword is to verify the Copyrights in the about popup
    [Arguments]   ${CopyRight}   ${Expc_Year}
    Wait Until Element Is Visible   ${CopyRight}
    ${Actual_COPY}=  get text    ${CopyRight}
    should contain   ${Actual_COPY}   ${Expc_Year}




SOL_Check the products in the solution landing page
    [Documentation]     This keyword is to Check the products in the solution landing page.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  5x  2s    Element Should Be Visible  ${SOL_UNISPHERE_LINK}
    Element Should Be Visible  ${SOL_UNITRACE_LINK}
    Element Should Be Visible  ${SOL_UNISECURE_LINK}

SOL_Click on Twitter/Facebook/LinkedIn/Youtube
    [Documentation]     This keyword is to Click on Twitter/Facebook/LinkedIn links.
    [Arguments]    ${SOCIALLINK}
    Wait Until Page Contains Element   ${SOL_ABOUT_LINK}
    Wait Until Page Contains Element   ${SOCIALLINK}
    wait until keyword succeeds  5x  2s  Click Element    ${SOCIALLINK}
    Page Should Contain Element   ${SOL_CONTINUE_BUTTON}

SOL_Click on GOBack button
    [Documentation]     This keyword is to click on Goback button.
    Wait Until Element Is Visible   ${SOL_GOBACK_BUTTON}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${SOL_GOBACK_BUTTON}
    Wait Until Element Is Visible   ${SOL_UNISPHERE_LINK}  timeout=20
    Element Should Be Visible  ${SOL_UNISPHERE_LINK}

SOL_Click on Continue button
    [Documentation]     This keyword is to click on Continue button.
    Wait Until Element Is Visible   ${SOL_CONTINUE_BUTTON}  timeout=20
    Element Should Be Visible   ${SOL_CONTINUE_BUTTON}
    wait until keyword succeeds  5x  2s  Click Element    ${SOL_CONTINUE_BUTTON}
    COMMON_Focus on New Tab

SOL_Click on SystechOne Contact link
    [Documentation]     This keyword is to Click on SystechOne Contact link.
    Wait Until Page Contains Element   ${SOL_ABOUT_LINK}
    Wait Until Page Contains Element   ${SOL_CONTACTUS_LINK}
    wait until keyword succeeds  5x  2s  Click Element     ${SOL_CONTACTUS_LINK}
    Run Keyword if  '${BROWSER}'!= 'headlesschrome'  COMMON_Focus on New Tab

SOL_Verify Autoplay in the market marquee section
    [Documentation]     This keyword is to Verify Autoplay in the market marquee section.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    Wait Until Element Is Visible   ${SOL_MARKETCIRCLE_SLIDER}  timeout=50
    ${Count}=  Get Element Count   ${SOL_MARKETCIRCLE_SLIDER}
    Log  ${Count}
    FOR  ${i}  IN RANGE  ${Count}
        wait until keyword succeeds  5x  2s  Click Element   ${SOL_MARKETCIRCLE_SLIDER} [${i+1}]
        Exit For Loop If    ${i} == ${Count}+1
    END

SOL_Verify the Video in the Market Marquee section
    [Documentation]     This keyword is to Verify the Video in the Market Marquee section.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
	Wait Until Element Is Visible   ${SOL_MARKETCIRCLE_SLIDER}  timeout=50
    ${Count}=  Get Element Count   ${SOL_MARKETCIRCLE_SLIDER}
    wait until keyword succeeds  2 min  10 sec  Page Should Contain Element    ${SOL_MARKETVIDEO_ICON}
	FOR  ${i}  IN RANGE  ${Count}
    	Click Element   ${SOL_MARKETCIRCLE_SLIDER} [${i+1}]
		Sleep  2S
		${VideoIcon}=  Run Keyword And Return Status  Element Should Be Visible  ${SOL_MARKETVIDEO_ICON}
		Run Keyword If  '${VideoIcon}'=='${TRUE}'  Run Keywords  Sleep  1S
	...  AND  Click Element  ${SOL_MARKETVIDEO_ICON}
	...  AND  Run Keyword And Ignore Error  Wait Until Element Is Visible  (//video[contains(@class, 'systech_video_')])[2]  timeout=20
	...  AND  Exit For Loop
	END

SOL_Verify Market marquee slide navigation
    [Documentation]     This keyword is to Verify Market marquee slide navigation.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
	Wait Until Element Is Visible   ${SOL_MARKETCIRCLE_SLIDER}  timeout=50
    ${Count}=  Get Element Count   ${SOL_MARKETCIRCLE_SLIDER}
    Log  ${Count}
    FOR  ${i}  IN RANGE  ${Count}
        wait until keyword succeeds  5x  2s  Click Element   ${SOL_MARKETCIRCLE_SLIDER} [${i+1}]
        Exit For Loop If    ${i} == ${Count}+1
    END
#-----------------------------------------------------------------------------------------------------------------------
########################################### MAINTANANCE PAGE  ##########################################################
#-----------------------------------------------------------------------------------------------------------------------
SOL_Check the Maintanance page
    [Documentation]     This keyword is to Check the Maintanance page.
    Wait Until Element Is Visible   ${SOL_SYSTECHONE_LINK}  timeout=20
    Wait Until Element Is Visible   ${SOL_MAINTANANCEHERE_LINK}  timeout=20

SOL_Check the Solution Landing page
    [Documentation]  This keyword is to check the Solution Landing page.
    Wait Until Element Is Visible    ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  5x  2s     Element Should Be Visible    ${SOL_UNISPHERE_LINK}
    wait until keyword succeeds  5x  2s     Element Should Be Visible    ${SOL_UNISECURE_LINK}
    wait until keyword succeeds  5x  2s     Element Should Be Visible    ${SOL_UNITRACE_LINK}
    ${Expected}=  get element attribute  xpath= ${SOL_UNISPHERE_IMG}  data-status
    Should be equal as strings    ${Expected}    active

SOL_Check the UI of the Maintanance page
    [Documentation]     This keyword is to check the UI of the Maintanance page.
    Element Should Be Visible   ${SOL_LOGO_LINK}
    Element Should Be Visible   ${SOL_SYSTECHONE_LINK}
    Element Should Be Visible   ${SOL_MAINTANANCE_ICON}
    Element Should Be Visible   ${SOL_MAINTANANCESYSUNAVAILABLE_TXT}
    Element Should Be Visible   ${SOL_MAINTANANCEINCONVINIENCE_MSG}
    Element Should Be Visible   ${SOL_MAINTANANCETHANKU_MSG}
    Element Should Be Visible   ${SOL_MAINTANANCECONTSUP_MSG}
    Element Should Be Visible   ${SOL_MAINTANANCEHERE_LINK}
    Element Should Be Visible   ${SOL_TWITTER_LINK}
    Element Should Be Visible   ${SOL_LINKEDIN_LINK}
    Element Should Be Visible   ${SOL_FACEBOOK_LINK}
    Element Should Be Visible   ${SOL_CONTACTUS_LINK}

SOL_Click on Contact Support link
    [Documentation]     This keyword is to click on contact support link
    Wait Until Element Is Visible  ${SOL_MAINTANANCEHERE_LINK}  timeout=20
    wait until keyword succeeds  5x  2s   Page Should Contain Element   ${SOL_MAINTANANCEHERE_LINK}
    wait until keyword succeeds  5x  2s   Click Element   ${SOL_MAINTANANCEHERE_LINK}

SOL_Click on UniSecure product
    [Documentation]     This keyword is to navigate to UniSecure product.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  5x  2s     Element Should Be Visible    ${SOL_UNISECURE_LINK}
    Wait Until Element Is Visible   ${SOL_UNISECURE_LINK}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${SOL_UNISECURE_LINK}
    ${Status}=    run keyword and return status     Wait Until Element Is Visible   ${UNISECURE_USERNAME_TXTBOX}  timeout=20
    log to console  ${Status}
    Run Keyword If  ${Status}== False     pass execution  Product is InActive
    Run Keyword If  ${Status}== True      Fail   Product is Active

SOL_Check the Product(UniSecure/UniSphere/UniTrace/UniSeries)data status
    [Documentation]  This keyword is to verify Product(UniSecure/UniSphere/UniTrace/UniSeries) data status
    ...              ${Data_Status}  is used to provide the data status(Active or Inactive) of the product to verify
    ...              ${Product_link} is used to provide the Product link in the solution landing page
    ...              ${Product_img} is used to provide the Product Image in the solution landing page
    ...              ${Product_datastatus}  is used to provide the data status attribute locator
    [Arguments]  ${Data_Status}    ${Product_link}   ${Product_img}   ${Product_datastatus}  ${Second_argument}
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  5x  2s     Element Should Be Visible    ${Product_link}
    wait until keyword succeeds  5x  2s     Page Should Contain Element  ${Product_link}
    wait until keyword succeeds  5x  2s     Page Should Contain Element  ${Product_img}
    SOL_Verify Autoplay in the market marquee section
    ${Expected}=  Get Element attribute   ${Product_datastatus}  ${Second_argument}
    log to console  ${Expected}
    Should be equal as strings    ${Expected}    ${Data_Status}

SOL_Click on UniSphere product
    [Documentation]     This keyword is to navigate to UniSphere product.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  5x  2s     Element Should Be Visible    ${SOL_UNISPHERE_LINK}
    Wait Until Element Is Visible   ${SOL_UNISPHERE_LINK}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${SOL_UNISPHERE_LINK}
    ${Status}=    run keyword and return status     Wait Until Element Is Visible   ${UNISECURE_USERNAME_TXTBOX}  timeout=20
    log to console  ${Status}
    Run Keyword If  ${Status}== False     pass execution  Product is InActive
    Run Keyword If  ${Status}== True      Fail   Product is Active

SOL_Click on UniTrace product
    [Documentation]     This keyword is to navigate to UniTrace product.
    Wait Until Element Is Visible   ${SOL_ABOUT_LINK}  timeout=20
    wait until keyword succeeds  5x  2s     Element Should Be Visible    ${SOL_UNITRACE_LINK}
    Wait Until Element Is Visible   ${SOL_UNITRACE_LINK}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${SOL_UNITRACE_LINK}
    ${Status}=    run keyword and return status     Wait Until Element Is Visible   ${TRC_USERNAME_TXTBOX}  timeout=20
    log to console  ${Status}
    Run Keyword If  ${Status}== False     pass execution  Product is InActive
    Run Keyword If  ${Status}== True      Fail   Product is Active

SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    [Documentation]   This keyword is used to click on UniSecure link in Solution landing page.
    ...               ${Productlink} is used to provide the product link in the Solution landing page
    ...               ${UsernameID} is used to provide the Username textbox id of the product.
    [Arguments]   ${Productlink}   ${UsernameID}
    Sleep  2s
    Run Keyword and Ignore Error  Wait Until Element Is Visible  xpath=(//*[text()='Next'])  timeout=20
    Run Keyword and Ignore Error  Wait Until Page Contains Element  xpath=(//video)[2]  timeout=20
    Wait Until Page Contains Element   ${Productlink}  timeout=20
    Wait Until Element Is Enabled  ${Productlink}  timeout=10
    wait until keyword succeeds  5x  2s  Mouse Over  ${Productlink}
    wait until keyword succeeds  5x  2s  Click Link  ${PRODUCTLINK}
    Wait Until Element Is Visible   ${UsernameID}  timeout=30

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
SOL_Check Terms of Service
    [Documentation]   This keyword is used to verify the Terms of Sevice
    [Arguments]  ${SOL_ABOUT_TERMS_SERV}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    SPH/SEC_Scroll Page To Location  0    1000
    wait until element is visible   ${SOL_ABOUT_TERMS_SERV}
    sleep    1s    #important because on jenkins the run is not headless
    click element   ${SOL_ABOUT_TERMS_SERV}
    Sleep  5s
    wait until keyword succeeds  3x  2s  Switch Window  NEW
    ${URLActual}=  Get Location
    Should be equal   ${SYSTECH_TERMS_SERV_URL}     ${URLActual}
    Page Should Contain     SYSTECH INTERNATIONAL® EUSA Version 2015-2
    close window
    Switch Window  MAIN

SOL_Check Privacy Policy

    [Documentation]   This keyword is used to verify the Privacy Policy
    [Arguments]  ${SOL_ABOUT_PRIVACY_POLC}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    SPH/SEC_Scroll Page To Location  0    1000
    wait until element is visible   ${SOL_ABOUT_PRIVACY_POLC}
    sleep    1s    #important because on jenkins the run is not headless
    click element   ${SOL_ABOUT_PRIVACY_POLC}
    Sleep  5s
    Switch Window  NEW
    ${URLActual}=  Get Location
    Should contain     ${URLActual}    ${SYSTECH_PRIV_POLC_URL}
    close window
    Switch Window  MAIN


