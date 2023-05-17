#------------------------------------------------------------------
#   Description       :      Test Suite for Training Center
#   Project           :      Systech360 Training Center Automation
#   Author            :      Dinesh Kumar
#   © 2019   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Pre-conditions / Pre-requisites:
#   - NA
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation  TestSuite for UniSphere Training Center
Library        BuiltIn
Library        SeleniumLibrary
Variables      ../Variables/${TESTENV}_Variable.py
Resource       ../Keywords/Generic_Keywords.robot
Resource       ../Locators/Generic_Locators.robot
Resource       ../Locators/Training_Center_Locators.robot
Resource       ../Keywords/Test_Suite_Training_Center.robot
Resource       ../Keywords/UniCloud_Keywords.robot

Suite Setup     UNI_Open Browser And Enter URL
Suite Teardown  Close Browser

*** Variables ***
${URL_UNRESTRICTEC_VIDEOS}  https://eng-svt.systechcloud.net/Systech360/


*** Test Cases ***
TC_01_To Verify Cascading menu of Training center
    [Documentation]      This is to Verify cascading menu of Training Center in Hamburger menu
     UNI_Enter Credentials and Login to Application
     SPH/SEC_TC_Verify Cascading menu of Training center

TC_02_To Verify Clicking on Training Center
    [Documentation]      This is to Verify clicking on Training Center in Hamburger menu
     SPH/SEC_TC_Verify Clicking on Training Center

TC_03_To Verify Calenders in Training Schedule
    [Documentation]      This is to Verify Calenders in Training Center
     SPH/SEC_TC_Verify Calendars in Training Schedule

TC_04_To Verify Breadcrumbs
    [Documentation]      This is to Verify breadcrumbs
    ...  Takes Card name as an argument
     SPH/SEC_TC_Verify Breadcrumbs  ${SEC/SPH_UNRESTRICTED_VIDEOS_CARD}

TC_05_To Verify Searching an Artifact
    [Documentation]      This is to Verify Searching an Artifact in Search bar provided
    ...  Takes the name of the arifact to be searched for as an argument
     SPH/SEC_TC_Verify Searching an Artifact  ${Artifact_Name}

TC_06_To Verify Clicking on First Artifact
    [Documentation]      This is to Verify Clicking on First Artifact present and viewing it.
     SPH/SEC_TC_Verify Clicking on First Artifact

TC_07_To Verify Adding a Comment
    [Documentation]      This is to Verify adding a comment to Artifact


     go to    https://eng-svt.systechcloud.net/Systech360/#/centers/training-center/videos-unrestricted
     SPH/SEC_TC_Verify Adding a Comment

TC_08_To Verify Sorting By Likes Ascending Order
    [Documentation]      This is to Verify sorting funtionality using Likes
     SPH/SEC_TC_Verify Sorting By Likes Ascending Order

TC_09_To Verify Sorting By Views Descending Order
    [Documentation]      This is to Verify sorting funtionality using Views
     SPH/SEC_TC_Verify Sorting By Views Descending Order

TC_10_To Verify Sorting By Published Descending Order
    [Documentation]      This is to Verify sorting funtionality using Published Date
     SPH/SEC_TC_Verify Sorting By Published Descending Order

TC_11_To Verify Refine By Solution
    [Documentation]      This is to Verify refine by Solution
    ...  Takes the address of Refine by Solution with the solution name as an argument to check the checkbox
     UNI_Verify Refine By Section  ${UNI_REFINE_BY_SOL_ID}  ${Solution_Name}

TC_12_To Verify Refine By Version
    [Documentation]      This is to Verify refine by Version
    ...  Takes the address of Refine by Version with the version name as an argument to check the checkbox
     UNI_Verify Refine By Section  ${UNI_REFINE_BY_VER_ID}  ${Version_name}

TC_13_To Verify Refine By Language
    [Documentation]      This is to Verify refine by Language
    ...  Takes the address of Refine by Language with the language name as an argument to check the checkbox
     UNI_Verify Refine By Section  ${UNI_REFINE_BY_LANG_ID}  ${Language_Name}

TC_14_To Verify Refine By Topics
    [Documentation]      This is to Verify refine by Topic
    ...  Takes the address of Refine by Topic with the topic name as an argument to check the checkbox
    click element    ${UNI_REFINE_BY_MORE_TOPICS}
    UNI_Verify Refine By Section  ${UNI_REFINE_BY_TOP_ID}  ${Topic}
	Close Browser

TC_15_To Verify Subscription Videos in Training Center
    [Documentation]  Verifies subscription video is enabled, when enabled in UniCloud
    Open Browser  ${CLD_URL}  ${Browser_type}
	Set Window Size         ${WINDOW_WIDTH}          ${WINDOW_HEIGHT}
	UNI_Wait For Element  ${UNI_PASSWORD_TXT_BOX}
    CLD_Enter Credentials and Login to Application
    CLD_Navigate to Customers Card
    CLD_Add and Enable Subscription Videos for Customer
    Go To  ${URL}
	UNI_Wait For Element  ${UNI_PASSWORD_TXT_BOX}
    UNI_Enter Credentials and Login to Application
    SPH/SEC_TC_Verify Clicking on Training Center
    Click Element  ${SEC/SPH_VIDEO_SUBS_CARD}
    UNI_Wait For Element  ${SEC/SPH_ITEM_NAME}
    Element Should Be Visible  ${SEC/SPH_REFINE_BY_TOPIC}

TC_16_To Disable/Delete Subscription Videos
    Go To  ${CLD_URL}
	UNI_Wait For Element  ${UNI_PASSWORD_TXT_BOX}
    CLD_Enter Credentials and Login to Application
    CLD_Navigate to Customers Card
    CLD_Disable/Delete Subscription Videos for eng-svt

	Go To  ${URL}
	UNI_Wait For Element  ${UNI_PASSWORD_TXT_BOX}
    UNI_Enter Credentials and Login to Application
    SPH/SEC_TC_Verify Clicking on Training Center
    ${AttrVal}=  Get Element Attribute  ${SEC/SPH_VIDEO_SUBS_CARD_SECTION}  class
	Should Contain  ${AttrVal}  grey