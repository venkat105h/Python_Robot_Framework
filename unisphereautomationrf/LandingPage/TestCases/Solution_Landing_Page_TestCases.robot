#-----------------------------------------------------------------------------------------------------------------------
#   Description       :      This test suite Test Cases for Solution Landing page
#   Project           :      UniSphere
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue: - NA
#
#   Epilogue:
#   - Solution landing page validation of navigations of products & links, Market marquee slides and language support .
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation     Verify Solution Landing Page Test cases

#Resource    ../../Resources/SOL_RESOURCE.robot
Resource    ../Resources/resource.robot

Suite Setup       SOL_Open Browser with Solution Landing page
Suite Teardown    Close Browser
Test Teardown     run keyword if test failed  Reload page
#-----------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
TC_01 To Verify if user is able to navigate to Solution Landing page.
    [Documentation]   This Test case is to verify if user is able to navigate to solution landing page.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-917
	COM_Get_Custom_Page_Screenshot  Login
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    Wait Until Element Is Visible   ${SOL_SYSTECHONE_LINK}  timeout=20
    Page Should Contain Element        ${SOL_UNISPHERE_LINK}


TC_02 To Verify Systech Logo in Solution Landing page.
    [Documentation]   This Test case is to verify and click on Systech logo in solution landing page.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-918
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    Wait Until Element Is Visible   ${SOL_SYSTECHONE_LINK}  timeout=20
    SOL_Click on Systech Logo link


TC_03 To Verify if user is able to navigate to Solution Landing page with the URL having (/home).
    [Documentation]   This Test case is to verify if user is able to
    ...                navigate to Solution Landing page with the URL having (/home).
    [Tags]    SolutionLandingPage   P1   Sanity  TC-919
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product  ${LOGIN URL_home1}
    wait until keyword succeeds  5x  2s   Wait Until Element Is Visible   ${SOL_SYSTECHONE_LINK}


TC_04 To Verify if user is able to navigate to UniSecure login page with the URL.
    [Documentation]   This Test case is to verify if user is able to navigate to UniSecure login page with the URL.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-920
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product       ${UNISECURE URL}
    wait until keyword succeeds  5x  2s   Wait Until Element Is Visible   ${UNISECURE_USERNAME_TXTBOX}

TC_05 To Verify if user is able to navigate to UniTrace login page with the URL.
    [Documentation]   This Test case is to verify if user is able to navigate to UniTrace login page with the URL.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-921
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product    ${UNITRACE URL}
    wait until keyword succeeds  5x  2s   Wait Until Element Is Visible   ${TRC_USERNAME_TXTBOX}


TC_06 To Verify if user is able to navigate to UniSphere login page with the URL.
    [Documentation]   This Test case is to verify if user is able to navigate to UniSphere login page with the URL.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-922
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${UNISPHERE URL}
    wait until keyword succeeds  5x  2s   Wait Until Element Is Visible  ${UNISPHERE_USERNAME_TXTBOX}

TC_07 To Verify the UI of the UniSphere About popup.
    [Documentation]   This Test case is to verify UI of the UniSphere About popup.
    [Tags]    SolutionLandingPage   P2     TC-923
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the UI of the About popup


TC_08 To Verify the Version number in the UniSphere About popup.
    [Documentation]   This Test case is to verify the Version number in the UniSphere About popup.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-924
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    SOL_Check the Version number


TC_09 To Verify the Copyrights in the UniSphere About popup.
    [Documentation]   This Test case is to Verify the Copyrights in the UniSphere About popup.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-925
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    SOL_Check the Copyrights   ${SOL_UNISPH_COPYRIGHT}   ${UNISPH_EXPECTED_YEAR}


TC_10 To Verify the Copyrights in the UniTrace About popup.
    [Documentation]   This Test case is to Verify the Copyrights in the UniSphere About popup.
    [Tags]    SolutionLandingPage   P2    TC-926
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    SOL_Check the Copyrights   ${SOL_UNITRC_COPYRIGHT}   ${UNITRC_EXPECTED_YEAR}


TC_11 To Verify the Copyrights in the UniSecure About popup.
    [Documentation]   This Test case is to Verify the Copyrights in the UniSphere About popup.
    [Tags]    SolutionLandingPage   P2     TC-927
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    SOL_Check the Copyrights   ${SOL_UNISEC_COPYRIGHT}   ${UNISEC_EXPECTED_YEAR}


TC_12 To Verify the Market Marquee area slides.
    [Documentation]   This Test case is to verify the Market Marquee area slides.
    [Tags]    SolutionLandingPage   P2  TC-928
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Verify Market marquee slide navigation


TC_13 To Verify auto play in the Market Marquee section
    [Documentation]   This Test case is to video is playing in the Market Marquee section.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-929
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Verify Autoplay in the market marquee section


TC_14 To Verify user is able to view the video contents in the Marketing material.
    [Documentation]   This Test case is to verify if user is able to view the video contents in the Marketing material.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-930
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Verify the Video in the Market Marquee section


TC_15 To Verify the Products in the solution landing page is Enabled.
    [Documentation]   This Test case is to verify if Products in the solution landing page is Enabled.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-931
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the products in the solution landing page


TC_16 To Verify Uni-Series product card in the Solution landing page is inactive.
    [Documentation]   This Test case is to verify if Uni-Series product card in the Solution landing page is inactive.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-932
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the Disabled product   ${SOL_UNISERIES_LINK}


TC_17 To Verify tooltip in the Uni-Series product card.
    [Documentation]   This Test case is to verify the tooltip in the Uni-Series product card.
    [Tags]    SolutionLandingPage   P2  TC-933
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the Tooltip on the disabled product


TC_18 To Verify UniSphere product navigation from the Solution Landing page.
    [Documentation]   This Test case is to verify the UniSphere product navigation from the Solution Landing page.
    [Tags]    SolutionLandingPage   P1   Sanity  TC-934
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the UniSphere/UniTrace/UniSecure/UniSphere product navigation
    ...            ${SOL_UNISPHERE_LINK}   ${UNISPHERE_USERNAME_TXTBOX}


TC_19 To Verify UniTrace product navigation from the Solution Landing page.
    [Documentation]   This Test case is to verify the UniTrace product navigation from the Solution Landing page.
    [Tags]    SolutionLandingPage   P2  TC-935
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the UniSphere/UniTrace/UniSecure/UniSphere product navigation
    ...         ${SOL_UNITRACE_LINK}   ${TRC_USERNAME_TXTBOX}


TC_20 To Verify UniSecure product navigation from the Solution Landing page.
    [Documentation]   This Test case is to verify the UniSecure product navigation from the Solution Landing page
    [Tags]    SolutionLandingPage   P2  TC-936
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the UniSphere/UniTrace/UniSecure/UniSphere product navigation
    ...             ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}


TC_21 To Verify UniSeries product navigation from the Solution Landing page.
    [Documentation]   This Test case is to verify the UniSeries product navigation from the Solution Landing page
    [Tags]    SolutionLandingPage   P2    TC-937
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Check the UniSphere/UniTrace/UniSecure/UniSphere product navigation
    ...               ${SOL_UNISERIES_LINK}   ${SOL_UNISERIES_LINK}


TC_22 To Verify if External link disclaimer is displayed to the user when he clicks on Twitter.
    [Documentation]   This Test case is to verify if External link disclaimer
    ...               is displayed to the user when he clicks on Twitter.
    [Tags]    SolutionLandingPage   P2  TC-938
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/Youtube    ${SOL_TWITTER_LINK}


TC_23 To Verify if user is able to navigate back to solution landing page from Twitter External link disclaimer.
    [Documentation]   This Test case is to verify if user is able to
    ...               navigate back to solution landing page from Twitter External link disclaimer.
    [Tags]    SolutionLandingPage   P2  TC-939
    SOL_Click on GOBack button


TC_24 To Verify if External link disclaimer is displayed to the user when he clicks on Facebook.
    [Documentation]   This Test case is to verify if External link disclaimer
    ...               is displayed to the user when he clicks on Facebook.
    [Tags]    SolutionLandingPage   P2  TC-940
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/Youtube    ${SOL_FACEBOOK_LINK}


TC_25 To Verify if user is able to navigate back to solution landing page from Facebook External link disclaimer.
    [Documentation]   This Test case is to verify if user is able to
    ...               navigate back to solution landing page from Facebook External link disclaimer.
    [Tags]    SolutionLandingPage   P2  TC-941
    SOL_Click on GOBack button


TC_26 To Verify if External link disclaimer is displayed to the user when he clicks on LinkedIn.
    [Documentation]   This Test case is to verify if
    ...               External link disclaimer is displayed to the user when he clicks on LinkedIn.
    [Tags]    SolutionLandingPage   P2  TC-942
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/Youtube    ${SOL_LINKEDIN_LINK}


TC_27 To Verify if user is able to navigate back to solution landing page from LinkedIn External link disclaimer.
    [Documentation]   This Test case is to verify if user is able to
    ...               navigate back to solution landing page from LinkedIn External link disclaimer.
    [Tags]    SolutionLandingPage   P2  TC-943
    SOL_Click on GOBack button


TC_28 To Verify if External link disclaimer is displayed to the user when he clicks on Youtube.
    [Documentation]   This Test case is to verify if External link disclaimer
    ...               is displayed to the user when he clicks on Youtube.
    [Tags]    SolutionLandingPage   P2  TC-944
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/Youtube    ${SOL_YOUTUBE_LINK}


TC_29 To Verify if user is able to navigate back to solution landing page from Youtube External link disclaimer.
    [Documentation]   This Test case is to verify if user is able to
    ...               navigate back to solution landing page from Youtube External link disclaimer.
    [Tags]    SolutionLandingPage   P2  TC-945
    SOL_Click on GOBack button


TC_30 To Verify if user is able to navigate to Twitter Systech page.
    [Documentation]   This Test case is to verify if user is able to navigate to Twitter Systech page.
    [Tags]    SolutionLandingPage   P2  TC-946
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/YouTube    ${SOL_TWITTER_LINK}
    SOL_Click on Continue button
	Sleep  5s
    ${TwitterURLActual}=  Get Location
    log to console   ${TwitterURLActual}
    Should be equal  ${SYSTECH_TWITTER_LINK}    ${TwitterURLActual}
    Close Window
    Switch Window    MAIN
#    Switch Window  MAIN


TC_31 To Verify if user is able to navigate to Facebook Systech page.
    [Documentation]   This Test case is to verify if user is able to navigate to Facebook Systech page.
    [Tags]    SolutionLandingPage   P2  TC-947
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/YouTube    ${SOL_FACEBOOK_LINK}
    SOL_Click on Continue button
	Sleep  5s
    ${FacebookURLActual}=  Get Location
    log to console   ${FacebookURLActual}
    should contain    ${FacebookURLActual}    ${SYSTECH_FACEBOOK_LINK}
    Close Window
    Switch Window  MAIN


TC_32 To Verify if user is able to navigate to LinkedIn Systech page.
    [Documentation]   This Test case is to verify if user is able to navigate to LinkedIn Systech page.
    [Tags]    SolutionLandingPage   P2  TC-948
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/YouTube    ${SOL_LINKEDIN_LINK}
    SOL_Click on Continue button
	Sleep  5s
    ${LinkedInURLActual}=  Get Location
    log to console   ${LinkedInURLActual}
    Should Contain     ${LinkedInURLActual}   ${SYSTECH_LINKEDIN_LINK}
    Close Window
    Switch Window  MAIN


TC_33 To Verify if user is able to navigate to Systech One Youtube page.
    [Documentation]   This Test case is to verify if user is able to navigate to Youtube Systech page.
    [Tags]    SolutionLandingPage   P2  TC-949
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on Twitter/Facebook/LinkedIn/YouTube    ${SOL_YOUTUBE_LINK}
    SOL_Click on Continue button
	Sleep  5s
    ${LinkedInURLActual}=  Get Location
    log to console   ${LinkedInURLActual}
    Should be equal   ${SYSTECH_YOUTUBE_LINK}     ${LinkedInURLActual}
    Close Window
    Switch Window  MAIN


#Verify Terms of Service for all solutions
TC_34 To Verify Terms of service for UniSecure
    [Documentation]   This Test case is to verify Terms of service for UniSecure
    [Tags]    SolutionLandingPage   P1    Sanity  TC-950
    SOL_Check Terms of Service  ${SOL_UNISEC_ABOUT_TERMS_SERV}


TC_35 To Verify Terms of service for Systech360
    [Documentation]   This Test case is to verify Terms of service for Systech360
    [Tags]    SolutionLandingPage   P1    Sanity  TC-951
    SOL_Check Terms of Service  ${SOL_UNISPH_ABOUT_TERMS_SERV}


TC_36 To Verify Terms of service for UniTrace
    [Documentation]   This Test case is to verify Terms of service for UniTrace
    [Tags]    SolutionLandingPage   P1    Sanity  TC-952
    SOL_Check Terms of Service  ${SOL_UNITRC_ABOUT_TERMS_SERV}


#Verify Privacy Policy for all solutions
TC_37 To Verify Privacy Policy for UniSecure
    [Documentation]   This Test case is to verify Privacy Policy for UniSecure
    [Tags]    SolutionLandingPage   P1    Sanity  TC-953
    SOL_Check Privacy Policy  ${SOL_UNISEC_ABOUT_PRIV_POLC}


TC_38 To Verify Privacy Policy for Systech360
    [Documentation]   This Test case is to verify Privacy Policy for Systech 360
    [Tags]    SolutionLandingPage   P1    Sanity  TC-954
    SOL_Check Privacy Policy  ${SOL_UNISPH_ABOUT_PRIV_POLC}


TC_39 To Verify Privacy Policy for UniTrace
    [Documentation]   This Test case is to verify Privacy Policy for UniTrace
    [Tags]    SolutionLandingPage   P1    Sanity  TC-955
    SOL_Check Privacy Policy  ${SOL_UNITRC_ABOUT_PRIV_POLC}


#Verify UniSecure Opensource software
TC_40 To Verify UniSecure Opensource software in About page
    [Documentation]   This Test case is to verify UniSecure Opensource software link
    [Tags]    SolutionLandingPage   P1    Sanity  TC-956
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    Page should contain link  ${SOL_UNISEC_ABOUT_OPNSRC_SW}
    SPH/SEC_Scroll Page To Location  0  0
    wait until element is visible  ${SOL_UNISEC_ABOUT_OPNSRC_SW}  timeout=20
    sleep    1s    #important because on jenkins the run is not headless
    click element   ${SOL_UNISEC_ABOUT_OPNSRC_SW}
    Sleep  5s
    capture page screenshot
    ${OPENSRCURLActual}=  Get Location
    log to console   ${OPENSRCURLActual}
    Should be equal   ${UNISEC_OPENSOURCE_LINK}      ${OPENSRCURLActual}
    Wait Until page contains element     ${SOL_UNISEC_OPNSRC_SW_TBL}   timeout=20
    page should contain element     ${SOL_UNISEC_OPNSRC_SW_LEAFLET_NAME}
    page should contain element     ${SOL_UNISEC_OPNSRC_SW_LEAFLET_NAME}
    #Verify Show license link
    click element   ${SOL_UNISEC_OPNSRC_SW_LEAFLET_SHOWLIC}
    Sleep  5s
    Switch Window  NEW
    ${SHOWLICActual}=  Get Location
    log to console   ${SHOWLICActual}
    Should be equal   ${SOL_UNISEC_OPNSRC_SW_LEAFLET_LIC_LINK}     ${SHOWLICActual}
    page should contain    Copyright (c) 2010-2023, Volodymyr Agafonkin
    Close Window
    Switch Window  MAIN

    #Verify Homepage link
    click element   ${SOL_UNISEC_OPNSRC_SW_LEAFLET_HOMEPAGE}
    Sleep  5s
    Switch Window  NEW
    ${HOMEPAGEActual}=  Get Location
    log to console   ${HOMEPAGEActual}
    Should be equal   ${SOL_UNISEC_OPNSRC_SW_LEAFLET_HOMEPAGE_LINK}     ${HOMEPAGEActual}
    Close Window
    Switch Window  MAIN


TC_41 To Verify UniSecure Patent info in UniSecure About page
    [Documentation]   This Test case is to verify Patent info link in UniSecure About page
    [Tags]    SolutionLandingPage   P1    Sanity  TC-957
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on About link
    SPH/SEC_Scroll Page To Location  0  0
    wait until element is visible  ${SOL_UNISEC_ABOUT_PATENT}  timeout=20
    sleep    1s    #important because on jenkins the run is not headless
    click element   ${SOL_UNISEC_ABOUT_PATENT}
    sleep  5s
    capture page screenshot
    ${PatentURLActual}=  Get Location
    log to console   ${PatentURLActual}
    Should be equal   ${SYSTECH_PATENT_URL}      ${PatentURLActual}
    Wait Until page contains element     ${SOL_UNISEC_ABOUT_PATENT_TABLE}   timeout=20
#    Close Window
#    Switch Window  MAIN


TC_42 To verify Terms of sevices in Lanidng page border
    [Documentation]   This Test case is to verify Terms of sevices
    [Tags]    SolutionLandingPage   P1    Sanity  TC-958
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    wait until element is visible  ${SOL_TOS_LINK}  timeout=40
    click element       ${SOL_TOS_LINK}
    Sleep  5s
    Switch Window  NEW
    ${URLActual}=  Get Location
    Should be equal   ${SYSTECH_TERMS_SERV_URL}     ${URLActual}
    scroll page to location  0   2000
    page should contain    SYSTECH INTERNATIONAL® EUSA Version 2015-2
    close window
    Switch Window  MAIN


TC_43 To verify Privacy policy in Lanidng page border
    [Documentation]   This Test case is to verify privacy policy
    [Tags]    SolutionLandingPage   P1    Sanity  TC-959
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    click element       ${SOL_PRV_PLCY_LINK}
    Sleep  5s
    Switch Window  NEW
    ${URLActual}=  Get Location
    Should contain     ${URLActual}    ${SYSTECH_PRIV_POLC_URL}
    Close Window
    Switch Window  MAIN


TC_44 To Verify if user is able to navigate to Systech One Contact page.
    [Documentation]   This Test case is to verify if user is able to navigate to Systech One Contact page.
    [Tags]    SolutionLandingPage   P1    Sanity  TC-960
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
	COM_Get_Custom_Page_Screenshot  Login
    SOL_Click on SystechOne Contact link
    COMMON_Focus on New Tab
    Sleep  5s
    ${ContactUsURLActual} =  Get Location
    log to console   ${ContactUsURLActual}
    Should be equal  ${SYSTECH_CONTACTUS_LINK}    ${ContactUsURLActual}
    Close Window
    Switch Window  MAIN


TC_45 To Verify if user is able to navigate to SystechOne landing page when clicks on SystechOne top link.
    [Documentation]   This Test case is to verify if user is able to
    ...               navigate to SystechOne landing page when clicks on SystechOne top link.
    [Tags]    SolutionLandingPage   P1    Sanity  TC-961
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
	COM_Get_Custom_Page_Screenshot  Login
    SOL_Click on SystechOne link
    Sleep  5s
    ${SystechOneURLActual}=  Get Location
    log to console    ${SystechOneURLActual}
    Should be equal   ${SYSTECHONE_HOME_LINK}    ${SystechOneURLActual}
    Sleep  5s
    Close Window
    Switch Window  MAIN


TC_46 To Verify if user is able to view the Solution landing page in desired languages (Chinese)
    [Documentation]  This Test case is to verify if Soltuion landing page is getting translated
     ...             to the languages user selected.
    [Tags]    SolutionLandingPage   P1    Sanity  TC-962
    Close All Browsers
    SOL_Open Browser with Solution Landing page in desired language   Chinese
    sleep  5s
    Check the Translated text are in desired language  Chinese
    [Teardown]  Close All Browsers


TC_47 To Verify if user is able to view the Solution landing page in desired languages (Non Supported Language(French))
    [Documentation]  This Test case is to verify if Soltuion landing page is getting translated
     ...             to the languages user selected.
    [Tags]    SolutionLandingPage   P1    Sanity  TC-963
    SOL_Open Browser with Solution Landing page in desired language   French
    Check the Translated text are in desired language  French
    [Teardown]  Close All Browsers


TC_48 To Verify if user is able to view the Solution landing page in desired languages (Non Supported Language(Arabic))
    [Documentation]  This Test case is to verify if Soltuion landing page is getting translated
     ...             to the languages user selected.
    [Tags]    SolutionLandingPage   P1    Sanity  TC-963
    Close All Browsers
    SOL_Open Browser with Solution Landing page in desired language   Arabic
    Check the Translated text are in desired language  Arabic
    Sleep  5s
    [Teardown]  Close All Browsers
