#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by Top_Banner
#	Project				:		Systech360 Automation
#	Author				:		Dinesh K / Vikram N
#	© 2019 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Pre-conditions / Pre-requisites:
#	- Not Applicable
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

*** Variables ***
${BROWSER}                                                gc
${URL}                                                    SVT
${Solution}                                               Systech360
${BROWSERWIDTH}                                           1366
${BROWSERHEIGHT}                                          768
${BASE_URL}                                               eng-${URL}.systechcloud.net
${LOGIN URL}                                              https://${BASE_URL}
${UNISECURE URL}                                          https://${BASE_URL}/UniSecure/#/
${UNITRACE URL}                                           https://${BASE_URL}/login/
${UNISPHERE URL}                                          https://${BASE_URL}/Systech360/#/
${UNISERIES_USERNAME_ID}                                  userName
${UNISECURELINK}                                          //a[@id="unisecure-link"]
${UNISPHERELINK}                                          //*[@id="systech360-link"]
${UNISERIESLINK}                                          //a[@id="systech360-link"]
${UNISPHEREUSERNAMEID}                                     userName
${UNISPHEREPRODUCTBGCOLOR}                                rgba(84, 154, 206, 1)
${UNISECUREPRODUCTBGCOLOR}                                rgba(0, 138, 221, 1)
${UNISECURE_ADMIN_USERNAME}                               TestSatya
${UNISECURE_ADMIN_PASSWORD}                               Test@124
${UNISECURE_ADMIN_ROLE}                                   Administrator
########################################################################################################################
