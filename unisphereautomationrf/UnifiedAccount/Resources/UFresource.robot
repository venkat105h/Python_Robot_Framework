#-----------------------------------------------------------------------------------------------------------------------
#   Description         :       This resource file is written to be reused by other Robot scrits.
#   Project             :       UniSphere
#   Author              :       Satya R
#   © 2018 Systech International. All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue:
#   - Not Applicable
#
#   Epilogue:
#   - Not Applicable
#-----------------------------------------------------------------------------------------------------------------------
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
Resource          ../Resources/Locator.robot
Resource          ..${/}..${/}Resources${/}COMMON_RESOURCE.robot
#-----------------------------------------------------------------------------------------------------------------------
*** Variables ***
${BROWSER}                                                Chrome
${URL}                                                    SVT
${BASE_URL}                                               eng-${URL}.systechcloud.net
${LOGIN URL}                                              https://${BASE_URL}
${LOGIN URL_Home}                                         https://${BASE_URL}/Home
${LOGIN URL_home1}                                        https://${BASE_URL}/home
${UNISECURE URL}                                          https://${BASE_URL}/UniSecure/#/
${UNITRACE URL}                                           https://${BASE_URL}/login/
${UNISPHERE URL}                                          https://${BASE_URL}/UniSphere
${i}                                                      1
${UNITRACE_ADMINISTRATOR_USERNAME}                        SystechSuperUser
${UNITRACE_ADMINISTRATOR_PASSWORD}                        yuda2030
${PW VALIDDAYS}                                           30
${UNISECURE_ADMINISTRATOR_USERNAME}                       TestSatya
${UNISECURE_ADMINISTRATOR_PASSWORD}                       Test@124
${UNISPHERE_ADMINISTRATOR_USERNAME}                       TestSatya
${UNISPHERE_ADMINISTRATOR_PASSWORD}                       Test@124
${UNISECURE_FIRSTNAME}                                    TestSatya
${UNISECURE_LASTNAME}                                     Reddy
${j}                                                      1
${Designer_Expected}                                      Designer Group
${BROWSERWIDTH}                                          1024
${BROWSERHEIGHT}                                         768
${Solution}                                               UniSecure
#-----------------------------------------------------------------------------------------------------------------------
*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------------

Delete Browser Cookies
    [Documentation]   This keyword is used to delete the cookies in browser.
    Delete All Cookies


Select Expire Password and click on save button
    [Documentation]   This keyword is used to Setup  security policies in the UniSphere/UniSecure system.
    Wait Until Page Contains Element  ${EXPIREPASS_CHKBOX}
    Select Checkbox  ${EXPIREPASS_CHKBOX}
    Mouse Over   ${UNISECURE_USEREDITBUTTONMOUSEHOVER}
    Click Element   ${UNISECURE_USERSAVE}
    Wait Until Page Contains Element  ${UNISECURE_SAVEMESSAGE}
    page should contain element  ${UNISECURE_SAVEMESSAGE}


Select Account Disabled and click on save button
    [Documentation]   This keyword is used to Setup  security policies in the UniSphere/UniSecure system.
    Wait Until Page Contains Element  ${ACCOUNTDISABLE_CHKBOX}
    Select Checkbox  ${ACCOUNTDISABLE_CHKBOX}
    Mouse Over   ${UNISECURE_USEREDITBUTTONMOUSEHOVER}
    Click Element   ${UNISECURE_USERSAVE}
    Wait Until Page Contains Element  ${UNISECURE_SAVEMESSAGE}
    page should contain element  ${UNISECURE_SAVEMESSAGE}
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
