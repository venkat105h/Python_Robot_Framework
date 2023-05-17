#------------------------------------------------------------------
#   Description     :      TestSuite for UniSphere Info Center, from where all the test cases are executed.
#   Project         :      UniSphere Information Center Automation
#   Author          :      Dinesh Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation   Necessary Libraries and Resources file are mentioned below

Library      BuiltIn
Variables    ..${/}Variables${/}${TESTENV}_Variable.py
Library      SeleniumLibrary    timeout=${Selenium_Timeout}
#Library      SeleniumLibrary    timeout=${Selenium_Timeout}    run_on_failure=Nothing
Resource     ../Keywords/Generic_Keywords.robot
Resource     ../Keywords/UniCloud_Upload_Delete_Artifacts.robot
Resource     ../Keywords/Information_Center_Keywords.robot
Resource     ../Keywords/UniCloud_Keywords.robot
Resource     ../Locators/Info_Center_Locators.robot
Resource     ../Locators/Generic_Locators.robot

Suite Teardown  Close Browser

*** Test Cases ***

TC_01 To Verify Cascading Menu Of Info Center
    [Documentation]      This is to Verify cascading menu of Info Center in Hamburger menu
    [Tags]    TC01
    SPH/SEC_Open Browser And Enter URL  ${UniSphere_URL}  ${SPH/SEC_USERNAME_TXT}  ${UniSphere_Username}
    ...  ${SPH/SEC_PASSWORD_TXT}  ${UniSphere_Password}  ${SPH/SEC_LOGIN_BTN}  ${SPH/SEC_WELCOME_PAGE}

    SPH/SEC_IC_Verify Cascading menu of Info center


TC_02 To Verify Clicking on Info center
    [Documentation]      This is to Verify clicking on Info Center in Hamburger menu
    [Tags]    TC02
    SPH/SEC_IC_Verify 3 Tabs Displayed After Clicking on Info center


TC_03 Verify Cascading Menu And Enabled Cards in General Tab
    [Documentation]      This is to Verify cascading menu of General is disabled when card is disabled
    SPH/SEC_IC_Verify Cascading Menu And Enabled Cards     ${SPH/SEC_GENERAL_TXT}   ${SPH/SEC_CASCADING_MENU_GEN}


TC_04 Verify Cascading Menu And Enabled Cards in Product Tab
    [Documentation]      This is to Verify cascading menu of Product is disabled when card is disabled
    SPH/SEC_IC_Verify Cascading Menu And Enabled Cards     ${SPH/SEC_PRODUCT_TXT}   ${SPH/SEC_CASCADING_MENU_PRO}


TC_05 Verify Cascading Menu And Enabled Cards in SystechGAMP Tab
    [Documentation]      This is to Verify cascading menu of Systech GAMP is disabled when card is disabled
    SPH/SEC_IC_Verify Cascading Menu And Enabled Cards     ${SPH/SEC_GAMP_TXT}      ${SPH/SEC_CASCADING_MENU_SYS}


TC_06 To Verify UI General Tab
    [Documentation]      This is to Verify UI of General Tab in Info Center
     ...  Takes the address of General tab as an argument to click on General tab
     SPH/SEC_IC_Verify When Tab Is Clicked The Respective Tab Is Activated  ${SPH/SEC_GENERAL_TAB}


TC_07 To Verify UI Products Tab
    [Documentation]      This is to Verify UI of Products Tab in Info Center
    ...  Takes the address of Product tab as an argument to click on General tab
     SPH/SEC_IC_Verify When Tab Is Clicked The Respective Tab Is Activated  ${SPH/SEC_PRODUCT_TAB}


TC_08 To Verify UI Systech GAMP Tab
    [Documentation]      This is to Verify UI of Systech GAMP Tab in Info Center
    ...  Takes the address of Systech GAMP tab as an argument to click on General tab
     SPH/SEC_IC_Verify When Tab Is Clicked The Respective Tab Is Activated  ${SPH/SEC_GAMP_TAB}


TC_09 To Verify Breadcrumbs
    [Documentation]      This is to Verify breadcrumbs
    ...  Takes Card name as an argument

    # Clicks on product tab
    Click Element              ${SPH/SEC_PRODUCT_TAB}
    SPH/SEC_Wait For Element       ${SPH/SEC_CARDS}
    SPH/SEC_IC_Verify Breadcrumbs  ${SPH/SEC_RELEASE_NOTES_CARD}


TC_10 To Verify Searching an Artifact
    [Documentation]      This is to Verify Searching an Artifact in Search bar provided
    ...  Takes the name of the arifact to be searched for as an argument
     SPH/SEC_IC_Verify Searching an Artifact  ${Artifact_Name}


TC_11 To Verify Clicking on First Artifact
    [Documentation]      This is to Verify Clicking on First Artifact present and viewing it.
    SPH/SEC_IC_Verify Clicking on First Artifact


TC_12 To Verify Adding a Comment
    [Documentation]      This is to Verify adding a comment to Artifact
    SPH/SEC_IC_Verify Adding a Comment


TC_13 To Verify Sorting By Likes Ascending Order
    [Documentation]      This is to Verify sorting funtionality using Likes
    SPH/SEC_IC_Verify Sorting By Likes Ascending Order


TC_14 To Verify Sorting By Views Descending Order
    [Documentation]      This is to Verify sorting funtionality using Views
    SPH/SEC_IC_Verify Sorting By Views Descending Order


TC_15 To Verify Sorting By Published Descending Order
    [Documentation]      This is to Verify sorting funtionality using Published Date
    SPH/SEC_IC_Verify Sorting By Published Descending Order


TC_16 To Verify Refine By Solution
    [Documentation]      This is to Verify refine by Solution
    ...  Takes the address of Refine by Solution with the solution name as an argument to check the checkbox
    SPH/SEC_Verify Refine By Section  ${SPH/SEC_REFINE_SOLUTION}   ${Solution_Name}


TC_17 To Verify Refine By Version
    [Documentation]      This is to Verify refine by Version
    ...  Takes the address of Refine by Version with the version name as an argument to check the checkbox
    SPH/SEC_Verify Refine By Section  ${SPH/SEC_REFINE_VERSION}   ${Version_name}


TC_18 To Verify Refine By Language
    [Documentation]      This is to Verify refine by Language
    ...  Takes the address of Refine by Language with the language name as an argument to check the checkbox
    SPH/SEC_Verify Refine By Section  ${SPH/SEC_REFINE_LANGUAGE}  ${Language_Name}


TC_19 To Verify Refine By Topics
    [Documentation]      This is to Verify refine by Topics
    ...  Takes the address of Refine by Topic with the topic name as an argument to check the checkbox
    SPH/SEC_Verify Refine By Section  ${SPH/SEC_REFINE_TOPIC}   ${Topic}


TC_20 To Verify Records Per Page In Information Center
    SPH/SEC_IC_Records Per Page In Information Center


TC_21 To Verify Documents in All Enabled Cards
    [Documentation]      This is to navigate through all the cards
    SPH/SEC_IC_Verify Documents in All Enabled Cards
    Close All Browsers

#
#TC_22 Delete Artifact In UniCloud And Verify In UniSphere/UniSecure
#    [Documentation]  Verifies if artifacts deleted in UniCloud is not visible in UniSphere/UniSecure
#	[Tags]  Systech360Only    TC22
#
##    Opens browser and navigate to URL
#    SPH/SEC_Open Browser And Enter URL  ${UniCloud_URL}  ${CLD_USERNAME_TXT}  ${UniCloud_Username}
#    ...  ${SPH/SEC_PASSWORD_TXT}  ${UniCloud_Password}  ${CLD_LOGIN_BTN}  ${CLD_WELCOMELINK_ELEMENT_ID}
#
#    # Deletes the artifact from Info center
#	log to console    Delete ${Artifact_Desc1}
#    Run Keyword And Continue On Failure  CLD_Delete Info Center Data  ${Artifact_Desc1}
#	log to console    Delete ${Artifact_Desc2}
#    Run Keyword And Continue On Failure  CLD_Delete Info Center Data  ${Artifact_Desc2}
#	log to console    Delete ${Artifact_Desc3}
#	Run Keyword And Continue On Failure  CLD_Delete Info Center Data  ${Artifact_Desc3}
#    Close All Browsers
#
#    # Opens browser and navigate to URL
#    SPH/SEC_Open Browser And Enter URL  ${UniSphere_URL}  ${SPH/SEC_USERNAME_TXT}  ${UniSphere_Username}
#    ...  ${SPH/SEC_PASSWORD_TXT}  ${UniSphere_Password}  ${SPH/SEC_LOGIN_BTN}  ${SPH/SEC_WELCOME_PAGE}
#
#    # Clears cache
#    Click Element   ${SPH/SEC_ABOUT_BTN}
#    Click Element   ${SPH/SEC_WELCOME_PAGE}
#
#    # Navigate to card
#    SPH/SEC_Navigate To Info Center
#    Click Element           ${SPH/SEC_PRODUCT_TAB}
#    SPH/SEC_Wait For Element    ${SPH/SEC_SOLUTION_SUMMARY_CARD}
#    Click Element           ${SPH/SEC_SOLUTION_SUMMARY_CARD}
#    SPH/SEC_Wait For Element    ${SPH/SEC_ITEMNAME}
#
#    # Verifies if deleted artifacts is present
#    ${Artifact1_Status}=  SPH/SEC_IC_Verify Searching an Artifact  ${Artifact_Desc1}
#	Run Keyword If  '${Artifact1_Status}'=='${TRUE}'   Fail
#	Close All Browsers
#
#
#TC_23 Upload Artifact In UniCloud And Verify In UniSphere/UniSecure
#    [Documentation]  Verifies if artifacts uploaded in UniCloud is visible in UniSphere/UniSecure
#
#	[Tags]  Systech360Only    TC23
#
#    # Opens browser and navigate to URL
#    SPH/SEC_Open Browser And Enter URL  ${UniCloud_URL}  ${CLD_USERNAME_TXT}  ${UniCloud_Username}
#    ...  ${SPH/SEC_PASSWORD_TXT}  ${UniCloud_Password}  ${CLD_LOGIN_BTN}  ${CLD_WELCOMELINK_ELEMENT_ID}
#    Set Selenium Speed  .3s
#    # Uploads the artifacts from the excel sheet
#	CLD_Add Info Center Data
#	Close All Browsers
#
#	log to console    Uploaded the artifacts from the excel sheet
#
#    # Opens browser and navigate to URL
#    SPH/SEC_Open Browser And Enter URL  ${UniSphere_URL}  ${SPH/SEC_USERNAME_TXT}  ${UniSphere_Username}
#    ...  ${SPH/SEC_PASSWORD_TXT}  ${UniSphere_Password}  ${SPH/SEC_LOGIN_BTN}  ${SPH/SEC_WELCOME_PAGE}
#
#    # Clears cache
#    Click Element   ${SPH/SEC_ABOUT_BTN}
#    wait until keyword succeeds  3x  2s  Click Element   ${SPH/SEC_WELCOME_PAGE}
#
#    # Verifies new Item indicator count
#    SPH/SEC_IC_Verify New Item Indicator Count  ${SPH/SEC_PRODUCT_TAB}   //*[@id="refine_Solutions_General"]/span  ${SPH/SEC_SOLUTION_SUMMARY_CARD}   ${Expected_Count_SPH}
#
#	log to console    Verified new Item indicator count
#
#    # Verifies searching uploaded artifacts in UniSphere
#    ${Artifact1_Status}=  SPH/SEC_IC_Verify Searching an Artifact  ${Artifact_Desc1}
#    ${Artifact2_Status}=  SPH/SEC_IC_Verify Searching an Artifact  ${Artifact_Desc2}
#    ${Artifact3_Status}=  SPH/SEC_IC_Verify Searching an Artifact  ${Artifact_Desc3}
#	Run Keyword If  '${Artifact1_Status}'!='${TRUE}'   Fail
# 	Run Keyword If  '${Artifact3_Status}'!='${TRUE}'   Fail
#	Run Keyword If  '${Artifact2_Status}'!='${FALSE}'   Fail
#
#    Close All Browsers
#
# todo why shows limited info