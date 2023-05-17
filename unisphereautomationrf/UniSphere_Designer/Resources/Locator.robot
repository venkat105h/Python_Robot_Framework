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


*** Variables ***
#######################SolutionLandingPage######################################################
${SCENEICON}                                               Scene-icon
${SCENEITEM}                                               Scene-item
${ORGANIZATIONICON}                                        Organization-icon
${ORGANIZATIONITEM}                                        Organization-item
${SITEICON}                                                Site-icon
${SITEITEM}                                                Site-item
${ENVIRONMENTICON}                                         Environment-icon
${ENVIRONMENTITEM}                                         Environment-item


${ABOUTLINK}                                               about-link
${UNISPHERELINK}                                           systech360-link
${UNISECURELINK}                                           unisecure-link
${UNITRACELINK}                                            unitrace-link
${UNISERIESLINK}                                           uniseries-link
##################################################################################################

######################UNISPEHERE##################################################################
${UNISPHEREUSERNAMEID}                                     userName
${UNISPHEREPASSWORDID}                                     password
${ROLE_ID}                                                 roleList
${LOGIN_ID}                                                loginBtn
${UNISPHERE_ADMIN_ROLE}                                    Administrator
${UNISPHERE_DESIGNER_ROLE}                                 Designer
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
${UNISPHERE_EDITOR_ADDNEW}                                 newScene
${EDITOR_NAMEINPUT}                                        nameInput





${EDITOR_FLOATBTNOPTIONS}                                  //*[@id="float-btn-icon"]
${EDITOR_SAVE}                                             floatBtn_SaveTxt

${MESSAGEID}                                               message-message

${CARDVIEWBTN}                                             cardViewBtn
${TABLEVIEWBTN}                                            listViewBtn
${CARDSSEARCHBOX}                                          searchBox
${CARDSSEARCHBTN}                                          searchBtn
${UPLOADEDIMAGESRC}                                        https://eng-svt.systechcloud.net/images/public/uniSphere/eng_svt/eng_svt/
${CARDOPTIONSMENU}                                        //*[@id="openMenuOnMouseEnter"]
${CARDBTNOPTIONSMOUSEOVER}                                //*[@id="openMenuOnMouseEnter"]/label/span
${CARDSDELETEBTN}                                         //i[@id="delete-menu-icon"]
${CARDSDUPLICATEBTN}                                      //i[@id="copy-menu-icon"]
${YESBTN}                                                 buttn_YesTxt
${CHECKBOXID}                                             //*[@id="checkBoxSelectALL"]
${TABLEROWS}                                              //table/tbody[2]/tr
${EDITOR_NAME}                                             /td[2]
${EDITOR_UPDATEDBY}                                        /td[4]
${EDITOR_UPDATEDON}                                        /td[5]
${TOGGLEPIN}                                              //*[@id="leftmenuinner "]/div/div/a/span
${TOGGLEDPINLEFT}                                         //span[@class='fa fa-chevron-left']
${TOGGLEDPINNORMAL}                                       //span[@class='fa fa-thumb-tack']
${FIRSTROWNAMETEXT}                                       //tbody/tr[2]/td[2]
########################################################################################################

######################UNISECURE#########################################################################

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
#########################################################################################################
