#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by Navigator_Menu with the common variables.
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
${BROWSER}                                                gc
${URL}                                                    SVT
${Solution}                                               Systech360
${Role}                                                   Designer
${BASE_URL}                                               eng-${URL}.systechcloud.net
${LOGIN URL}                                              https://${BASE_URL}
${UNISECURE URL}                                          https://${BASE_URL}/UniSecure/#/
${UNITRACE URL}                                           https://${BASE_URL}/login/
${UNISPHERE URL}                                          https://${BASE_URL}/Systech360/#/
${UNISECURE_ADMIN_USERNAME}                               AdminUser2
${UNISECURE_ADMIN_PASSWORD}                               Test@101

${UNISECURE_DESIGNER_USERNAME}                            DesUser1
${UNISECURE_OPERATOR_PASSWORD}                            Test@101

${UNISECURE_ADMIN_ROLE}                                   Administrator
${PRODUCTBGCOLOR}                                         rgba(84, 154, 206, 1)
${BROWSERWIDTH}                                           1024
${BROWSERHEIGHT}                                          768
