#-----------------------------------------------------------------------------------------------------------------------
#   Description       :      Test Cases for Top Banner(UniSecure and UniSphere)
#   Project           :      UniSphere
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue:
#   - UniSecure or UniSphere product must be Enabled in Unicloud for the Account
#
#   Epilogue:
#   - Check the Top banner links.
#   - Global Search for Administrator, Designer and Operator.
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation  Top Banner common Test Cases
Resource   ..//Resources/Keyword.robot
Resource   ..//Resources/Common_Variable.robot
Resource   ..//Resources/Variable.robot
Resource   ..//..//..//RF_Systech360_Automation/Keywords/Generic_Keywords.robot
Resource   ..//..//..//RF_Systech360_Automation/Keywords/Designer_Keywords.robot
Library    SeleniumLibrary
Library    Collections
Library    String
Library    OperatingSystem
Suite Setup   SOL_Open Browser with Solution Landing page
Suite Teardown    Close Browser
#-----------------------------------------------------------------------------------------------------------------------

*** Variables ***
${URL}   https://eng-svt.systechcloud.net/Systech360/












*** Test Cases ***
#TC_00 Crete Role if it not exist
#    [Documentation]   This test case is to  Crete Role if it not exist
#     [Tags]    TC_00
#
#   go to    https://eng-svt.systechcloud.net/Systech360/#/login
#   SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...       ${UNISECURE_ADMIN_USERNAME}  ${UNISECURE_ADMIN_PASSWORD}  ${UNISECURE_ADMIN_ROLE}
#   wait until element is visible    //*[@id="preferenceCardName_0"]
#   click element    //*[@id="preferenceCardName_0"]
#   Search in Users/Groups    ${UNISECURE_ADMIN_USERNAME}
#   Execute JavaScript    window.scrollTo('0','600')
#   wait until keyword succeeds  5x  2s  click element    //*[@id="logOut"]

TC_01 Verify the Top banner in Login page of the Solution(UniSecure,UniSphere or UniSeries)
    [Documentation]   This test case is to verify the Top banner in Login page
    ...                of the Solution(UniSecure,UniSphere or UniSeries)
    [Tags]    TC_01
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    TOPBANNER_Check the Top Banner in Login

TC_02 Verify the Top Banner background color in Login page
    [Documentation]   This test case is to Verify the Top Banner background color in Login page
    [Tags]    TC_02
     Run Keyword If   '${Solution}' == 'Systech360'
     ...   COMMON_Check the background color    ${UNISPHERE_TOPBANNER_ID}    ${UNISPHEREPRODUCTBGCOLOR}
      Run Keyword If   '${Solution}' == 'UniSecure'
     ...   COMMON_Check the background color    ${UNISPHERE_TOPBANNER_ID}    ${UNISECUREPRODUCTBGCOLOR}

TC_03 Verify the Top banner after user logged in to the solution
    [Documentation]   This test case is to Verify the Top banner after user logged in to the solution
    [Tags]    TC_03
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...       ${UNISECURE_ADMIN_USERNAME}  ${UNISECURE_ADMIN_PASSWORD}  ${UNISECURE_ADMIN_ROLE}
    TOPBANNER_Check the Top Banner after login

TC_04 Verify user is able to Mouse over on Hmaburger icon in the Top banner
    [Documentation]  This test case is to Verify user is able to Mouse over on Hmaburger icon in the Top banner
    [Tags]    TC_04
    TOPBANNER_Check the Hamburger icon

TC_05 Verify user is able to click on Welcome button in the Top banner
    [Documentation]  This test case is to Verify user is able to click on Welcome button in the Top banner
    [Tags]    TC_05
    TOPBANNER_Click on Welcome button   ${UNISPHERE_PRODUCTCARD_ID}

TC_06 Verify user is able to click on the disabled UniSeries Product
    [Documentation]  This test case is to Verify user is able to click on the disabled UniSeries Product
    [Tags]    TC_06
    TOPBANNER_Click on UniSeries button

TC_07 Verify user is able to click on UniTrace button in the Top Banner
    [Documentation]  This test case is to Verify user is able to click on UniTrace button in the Top Banner
    [Tags]    TC_07
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMIN_USERNAME}  ${UNISECURE_ADMIN_PASSWORD}  ${UNISECURE_ADMIN_ROLE}
    TOPBANNER_Click on UniTrace button

TC_08 Verify user is able to view the UniSphere/UniSecure role navigation links in the Top Banner
    [Documentation]  This test case is to Verify user is able to view the
    ...              UniSphere/UniSecure role navigation links in the Top Banner
    [Tags]    TC_08
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNISECURE_ADMIN_USERNAME}  ${UNISECURE_ADMIN_PASSWORD}  ${UNISECURE_ADMIN_ROLE}
    TOPBANNER_Click on the UniSphere/UniSecure button
    TOPBANNER_Check the UniSphere/UniSecure roles in the dropdown

TC_09 Verify if user is able to click on About popup
    [Documentation]  This test case is to Verify if user is able to click on About popup
    [Tags]    TC_09
    TOPBANNER_Click on About popup

TC_10 Verify About Popup
    [Documentation]  This test case is to Verify About Popup
    [Tags]    TC_10
    TOPBANNER_Check the UI of the About popup    # club this test case

TC_11 Verify user is able to close the About popup by clicking on close button
    [Documentation]  This test case is to Verify user is able to close the About popup by clicking on close button
    [Tags]    TC_11
    TOPBANNER_Click on Close button in the About Popup

TC_12 Verify user is able to click on Welcome button after clicking on About popup
    [Documentation]  This test case is to Verify user is able to click on Welcome button after clicking on About popup
    [Tags]    TC_12
    TOPBANNER_Click on About popup
    TOPBANNER_Click on Welcome button   ${UNISPHERE_PRODUCTCARD_ID}

TC_13 Verify Administrator link is displayed when About popup is active
    [Documentation]  This test case is to Verify Administrator link is displayed when About popup is active
    [Tags]    TC_13
    TOPBANNER_Click on About popup
    TOPBANNER_Check the Role navigation in the Top Banner  ${UNISPHERE_ABOUTADMIN_ID}

TC_14 Verify Designer link is displayed when About popup is active
    [Documentation]  This test case is to Verify Designer link is displayed when About popup is active
    [Tags]    TC_14
    TOPBANNER_Select the role in the dropdown  ${UNISPHERE_PREFERENCESDESIGNER_ROLE}
    TOPBANNER_Click on About popup
    TOPBANNER_Check the Role navigation in the Top Banner  ${UNISPHERE_ABOUTDESIGNER_ID}

TC_15 Verify Operator link is displayed when About popup is active
    [Documentation]  This test case is to Verify Operator link is displayed when About popup is active
    [Tags]    TC_15
    TOPBANNER_Select the role in the dropdown  ${UNISPHERE_PREFERENCESOPERATOR_ROLE}
    TOPBANNER_Click on About popup
    TOPBANNER_Check the Role navigation in the Top Banner  ${UNISPHERE_ABOUTOPERATOR_ID}

TC_16 Verify Business Owner link(UniSecure) is displayed when About popup is active
    [Documentation]  This test case is to Verify Operator link is displayed when About popup is active
    [Tags]    TC_16
    TOPBANNER_Check the Solution for this testcase
    TOPBANNER_Select the role in the dropdown  ${UNISPHERE_PREFERENCESBO_ROLE}
    TOPBANNER_Click on About popup
    TOPBANNER_Check the Role navigation in the Top Banner  ${UNISPHERE_ABOUTBO_ID}

TC_17 Verify user is able to click on Search button with out entering details.
    [Documentation]  This test case is to Verify user is able to click on Search button with out entering details.
    [Tags]    TC_17
    TOPBANNER_Select the role in the dropdown  ${UNISPHERE_PREFERENCESADMIN_ROLE}
    TOPBANNER_Click on Welcome button   ${UNISPHERE_PRODUCTCARD_ID}
    TOPBANNER_Check the Global Search Result with out entering any data
    TOPBANNER_Check Global search page displayed to the user

TC_18 Verify Administrator is able to do Global Search
    [Documentation]  This test case is to Verify Administrator is able to do Global Search
    [Tags]    TC_18
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere  ${Solution}
    ${Username}=  TOPBANNER_Fetch the data to search  ${UNISECURE_SEARCHUSER_XPATH}
    ${Groupname}=   TOPBANNER_Fetch the data to search  ${UNISECURE_SEARCHGROUP_XPATH}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Username}
    TOPBANNER_Search the user in the global search
    ...             ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Username}
    TOPBANNER_Click on Welcome button   ${UNISPHERE_PRODUCTCARD_ID}
    TOPBANNER_Enter Input in the Searchbox and click Search button    ${Groupname}
    TOPBANNER_Search the user in the global search
    ...             ${UNISPHERE_GSHIGHLIGHTED_SPAN}   ${Groupname}

TC_19 Verify Designer is able to do Global Search
    [Documentation]  This test case is to Verify Designer is able to do Global Search
    [Tags]    TC_19
    TOPBANNER_Select the role in the dropdown   ${UNISPHERE_PREFERENCESDESIGNER_ROLE}
    TOPBANNER_Fetch the Designer data to search
    [Teardown]  run keyword if test failed   SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}

#TODO fix this TC
#TC_20 Verify Operator is able to do Global Search
#    [Documentation]  This test case is to Verify Operator is able to do Global Search
#    [Tags]    TC_20
#    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
#    SOL_Select Solution from the Landing page  ${Solution}
#    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...   ${UNISECURE_ADMIN_USERNAME}  ${UNISECURE_ADMIN_PASSWORD}  ${UNISECURE_ADMIN_ROLE}
#   TOPBANNER_Select the role in the dropdown   ${UNISPHERE_PREFERENCESDESIGNER_ROLE}
#   Create And Publish Scene In Designer
#   TOPBANNER_Select the role in the dropdown   ${UNISPHERE_PREFERENCESOPERATOR_ROLE}
#   Keyword.TOPBANNER Fetch The Operator Data To Search

TC_21 Verify Help video section is dispalyed in Top banner
    [Documentation]  This test case is to Verify Help video section is dispalyed in Top banner
    [Tags]    TC_21
    TOPBANNER_Check the help video section in the top banner

TC_22Verify user is able to play the help video in the Top banner
    [Documentation]  This test case is to Verify user is able to play the help video in the Top banner
    [Tags]    TC_22
    TOPBANNER_Click on the Help Video
    TOPBANNER_Check the Video catalog list
    TOPBANNER_Close the Video Online Assistance


Delete all the used Test data in Designer
    [Documentation]  Deletes created Test data
    [Tags]    DTD
    go to    ${URL}
    SEC/S360_Login Precondition    ${URL}    ${UNISPHERE_DESIGNER_USERNAME}    ${UNISPHERE_DESIGNER_PASSWORD}    ${DesignerRole}
    S360_DSG_Delete An Item  ${S360_ENV_ITEM}             ${Test_SceneName}       ${DeleteSceneMsgID}
    run keyword and ignore error    SEC/S360_Empty Trash
    [Teardown]    SEC/S360_Common Logout

#-----------------------------------------------------------------------------------------------------------------------
