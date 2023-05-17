#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by other Robot scrits.
#	Project				:		UniSphere
#	Author				:		Satya R
#	© 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable

*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library          Collections
Library          Requests_Library.py
Library          String
Library          robot.libraries.DateTime
Library          BuiltIn
Library          SeleniumLibrary     timeout=30.0
Library          OperatingSystem

*** Keywords ***
########################################################################################################################
############################################   UNITRACE ################################################################

TRC_Login with valid Credentials for UniTrace
    [Documentation]     This keyword is to login to Unitrace product with two arguments username and password
    ...                 ${username} is used to provide the login username for UniTrace product
    ...                 ${password} is used to provide the login password for UniTrace product
    [Arguments]    ${username}  ${password}
    Input Text    ${TRC_USERNAME_TXTBOX}    ${username}
    Input Text    ${TRC_PASSWORD_TXTBOX}    ${password}
    Click Button    ${TRC_LOGIN_BTN}
    Wait Until Page Contains Element    ${TRC_LOGOUT_DRPDWN}    30s

Login with valid Credentials(UniSphere/UniSecure) for UniTrace
    [Documentation]     This keyword is to login to Unitrace product with two arguments username and password
    [Arguments]    ${username}  ${password}
    wait until keyword succeeds  15x  2s  Wait Until Page Contains Element   ${UNITRACEUSERNAMEID}
    Input Text    ${UNITRACEUSERNAMEID}    ${username}
    Input Text    ${UNITRACEPASSWORDID}    ${password}
    Click Button    ${UNITRACELOGINBTNID}

Login with valid Credentials for New UniTrace
    [Documentation]     This keyword is to login to Unitrace product with two arguments username and password
    [Arguments]    ${username}  ${password}
    Input Text    ${UNITRACEUSERNAMEID}    ${username}
    Input Text    ${UNITRACEPASSWORDID}    ${password}
    Click Button    ${UNITRACELOGINBTNID}
    TRC_Verify New User's Terms of Service Screen
    Wait Until Page Contains    ${UNITRACE_USERDASHBOARD}    30s

TRC_Navigation Welcome Screen To Administration
    [Documentation]     This keyword is to navigate to Administration page
    click button  ${TRC_ADMIN_TXT}
    Wait until page contains Element    ${TRC_ADMINSITE_ID}
    Title should be  ${TRC_ADMIN_TXT}

TRC_Check user is logged in to dashboard
    [Documentation]  This keyword is to check the user is logged in to dashboard
    Wait Until Page Contains Element   ${TRC_DASHBOARD_ROW}
    Page Should Contain Element  ${TRC_DASHBOARD_ROW}

Check the Login Failed Message
    [Documentation]  This keyword is to check the failed login message
    wait until keyword succeeds  5x  2s    Page Should Contain Element   ${UNITRACE_FAILEDLOGINMSG}

TRC_Navigation Users grid to add User
    [Documentation]     This keyword is to navigate from Users grid to ass user
    Wait Until Page Contains Element  ${TRC_ADDUSER_XPATH}
    click element  ${TRC_ADDUSER_XPATH}
    wait until page contains element   ${TRC_FORM_ID}

TRC_Create New User
    [Documentation]   This keyword is used to enter new user details and save
    ...               (Username, Password,Email, Firstname,Last name and group)
    ...               with four arguments with two arguments username password, email and password validity days.
    [Arguments]    ${username}    ${password}    ${email}    ${PW VALIDDAYS}
    Wait Until Page Contains Element  ${TRC_EDITUSERNAME_TXTBX}
    input text  ${TRC_EDITUSERNAME_TXTBX}  ${username}
    input text  ${TRC_EDITPASSWORD_TXTBX}  ${password}
    input text  ${TRC_EDITCNFPWD_TXTBX}  ${password}
    input text  ${TRC_EDITEMAIL_TXTBX}  ${email}
    input text  ${TRC_EDITVALIDDAYS_TXTBX}  ${PW VALIDDAYS}
    Click button  ${TRC_EDITSAVE_BTN}
    wait until page contains   ${TRC_SUCESSPART1_MSG} "${username}" ${TRC_SUCESSPART3_MSG}

TRC_Verify Successful Creation of User
    [Documentation]   This keyword is used to verify the created user is displayed in the Users with username argument.
    [Arguments]    ${username}
    Element Should Contain  ${TRC_USRSAVE_MSG}  ${username}
    Click Element  ${TRC_STAFF_ROLE}
    Click button  ${TRC_EDITSAVE_BTN}
    wait until page contains   ${TRC_SUCESSPART1_MSG} "${username}" ${TRC_SUCESSPART2_MSG}

TRC_Logout
    [Documentation]   This keyword is used to logut the User from UniTrace.
    wait until keyword succeeds  2x  2s     click element    ${TRC_LOGOUT_MENU}
    click link    ${TRC_LOGOUT_LINK}
    Wait until page contains    ${TRC_LOGGEDOUT_TEXT}

TRC_Navigate Back to Login Screen
    [Documentation]   This keyword is used to navigate from logged out screen to login screen for UniTrace.
    click image  ${TRC_SYSTECH_LOGO}

TRC_New User Login with valid Credentials
    [Documentation]   This keyword is used to login to UniTrace product with valid credentials with username and password arguments.
    [Arguments]    ${username}    ${password}
    TRC_Input Username    ${username}
    TRC_Input Password   ${password}
    TRC_Submit Credentials

TRC_Input Username
    [Documentation]   This keyword is used to enter Username in the UniTrace login page with username argument.
    [Arguments]    ${username}
    Input Text    ${TRC_USERNAME_TXTBOX}    ${username}

TRC_Input Password
    [Documentation]   This keyword is used to enter Password in the UniTrace login page.
    [Arguments]    ${password}
    Input Text    ${TRC_PASSWORD_TXTBOX}    ${password}

TRC_Submit Credentials
    [Documentation]   This keyword is used to click on login button in UniTrace login page.
    Click Button    ${TRC_LOGIN_BTN}

TRC_Navigation Administration to Users grid
    [Documentation]   This keyword is used to navigate to users grid from Administration.
    click link  ${TRC_USERGRID_XPATH}
    Wait Until Page Contains Element  ${TRC_ADDUSER_XPATH}

TRC_Search the Users in UniTrace
    [Documentation]   This keyword is used to verify successful creation of UniTrace user with username argument.
    [Arguments]    ${username}
    Click Element   ${TRC_SEARCHUSERS_ID}
    Input Text     ${TRC_SEARCHUSERS_ID}    ${username}
    Click Element   ${TRC_USERSEARCHSUBMIT_BTN}
    ${ExpectedUsername}=  get text  ${TRC_SEARCHEDUSERNAME_XPATH}
    Should be equal as strings   ${ExpectedUsername}    ${username}
    Click Element   ${TRC_SEARCHEDUSERNAME_XPATH}

TRC_Assign Roles to the User in UniTrace
    [Documentation]   This keyword is used to assign roles (SuperUser or Staff user) to the user in UniTrace with username argument.
    [Arguments]    ${username}
    select checkbox  ${TRC_STAFFSTATUSPERMISSIONS_ID}
    select checkbox  ${TRC_SUPERUSERPERMISSIONS_ID}
    Click button  ${TRC_EDITSAVE_BTN}
    ${massege}=    get text    ${TRC_SUCCESS_MASSEGE}
    Should Contain     ${massege}    ${TRC_SUCESSPART1_MSG} "${username}" ${TRC_SUCESSPART2_MSG}
#    wait until page contains  ${TRC_SUCESSPART1_MSG} "${username}" ${TRC_SUCESSPART2_MSG}    20s

TRC_Verify New User's Terms of Service Screen
    [Documentation]  This keyword is used to accept the new User agreement in UniTrace.
    Title Should be   ${TRC_USERLOGIN_TITLE}
    Click Button      ${TRC_EULAACCEPT_BTN}

TRC_Check the Solution not enabled error message
    [Documentation]  This keyword is used to check the Solution not enabled seeror message is displayed in the Product.
    Wait Until Page Contains Element   ${TRC_SOLDISABLEDMSG_XPATH}
    Page Should Contain Element    ${TRC_SOLDISABLEDMSG_XPATH}
    Page Should Not Contain Element  ${TRC_USERNAME_TXTBOX}
    Page Should Not Contain Element  ${TRC_PASSWORD_TXTBOX}

TRC_Posting the UniTrace System Inbox job
    [Documentation]  This keyword is used to post the Unitrace System inbox job.
    ${ResponseUniTraceJob}=  Requests_Library.POST  url=${LOGIN URL}/jobs/api/inboundjob/?message-type=SystemInbox&format=json  data=TestSatya For Checking the UniTrace job
    ...   username=${UNITRACE_ADMINISTRATOR_USERNAME}@${UNITRACE_ENVIRONMENT}   password=${UNITRACE_ADMINISTRATOR_PASSWORD}
    log to console   ${ResponseUniTraceJob.text}
    log to console   ${ResponseUniTraceJob.status_code}
    [Return]    ${ResponseUniTraceJob.status_code}

TRC_Posting the UniTrace System Inbox job and get the Job Receipt
    [Documentation]  This keyword is used to post the Unitrace System inbox job and get the Job Receipt of that.
    ${ResponseUniTraceJob}=  Requests_Library.POST  url=${LOGIN URL}/jobs/api/inboundjob/?message-type=SystemInbox&format=json  data=TestSatya For Checking the UniTrace job
    ...   username=${UNITRACE_ADMINISTRATOR_USERNAME}@${UNITRACE_ENVIRONMENT}   password=${UNITRACE_ADMINISTRATOR_PASSWORD}
    log to console   ${ResponseUniTraceJob.text}
    log to console   ${ResponseUniTraceJob.status_code}
    ${json_value}=  Get From Dictionary   ${ResponseUniTraceJob.json()}  receipt
    log to console   ${json_value}
    log to console  ${json_value}
    [Return]    ${json_value}

TRC_Get request of Inbox API with the job Receipt
    [Arguments]  ${json_value}
    ${InboxUniTracejob}=  Requests_Library.GET   url=${LOGIN URL}/inbox/api/getmessages/${json_value}/?message-type=SystemInbox&format=json   username=${UNITRACE_ADMINISTRATOR_USERNAME}@${UNITRACE_ENVIRONMENT}   password=${UNITRACE_ADMINISTRATOR_PASSWORD}
    log to console   ${InboxUniTracejob.status_code}
    [Return]   ${InboxUniTracejob.status_code}
#######################################################################################################################
