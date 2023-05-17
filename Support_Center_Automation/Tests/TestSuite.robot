#------------------------------------------------------------------
#   Description       :      Test Suite for Support Center
#   Project           :      UniSphere Information Center Automation
#   Author            :      Dinesh Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation  TestSuite for UniSphere Support Center
Library    BuiltIn
Variables  ../Variables/${TESTENV}_Variable.py
Library    SeleniumLibrary  run_on_failure=Capture Page Screenshot
Resource   ../Keywords/Generic_Keywords.robot
Resource   ../../RF_Systech360_Automation/Keywords/Admin_Keywords.robot
Resource   ../Generic/GenericMethods.py
Resource   ../Keywords/Support_Center_keywords.robot
Resource   ../Locators/Support_Center_Locators.robot
Resource   ../Locators/Generic_Locators.robot

Suite Setup     UNI_Open Browser And Navigate to URL
Suite Teardown  Close Browser

*** Test Cases ***
TC_01 Verify Cascading Menu Of Support Center
    [Documentation]      This is to Verify cascading menu of Support Center in Hamburger menu
     [Tags]     TC_01
     SPH/SEC_SC_Verify Cascading menu of Support center


TC_02 Verify Breadcrumbs
    [Documentation]      This is to Verify breadcumbs
    [Tags]    TC_02
#     SPH/SEC_SC_Verify Breadcrumbs  ${SPH/SEC_LIVE_CHAT_CARD}
      SPH/SEC_SC_Verify Breadcrumbs  ${SPH/SEC_CONTACT_SUPPORT_CARD}
# Live Chat feature is removed
#Verify Live Chat Feature
#    [Documentation]      This is to Verify Live Chat feature in Support Center
#     SPH/SEC_SC_Live Chat


TC_03 Verify Contact Support Feature With Only Mandatory Field
    [Documentation]      This is to Verify Contact Support feature by entering only mandatory fields in Support Center
    [Tags]   TC_03
     SPH/SEC_SC_Contact Support With Only Mandatory Fields


TC_04 Verify Contact Support Feature With a Missing Mandatory Field
    [Documentation]      This is to Verify Contact Support feature by not entering one mandatory fields in Support Center
    [Tags]    TC_04
     SPH/SEC_SC_Contact Support With One Missing Mandatory Fields


TC_05 Verify Contact Support Feature With All fields
    [Documentation]      This is to Verify Contact Support feature by entering all fields present in Support Center
    [Tags]    TC_05
    SPH/SEC_SC_Contact Support With all Fields


TC_06 Verify Case History Page UI
    [Documentation]  Verifies Case History page elements
    [Tags]    TC_06
    SPH/SEC_SC_Verify Case History Page UI


TC_07 Verify Case History Page Details tab UI
    [Documentation]  Verifies UI elements of details tab in case history page
    [Tags]    TC_07
    SPH/SEC_SC_Verify Case History Page Details Tab UI


TC_08 To Verify Searching an Artifact
    [Documentation]      This is to Verify Searching an Artifact in Search bar provided
    ...  Takes the name of the arifact to be searched for as an argument
	[Tags]  OnlySystech360

     SPH/SEC_SC_Verify Searching an Artifact  ${Var_Artifact_Name}


TC_09 To Verify Sorting By Published Descending Order
    [Documentation]      This is to Verify sorting funtionality using Published Date
	[Tags]  OnlySystech360

     SPH/SEC_SC_Verify Sorting By Published Descending Order


TC_10 To Verify Refine By Solution In Software
    [Documentation]      This is to Verify refine by Solution in Software Card
    ...  Takes the address of Refine by Solution with the solution name as an argument to check the checkbox
	[Tags]   OnlySystech360
     sleep    11s
     UNI_Verify Refine By Section  ${UNI_RefineSolution}  ${Var_Solution_Name}


TC_11 To Verify Refine By Version In Software
    [Documentation]      This is to Verify refine by Version in Software Card

    ...  Takes the address of Refine by Version with the version name as an argument to check the checkbox
	[Tags]  OnlySystech360
    reload page
    wait until element is visible    ${UNI_MULTIPLE_ITEM_NAME}
    Support_Center_keywords.UNI Verify Refine By Section In Renewal Info  ${UNI_RefineVersion}  ${Var_Version_name}

TC_12 TC_12To Verify Refine By Topics In Software
    [Documentation]      This is to Verify refine by Language in Software Card
    ...  Takes the address of Refine by Topic with the topic name as an argument to check the checkbox
	[Tags]  OnlySystech360
    reload page
    run keyword and ignore error    wait until element is visible    ${UNI_MULTIPLE_ITEM_NAME}
    run keyword and ignore error  UNI Verify Refine By Section  ${UNI_RefineTopic}  ${Var_Topic}

TC_13 To Verify Viewing Release Note
    [Documentation]  This is to verify opening release notes and viewing it
	[Tags]  OnlySystech360

    SPH/SEC_SC_Verify Viewing Release Note

#TODO chech test case
#
#TC_14 To Verify Clicking On A Software
#    [Documentation]  This is to verify when one of software patch is clicked
#	[Tags]  OnlySystech360
#    sleep    33s
#    go to    https://eng-svt.systechcloud.net/Systech360/#/centers/support-center/software-patch
#
#   SPH/SEC_SC_Verify Clicking On A Software  ${Var_SceneName1}  ${Var_ItemName}


TC_15 To Verify Refine By Saas 'No'
    [Documentation]  This Verifies Refine By Section in Renewal Info Page
    [Tags]  TC15

    SPH/SEC_SC_Navigate To Renewal Info Page

    UNI_Verify Refine By Sections In Renewal Info  ${SPH/SEC_REFINE_BY_SAAS}   No   ${SPH/SEC_SAAS_VALUE}
    [Teardown]  Run Keyword If Test Failed  Execute JavaScript  document.getElementById('${SPH/SEC_REFINE_BY_SAAS}Yes_input').click()

TC_16 To Verify Refine By Saas 'Yes'
    SPH/SEC_SC_Navigate To Renewal Info Page

    UNI_Verify Refine By Sections In Renewal Info  ${SPH/SEC_REFINE_BY_SAAS}   Yes   ${SPH/SEC_SAAS_VALUE}
    [Teardown]  Run Keyword If Test Failed  Execute JavaScript  document.getElementById('${SPH/SEC_REFINE_BY_SAAS}Yes_input').click()

TC_17 To Verify Refine By MultiYear 'No'

   SPH/SEC_SC_Navigate To Renewal Info Page

    UNI_Verify Refine By Sections In Renewal Info  ${SPH/SEC_REFINE_BY_MULTI_YEAR}   No   ${SPH/SEC_MULTI_YEAR_VALUE}
    [Teardown]  Run Keyword If Test Failed  Execute JavaScript  document.getElementById('${SPH/SEC_REFINE_BY_MULTI_YEAR}No_input').click()

TC_18 To Verify Refine By MultiYear 'Yes'
    SPH/SEC_SC_Navigate To Renewal Info Page

    UNI_Verify Refine By Sections In Renewal Info  ${SPH/SEC_REFINE_BY_MULTI_YEAR}   Yes   ${SPH/SEC_MULTI_YEAR_VALUE}
    [Teardown]  Run Keyword If Test Failed  Execute JavaScript  document.getElementById('${SPH/SEC_REFINE_BY_MULTI_YEAR}Yes_input').click()

TC_19 To Verify Refine By Coverage Year '2018'
    SPH/SEC_SC_Navigate To Renewal Info Page

    UNI_Verify Refine By Sections In Renewal Info  ${SPH/SEC_REFINE_BY_COV_YEAR}   2018   ${SPH/SEC_COV_YEAR_VALUE}
    [Teardown]  Run Keyword If Test Failed  Execute JavaScript  document.getElementById('${SPH/SEC_REFINE_BY_COV_YEAR}2018_input').click()

TC_20 To Verify Refine By Coverage Year '2017'
    SPH/SEC_SC_Navigate To Renewal Info Page

    UNI_Verify Refine By Sections In Renewal Info  ${SPH/SEC_REFINE_BY_COV_YEAR}   2017   ${SPH/SEC_COV_YEAR_VALUE}
    [Teardown]  Run Keyword If Test Failed  Execute JavaScript  document.getElementById('${SPH/SEC_REFINE_BY_COV_YEAR}2017').click()


