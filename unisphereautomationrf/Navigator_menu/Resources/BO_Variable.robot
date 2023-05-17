#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by Navigator_Menu for Business Owner role. .
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
...               by the imported Selenium2Library.


*** Variables ***
###########################Locators#######################################
${USERNAME_ID}                                             userName
${PASSWORD_ID}                                             password
${UNISPHEREABOUTID}                                        navBtn_about
${UNISPHERE_WELCOME_ID}                                    navBtn_welcome
${UNISPHERE_USERS_GROUP_ID}                                preferenceCardName_0
${UNISPHERE_DISPLAYUSERNAME}                               userDisplayImage
${UNISPHERE_DESIGNERDISPLAYID}                             goToDesigner
${ROLE_ID}                                                 roleList
${LOGIN_ID}                                                loginBtn
${UNISECURE_USERNAME}                                      AdminUser1
${UNISECURE_PASSWORD}                                      Test@101
${ROLE_ROLE_ID}                                            Business Owner
