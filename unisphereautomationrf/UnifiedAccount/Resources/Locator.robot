#------------------------------------------------------------------
#	Description			:		This locator file contains all the element references that are made from Resources and the test scripts
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
Library           Collections
Library           String
Library           robot.libraries.DateTime
Library           SeleniumLibrary
Library           OperatingSystem


*** Variables ***
#######################SolutionLandingPage######################################################

${ABOUTLINK}                                               about-link
${SystechOneLink}                                          systech-one-link
${SYSTECHONEMENUXPATH}                                     //*[@id="menu-item-2887"]
${UNISPHERELINK}                                           systech360-link
${UNISECURELINK}                                           //*[@id="unisecure-link"]
${UNITRACELINK}                                            unitrace-link
${UNISERIESLINK}                                           uniseries-link
${TWITTERLINK}                                             twitter-link
${GOBACKBUTTONID}                                          cancel-external-btn
${CONTINUEBUTTONID}                                        continue-external-btn
${LINKEDINLINK}                                            linkedin-link
${CONTACTUSLINK}                                           contact-us-link
${UNITRACELINK_XPATH}                                      //a[@id="unitrace-link"]
${UNISECURELINK_XPATH}                                     //a[@id="unisecure-link"]
${UNISPHERELINK_XPATH}                                     //a[@id="systech360-link"]
##################################################################################################

######################UNITRACE####################################################################
${UNITRACEUSERNAMEID}                                      id_auth-username
${UNITRACEPASSWORDID}                                      id_auth-password
${UNITRACEUSERNAMETEXT}                                    auth-username
${UNITRACEPASSWORDTEXT}                                    auth-password
${UNITRACELOGINTEXT}                                       Login

${UNITRACE_SEARCHEDUSERNAME}                               //*[@id="result_list"]/tbody/tr/th/a
${UNITRACELOGINBTNID}                                      id_wizard_goto_next

${UNITRACE_SEARCHUSERSID}                                  searchbar
${UNITRACE_USERSEARCHSUBMIT}                               //*[@id="changelist-search"]/div/input[2]
${UNITRACE_SUPERUSERPERMISSIONS_ID}                        id_is_superuser
${UNITRACE_STAFFSTATUSPERMISSIONS_ID}                      id_is_staff
${UNITRACE_EDITUSERNAME}                                   //input[@id='id_username']
${UNITRACE_EDITPASSWORD}                                   //input[@id='id_password1']
${UNITRACE_EDITCNFPWD}                                     //input[@id='id_password2']
${UNITRACE_EDITEMAIL}                                      //input[@id='id_email']
${UNITRACE_EDITVALIDDAYS}                                  //input[@id='id_userpasswordmanagement-0-password_valid_days']
${UNITRACE_EDITSAVE}                                       //input[@name='_save']
${UNITRACE_USRSAVEMSG}                                     //li[@class='success']
${UNITRACE_STAFF}                                          //input[@id='id_is_staff']
${UNITRACE_DISPLAYUSER}                                    css=ul.nav.navbar-nav.navbar-right.pull-right
${EUSA_BtnAccept}                                          id_accept_eusa
${UNITRACE_USERDASHBOARD}                                  User Dashboard


${UNITRACE_LOGOUTLINK}                                     /logout
${UNITRACE_LOGGEDOUTTEXT}                                  Logged Out
${UNITRACE_SYSTECHLOGO}                                    //img[@src='/media/systech_logo.png']
${UNITRACE_TITLE}                                          Authentication Portal | Terms of Service


${UNITRACE_FAILEDLOGINMSG}                                 //*[@id="two-factor"]/tbody/tr[1]/td/ul
${SUCESSMSGPART1}                                          The user
${SUCESSMSGPART2}                                          was changed successfully.
${SUCESSMSGPART3}                                          was added successfully. You may edit it again below
##################################################################################################

######################UNISPEHERE##################################################################
${UNISPHEREUSERNAMEID}                                     userName
${UNISPHEREABOUTID}                                        navBtn_about
${UNISPHERE_WELCOME_ID}                                    navBtn_welcome
${UNISPHERE_USERS_GROUP_ID}                                preferenceCardName_0
${UNISPHERE_DESIGNER_ID}
${UNISPHERE_USERSEARCH_ID}                                 searchBox
${UNISPHERE_SEARCHUSERID}                                  user_0

${UNISPHERE_ADDUSERID}                                     newUser
${UNISPHERE_ADDGROUP}                                      newGroup
${UNISPHERE_USERSAVE}                                      floatBtn_SaveTxt

${UNISPHERE_SAVEMESSAGE}                                   message-message

${UNISPHERE_DESIGNER_UNISECURETOPLINK}                     //a[@id='tobnavbtn_home']/div[1 and @class='dropdown']/a[1 and @class='dropdown-toggle']
${UNISPHERE_UNISECURETOPLINK_ADMINISTRATOR}                navBtn_GotoAdministrator
${UNISPHERE_UNISECURETOPLINK_DESIGNER}                     navBtn_GotoDesigner
${UNISPHERE_UNISECURETOPLINK_OPERATOR}                     navBtn_GotoOperator
${UNISPHERE_UNISECURETOPLINK_BUSINESSOWNER}                navBtn_GotoBusiness



${ACCOUNTDISABLE_CHKBOX}                                   chkAccountDisable
${EXPIREPASS_CHKBOX}                                       txtExpirePwd

########################################################################################################

######################UNISECURE#########################################################################
${UNISECURE_WELCOME_ID}                                    //*[@id="navBtn_welcome"]
${UNISECUREUSERNAMEID}                                     userName
${UNISECUREPASSWORDID}                                     password
${UNISECURELOGINBTNID}                                     loginBtn
${UNISECURE_ROLEDROPDOWN}                                  roleList
${UNISECURE_ADMINROLEDROPDOWN}                             Administrator
${UNISECURE_DESIGNERROLEDROPDOWN}                          Designer
${UNISECURE_OPERATORROLEDROPDOWN}                          Operator
${UNISECURE_BOROLEDROPDOWN}                                Business Owner
${UNISECURE_USERS_GROUP_ID}                                preferenceCardName_1
${UNISECURE_SECURITY_GROUP_ID}                             preferenceCardHead_5
${UNISECURE_USERSEARCH_ID}                                 searchBox


${UNISECURE_USERALLGROUPS}                                 chkSelectAllGroups
${EXISTINGGRPS_XPATH}                                      //*[@id="addUser"]/div[2]/div[4]/div/table/tbody/tr     #//datatable-body-cell[@ng-reflect-row-index="29"][1]/div/label/input
${UNISECURE_USERSAVE}                                      floatBtn_SaveTxt
${UNISECURE_USEREDITBUTTONMOUSEHOVER}                      floatBtn_options
${UNISECURE_SAVEMESSAGE}                                   message-message
${UNISECURE_ADDUSERID}                                     newUser
${UNISECURE_UNITRACETOPLINK}                               navBtn_UniTrace
${UNISECURE_UNISPHERETOPLINK}                              dropdownMenu2
${UNISECURE_UNISPHERETOPLINK_ADMINISTRATOR}                navBtn_GotoAdministrator
${UNISECURE_UNISPHERETOPLINK_DESIGNER}                     navBtn_GotoDesigner
${UNISECURE_UNISPHERETOPLINK_OPERATOR}                     navBtn_GotoOperator
${UNISECURE_UNISPHERETOPLINK_BUSINESSOWNER}                navBtn_GotoBusiness
${UNISECURE_UNISPHERETOPLINK_DISADMINISTRATOR}             //a[@id='navBtn_GotoAdministrator' and @class='disabledAnchor' ]
${UNISECURE_UNISPHERETOPLINK_DISDESIGNER}                  //a[@id='navBtn_GotoDesigner' and @class='disabledAnchor' ]
${UNISECURE_UNISPHERETOPLINK_DISOPERATOR}                  //a[@id='navBtn_GotoOperator' and @class='disabledAnchor' ]
${UNISECURE_UNISPHERETOPLINK_DISBUSINESSOWNER}             //a[@id='navBtn_GotoBusiness' and @class='disabledAnchor' ]


${UNISECURE_PWDOCC_CHECKBOX}                               samePWD
${UNISECURE_DISACC_CHECKBOX}                               lockAccount
${UNISECURE_REQSEC_CHECKBOX}                               reqSecQuestion
${UNISECURE_FORPASS_CHECKBOX}                              forcePassword
${UNISECURE_SECURITY_FLOATBTN}                             float-btn-icon
${UNISECURE_SECURITY_FLOATBTNOPT}                          floatBtn_options
${UNISECURE_SECURITY_SAVEBTN}                              floatBtn_SaveTxt
${UNISECURE_SECURITY_REQSECDRDOWN}                         dropdownReqSecQuestion
${UNISECURE_DISPLAYIMAGE}                                  userDisplayImage
${UNISECURE_LOGOUT}                                        logOut





${UNISECURE_GRPSEARCHBOX}                                  existingGroupFilter
${UNISECURE_GRPSEARCHED}                                   //*[@id="btnDeleteGroup_0"]

${UNISECURE_USERSEARCHBOX}                                 searchBox
${UNISECURE_USERSEARCHED}                                  //*[@id="user_0"]

${DRAGANDDROPFILEURL}                                      ${CURDIR}/drag-n-drop.js


${Designer}                                                Designer
${Operator}                                                Operator
${BusinessOwner}                                           BusinessOwner


#########################################################################################################
