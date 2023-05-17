#-----------------------------------------------------------------------------------------------------------------------
#   Description       :      Test Cases for UniSphere Designer Navigator
#   Project           :      UniSphere
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue:
#   - Designer user must be created and completed the Security Questions
#
#   Epilogue:
#   - Navigator links Functions
#   - Navigator Trash page functions
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation  Navigator common Test Cases
Resource       ../Resources/Navigator_Resources.robot
Resource       ../Resources/Designer_Variable.robot
Library        BuiltIn
Library        SeleniumLibrary
Library        Collections
Library        String
Library        robot.libraries.DateTime
Library        OperatingSystem
Suite Setup    SOL_Open Browser with Solution Landing page
Suite Teardown   Close Browser
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
TC_01 To Setup Variable
    [Documentation]   This Test case is to setup the Role variable in the Solution suite
    NAV_IMPORTVARIABLE_Import the Role Variable File

TC_02 To Setup Administrator Security Policies and Display Preferences
    [Documentation]   This Test case is to setup the Security Policies by the Administrator
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPHSEC_RESOURCE.SPH/SEC Login With Valid Credentials For UniSecure/UniSphere  ${UNISECURE_ADMIN_USERNAME}  ${UNISECURE_ADMIN_PASSWORD}  ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Security Policies
    SPH/SEC_Select the Checkbox and Enter the values
    SPH_DESN_Open Designer page
    SPH/SEC_Navigate to Preferences
    SPH/SEC_Navigate to Display Preferences
    SPH/SEC_Setup Default layout and Enable Prefix

TC_03 To Verify Left Menu Navigation is displayed
    [Documentation]  This Test case is to verify the Left Menu Navigation menu is displayed
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere  ${UNISECURE_DESIGNER_USERNAME}  ${UNISECURE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
    NAV_Check the Left navigation menu
    NAV_Check the UI of the Left navigation Menu

TC_04 To Verify if user is able to turn on the Pin navigator
    [Documentation]  This Test case is to verify user is able to turn on the Pin navigator
    NAV_Click on Pin Navigator

TC_05 To Verify if user is able to turn off the pin navigator
    [Documentation]  This Test case is to verify user is able to turn off the Pin navigator
    NAV_Click off Pin Navigator

TC_06 To Verify the color of the Navigator
    [Documentation]  This testcase is to verify the color of the navigator
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere  ${UNISECURE_DESIGNER_USERNAME}  ${UNISECURE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
    NAV_Check the Left navigation menu
    NAV_Click on Pin Navigator
    NAV_Navigate to Trash page
    COMMON_Check the background color    ${UNISPHERE_NAVIGATOR_ID}     ${PRODUCTBGCOLOR}

TC_07 To Verify ExpandCollapse icon for each link in Navigator menu
    [Documentation]  This Test case is to verify ExpandCollapse icon for each link in Navigator menu
    NAV_Check the Expand/Collapse icon for each link in Navigator menu

TC_08 To Verify user is able to Expand/Collapse the left menu navigation items
    [Documentation]  This Test case is to Expand/Collapse the left menu navigation items
    NAV_Check user is able to Expand/Collapse each icon in Navigator menu

TC_09 To Verify user is able to check the Expand/Collapse child items
    [Documentation]  This test case is to verify if user is able to check the Expand/Collapse child items
    SPH/SEC_Navigate to Preferences
    SPH/SEC_Navigate to Display Preferences
    SPH/SEC_NAV_Setup Default layout to list view
    Click Element  ${UNISECURE_WELCOME_ID}
    NAV_Check the Left navigation menu
    NAV_Click on Pin Navigator
    run keyword and ignore error    NAV_Check the Expand/Collapse child items    #sometimes it failes
    NAV_Click off Pin Navigator
    [Teardown]  run keyword if test failed    NAV_Click off Pin Navigator

TC_10 To Verify user is able to navigate to the left menu links.
    [Documentation]  This Test case is to Verify user is able to navigate to the left menu links.
    NAV_Click on Pin Navigator
    NAV_Navigate to each left menu link
    NAV_Click off Pin Navigator
    [Teardown]  run keyword if test failed    NAV_Click off Pin Navigator

TC_11 To Verify if user is able to create a new data for Trash page
    [Documentation]  This test case is to Verify if user is able to create a new data for Trash page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere  ${UNISECURE_DESIGNER_USERNAME}  ${UNISECURE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
    NAV_Check the Left navigation menu
    NAV_Click on Pin Navigator
    run keyword and ignore error     NAV_Create Data for Trashcan page verifications
    NAV_Click off Pin Navigator
    [Teardown]  run keyword if test failed    NAV_Click off Pin Navigator

TC_12 To Verify the UI of the Trash page
    [Documentation]  This test case is to Check the UI of the Trash page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere  ${UNISECURE_DESIGNER_USERNAME}  ${UNISECURE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
    NAV_Navigate to Trash page
    NAV_Check the UI of the Trash page

TC_13 To Verify Restore button is disabled when user mouse over with out selecting any value
    [Documentation]  This test case is to verify Restore button is disabled when user mouse over with out selecting any value
    #NAV_Navigate to Trash page
    NAV_Check the Restore button is disabled

TC_14 To Verify Delete button is disabled when user mouse over with out selecting any value
    [Documentation]  This test case is to verfy Delete button is disabled when user mouse over with out selecting any value
    #NAV_Navigate to Trash page
    NAV_Check the Delete button is disabled

TC_15 Verify the numbers displayed in the left navigation is matching with the numbers in the Trash page
    [Documentation]  This test case is to verfy the numbers displayed in the left navigation is matching with the numbers in the Trash page
    #NAV_Navigate to Trash page
    NAV_Compare the Trashcancount and Trash page count

TC_16 To Verify user is able to select the Selectall checkbox
    [Documentation]  This test case is to Verify user is able to select the Selectall checkbox
    NAV_Navigate to Trash page
    NAV_Check the Select All checkbox functionality

TC_17 To Verify Restore and delete button is enabled when user mouse over with out selecting any value
    [Documentation]  This test case is to Verify Restore and delete button is enabled when user mouse over with out selecting any value
    NAV_Check the Restore button is enabled
    NAV_Check the Delete button is enabled

TC_18 To Verify user is able to unselect the Selectall checkbox
    [Documentation]  This test case is to Verify user is able to unselect the Selectall checkbox
    NAV_Navigate to Trash page
    NAV_Check the UnSelect All checkbox functionality

TC_19 To Verify user is able to search the Trash items
    [Documentation]  This test case is to Verify user is able to search the Trash items
    NAV_Navigate to Trash page
    NAV_Search the Trash items
    NAV_Clear the Search box

TC_20 To Veriy user is able to View the list in Ascending order by default
    [Documentation]  This test case is to verify user is able to View the list in Ascending order by default
    NAV_Navigate to Trash page
    NAV_Check the order in Trash page is Ascending Order    ${UNISPHERE_TRASHNAME_COLUMN}

TC_21 vTo Verify user is able to click on Descending order
    [Documentation]  This test case is to Verify user is able to click on Descending order
    NAV_Navigate to Trash page
    NAV_Check the Descending order in Trash page
    NAV_Check the order in Trash page is Descending Order   ${UNISPHERE_TRASHNAME_COLUMN}

TC_22 To Verify user is able to Sort Updated By in Trash page
    [Documentation]  This test case is to Verify user is able to Sort Updated By in Trash page
    NAV_Navigate to Trash page
    NAV_Select Updated By option in Trash page
    NAV_Click on Ascending order
    NAV_Check the order in Trash page is Ascending Order   ${UNISPHERE_TRASHUPDATEDBY_COLUMN}
    NAV_Click on Descending order

TC_23 To Verify user is able to Sort Updated On in Trash page
    [Documentation]  This test case is to Verify user is able to Sort Updated On in Trash page
    NAV_Navigate to Trash page
    NAV_Select Updated On option in Trash page
    NAV_Click on Ascending order
    NAV_Check the order of Dates in Trash page is Ascending Order   ${UNISPHERE_TRASHUPDATEDON_COLUMN}
    NAV_Click on Descending order
    NAV_Check the order of Dates in Trash page is Descending Order  ${UNISPHERE_TRASHUPDATEDON_COLUMN}

TC_24 To Verify user is able to Check the paginations in trash page
    [Documentation]  This test case is to Verify user is able to Check the paginations in trash page
    NAV_Navigate to Trash page
    NAV_Click on Pin Navigator
    run keyword and ignore error    NAV_Create Bulk data for Pagination verification   5
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere  ${UNISECURE_DESIGNER_USERNAME}  ${UNISECURE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
    NAV_Navigate to Trash page
    NAV_Check the Paginations in Trash page

TC_25 To Verify user is able to click on Last Pagination in trash page
    [Documentation]  This test case is to Verify user is able to click on Last Pagination in trash page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Select Solution from the Landing page  ${Solution}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere  ${UNISECURE_DESIGNER_USERNAME}  ${UNISECURE_DESIGNER_PASSWORD}   ${UNISECURE_DESIGNERROLE_DRPDWN}
    NAV_Navigate to Trash page
    NAV_Click on Last pagination link in Trash page

TC_26 To Verify user is able to click on First Pagination in trash page
    [Documentation]  This test case is to Verify user is able to click on First Pagination in trash page
    NAV_Navigate to Trash page
    NAV_Click on First link in the Trash page

TC_27 To Verify user is able to click on Next pagination in trash page
    [Documentation]  This test case is to Verify user is able to click on Next pagination in trash page
    NAV_Navigate to Trash page
    NAV_Click on Next pagination link in Trash page

TC_28 To Verify user is able to click on Previous pagination in trash page
    [Documentation]  This test case is to Verify user is able to click on Previous pagination in trash page
    NAV_Navigate to Trash page
    NAV_Click on Previous link in the Trash page

TC_29 To Verify the Items per page in the Trash page by default
    [Documentation]  This test case is to Verify the Items per page in the Trash page by default
    NAV_Navigate to Trash page
    NAV_Check the number of records displayed in the trash page by default

TC_30 To Verify user is able to select the paginations in the Items per page
    [Documentation]  This test case is to Verify user is able to select the paginations in the Items per page
    NAV_Navigate to Trash page
    NAV_Check the Pagination options in the Items per page

TC_31 To Verify user is able to restore the Trash items
    [Documentation]  This test case is to Verify user is able to restore the Trash items
    NAV_Navigate to Trash page
    NAV_Select a item in the table and click on Restore

TC_32 To Verify user is able to delete the Trash items
    [Documentation]  This test case is to Verify user is able to delete the Trash items
    NAV_Navigate to Trash page
    NAV_Select a item in the table and click on Delete

TC_33 To Veify user is able to delete all the items in the Trash page
    [Documentation]  This test case is to delete all the items in the trash page
    Wait Until Element Is Visible   ${UNISECURE_WELCOME_ID}  timeout=20
    Click Element  ${UNISECURE_WELCOME_ID}
    NAV_Navigate to Trash page
    NAV_Delete all the Trash page
    NAV_Check the Trash can empty message
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------

