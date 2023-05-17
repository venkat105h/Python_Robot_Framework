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

Resource        ..${/}Locators${/}Locator_UniSphere.robot
Resource        ..${/}Locators${/}Locator_UniSecure.robot
Resource        .${/}COMMON_RESOURCE.robot

*** Variables ***
${DRAGANDDROPFILEURL}                                      ${CURDIR}/drag-n-drop.js
${UNISECURE_ROLEDROPLOCATION_XPTAH}                        //div[@class="form-control" and @dnd-droppable]
*** Keywords ***
#######################################################################################################################
################################################  UNISPHERE/UNISECURE #################################################

SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    [Documentation]   This keyword is used to login to UniSecure product with valid credentials.
    ...               ${username} is used to provide the login Username of the product
    ...               ${password} is used to provide the login Password of the product
    ...               ${RoleDropdown} is used to provide the User role of the product
    [Arguments]    ${username}  ${password}  ${RoleDropdown}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISECURE_USERNAME_TXTBOX}
    Input Text    ${UNISECURE_USERNAME_TXTBOX}    ${username}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISECURE_PASSWORD_TXTBOX}
    Input Text    ${UNISECURE_PASSWORD_TXTBOX}    ${password}
    Wait Until Element Is Visible    id=welcomeToTxt
    sleep       5s
    Select From List By Value  ${UNISECURE_ROLE_DROPDOWN}  ${RoleDropdown}
    wait until keyword succeeds  5x  2s  Click Element   ${UNISECURE_LOGIN_BTN}
    SPH/SEC_Accept End User License Agreement


SPH/SEC_Accept End User License Agreement
    [Documentation]  Accept end user license agreement
    ${Status}=  Run Keyword and Return status   Wait Until Element Is Visible  ${UNI_ACCEPT_BTN}
    Run Keyword If  '${Status}'=='${True}'  Run Keywords  Scroll Element Into View  ${UNI_ACCEPT_BTN}
    ...  AND   click Element  ${UNI_ACCEPT_BTN}
    ...  AND    Execute JavaScript    window.scrollTo(0,    0)

SPH/SEC_Scroll Page To Location
    [Documentation]  Scrolls to the location mentioned

    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

SPH/SEC_Scroll To Element
    [Documentation]  Scrolls till element is visible

    [Arguments]  ${ElementLocator}

    FOR  ${Index}   IN RANGE  0  5
       ${Visibility}=  Run Keyword And Return Status  Element Should Not Be Visible  ${ElementLocator}
       Exit For Loop If  '${Visibility}'=='${FALSE}'
       Execute JavaScript    window.scrollTo(0, 2000)
       ${ElementAddress}=   RUN KEYWORD AND IGNORE ERROR  Get Webelement   ${ElementLocator}
       ${Status}=           Run Keyword And Return Status  Should Not Contain  ${ElementAddress}  FAIL
       Exit For Loop If  '${Status}'=='${TRUE}'
    END

SPH/SEC_Login Failed error message
    [Documentation]   This keyword is used verify the login error message id is displayed in UniSecure.
    Wait Until Element Is Visible  ${UNISECURE_FAILEDLOGIN_MSG}  timeout=20
    Page Should Contain Element  ${UNISECURE_FAILEDLOGIN_MSG}

SPH/SEC_Check the logon Message
    [Documentation]  This keyword is to check the logon message
    Wait Until Element Is Visible  ${UNISECURE_LOGON_MSGBOX}  timeout=20
    Wait Until Element Is Visible   ${UNISECURE_LOGON_MSGBOX}  timeout=20
    Page Should contain Element  ${UNISECURE_LOGON_MSGBOX}
    Page Should contain Element  ${UNISECURE_LOGON_IMG}
    Sleep  2s
    Wait Until Element Is Visible   ${UNISECURE_LOGONMSG_TXT}  timeout=20
    ${EXPECTEDLOGONMSG}=  Get Text    ${UNISECURE_LOGONMSG_TXT}
    Should be equal as strings     ${EXPECTEDLOGONMSG}   ${LOGONMSG}

SPH/SEC_Check the logon popup after disabling the logon message in Unicloud
    [Documentation]  This keyword is to check the logon message
    Page Should not contain Element  ${UNISECURE_LOGON_MSGBOX}
    Page Should not contain Element  ${UNISECURE_LOGON_IMG}

SPH/SEC_Close the logon Message
    [Documentation]  This keyword is to close the logon message in the product.
    Wait Until Element Is Visible   ${UNISECURE_LOGONCLOSE_BTN}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISECURE_LOGONCLOSE_BTN}

SPH/SEC_Check the Solution not enabled error message
    [Documentation]  This keyword is used to check the Solution not enabled error message.
    Wait Until Element Is Visible  ${UNISECURE_FAILEDLOGINERROR_MSG}  timeout=20
    Page Should contain Element   ${UNISECURE_FAILEDLOGINERROR_MSG}

SPH/SEC_Navigate to Security Policies
    [Documentation]  This keyword is to Navigate to Security Policies based on the Product.
    Wait Until Element Is Visible    ${UNISECURE_WELCOME_ID}
    Click Element     ${UNISECURE_WELCOME_ID}
    Wait Until Element Is Visible    ${UNISPHERE_SECURITYPOLICIES_CARD}
    Run Keyword If   '${Solution}' == 'Systech360'   Click Element   ${UNISPHERE_SECURITYPOLICIES_CARD}
    Run Keyword If   '${Solution}' == 'UniSecure'   Click Element   ${UNISECURE_SECURITYPOLICIES_CARD}
    Run Keyword If   '${Solution}' == 'UniSeries'   Click Element   ${UNISERIES_SECURITYPOLICIES_CARD}
    Wait Until Element Is Visible  ${UNISECURESECURITYINTRO_TXT}  timeout=20

SPH/SEC_Select the Checkbox and Enter the values
    [Documentation]  This keyword is to Select the Checkbox and Enter the values in the Security Policies
    Wait Until Element Is Visible  ${UNISECUREPASSWORDOCCU_CHHBX}  timeout=20
    Select Checkbox  ${UNISECUREPASSWORDOCCU_CHHBX}
    Select From List By Index  ${UNISECURE_PASSOCCU_DRPDOWN}  10
    Select From List By Index  ${UNISECURE_PASSOCCU_DRPDOWN}  11
    Select Checkbox  ${UNISECURE_ACCDIS_CHKBX}
    Select From List By Index  ${UNISECURE_ACCDIS_DRPDOWN}  10
    Select From List By Index  ${UNISECURE_ACCDIS_DRPDOWN}  11
    #todo other test cases fails because of this
#    Select Checkbox  ${UNISECURE_SECURITYQUES_CHKBX}
#    Select From List By Index  ${UNISECURE_SECURITYQUES_DRPDOWN}  10
#    Select From List By Index  ${UNISECURE_SECURITYQUES_DRPDOWN}  11
    Select Checkbox  ${UNISECURE_FORCEPASS_CHKBX}
    Select From List By Index  ${UNISECURE_FORCEPASS_DRPDOWN}   28
    Select From List By Index  ${UNISECURE_FORCEPASS_DRPDOWN}   29
    #Mouse Over   ${UNISECURE_FLOATBTN_OPTIONS}
    Click Element  ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20

SPH/SEC_Navigate to Preferences
    [Documentation]  This keyword is to naviagte to Preferences page.
    Wait Until Element Is Visible  ${UNISECURE_USERDISPLAY_IMAGE}  timeout=20
    Mouse over   ${UNISECURE_USERDISPLAY_IMAGE}
    Wait Until Element Is Visible  ${UNISECURE_GOTOPREFRENCES_LINK}
    Click Element  ${UNISECURE_GOTOPREFRENCES_LINK}

SPH/SEC_Navigate to Display Preferences
    [Documentation]  This keyword is to navigate to Display Preferences page from Preferences page.
    Wait Until Element Is Visible  ${UNISECURE_ACCOUNTINFORMATION_CARD}  timeout=20
    Click Element  ${UNISECURE_ACCOUNTINFORMATION_CARD}
    Wait Until Element Is Visible  ${UNISECURE_DEFAULTLAYOUTLIST_DRPDOWN}  timeout=20

SPH/SEC_Setup Default layout and Enable Prefix
    [Documentation]  This keyword is to setup the default layout and enable the message prefix.
    Click Element  ${UNISECURE_DEFAULTLAYOUTLIST_DRPDOWN}
    Select From List By Index   ${UNISECURE_SELECTDEFAULTLAYOUTLIST_OPTIONS}   1
    Select From List By Index   ${UNISECURE_SELECTDEFAULTLAYOUTLIST_OPTIONS}   0
    ${Status}=  run keyword and return status   Page Should Contain Element   ${UNISECURE_ENABLEDMESSAGEPREFIX_SLIDER}
    log to console   ${Status}
    Run Keyword If  ${Status}== False     Click Element    ${UNISECURE_ENABLE_SLIDER}
    #Mouse over  ${UNISECURE_FLOATBTN_ICON}
    Click Element   ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
    Wait Until Element Contains   ${UNISECURE_MESSAGE_ID}    ${UNISECURE_USERPREFERENCES_MESSAGEPREFIX}    20s
    #added by Akash
    Wait Until Element Is Visible   ${UNISPHERE_MESSAGECENTERCLOSE_BTN}  timeout=20
    Click Element    ${UNISPHERE_MESSAGECENTERCLOSE_BTN}

SPH/SEC_NAV_Setup Default layout to list view
    [Documentation]  This keyword is to setup the default layout and enable the message prefix.
    Click Element  ${UNISECURE_DEFAULTLAYOUTLIST_DRPDOWN}
    Select From List By Index   ${UNISECURE_SELECTDEFAULTLAYOUTLIST_OPTIONS}   0
    Select From List By Index   ${UNISECURE_SELECTDEFAULTLAYOUTLIST_OPTIONS}   1
    ${Status}=  run keyword and return status   Page Should Contain Element   ${UNISECURE_ENABLEDMESSAGEPREFIX_SLIDER}
    log to console   ${Status}
    Run Keyword If  ${Status}== False     Click Element    ${UNISECURE_ENABLE_SLIDER}
    #Mouse over  ${UNISECURE_FLOATBTN_ICON}
    Click Element   ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
    Wait Until Element Contains   ${UNISECURE_MESSAGE_ID}    ${UNISECURE_USERPREFERENCES_MESSAGEPREFIX}    20s

SPH/SEC_Logout from UniSecure/UniSphere
    [Documentation]   This keyword is used to logout user from UniSecure/UniSphere.
    Execute JavaScript    window.scrollTo(0,0)
    Wait Until Element Is Visible   ${UNISECURE_USERDISPLAY_IMAGE}  timeout=20
    wait until keyword succeeds  5x  2s  mouse over   ${UNISECURE_USERDISPLAY_IMAGE}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISECURE_USERDISPLAY_IMAGE}
    Wait Until Element Is Visible  ${UNISECURE_LOGOUT_ID}
    wait until keyword succeeds  5x  2s  click element  ${UNISECURE_LOGOUT_ID}

    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${UNISPHERE_POPUPCANCELBTN_BTN}  timeout=2
    ${CancelBtn_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${UNISPHERE_POPUPCANCELBTN_BTN}
    Run Keyword If  '${CancelBtn_Status}'=='${TRUE}'  Click Element  ${UNISPHERE_POPUPCANCELBTN_BTN}

    Wait Until Element Is Visible   ${UNISECURE_USERNAME_TXTBOX}  timeout=20


SPH/SEC_Check the Message Prefix ID in message center
    [Arguments]   ${MESSAGEPREFIX}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=60
    wait until keyword succeeds  15x  2s  Page should contain  ${MESSAGEPREFIX}

SPH/SEC_Close the message center
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_MESSAGECENTERCLOSE_BTN}

SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere
    [Documentation]   This keyword is used to navigate to Users&Group in UniSecure.
    ...               ${Productname} is used to specify the name of the product to click on the User group card
    [Arguments]  ${Productname}
    Wait Until Element Is Visible  ${UNISPHERE_USERGROUP_CARD}  timeout=20
    Run Keyword If   '${Productname}' == 'Systech360'   Click Element   ${UNISPHERE_USERGROUP_CARD}
    Run Keyword If   '${Productname}' == 'UniSecure'   Click Element   ${UNISECURE_USERGROUP_CARD}
    Run Keyword If   '${Productname}' == 'UniSeries'   Click Element   ${UNISECURE_USERGROUP_CARD}
    wait until keyword succeeds  3x  2s   Click Element   ${UNISPHERE_CARDSSEARCH_BOX}

SPH/SEC_Navigate to Add User page in UniSecure/UniSphere
    [Documentation]   This keyword is used to navigate to Add user page in UniSecure.
    ...               ${Productname}  is used to provide the name of the product
    [Arguments]   ${Productname}
    COMMON_Scroll to top of the page
    Wait Until Element Is Visible   ${UNISECURE_WELCOME_ID}  timeout=20
    Click Element  ${UNISECURE_WELCOME_ID}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere    ${Productname}
    Wait Until Element Is Visible    ${UNISECURE_ADDUSER_ID}  timeout=20
    wait until keyword succeeds  5x  2s  Click Element   ${UNISECURE_ADDUSER_ID}
    Wait Until Element Is Visible    ${UNISECURE_USERNAME_TXTBX}  timeout=20

SPH/SEC_Search the Users in UniSecure/UniSphere
    [Documentation]   This keyword is used to search the users in UniSecure/UniSphere.
    [Arguments]    ${username}
	COM_Verify loading object presence and absence
    Wait Until Element Is Visible   ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text     ${UNISPHERE_CARDSSEARCH_BOX}    ${username}
    Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
    Wait Until Element Is Visible    ${UNISECURE_SEARCHUSER_ID}  timeout=20
    wait until keyword succeeds  5x  2S  Click Element  ${UNISECURE_SEARCHUSER_ID}

SPH/SEC_Assign Roles to the User in UniSphere/UniSecure
    [Documentation]   This keyword is used to assign groups/roles in UniSecure/UniSphere.
    Wait Until Element Is Visible    ${UNISPHERE_USERALLGROUPS_CHKBX}  timeout=20
    wait until keyword succeeds  5x   2s     UnSelect Checkbox  ${UNISPHERE_USERALLGROUPS_CHKBX}
    wait until keyword succeeds  5x   2s     Select Checkbox     ${UNISPHERE_USERALLGROUPS_CHKBX}
    #Mouse Over   ${UNISECURE_FLOATBTN_OPTIONS}
    Click Element   ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible    ${UNISECURE_MESSAGE_ID}  timeout=20

SPH/SEC_Click on About Popup
    Wait Until Element Is Visible   ${UNISPHERE_ABOUT_ID}  timeout=20
    Click Element  ${UNISPHERE_ABOUT_ID}
    Wait Until Element Is Visible   //*[@id="main-content"]//p[2]  timeout=20
    #Wait Until Element Is Visible   ${UNISPHERE_ABOUTCLOSE_BTN}  timeout=20
    #wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_ABOUTCLOSE_BTN}
    Wait Until Page Contains Element  ${UNISPHERE_WELCOME_ID}
    Wait Until Element Is Visible   ${UNISPHERE_WELCOME_ID}  timeout=20
    wait until keyword succeeds  3x  2s   Click Element  ${UNISECURE_WELCOME_ID}
    Wait Until Element Is Visible  //*[@id='navInput_Search']  timeout=20
    wait until keyword succeeds  5x  2s   Page Should Contain Element   //*[@id='navInput_Search']


SPH/SEC_Enter First name, Last name and Email for UniTrace user
    [Documentation]   This keyword is used to enter UniSecure username, password, email, Firstname, lastname and group and create the user.
    [Arguments]    ${email}
    input text  ${UNISECURE_EMAIL_TXTBX}  ${email}
    input text   ${UNISECURE_FNAME_TXTBX}  ${UNISECURE_FIRSTNAME}
    input text   ${UNISECURE_LNAME_TXTBX}   ${UNISECURE_LASTNAME}
    COMMON_Scroll to bottom of the page
    Select Checkbox   ${UNISECURE_USERALLGROUPS_CHKBX}
    #Mouse Over   ${UNISECURE_FLOATBTN_OPTIONS}
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   id=${UNISECURE_SAVE_BTN}
    log to console    ${present}
    Run Keyword If    ${present}    Click Element   ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20

SPH/SEC_Search the users and delete
    [Documentation]   This keyword is used to search and delete the users created.
    [Arguments]     ${Delete_Username}
    COMMON_Scroll to top of the page
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    Click Element   ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}  ${Delete_Username}
    Wait Until Element Is Visible   ${UNISECURE_SEARCHUSER_ID}  timeout=20
    Mouse Over   ${UNISECURE_SEARCHUSER_ID}
    Mouse Over   ${UNISECURE_USERSEARCHDELETE_ICON}
    Double Click Element  ${UNISECURE_USERSEARCHDELETE_ICON}
    Wait Until Page Contains Element   ${UNISPHERE_DELETEPOUP_ID}  timeout=20
    Page Should Contain Element        ${UNISPHERE_DELETEPOUP_ID}
    Sleep  10s     # Waiting for the Delete Confirmation popup , as Delete button is displayed in the active screen.
    Wait Until Element Is Visible  ${UNISECURE_GRPDELETE_BTN}  timeout=20
    Set Focus To Element   ${UNISECURE_GRPDELETE_BTN}
    Click Button  ${UNISECURE_GRPDELETE_BTN}
	log to console  Deleted button
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
    wait until keyword succeeds  5x  2s   Page Should Contain Element       ${UNISECURE_MESSAGE_ID}

SPH/SEC_Create New User details and Save
    [Documentation]   This keyword is used to enter UniSecure username, password, email, Firstname, lastname and group and create the user.
    [Arguments]    ${username}    ${password}    ${email}
    input text  ${UNISECURE_USERNAME_TXTBX}  ${username}
    input text  ${UNISECURE_PASSWORD_TXTBX}  ${password}
    input text  ${UNISECURE_VPASSWORD_TXTBX}  ${password}
    input text  ${UNISECURE_EMAIL_TXTBX}  ${email}
    input text   ${UNISECURE_FNAME_TXTBX}  ${UNISECURE_FIRSTNAME}
    input text   ${UNISECURE_LNAME_TXTBX}   ${UNISECURE_LASTNAME}
    COMMON_Scroll to bottom of the page
    Select Checkbox   ${UNISECURE_USERALLGROUPS_CHKBX}
    #Mouse Over   ${UNISECURE_FLOATBTN_OPTIONS}
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   id=${UNISECURE_SAVE_BTN}
    log to console    ${present}
    Run Keyword If    ${present}    Click Element   ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}      timeout=20

SPH/SEC_Create UniSecure with New group, User details and Save
    [Documentation]   This keyword is used to enter UniSecure Designer username, password, email, Firstname, lastname and group and create the user.
    [Arguments]    ${username}    ${password}    ${email}   ${groupname}   ${role}
    input text  ${UNISECURE_USERNAME_TXTBX}  ${username}
    input text  ${UNISECURE_PASSWORD_TXTBX}  ${password}
    input text  ${UNISECURE_VPASSWORD_TXTBX}  ${password}
    input text  ${UNISECURE_EMAIL_TXTBX}  ${email}
    input text   ${UNISECURE_FNAME_TXTBX}  ${UNISECURE_FIRSTNAME}
    input text   ${UNISECURE_LNAME_TXTBX}   ${UNISECURE_LASTNAME}
    Sleep  5s
    ${Totaltext}=  get text  ${UNISPHERE_TOTALTEXTCLASS_XPATH}
    ${TotalConvert}=  Convert To String  ${Totaltext}
    @{Total}=    Split String  ${TotalConvert}    0 Selected /
    log to console   ${Total}[-1]
    @{TotalVal}=   Split String From Right  ${Total}[-1]   Total  -1
    log to console   @{TotalVal}
    ${TotalValue}=  Evaluate    @{TotalVal}
    ${TotalRecord}=  Convert To Integer  ${TotalValue}
    log to console  ${TotalRecord}
    ${PageCountNo}=  Evaluate    ${TotalRecord}/6
    ${PageCount}=  Convert to Integer  ${PageCountNo}
    log to console  ${PageCount}
    COMMON_Scroll to bottom of the page
    Run keyword If   ${PageCount}==1   run keyword if   ${TotalRecord}==6   SPH/SEC_Select the Group name in First page   ${groupname}
    Run keyword If   ${PageCount}==1   run keyword if   ${TotalRecord}>6   SPH/SEC_Select the Group name in Exisiting Groups Table in all pages  ${PageCount}  ${TotalRecord}  ${groupname}
    Run Keyword If   ${PageCount}<1    SPH/SEC_Select the Group name in First page   ${groupname}
    Run Keyword If   ${PageCount}>1    SPH/SEC_Select the Group name in Exisiting Groups Table in all pages  ${PageCount}  ${TotalRecord}  ${groupname}


SPH/SEC_Select the Group name in First page
    [Arguments]    ${groupname}
     ${RowCount}=   Get Element Count  ${UNISPHERE_GROUPTABLEROW_XPATH}
    log to console  ${RowCount}
     FOR  ${g}   IN RANGE  ${RowCount}
        ${role}=   Get Text   xpath=//*[@id="name_${g}"]
        log to console  ${role}
        Run Keyword If  "${groupname}" == "${role}"   Select Checkbox    //*[@id="chkUserGroup_${g}"]
        Run Keyword If  "${groupname}" == "${role}"    exit for loop
     END
    COMMON_Scroll to bottom of the page
    #Mouse Over   ${UNISECURE_FLOATBTN_OPTIONS}
    Click Element   ${UNISECURE_SAVE_BTN}
    COMMON_Scroll to top of the page
    Wait Until Element Is Visible    ${UNISECURE_MESSAGE_ID}  timeout=20


SPH/SEC_Select the Group name in Exisiting Groups Table in all pages
    [Arguments]  ${PageCount}  ${TotalRecord}  ${groupname}
    FOR  ${i}   IN RANGE  ${PageCount}+1
       run keyword and ignore error   SPH/SEC_Check the Group name in all pages  ${i}   ${TotalRecord}  ${groupname}
       Click Element  ${UNISPHERE_GROUPTABLENEXTBTN_XPATH}
       Run Keyword If  ${i} == ${PageCount}    exit for loop
    END
    COMMON_Scroll to bottom of the page
    #Mouse Over   ${UNISECURE_FLOATBTN_OPTIONS}
    Click Element   ${UNISECURE_SAVE_BTN}
    COMMON_Scroll to top of the page
    Wait Until Element Is Visible    ${UNISECURE_MESSAGE_ID}  timeout=20

SPH/SEC_Check the Group name in all pages
    [Arguments]  ${PageCount}   ${TotalRecord}  ${groupname}
    ${RowCount}=   Get Element Count  ${UNISPHERE_GROUPTABLEROW_XPATH}
    log to console  ${RowCount}
    ${ID}=  Evaluate  ${PageCount}*${RowCount}
    FOR  ${g}   IN RANGE  ${RowCount}
        log to console  ${ID}
        ${role}=   Get Text   xpath=//*[@id="name_${ID}"]
        log to console  ${role}
        Run Keyword If  "${groupname}" == "${role}"   Select Checkbox    //*[@id="chkUserGroup_${ID}"]
        Run Keyword If  "${groupname}" == "${role}"    exit for loop
        ${ID}=  Evaluate  ${ID}+1
    END
SPH/SEC_Verify successful creation of UniSecure/UniSphere user
    [Documentation]   This keyword is used to verify successful creation of UniSecure user.
    [Arguments]    ${Productname}    ${username}
    Wait Until Element Is Visible   ${UNISECURE_WELCOME_ID}  timeout=20
    Click Element  ${UNISECURE_WELCOME_ID}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere    ${Productname}
    Input Text     ${UNISPHERE_CARDSSEARCH_BOX}    ${username}
    Wait Until Element Is Visible  ${UNISECURE_SEARCHUSER_XPATH}  timeout=20
    ${ExpectedUsername}=  wait until keyword succeeds    5x    1s    get element attribute  xpath= ${UNISECURE_SEARCHUSER_XPATH}  title
    Should be equal as strings    ${ExpectedUsername}    ${username}

SPH/SEC_Enter Security Policies for new UniSecure/UniSphere user
    [Documentation]   This keyword is used to enter security policies answers for UniSecure/UniSphere.
	Run Keyword And Ignore Error  Wait Until Element Is Not Visible   ${UNISPHERE_WELCOME_ID}  timeout=20
	Sleep  2S
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible   ${UNISECURE_SECURITYQUESTIONS_MSG}  timeout=20
    Wait Until Element Is Visible   ${UNISECURE_SECURITYQUESTIONSANS_TXT}  timeout=20
    Wait Until Element Is Visible   ${UNISECURE_SECURITYQUESTIONSCOLLSET_ID}  timeout=20
    ${Count}=  Get Element Count  ${UNISECURE_SECURITYQUESTIONSCOLLSET_ID}
    log to console  ${Count}
    FOR  ${i}  IN RANGE  ${Count}
        wait until keyword succeeds  15x  2s    Click Element   //*[@id="txtAnswerSetup_${i}"]
        wait until keyword succeeds  15x  2s    input text    //*[@id="txtAnswerSetup_${i}"]   Answer${i+1}
        Exit For Loop If    ${i} == ${Count}+1
    END
    wait until element is enabled   ${UNISECURE_SECURITYQUESTIONSOK_BTN}
    Wait Until Element Is Visible  ${UNISECURE_SECURITYQUESTIONSOK_BTN}  timeout=20
    wait until keyword succeeds  15x  2s   click element  ${UNISECURE_SECURITYQUESTIONSOK_BTN}
    #mouse over  ${UNISECURE_FLOATBTN_OPTIONS}
    wait until keyword succeeds  5x  2s   click element   ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}      timeout=20

SPH/SEC_Check user is logged in to UniSecure/Unisphere dashboard
    [Documentation]  This keyword is to check user is logged in to UniSecure/UniSphere dashboard
    Wait Until Element Is Visible  ${UNISPHERE_WELCOME_ID}  timeout=20
    Page Should Contain Element  ${UNISPHERE_WELCOME_ID}

SPH/SEC_Click on Top Banner Navigation links
    [Documentation]  This keyword is used to Click on Top Banner Navigation links.
    [Arguments]  ${TopLink}  ${GOTO_Options}
    Click Element   ${UNISPHERE_WELCOME_ID}
    Wait Until Element Is Visible  ${TopLink}  timeout=20
    wait until keyword succeeds  3x  2s     Mouse Over   ${TopLink}
    Click Element  ${TopLink}
    Wait Until Element Is Visible   ${GOTO_Options}  timeout=20
    Mouse Over  ${GOTO_Options}
    click element   ${GOTO_Options}

SPH/SEC_Check user is navigated to the respective page
    [Documentation]  This keyword is used to veify user is navigated to the respective page.
    [Arguments]    ${TOPLINK}   ${PAGE_ID}
    Wait Until Element Is Visible   ${TOPLINK}  timeout=20
    Page Should Contain Element        ${PAGE_ID}

SPH/SEC_Create Group
    [Documentation]   Create Group for UniSecure Product with Groupname, Description and role as arguments
    [Arguments]    ${GroupName}  ${GroupDescription}  ${ROLE}
    Wait Until Element Is Visible  ${UNISECURE_ADDGROUP_ID}  timeout=20
    COMMON_Scroll to bottom of the page
    Click Element  ${UNISECURE_ADDGROUP_ID}
    wait until keyword succeeds  15x  2s  Click Element  ${UNISECURE_GROUPNAME_ID}
    Input Text    ${UNISECURE_GROUPNAME_ID}    ${GroupName}
    Click Element  ${UNISECURE_GROUPDESCRIPTION_ID}
    Input Text    ${UNISECURE_GROUPDESCRIPTION_ID}    ${GroupDescription}
    COMMON_Scroll to bottom of the page
    Set Focus To Element  ${ROLE}
    COMMON_Scroll to bottom of the page
    ${js}        Get File              ${DRAGANDDROPFILEURL}
    ${result}    Execute Javascript    ${js}; return DragNDrop('${ROLE}' , '${UNISECURE_ROLEDROPLOCATION_XPTAH}');
    wait until keyword succeeds   8x  2s   Click Element    ${UNISECURE_CREATEGRP_BTN}
    COMMON_Scroll to bottom of the page

SPH/SEC_Search the Groups and delete
    [Documentation]   This keyword is used to search and delet the groups created.
    [Arguments]    ${GroupName}
    Scroll Page To Location  0  2000
    Wait Until Element Is Visible  ${UNISECURE_GRPSEARCHBOX}  timeout=20
    Click Element  ${UNISECURE_GRPSEARCHBOX}
    Input Text     ${UNISECURE_GRPSEARCHBOX}   ${GroupName}
    Wait Until Element Is Visible   ${UNISECURE_GRPSEARCHED}  timeout=20
    Click Element  ${UNISECURE_GRPSEARCHED}
    Wait Until Element Is Visible  ${UNISECURE_GRPDELETE}  timeout=20
    wait until keyword succeeds  2x   2s  Click Element  ${UNISECURE_GRPDELETE}

SPH/SEC_Check UniTrace and UniSecure link at the top banner
    [Documentation]  This keyword is used to Check the UniTrace and UniSecure links at the top banner
    Wait Until Element Is Visible  ${UNISPHERE_WELCOME_ID}    timeout=20
    Set Focus To Element   ${UNISPHERE_UNITRACETOP_ID}
    Page Should Contain Element  ${UNISPHERE_UNITRACETOP_ID}
    Page Should Contain Element  ${UNISPHERE_UNISECURE_TOPBANNER}


SPH/SEC_Check UniSphere link top banner is clickable for the UniSecure Business Owner
    [Documentation]   This keyword is used to Check UniSphere link top banner is clickable for the UniSecure Business Owner
    Wait Until Element Is Visible  ${UNISPHERE_UNISECURE_TOPBANNER}  timeout=20
    Mouse Over   ${UNISPHERE_UNISECURE_TOPBANNER}
    ${Status}=  run keyword and return status  Click Element  ${UNISPHERE_UNISECURE_TOPBANNER}
    log to console  ${Status}
    Run Keyword If  ${Status}== False     pass execution  UniSphere link is not clickable
    Run Keyword If  ${Status}== True      Fail   UniSphere link is clickable

SPH/SEC_Delete the Group in UniSecure/UniSphere
    [Documentation]  This keyword is used to delete the Group in the UniSecure /UniSphere
    [Arguments]   ${GROUPNAME}
    Wait Until Element Is Visible  ${UNISECURE_GROUPSEARCH_ID}  timeout=20
    Click Element  ${UNISECURE_EXISTINGGROUPFILTER_ID}
    Input Text  ${UNISECURE_EXISTINGGROUPFILTER_ID}   ${GROUPNAME}
    Wait Until Element Is Visible   ${UNISECURE_GROUPLABELENAME_ID}  timeout=20
    ${DeleteSearcheditems}=    Get Element Count      ${UNISECURE_SEARCHEDGROUP_XPATH}
    FOR  ${i}   IN RANGE  ${DeleteSearcheditems}
       wait until keyword succeeds  15x  2s  Mouse Over   ${UNISECURE_GROUPLABELENAME_ID}
       wait until keyword succeeds  15x  2s  Mouse Over   ${UNISECURE_DELETEGROUP_ID}
       Double Click Element  ${UNISECURE_DELETEGROUP_ID}
       Wait Until Element Is Visible   ${UNISECURE_GRPDELETE_BTN}  timeout=20
       Page Should Contain Element        ${UNISECURE_GRPDELETE_BTN}
       Sleep  2s
       Wait Until Element Is Visible  ${UNISECURE_GRPDELETE_BTN}  timeout=20
       Set Focus To Element   ${UNISECURE_GRPDELETE_BTN}
       Click Button  ${UNISECURE_GRPDELETE_BTN}
	   log to console  Deleted button
       Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
       wait until keyword succeeds  5x  2s   Page Should Contain Element       ${UNISECURE_MESSAGE_ID}
       SPH/SEC_Close the message center
    END
Delete the Users in UniSecure
    [Documentation]   This test case is to Delete the Users
    [Arguments]  ${USERNAME}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product   ${UNISECURE URL}
    SOL_Click on UniSecure/UniSecure/UniSeries/UniTrace link in Solution Landing page
    ...  ${SOL_UNISPHERE_LINK}  ${UNISECURE_USERNAME_TXTBOX}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Navigate to Users&Group in UniSecure/UniSphere   UniSecure
    Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}  timeout=20
    Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
    Input Text  ${UNISPHERE_CARDSSEARCH_BOX}   ${USERNAME}
    Wait Until Element Is Visible   ${UNISECURE_SEARCHUSER_ID}  timeout=20
    ${DeleteUserSearcheditems}=    Get Element Count      ${UNISPHERE_HIGHLIGHTEDTEXTYELLOW_XPATH}
    FOR  ${i}   IN RANGE  ${DeleteUserSearcheditems}
       wait until keyword succeeds  15x  2s  Mouse Over   ${UNISECURE_SEARCHUSER_ID}
       wait until keyword succeeds  15x  2s  Mouse Over   ${UNISECURE_USERSEARCHDELETE_ICON}
       Double Click Element  ${UNISECURE_USERSEARCHDELETE_ICON}
       Wait Until Element Is Visible   ${UNISPHERE_DELETEPOUP_ID}  timeout=20
       Page Should Contain Element        ${UNISPHERE_DELETEPOUP_ID}
       Sleep  3s
       Wait Until Element Is Visible  ${UNISECURE_GRPDELETE_BTN}  timeout=20
       Set Focus To Element   ${UNISECURE_GRPDELETE_BTN}
       Click Button  ${UNISECURE_GRPDELETE_BTN}
	   log to console  Deleted button
       Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}  timeout=20
       SPH/SEC_Close the message center
    END
SPH/SEC_Navigate to Designer/Operator
    [Documentation]  This keyword is to navigate to Designer
    [Arguments]   ${ROLE}
    Wait Until Element Is Visible  ${UNISECURE_USERDISPLAY_IMAGE}  timeout=20
    Mouse over   ${UNISECURE_USERDISPLAY_IMAGE}
    Wait Until Element Is Visible  ${ROLE}
    Click Element  ${ROLE}
	${designer_role}=  Run Keyword And Return Status  Should Contain  ${ROLE}  designer  ignore_case=true
    Run Keyword If  '${designer_role}'=='${TRUE}'  NAV_Click on Pin Navigator

SPH/SEC_Navigate to Welcome page
    Click element  ${UNISPHERE_WELCOME_ID}

SPH/SEC_Check the disabled anchor link in Top banner
    [Arguments]      ${Toplink}
    [Documentation]  This keyword is used to check the disabled anchor in the top banner
    Wait Until Element Is Visible   ${UNISPHERE_WELCOME_ID}  timeout=20
    Page Should Contain Element   ${Toplink}

########################################################################################################################
