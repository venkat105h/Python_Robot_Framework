#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by .
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
Library           String
Library           robot.libraries.DateTime
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Resources/Keyword.robot


*** Variables ***
${BROWSER}                                                gc
${ENVIRONMENT}                                            SVT
${SERVER_SVT}                                             eng-svt.systechcloud.net
${SERVER_DEV}                                             eng-dev.systechcloud.net
${SERVER_QA}                                              eng-qa.systechcloud.net
${LOGIN URL_SVT}                                          https://${SERVER_SVT}
${LOGIN URL_QA}                                           https://${SERVER_QA}
${LOGIN URL_DEV}                                          https://${SERVER_DEV}
${UNISECURE URL_SVT}                                      https://${SERVER_SVT}/UniSecure/#/
${UNISECURE URL_QA}                                       https://${SERVER_QA}/UniSecure/#/
${UNISECURE URL_DEV}                                      https://${SERVER_DEV}/UniSecure/#/
${UNITRACE URL_SVT}                                       https://${SERVER_SVT}/login/?next=/
${UNITRACE URL_QA}                                        https://${SERVER_QA}/login/?next=/
${UNITRACE URL_DEV}                                       https://${SERVER_DEV}/login/?next=/
${UNISPHERE URL_SVT}                                      https://${SERVER_SVT}/Systech360/#/
${UNISPHERE URL_QA}                                       https://${SERVER_QA}/Systech360/#/
${UNISPHERE URL_DEV}                                      https://${SERVER_DEV}/Systech360/#/
${UNISECURE_DESIGNER_USERNAME}                            TestSatya
${UNISECURE_DESIGNER_PASSWORD}                            Test@124
${UNISPHERE_DESIGNER_USERNAME}                            TestSatya
${UNISPHERE_DESIGNER_PASSWORD}                            Test@124
${ROLE}                                                   Administrator
${DesignerRole}                                           Designer
${UNISECURE_ADMIN_USERNAME}                               TestSatya
${UNISECURE_ADMIN_PASSWORD}                               Test@124
${UNISECURE_ADMIN_ROLE}                                   Administrator
${DeleteSceneMsgID}                                       Scene 'agbra5' has been successfully moved to the trashcan
${Test_SceneName}                                         TopBanner
${S360_SCENE_ITEM}                                        id=Scene-item