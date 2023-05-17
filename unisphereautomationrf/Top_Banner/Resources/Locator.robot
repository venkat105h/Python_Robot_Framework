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
${ENVIRONMENT}                                             SVT
${ABOUTLINK}                                               about-link
${SystechOneLink}                                          systech-one-link
${SYSTECHONEMENUXPATH}                                     //*[@id="menu-item-2887"]
${UNISPHERELINK}                                           unisphere-link
${UNISECURELINK}                                           unisecure-link
${UNITRACELINK}                                            unitrace-link
${UNISERIESLINK}                                           uniseries-link
${TWITTERLINK}                                             twitter-link
${FACEBOOKLINK}                                            facebook-link
${GOBACKBUTTONID}                                          cancel-external-btn
${CONTINUEBUTTONID}                                        continue-external-btn
${LINKEDINLINK}                                            linkedin-link
${CONTACTUSLINK}                                           contact-us-link
${LOGO_LINK}                                               logo-link
${MARKETCIRCLEID}                                          //*[@class = "ball"]
${MARKETVIDEOID}                                           play-icon
##################################################################################################

######################UNITRACE####################################################################
${UNITRACEUSERNAMEID}                                      id_auth-username
${UNITRACE_SEARCHUSERSID}                                  searchbar
${UNITRACE_USERSEARCHSUBMIT}                               //*[@id="changelist-search"]/div/input[2]
${UNITRACE_SUPERUSERPERMISSIONS_ID}                        id_is_superuser
${UNITRACE_STAFFSTATUSPERMISSIONS_ID}                      id_is_staff
##################################################################################################

######################UNISPEHERE##################################################################
${UNISPHERE_ABOUT_IMG}                                     //*[@id="main-content"]//img[1]
${UNISPHERE_ABOUT_VERSION_LABEL}                           //*[@id="main-content"]//p[1]
${UNISPHERE_ABOUT_BUILD_LABEL}                             //*[@id="systech-about"]//p[2]
${UNISPHERE_ABOUTCOPYRIGHTS_LABEL}                         //*[@id="systech-about"]//p[3]
${UNISPHEREUSERNAMEID}                                     userName
${UNISPHEREABOUTID}                                        navBtn_about
${UNISPHERE_WELCOME_ID}                                    navBtn_welcome
${UNISPHERE_USERS_GROUP_ID}                                preferenceCardName_0
${UNISPHERE_DESIGNER_ID}
${UNISPHERE_USERSEARCH_ID}                                 searchBox
${UNISPHERE_SEARCHUSERID}                                  user_0
${UNISPHERE_USERALLGROUPS}                                 //*[@id="addUser"]/div[2]/div[4]/div/table/tbody/tr[1]/th[1]/input
${UNISPHERE_ADDUSERID}                                     newUser
${UNISPHERE_ADDGROUP}                                      newGroup
${UNISPHERE_USERSAVE}                                      btnSave
${UNISPHERE_USEREDITBUTTONMOUSEHOVER}                      btnOptions
${UNISPHERE_SAVEMESSAGE}                                   message-message
${UNISPHERE_UNITRACETOPLINK}                               navBtn_UniTrace
${UNISPHERE_UNISECURETOPLINK}                              dropdownMenu2
${UNISPHERE_DESIGNER_UNISECURETOPLINK}                     //a[@id='tobnavbtn_home']/div[1 and @class='dropdown']/a[1 and @class='dropdown-toggle']
${UNISPHERE_UNISECURETOPLINK_ADMINISTRATOR}                navBtn_GotoAdministrator
${UNISPHERE_UNISECURETOPLINK_DESIGNER}                     navBtn_GotoDesigner
${UNISPHERE_UNISECURETOPLINK_OPERATOR}                     navBtn_GotoOperator
${UNISPHERE_UNISECURETOPLINK_BUSINESSOWNER}                navBtn_GotoBusiness
${UNISPHERE_UNISECURETOPLINK_DISADMINISTRATOR}             //a[@id='navBtn_GotoAdministrator' and @class='disabledAnchor' ]
${UNISPHERE_UNISECURETOPLINK_DISDESIGNER}                  //a[@id='navBtn_GotoDesigner' and @class='disabledAnchor' ]
${UNISPHERE_UNISECURETOPLINK_DISOPERATOR}                  //a[@id='navBtn_GotoOperator' and @class='disabledAnchor' ]
${UNISPHERE_UNISECURETOPLINK_DISBUSINESSOWNER}             //a[@id='navBtn_GotoBusiness' and @class='disabledAnchor' ]
${UNISPHERE_DESIGNER_SCENE}                                Scene-item
${UNISPHERE_OPERATOR_Scene}                                Scene-item
${PREFERENCES_ADMINROLE}                                   goToAdministrator
${PREFERENCES_DESIGNERROLE}                                goToDesigner
${PREFERENCES_OPERATORROLE}                                goToOperator
${PREFERENCES_BOROLE}                                      goToBusiness Owner
${ADMINISTRATOR_TOPNAV}                                    navBtn_administrator
${DESIGNER_TOPNAV}                                         navBtn_designer
${OPERATOR_TOPNAV}                                         navBtn_Operator
${BO_TOPNAV}                                               navBtn_businessOwner
########################################################################################################

######################UNISECURE#########################################################################
${UNISECURE_WELCOME_ID}                                    navBtn_welcome
${UNISECUREUSERNAMEID}                                     userName
${UNISECURE_USERS_GROUP_ID}                                preferenceCardName_1
${UNISECURE_SECURITY_GROUP_ID}                             preferenceCardHead_5
${UNISECURE_USERSEARCH_ID}                                 searchBox
${UNISECURE_SEARCHUSERID}                                  user_0
${UNISECURE_USERALLGROUPS}                                 //*[@id="addUser"]/div[2]/div[4]/div/table/tbody/tr[1]/th[1]/input
${UNISECURE_USERSAVE}                                      btnSave
${UNISECURE_USEREDITBUTTONMOUSEHOVER}                      btnOptions
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
${UNISECURE_DESIGNER_FAMILYICON}                           Family-icon
${UNISECURE_OPERATOR_ACTION}                               Action-icon
${UNISECURE_PWDOCC_CHECKBOX}                               samePWD
${UNISECURE_DISACC_CHECKBOX}                               lockAccount
${UNISECURE_REQSEC_CHECKBOX}                               reqSecQuestion
${UNISECURE_FORPASS_CHECKBOX}                              forcePassword
${UNISECURE_SECURITY_FLOATBTN}                             float-btn-icon
${UNISECURE_SECURITY_SAVEBTN}                              floatBtn_SaveTxt
${UNISECURE_SECURITY_REQSECDRDOWN}                         dropdownReqSecQuestion
${S360_ADD_SCENE}                                          id=newScene
${SEC/S360_NAME_TXT}                                       id=nameInput
${S360_PICKLIST_ITEM}                                      id=pick_item_0
########################################################################################################
