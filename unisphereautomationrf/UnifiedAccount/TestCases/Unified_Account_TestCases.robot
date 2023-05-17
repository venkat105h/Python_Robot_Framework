#-----------------------------------------------------------------------------------------------------------------------
#   Description       :      Test Cases for Unified Account
#   Project           :      UniSphere
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation     Verify Unified Account (UniSecure,UniTrace,UniSphere) Test cases
Resource          ../Resources/UFresource.robot
Library           BuiltIn
Library           SeleniumLibrary
Library           Collections
Library           String
Library           robot.libraries.DateTime
Library           OperatingSystem

Suite Setup       SOL_Open Browser with Solution Landing page
Suite Teardown    Close Browser
#-----------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
##############################UNITRACE##################################################################################
TC_01 Setup Security Policies in UniSecure
    [Documentation]  This test case is to setup Security Policies in UniSecure/UniSphere product
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...    ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Security Policies
    SPH/SEC_Select the Checkbox and Enter the values  # Enablin and disablin the Security policies keyword addition to the eac cehkbox


TC_02 Create UniTrace New User
    [Documentation]   This test case is to verify if UniTrace Administartor is able to create a new Unitrace user.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    COMMON_Declare Random variables for UniTrace User
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...    ${SOL_UNITRACE_LINK}    ${TRC_USERNAME_TXTBOX}
    TRC_Login with valid Credentials for UniTrace
    ...   ${UNITRACE_ADMINISTRATOR_USERNAME}   ${UNITRACE_ADMINISTRATOR_PASSWORD}
    TRC_Navigation Welcome Screen To Administration
    TRC_Navigation Users grid to add User
    TRC_Create New User   ${UNITRACE_username}    ${UNITRACE_password}    ${UNITRACE_email}    ${PW VALIDDAYS}
    TRC_Verify Successful Creation of User    ${UNITRACE_username}
    TRC_Logout
    TRC_Navigate Back to Login Screen
    TRC_New User Login with valid Credentials    ${UNITRACE_username}    ${UNITRACE_password}
    TRC_Verify New User's Terms of Service Screen
    TRC_Logout
    [Teardown]  Run Keyword If Test Failed  TRC_Logout


TC_03 Verify UniTrace new User is able to login to UniSecure product before UniSecure Administrator assigns roles.System should not allow user to login to UniSecure.
    [Documentation]   This test case is to verify if UniTrace new User is able to login to UniSecure product
     ...              before UniSecure Administrator assigns roles.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...  ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNITRACE_username}    ${UNITRACE_password}  ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Login Failed error message
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_04 Verify UniTrace new User is able to login to UniSphere product before UniSphere Administrator assigns roles.System should not allow user to login to UniSphere.
    [Documentation]   This test case is to verify if UniTrace new User is able to login to UniSphere product
    ...               before UniSecure Administrator assigns roles.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNITRACE_username}    ${UNITRACE_password}  ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Login Failed error message
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_05 Verify if UniSecure Administrator is able to view the newly created Unitrace user in UniSecure product.
    [Documentation]   This test case is to verify UniSecure Administrator is able to view the
    ...               newly created Unitrace user in UniSecure product.
    ...               Verify if UniSecure Administrator is able to view the
    ...               newly created Unitrace user in UniSecure product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
       ...    ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
    SPH/SEC_Click on About Popup
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
    SPH/SEC_Search the Users in UniSecure/UniSphere  ${UNITRACE_username}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_06 Verify if UniSecure Administrator is able to assign groups/roles for New UniTrace User.
    [Documentation]   This test case is to verify  UniSecure Administrator
     ...              is able to assign groups/roles for New UniTrace User.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
    SPH/SEC_Search the Users in UniSecure/UniSphere  ${UNITRACE_username}
    SPH/SEC_Enter First name, Last name and Email for UniTrace user   ${UNITRACE_email}
    SPH/SEC_Assign Roles to the User in UniSphere/UniSecure
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_07 Verify if New UniTrace user is able to log in to UniSecure after UniSecure Administrator assigned roles.
    [Documentation]   This test case is to verify New UniTrace user is able to log in to UniSecure
    ...              after UniSecure Administrator assigned roles.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...  ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...  ${UNITRACE_username}    ${UNITRACE_password}   ${UNISECURE_ADMINROLE_DROPDOWN}
    run keyword and ignore error    SPH/SEC_Enter Security Policies for new UniSecure/UniSphere user    #security questions are not always available
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_08 Verify if UniSphere Administrator is able to assign groups/roles for New UniTrace User.
    [Documentation]   This test case is to verify if UniSphere Administrator
    ...               is able to assign groups/roles for New UniTrace User.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere  Systech360
    SPH/SEC_Search the Users in UniSecure/UniSphere   ${UNITRACE_username}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_09 Verify if New UniTrace user is able to log in to UniSphere after UniSphere Administrator assigned roles.
    [Documentation]   This test case is to verify if  New UniTrace user is able to
    ...               log in to UniSphere after UniSphere Administrator assigned roles.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...      ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNITRACE_username}    ${UNITRACE_password}    ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_10 Delete the Unitrace User in UniSphere Product
    [Documentation]   This test case is to Delete the Users
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...  ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
    SPH/SEC_Search the users and delete       ${UNITRACE_username}
#-----------------------------------------------------------------------------------------------------------------------
#########################################UNISECURE/UNISPHERE#########################################################
#-----------------------------------------------------------------------------------------------------------------------
TC_11 Verify if UniSecure Administrator is able to create a new user from UniSecure.
    [Documentation]   This test case is to verify if UniSecure Administrator
     ...              is able to create a new user from UniSecure.
    COMMON_Declare Random variables for UniSecure Administrator
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISECURE_LINK}   ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Add User page in UniSecure/UniSphere   UniSecure
    SPH/SEC_Create New User details and Save   ${UNISECURE_username}   ${UNISECURE_password}   ${UNISECURE_email}
    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Verify successful creation of UniSecure/UniSphere user   UniSecure   ${UNISECURE_username}
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_12 Verify if UniSecure new user is able to enter security questions and answers
    [Documentation]   This test case is to verify if new user is able to enter security questions and answers
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_username}   ${UNISECURE_password}    ${UNISECURE_ADMINROLE_DROPDOWN}
    run keyword and ignore error    SPH/SEC_Enter Security Policies for new UniSecure/UniSphere user    #security questions are not always available
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_13 Verify UniSecure new User is able to login to UniTrace product before UniTrace Administrator assign roles
    [Documentation]   This test case is to verify if new User is able to login to UniTrace product
    ...               before UniTrace Administrator assign roles
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...  ${SOL_UNITRACE_LINK}  ${TRC_USERNAME_TXTBOX}
    TRC_Login with valid Credentials for UniTrace   ${UNISECURE_username}  ${UNISECURE_password}
    TRC_Check user is logged in to dashboard
    TRC_Logout
    [Teardown]  Run Keyword If Test Failed  TRC_Logout


TC_14 Verify if UniTrace Administrator is able to assign the newly created UniSecure user in UniTrace product.
    [Documentation]   This test case is to verify if UniTrace Administrator is able to assign
    ...               the newly created UniSecure user in UniTrace product.
      [Tags]    TC_02
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...    ${SOL_UNITRACE_LINK}  ${TRC_USERNAME_TXTBOX}
    TRC_Login with valid Credentials for UniTrace  ${UNITRACE_ADMINISTRATOR_USERNAME}  ${UNITRACE_ADMINISTRATOR_PASSWORD}
    TRC_Navigation Welcome Screen To Administration
    TRC_Navigation Administration to Users grid
    TRC_Search the Users in UniTrace   ${UNISECURE_username}
    TRC_Assign Roles to the User in UniTrace    ${UNISECURE_username}
    TRC_Logout
    [Teardown]  Run Keyword If Test Failed  TRC_Logout


TC_15 Verify if New UniSecure user is able to log in to UniTrace.
    [Documentation]   This test case is to verify if New UniSecure user is able to log in to UniTrace.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...  ${SOL_UNITRACE_LINK}  ${TRC_USERNAME_TXTBOX}
    TRC_Login with valid Credentials for UniTrace    ${UNISECURE_username}  ${UNISECURE_password}
    TRC_Check user is logged in to dashboard
    TRC_Logout
    [Teardown]  Run Keyword If Test Failed  TRC_Logout


TC_16 Verify if New UniSecure user is able to log in to UniSphere product.
    [Documentation]   This test case is to verify if New UniSecure user is able to
    ...              log in to UniSphere product after UniSphere Administartor assign the roles.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNISECURE_username}    ${UNISECURE_password}    ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check user is logged in to UniSecure/Unisphere dashboard
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_17 Delete the UniSecure User in UniSphere product
    [Documentation]   This test case is to Delete the Users
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...    ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}     ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   Systech360
    SPH/SEC_Search the users and delete     ${UNISECURE_username}

##-----------------------------------------------------------------------------------------------------------------------
#####################################ADMINISTRATOR####################################################################
##-----------------------------------------------------------------------------------------------------------------------
TC_18 Verify if UniSphere Administrator is able to create a new user for UniSphere.
    [Documentation]   This test case is to verify if UniSphere Administrator is able to create a new user for UniSphere.
    COMMON_Declare Random variables for UniSphere Administrator
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}    ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Add User page in UniSecure/UniSphere   Systech360
    SPH/SEC_Create New User details and Save   ${UNISPHERE_username}    ${UNISPHERE_password}    ${UNISPHERE_email}
    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}    ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Verify successful creation of UniSecure/UniSphere user   Systech360    ${UNISPHERE_username}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_19 Verify if UniSphere new user is able to enter security questions and answers
    [Documentation]   This test case is to verify if new user is able to enter security questions and answers
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNISPHERE_username}   ${UNISPHERE_password}    ${UNISECURE_ADMINROLE_DROPDOWN}
    run keyword and ignore error    SPH/SEC_Enter Security Policies for new UniSecure/UniSphere user    #security questions are not always available
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_20 Verify UniSphere new User is able to login to UniTrace product before UniTrace Administrator assign roles
    [Documentation]   This test case is to verify if UniSphere new User is able to login to
    ...               UniTrace product before UniTrace Administrator assign roles
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...    ${SOL_UNITRACE_LINK}  ${TRC_USERNAME_TXTBOX}
    TRC_Login with valid Credentials for UniTrace     ${UNISPHERE_username}  ${UNISPHERE_password}
    TRC_Check user is logged in to dashboard
    TRC_Logout
    [Teardown]  Run Keyword If Test Failed  TRC_Logout


TC_21 Verify UniSphere new User is able to login to UniSecure product before UniSecure Administrator assigns roles.
    [Documentation]   This test case is to verify if new User is able to login to
    ...               UniSecure product before UniSecure Administrator assigns roles.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...            ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...       ${UNISPHERE_username}   ${UNISPHERE_password}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check user is logged in to UniSecure/Unisphere dashboard
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_22 Verify if UniTrace Administrator is able to assign the newly created UniSphere user in UniTrace product.
    [Documentation]   This test case is to verify if UniTrace Administrator is able to
    ...               assign the newly created UniSphere user in UniTrace product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...    ${SOL_UNITRACE_LINK}  ${TRC_USERNAME_TXTBOX}
    TRC_Login with valid Credentials for UniTrace  ${UNITRACE_ADMINISTRATOR_USERNAME}  ${UNITRACE_ADMINISTRATOR_PASSWORD}
    TRC_Navigation Welcome Screen To Administration
    TRC_Navigation Administration to Users grid
    TRC_Search the Users in UniTrace   ${UNISPHERE_username}
    TRC_Assign Roles to the User in UniTrace    ${UNISPHERE_username}
    TRC_Logout
    [Teardown]  Run Keyword If Test Failed  TRC_Logout


TC_23 Verify if New UniSphere user is able to log in to UniTrace.
    [Documentation]   This test case is to verify if New UniSphere user is able to log in to UniTrace.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...   ${SOL_UNITRACE_LINK}  ${TRC_USERNAME_TXTBOX}
    TRC_Login with valid Credentials for UniTrace   ${UNISPHERE_username}  ${UNISPHERE_password}
    TRC_Check user is logged in to dashboard
    TRC_Logout
    [Teardown]  Run Keyword If Test Failed  TRC_Logout


TC_24 Verify if New UniSphere user is able to log in to UniSecure product after UniSecure Administartor assign the roles.
    [Documentation]   This test case is to verify if New UniSphere user is able to log in to
    ...                UniSecure product after UniSecure Administartor assign the roles.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...     ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...         ${UNISPHERE_username}  ${UNISPHERE_password}    ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check user is logged in to UniSecure/Unisphere dashboard
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_25 Verify if UniSphere Administrator is able to view the UniSecure and UniTrace products at the top banner.
    [Documentation]   This test case is to verify if UniSphere Administrator is able to view the
    ...               UniSecure and UniTrace products at the top banner.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...     ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    Wait Until Page Contains Element  ${UNISPHERE_USERGROUP_CARD}
    Page Should Contain Element   ${UNISPHERE_UNITRACETOP_ID}
    Page Should Contain Element  ${UNISPHERE_UNISECURE_TOPBANNER}
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_26 Verify if UniSphere Administrator is able to navigate to UniSecure Administrator page.
    [Documentation]   This test case is to verify if UniSphere Administrator is able to
    ...               navigate to UniSecure Administrator page.
    SPH/SEC_Click on Top Banner Navigation links   ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...     ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_PRODUCTCARD_ID}


TC_27 Verify if UniSecure Administrator is able to navigate back to UniSphere Administrator page.
    [Documentation]   This test case is to verify if UniSecure Administrator is able to
    ...               navigate back to UniSphere Administrator page.
    SPH/SEC_Click on Top Banner Navigation links   ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...     ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_USERGROUP_CARD}


TC_28 Verify if UniSphere Administrator is able to navigate to UniSecure Designer page.
    [Documentation]   This test case is to verify if UniSphere Administrator
    ...               is able to navigate to UniSecure Designer page.
    SPH/SEC_Click on Top Banner Navigation links   ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERDESIGNER_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...       ${UNISPHERE_UNISECURE_TOPBANNER}   ${UNISECURE_DESIGNERFAMILY_ICON}


TC_29 Verify if UniSecure Designer is able to navigate back to UniSphere Administrator page.
    [Documentation]   This test case is to verify if UniSecure Designer
     ...             is able to navigate back to UniSphere Administrator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...        ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_USERGROUP_CARD}


TC_30 Verify if UniSphere Administrator is able to navigate to UniSecure Operator page.
    [Documentation]   This test case is to verify if UniSphere Administrator
    ...              is able to navigate to UniSecure Operator page.
    SPH/SEC_Click on Top Banner Navigation links   ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNEROPERATOR_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...      ${UNISPHERE_UNISECURE_TOPBANNER}   ${UNISECURE_OPERATORACTION_ICON}


TC_31 Verify if UniSecure Operator is able to navigate back to UniSphere Administrator page.
    [Documentation]   This test case is to verify if UniSecure Operator
     ...             is able to navigate back to UniSphere Administrator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...     ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_USERGROUP_CARD}

# NO Bussiness owner role anymore
#Verify if UniSphere Administrator is able to navigate to UniSecure Business owner page.
#    [Documentation]   This test case is to verify if UniSphere Administrator
#     ...              is able to navigate to UniSecure Business owner page.
#    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERBO_ID}
#    SPH/SEC_Check user is navigated to the respective page
#    ...           ${UNISPHERE_UNISECURE_TOPBANNER}   ${UNISECURE_BOREPORT_CARD}


TC_32 Verify if UniSecure Business Owner is able to navigate back to UniSphere Administrator page.
    [Documentation]   This test case is to verify if UniSecure Business Owner
    ...               is able to navigate back to UniSphere Administrator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...            ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_USERGROUP_CARD}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_33 Verify if UniSecure Administrator is able to view the UniSphere and UniTrace products at the top banner.
    [Documentation]   This test case is to verify if UniSecure Administrator is able to view the UniSphere and UniTrace products at the top banner.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...          ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISECURE_ADMINISTRATOR_USERNAME}  ${UNISECURE_ADMINISTRATOR_PASSWORD}    ${UNISECURE_ADMINROLE_DROPDOWN}
    Wait Until Page Contains Element   ${UNISECURE_WELCOME_ID}
    Page Should Contain Element  ${UNISPHERE_UNITRACETOP_ID}
    Page Should Contain Element  ${UNISPHERE_UNISECURE_TOPBANNER}


TC_34 Verify if UniSecure Administrator is able to navigate to UniSphere Administrator page.
    [Documentation]   This test case is to verify if UniSecure Administrator
     ...              is able to navigate to UniSphere Administrator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...      ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_USERGROUP_CARD}


TC_35 Verify if UniSphere Administrator is able to navigate back to UniSecure Administrator page.
    [Documentation]   This test case is to verify if UniSphere Administrator
     ...              is able to navigate back to UniSecure Administrator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...        ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_PRODUCTCARD_ID}


TC_36 Verify if UniSecure Administrator is able to navigate to UniSphere Designer page.
    [Documentation]   This test case is to verify if UniSecure Administrator
     ...              is able to navigate to UniSphere Designer page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERDESIGNER_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...        ${UNISPHERE_UNISECURE_TOPBANNER}   ${UNISPHERE_DESIGNERSCENE_ID}


TC_37 Verify if UniSphere Designer is able to navigate back to UniSecure Administrator page.
    [Documentation]   This test case is to verify if UniSphere Designer
     ...              is able to navigate back to UniSecure Administrator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...           ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_PRODUCTCARD_ID}


TC_38 Verify if UniSecure Administrator is able to navigate to UniSphere Operator page.
    [Documentation]   This test case is to verify if UniSecure Administrator
     ...             is able to navigate to UniSphere Operator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNEROPERATOR_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...         ${UNISPHERE_UNISECURE_TOPBANNER}   preferenceCardName_0


TC_39 Verify if UniSphere Operator is able to navigate back to UniSecure Administrator page.
    [Documentation]   This test case is to verify if UniSphere Operator
     ...              is able to navigate back to UniSecure Administrator page.
    SPH/SEC_Click on Top Banner Navigation links  ${UNISPHERE_UNISECURE_TOPBANNER}  ${UNISPHERE_TOPBANNERADMIN_ID}
    SPH/SEC_Check user is navigated to the respective page
    ...     ${UNISPHERE_UNISECURE_TOPBANNER}    ${UNISPHERE_PRODUCTCARD_ID}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere
#-----------------------------------------------------------------------------------------------------------------------
############################################UniSphereDesigner###########################################################
#-----------------------------------------------------------------------------------------------------------------------
TC_40 Verify if UniSphere Administrator is able to create a new user for UniSphere Designer.
    [Documentation]   This test case is to verify if UniSphere Administrator
     ...              is able to create a new user for UniSphere Designer.
    COMMON_Declare Random variables for UniSphere Designer
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...          ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}  ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere    Systech360
    COMMON_Scroll to bottom of the page
    SPH/SEC_Create Group   ${Designer_GroupName}  ${Designer_GroupDescription}  ${UNISECURE_DESIGNER_ROLE}
    wait until keyword succeeds    3x    0.5s    SPH/SEC_Navigate to Add User page in UniSecure/UniSphere   Systech360
    COMMON_Scroll to bottom of the page
    SPH/SEC_Create UniSecure with New group, User details and Save
    ...     ${UNISPHERE_Designer_username}   ${UNISPHERE_Designer_password}
    ...     ${UNISPHERE_Designer_email}  ${Designer_GroupName}  ${Designer}
    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...      ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}  ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Verify successful creation of UniSecure/UniSphere user   Systech360   ${UNISPHERE_Designer_username}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_41 Verify if UniSphere Designer new user is able to enter security questions and answers
    [Documentation]   This test case is to verify if new user is able to enter security questions and answers
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...      ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...      ${UNISPHERE_Designer_username}   ${UNISPHERE_Designer_password}   ${UNISECURE_DESIGNERROLEDROPDOWN}
    run keyword and ignore error    SPH/SEC_Enter Security Policies for new UniSecure/UniSphere user    #security questions are not always available
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_42 Verify if UniSphere Designer is able to view the UniSecure and UniTrace products at the top banner.
    [Documentation]   This test case is to verify if UniSphere Designer
    ...               is able to view the UniSecure and UniTrace products at the top banner.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...          ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...            ${UNISPHERE_Designer_username}    ${UNISPHERE_Designer_password}  ${UNISECURE_DESIGNERROLEDROPDOWN}
    SPH/SEC_Check UniTrace and UniSecure link at the top banner


TC_43 Delete the UniSphere Designer User in UniSecure Product
    [Documentation]   This test case is to Delete the Users
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...      ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere    UniSecure
    SPH/SEC_Search the users and delete      ${UNISPHERE_Designer_username}

#-----------------------------------------------------------------------------------------------------------------------
##########################################UniSphere Operator###########################################################
#-----------------------------------------------------------------------------------------------------------------------
TC_44 Verify if UniSphere Administrator is able to create a new user for UniSphere Operator.
    [Documentation]   This test case is to verify if UniSphere Administrator
     ...              is able to create a new user for UniSphere Operator.
    COMMON_Declare Random variables for UniSphere Operator
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...       ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere    Systech360
    SPH/SEC_Create Group    ${Operator_GroupName}  ${Operator_GroupDescription}  ${UNISECURE_OPERATOR_ROLE}
    wait until keyword succeeds    3x    0.5s    SPH/SEC_Navigate to Add User page in UniSecure/UniSphere   Systech360
    SPH/SEC_Create UniSecure with New group, User details and Save
    ...      ${UNISPHERE_Operator_username}   ${UNISPHERE_Operator_password}
    ...      ${UNISPHERE_Operator_email}   ${Operator_GroupName}   ${Operator}
    SPH/SEC_Logout from UniSecure/UniSphere
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    Wait Until Page Contains Element  ${UNISPHERE_USERGROUP_CARD}
    SPH/SEC_Verify successful creation of UniSecure/UniSphere user   Systech360   ${UNISPHERE_Operator_username}
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_45 Verify if Unisphere Operator new user is able to enter security questions and answers
    [Documentation]   This test case is to verify if new user is able to enter security questions and answers
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...      ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...        ${UNISPHERE_Operator_username}   ${UNISPHERE_Operator_password}  ${UNISECURE_OPERATORROLEDROPDOWN}
    run keyword and ignore error    SPH/SEC_Enter Security Policies for new UniSecure/UniSphere user    #security questions are not always available
    SPH/SEC_Logout from UniSecure/UniSphere
    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere


TC_46 Verify if UniSphere Operator is able to view the UniSecure and UniTrace products at the top banner.
    [Documentation]   This test case is to verify if UniSphere Operator
    ...              is able to view the UniSecure and UniTrace products at the top banner.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...      ${SOL_UNISPHERE_LINK}  ${UNISPHERE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...       ${UNISPHERE_Operator_username}    ${UNISPHERE_Operator_password}  ${UNISECURE_OPERATORROLEDROPDOWN}
    Wait Until Page Contains Element  ${UNISPHERE_WELCOME_ID}
    Page Should Contain Element  ${UNISPHERE_UNITRACETOP_ID}
    Page Should Contain Element  ${UNISPHERE_UNISECURE_TOPBANNER}


TC_47 Delete the UniSphere Operator User in UniSecure Product
    [Documentation]   This test case is to Delete the Users
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...        ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere    UniSecure
    SPH/SEC_Search the users and delete      ${UNISPHERE_Operator_username}

###  NO Bussiness owner role anymore
#-----------------------------------------------------------------------------------------------------------------------
##########################UNISECURE BUSINESSOWNER######################################################################
#-----------------------------------------------------------------------------------------------------------------------
#Verify if UniSecure Administrator is able to create a new user from UniSecure BusinessOwner.
#    [Documentation]   This test case is to verify if UniSecure Administrator
#     ...              is able to create a new user from UniSecure BusinessOwner.
#    COMMON_Declare Random variables for Business Owner
#    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
#    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
#    ...         ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
#    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
#    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
#    SPH/SEC_Create Group   ${BO_GroupName}  ${BO_GroupDescription}   ${UNISECURE_BO_ROLE}
#    SPH/SEC_Navigate to Add User page in UniSecure/UniSphere   UniSecure
#    SPH/SEC_Create UniSecure with New group, User details and Save
#    ...   ${UNISECURE_BO_username}   ${UNISECURE_BO_password}   ${UNISECURE_BO_email}
#    ...   ${BO_GroupName}  ${BusinessOwner}
#    SPH/SEC_Logout from UniSecure/UniSphere
#    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
#    Wait Until Page Contains Element  ${UNISPHERE_PRODUCTCARD_ID}
#    SPH/SEC_Verify successful creation of UniSecure/UniSphere user   UniSecure   ${UNISECURE_BO_username}
#    SPH/SEC_Logout from UniSecure/UniSphere
#    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere
#
#Verify if UniSecure Business Owner new user is able to enter security questions and answers
#    [Documentation]   This test case is to verify if new user is able to enter security questions and answers
#    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
#    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
#    ...   ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
#    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...     ${UNISECURE_BO_username}   ${UNISECURE_BO_password}  ${UNISECURE_BOROLEDROPDOWN}
#    SPH/SEC_Enter Security Policies for new UniSecure/UniSphere user
#    SPH/SEC_Logout from UniSecure/UniSphere
#    [Teardown]  Run Keyword If Test Failed  SPH/SEC_Logout from UniSecure/UniSphere
#
#Verify if UniSecure Business Owner is able to view the UniSphere and UniTrace products at the top banner.
#    [Documentation]   This test case is to verify if UniSecure Business Owner is
#    ...               able to view the UniSphere and UniTrace products at the top banner.
#    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
#    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
#    ...         ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
#    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...      ${UNISECURE_BO_username}   ${UNISECURE_BO_password}   ${UNISECURE_BOROLEDROPDOWN}
#    Wait Until Page Contains Element  ${UNISECURE_WELCOME_ID}
#    Page Should Contain Element  ${UNISPHERE_UNITRACETOP_ID}
#    Page Should Contain Element  ${UNISPHERE_UNISECURE_TOPBANNER}
#
#Verify if UniSecure Business Owner is able to view the Header navigation for UniSPhere dropdown.
#    [Documentation]   This test case is to verify if  UniSecure Business Owner
#    ...               is able to view the Header navigation for UniSPhere dropdown.
#    Page should not contain Element   ${UNISPHERE_TOPBANNERADMIN_ID}
#    Page should not contain Element   ${UNISPHERE_TOPBANNERDESIGNER_ID}
#    Page should not contain Element   ${UNISPHERE_TOPBANNEROPERATOR_ID}
#    Page should not contain Element   ${UNISPHERE_TOPBANNERBO_ID}
#
#Delete the UniSecure Business Owner User in UniSecure Product
#    [Documentation]   This test case is to Delete the Users
#    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
#    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
#    ...      ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
#    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
#    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
#    SPH/SEC_Search the users and delete      ${UNISECURE_BO_username}
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------

DTD Delete the Groups in UniSphere
    [Documentation]   This test case is to Delete the Group in UniSphere
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...  ${SOL_UNISPHERE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   Systech360
    COMMON_Scroll to bottom of the page
    SPH/SEC_Delete the Group in UniSecure/UniSphere   UniGroup

### no groups in unisecure
#Delete the Groups in UniSecure
#    [Documentation]   This test case is to Delete the Group in UniSecure
#    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${LOGIN URL}
#    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
#    ...  ${SOL_UNISECURE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
#    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
#    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
#    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
#    COMMON_Scroll to bottom of the page
#    SPH/SEC_Delete the Group in UniSecure/UniSphere   UniGroup
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
