#-----------------------------------------------------------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by other Robot scrits.
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
Documentation     A resource file with reusable keywords and variables related to Solution landing page
...               and UniCloud integeration test cases.
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Resource          ..${/}..${/}Resources${/}COMMON_RESOURCE.robot
#-----------------------------------------------------------------------------------------------------------------------
*** Variables ***
${BROWSER}                                  chrome
${URI}                                      svt
${LANGUAGE}                                 Chinese
${CHINESELOCALE}                            zh   #en-us
${FRENCHLOCALE}                             fr
${SPANISHLOCALE}                            es
${GERMANLOCALE}                             de
${ARABICLOCALE}                             ar
${BASE_URL}                                 eng-${URI}.systechcloud.net
#${BASE_URL}                                 dd-systech-qa2.systechcloud.net
${UNICLOUD_URL}								http://athena.systechcloud.net:8008/UniCloud/#/login
#${UNICLOUD_USER}							Automation
#${UNICLOUD_PASSWORD}						Test!234
${UNICLOUD_USER}							admin
${UNICLOUD_PASSWORD}						yuda2030
${LOGIN URL}                                https://${BASE_URL}
${LOGIN URL_Home}                           https://${BASE_URL}/Home
${LOGIN URL_home1}                          https://${BASE_URL}/home
${UNISECURE URL}                            https://${BASE_URL}/UniSecure/#/
${UNITRACE URL}                             https://${BASE_URL}/login/
${UNISPHERE URL}                            https://${BASE_URL}/Systech360/#/
${i}                                        1
${SYSTECH_CONTACTUS_LINK}                   https://www.systechone.com/contact/
${SYSTECH_LINKEDIN_LINK}                    https://www.linkedin.com/
${SYSTECH_FACEBOOK_LINK}                    https://www.facebook.com/
${SYSTECH_TWITTER_LINK}                     https://twitter.com/systechone
${SYSTECH_YOUTUBE_LINK}                     https://www.youtube.com/channel/UC1fz6UKo5eMa1WxgVMGRhpA
${SYSTECH_TERMS_SERV_URL}                   https://dd-systech-qa2.systechcloud.net/tos/
${SYSTECH_PRIV_POLC_URL}                   Legal/Mobile-Application-Privacy-Policy-8.6.0
${SYSTECH_PATENT_URL}                      https://dd-systech-qa2.systechcloud.net/UniSecure/#/patents
${UNISEC_EXPECTED_YEAR}                     2012-2023
${UNISPH_EXPECTED_YEAR}                     2018-2023
${UNITRC_EXPECTED_YEAR}                     2012-2023
${UNISEC_OPENSOURCE_LINK}                     https://dd-systech-qa2.systechcloud.net/UniSecure/#/open-source-packages

${SYSTECHONE_HOME_LINK}                     https://www.systechone.com/
${UNISPHERE_BUILD_VERSIONNO}                1.11.0
${UNISPHERE_BUILD_NUMBER}                   20190927-150755
${UNISECURE_ADMINISTRATOR_USERNAME}         ruleuser
${UNISECURE_ADMINISTRATOR_PASSWORD}         Test@101
${UNISCAN_INSPECTOR_USERNAME}               Hiren
${UNISCAN_INSPECTOR_PASSWORD}               Hiren123!
${UNITRACE_ADMINISTRATOR_USERNAME}          SystechSuperUser
${UNITRACE_ADMINISTRATOR_PASSWORD}          yuda2030
${UNITRACE_ENVIRONMENT}                     eng_svt
${BROWSERWIDTH}                             1400
${BROWSERHEIGHT}                            920
${DISABLEDTOOLTIP}                          We are working on UniSeries web components. Check back again
${LOGONMSG}                                 "This is to inform maintanance Activity is scheduled on 30th December 2018"
${UNICLOUD_MASTERACCOUNTID_MAID}            0100000003
#-----------------------------------------------------------------------------------------------------------------------
*** Keywords ***
SOL_Open Browser with Solution Landing page in desired language
    [Documentation]     This keyword is used to Open the browser, set the browser window size
     ...                and navigate to the Login URL specified in the variable.
     ...                ${LANGUAGE} is used as argument to specify the language to create a web driver
    [Arguments]    ${LANGUAGE}
    Run Keyword If   '${LANGUAGE}' == 'Chinese'
    ...                        Create WebDriver browser with the language capabilities   ${CHINESELOCALE}
    Run keyword If   '${LANGUAGE}' == 'French'
    ...                        Create WebDriver browser with the language capabilities   ${FRENCHLOCALE}
    Run keyword If   '${LANGUAGE}' == 'Spanish'
    ...                        Create WebDriver browser with the language capabilities   ${FRENCHLOCALE}
    Run keyword If   '${LANGUAGE}' == 'German'
    ...                        Create WebDriver browser with the language capabilities   ${GERMANLOCALE}
    Run keyword If   '${LANGUAGE}' == 'Arabic'
    ...                        Create WebDriver browser with the language capabilities   ${ARABICLOCALE}
    Run keyword If   '${LANGUAGE}' == 'English'  SOL_Open Browser with Solution Landing page

Create WebDriver browser with the language capabilities
    [Documentation]  This keyword is used to create a webdriver browser with the language capabilities
    ...               ${LOCALE} is used to provide the Browser language locale code
    [Arguments]  ${LOCALE}
    Run Keyword If   '${BROWSER}' == 'chrome'    Open url in google chrome with desired language   ${LOCALE}
    Run Keyword If   '${BROWSER}' == 'headlesschrome'    Open url in headless google chrome with desired language   ${LOCALE}
    Run Keyword If   '${BROWSER}' == 'firefox'   Open url in Firefox with desired language  ${LOCALE}

Open url in Firefox with desired language
    [Documentation]  This keyword is used to Open Firefox browser with the language capabilities
    ...               ${LOCALE} is used to provide the Browser language locale code
    [Arguments]  ${LOCALE}
    ${profile}=  Evaluate  sys.modules['selenium.webdriver'].FirefoxProfile()  sys
    Call Method   ${profile}   set_preference   intl.accept_languages   ${LOCALE}
    Create WebDriver   Firefox    firefox_profile=${profile}
    Go To   ${LOGIN URL}
    Set Window Size  ${BROWSERWIDTH}  ${BROWSERHEIGHT}
	${width}    ${height}=  Get Window Size
    Maximize Browser Window

Open url in google chrome with desired language
        [Documentation]  This keyword is used to Open Chrome browser with the language capabilities
        ...               ${LOCALE} is used to provide the Browser language locale code
        [Arguments]  ${LOCALE}
        ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
        Call Method  ${options}  add_argument  --lang\=${LOCALE}
        Create WebDriver  Chrome  chrome_options=${options}
        Go To   ${LOGIN URL}
        Set Window Size  ${BROWSERWIDTH}  ${BROWSERHEIGHT}
        ${width}    ${height}=  Get Window Size
        Maximize Browser Window

Open url in headless google chrome with desired language
        [Documentation]  This keyword is used to Open Chrome browser with the language capabilities
        ...               ${LOCALE} is used to provide the Browser language locale code
        [Arguments]  ${LOCALE}
        ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
        Call Method  ${options}  add_argument  headless
        Call Method  ${options}  add_argument  --lang\=${LOCALE}
        Create WebDriver  Chrome  chrome_options=${options}
        Go To   ${LOGIN URL}
        Set Window Size  ${BROWSERWIDTH}  ${BROWSERHEIGHT}
        ${width}    ${height}=  Get Window Size
        Maximize Browser Window

Check the Translated text are in desired language
    [Documentation]  This keyword is used to check the translated text are in desired language
    ...               ${Lang} is used to provide the language to test the Solution landing page translated text
    [Arguments]   ${Lang}

    Run Keyword If  '${Lang}' == 'Chinese'   Chinese Data Translate is displayed
    ...         ELSE    English Data Translate is displayed

Chinese Data Translate is displayed
    [Documentation]  This keyword is used to check the Chinese text data translate is displayed.
    run keyword and ignore error    Data Translate comparision    ${SOL_ABOUT_XPATH}   ${CHINESEABOUT}
    run keyword and ignore error    Data Translate comparision    ${SOL_UNISPHEREXPATH_TXT}   ${CHINESEUNISPHERETEXT}
    run keyword and ignore error    Data Translate comparision    ${SOL_UNITRACEXPATH_TXT}   ${CHINESUNITRACETEXT}
    run keyword and ignore error    Data Translate comparision    ${SOL_UNISECUREXPATH_TXT}   ${CHINESUNISECURETEXT}
    run keyword and ignore error    Data Translate comparision    ${SOL_UNISERIESXPATH_TXT}   ${CHINESUNISERIESTEXT}
    run keyword and ignore error    Data Translate comparision    ${SOL_FOLLOWUSXPATH_TXT}   ${CHINESEFOLLOWUSTEXT}
    run keyword and ignore error    Data Translate comparision    ${SOL_CONTACTUSXPATH_TXT}   ${CHINESECONTACTUSTEXT}
    run keyword and ignore error    Data Translate comparision    ${SOL_NEEDHELPXPATH_TXT}  ${CHINESENEEDHELPTEXT}

English Data Translate is displayed
    [Documentation]  This keyword is used to check the Chinese text data translate is displayed.
    run keyword and continue on failure  Data Translate comparision    ${SOL_ABOUT_XPATH}   ${ENGLISHABOUT}
    run keyword and continue on failure  Data Translate comparision    ${SOL_UNISPHEREXPATH_TXT}   ${ENGLISHUNISPHERETEXT}
    run keyword and continue on failure  Data Translate comparision    ${SOL_UNITRACEXPATH_TXT}   ${ENGLISHUNITRACETEXT}
    run keyword and continue on failure  Data Translate comparision    ${SOL_UNISECUREXPATH_TXT}   ${ENGLISHUNISECURETEXT}
    run keyword and continue on failure  Data Translate comparision    ${SOL_UNISERIESXPATH_TXT}   ${ENGLISHUNISERIESTEXT}
    run keyword and continue on failure  Data Translate comparision    ${SOL_FOLLOWUSXPATH_TXT}   ${ENGLISHFOLLOWUSTEXT}
    run keyword and continue on failure  Data Translate comparision    ${SOL_CONTACTUSXPATH_TXT}   ${ENGLISHCONTACTUSTEXT}
    run keyword and continue on failure  Data Translate comparision    ${SOL_NEEDHELPXPATH_TXT}  ${ENGLISHNEEDHELPTEXT}

Data Translate comparision
    [Documentation]  This keyword is used to compare the date translates with the derived text of the element
    ...              ${DataTranslatexpath} is used to provide the Element of the Xpath
    ...              ${ChineseData} is used to provide the Chinese data
    [Arguments]   ${DataTranslatexpath}  ${ChineseData}
    ${CHINESETEXT}=  Get Text  ${DataTranslatexpath}
    Should be equal  ${ChineseData}   ${CHINESETEXT}

#-----------------------------------------------------------------------------------------------------------------------
COM_Navigate_To_Any_Card
	[Documentation]  Navigates to the expected card in any role, but it should be in cards view
	[Arguments]  ${Card_Path}  ${EXP_Card_Name}
	wait until element is visible  ${Card_Path} [1]  timeout=10
	${Cards_Count}=  Get Element Count  ${Card_Path}
	FOR    ${Card_Num}    IN RANGE    1    ${Cards_Count}+1
	    ${Actual_Card_Name}=  Get Text  ${Card_Path} [${Card_Num}]
	    Run Keyword If  '${Actual_Card_Name}'=='${EXP_Card_Name}'  Run Keywords  Click Element  ${Card_Path} [${Card_Num}]  AND  Exit For Loop
	END
	run keyword and ignore error  wait until element is not visible  ${Card_Path} [${Card_Num}]  timeout=10
	run keyword and ignore error  wait until element is visible  ${UNI_LOADINGICON}  timeout=25
	run keyword and ignore error  wait until element is not visible  ${UNI_LOADINGICON}  timeout=10
