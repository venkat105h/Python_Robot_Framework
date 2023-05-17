#------------------------------------------------------------------
#	Description			:		This locator file contains all the element in the UniSecure
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
Documentation     A resource file with locators.

*** Variables ***
########################################################################################################################
#######################################    UNISECURE        ############################################################
${UNISECURE_USERNAME_TXTBOX}                       userName
${UNISECURE_PASSWORD_TXTBOX}                       password
${UNISECURE_LOGIN_BTN}                             loginBtn
${UNISECURE_ROLE_DROPDOWN}                         roleList
${UNISECURE_ABOUT_IMG}                             //*[@id="main-content"]/unisecure-about/app-about/div/div/div/img
${UNISECURE_FAILEDLOGINERROR_MSG}                  //*[@id="loginErrorMsg"]
${UNISECURE_ADMINROLE_DROPDOWN}                    Administrator
${UNISECURE_DESIGNERROLE_DRPDWN}                   Designer
${UNISECURE_OPERATORROLE_DRPDWN}                   Operator
${UNISECURE_BOROLE_DRPDWN}                         Business Owner
${UNISECURE_LOGON_MSGBOX}                          //*[@id="desc"]
${UNISECURE_LOGON_IMG}                             //*[@id="img"]
${UNISECURE_LOGONMSG_TXT}                          //li[@id="desc" and @style="display: inline;"]
${UNISECURE_LOGONCLOSE_BTN}                        //app-alert/div/ul/div/li[1]/a
${UNISECURE_USERDISPLAY_IMAGE}                     //a[@id='dropdownMenu1']
${UNISECURE_GOTOPREFRENCES_LINK}                   goToPreference
${UNISECURE_ACCOUNTINFORMATION_CARD}               //*[@id='preferenceLbl']/../../..//*[contains(@id,'preferenceCardName_0')]
${UNISECURE_DEFAULTLAYOUTLIST_DRPDOWN}             defaultLayoutList
${UNISECURE_SELECTDEFAULTLAYOUTLIST_OPTIONS}       xpath=//Select[@id="defaultLayoutList"]
${UNISECURE_ENABLEDMESSAGEPREFIX_SLIDER}           //*[@id="enablePrefixChkBoxLbl"]/span[1][contains(text(),"Enable")]
${UNISECURE_ENABLE_SLIDER}                         //span[@class='editswitch-switch']
${UNISECURE_FLOATBTN_OPTIONS}                      floatBtn_options
${UNISECURE_FLOATBTN_ICON}                         float-btn-icon
${UNISECURE_SAVE_BTN}                              floatBtn_SaveTxt
${UNISECURE_MESSAGE_ID}                            message-message
${UNISECURE_USERPREFERENCES_MESSAGEPREFIX}         000146I
${UNISECURE_LOGOUT_ID}                             logOut
${UNISECURE_WELCOME_ID}                            navBtn_welcome
${UNISECURE_SECURITYPOLICIES_CARD}                 preferenceCardHead_4
${UNISECURE_USERGROUP_CARD}                        preferenceCardHead_0
${UNISERIES_SECURITYPOLICIES_CARD}                 preferenceCardHead_1
${UNISECURESECURITYINTRO_TXT}                      introSecurity
${UNISECUREPASSWORDOCCU_CHHBX}                     samePWD
${UNISECURE_PASSOCCU_DRPDOWN}                      dropdownpassOccur
${UNISECURE_ACCDIS_CHKBX}                          lockAccount
${UNISECURE_ACCDIS_DRPDOWN}                        dropdownLockAttempts
${UNISECURE_SECURITYQUES_CHKBX}                    reqSecQuestion
${UNISECURE_SECURITYQUES_DRPDOWN}                  dropdownReqSecQuestion
${UNISECURE_FORCEPASS_CHKBX}                       forcePassword
${UNISECURE_FORCEPASS_DRPDOWN}                     dropdownForcePwd
${UNISECURE_FAILEDLOGIN_MSG}                       loginErrorMsg
${UNISECURE_SEARCHUSER_ID}                         //*[@id="user_0"]
${UNISECURE_SEARCHUSER_XPATH}                      //*[@id="userName_0"]
${UNISECURE_SEARCHGROUP_XPATH}                     //*[@id="lblGroupName_0"]
${UNISECURE_USERSEARCHDELETE_ICON}                 //*[@id="user_0"]/span[@id="btnDeleteUser_0"]
${UNISECURE_GRPDELETE_BTN}                         //button[@id='buttn_DeleteTxt']
${UNISECURE_ADDUSER_ID}                            newUser
${UNISECURE_USERNAME_TXTBX}                       txtBoxUserName
${UNISECURE_PASSWORD_TXTBX}                       txtPassword
${UNISECURE_VPASSWORD_TXTBX}                      txtVerifyPwdTxt
${UNISECURE_EMAIL_TXTBX}                          //*[@type = 'email']
${UNISECURE_FNAME_TXTBX}                          txtFirstName
${UNISECURE_LNAME_TXTBX}                          txtLastName
${UNISECURE_USERALLGROUPS_CHKBX}                   chkSelectAllGroups
${UNISECURE_SECURITYQUESTIONS_MSG}                 //*[@id="msgSecurityQuestionSetup"]
${UNISECURE_SECURITYQUESTIONSANS_TXT}              txtAnswerSetup_0
${UNISECURE_SECURITYQUESTIONSCOLLSET_ID}           //*[@id="collectionUserQuestion"]
${UNISECURE_SECURITYQUESTIONSOK_BTN}               btnOkSecurityQuestionSetup
${UNISECURE_DESIGNERFAMILY_ICON}                   Family-icon
${UNISECURE_DESIGNERFAMILY_ITEM}                   //*[@id="Family-item"]
${UNISECURE_DESIGNERPRODUCT_ICON}                  //*[@id="Product-icon"]
${UNISECURE_DESIGNERPRODUCT_ITEM}                  //*[@id="Product-item"]
${UNISECURE_DESIGNERPACKAGE_ICON}                  //*[@id="PackageProfile-icon"]
${UNISECURE_DESIGNERPACKAGE_ITEM}                  //*[@id="PackageProfile-item"]
${UNISECURE_GSFAMILY_XPATH}                        //*[@id="searchResultForFamily"]
${UNISECURE_GSPRODUCT_XPATH}                       //*[@id="searchResultForProduct"]
${UNISECURE_GSPACKAGE_XPATH}                       //*[@id="searchResultForPackageProfile"]
${UNISECURE_GSACTION_XPATH}                        //*[@id="searchResultForAction"]
${UNISECURE_GSPUBISHEDFAMILY_XPATH}                //*[@id="searchResultForPublishedFamily"]
${UNISECURE_GSCARDITMFAMILY_XPATH}                 //*[@id="Family_itemName_0"]
${UNISECURE_GSCARDITEMPRODUCT_XPATH}               //*[@id="Product_itemName_0"]
${UNISECURE_GSCARDITEMPACKAGE_XPATH}               //*[@id="PackageProfile_itemName_0"]
${UNISECURE_GSCARDITEMACTION_XPATH}                //*[@id="itemAuthentication_itemName_0"]
${UNISECURE_GSCARDITEMDESC_XPATH}                  //*[@id="itemDescription"]
${UNISECURE_OPERATORACTION_ICON}                   Action-icon
${UNISECURE_OPERATORACTION_ITEM}                   //*[@id="Action-item"]
${UNISECURE_OPERATORFAMILY_ICON}                  //*[@id="PublishedFamily-icon"]
${UNISECURE_OPERATORFAMILY_ITEM}                  //*[@id="PublishedFamily-item"]
${UNISECURE_BOREPORT_CARD}                         preferenceCardName_0
${UNISECURE_ADDGROUP_ID}                           newGroup
${UNISECURE_GROUPNAME_ID}                          txtBoxNewGroupName
${UNISECURE_GROUPDESCRIPTION_ID}                   txtBoxNewGroupDesc
${UNISECURE_ROLEDROPLOCATION_XPTAH}                //*[@id="existing-groups"]/tr[2]/td[3]/div
${UNISECURE_CREATEGRP_BTN}                         //span[@id='btnCreateNewGrp' and @class='fa fa-check-square']
${UNISECURE_ADMIN_ROLE}                            (//*[contains(@id,"role_")]//img[contains(@src,"_icon_administrator")])[1]
${UNISECURE_DESIGNER_ROLE}                         (//*[contains(@id,"role_")]//img[contains(@src,"_icon_designer")])[1]
${UNISECURE_OPERATOR_ROLE}                         (//*[contains(@id,"role_")]//img[contains(@src,"_icon_inspector")])[1]
${UNISECURE_BO_ROLE}                               (//*[contains(@id,"role_")]//img[contains(@src,"_icon_businessowner")])[1]
${UNISECURE_CARDNAMEOPERATORPUBFAMILY_XPATH}       //*[@id="PublishedFamily_itemName_0"]
${UNISECURE_CARDDESOPERATORPUBFAMILY_XPATH}        //*[@id="itemDescription"]
${UNISECURE_GROUPSEARCH_ID}                        groupSearch
${UNISECURE_EXISTINGGROUPFILTER_ID}                //*[@id="existingGroupFilter"]
${UNISECURE_GROUPLABELENAME_ID}                    lblGroupName_0
${UNISECURE_SEARCHEDGROUP_XPATH}                   //label[@class='ng-star-inserted']/span[@class='highlightText']
${UNISECURE_DELETEGROUP_ID}                        btnDeleteGroup_0
${UNISECURE_CLOSE_MSG_CENTER}                      xpath=//button[@id='close-center']
########################################################################################################################
