#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are common accross solutions.
#   Project           :      UniSphere Information Center Automation
#   Author            :      Dinesh Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation   Locators for each element used in the Suite

*** Variables ***
# Login
${SPH/SEC_USERNAME_TXT}                 id=userName
${SPH/SEC_PASSWORD_TXT}                 id=password
${SPH/SEC_LOGIN_BTN}                    id=loginBtn
${SPH/SEC_ACCEPT_BTN}                  id=eusa-accept
${SPH/SEC_WELCOME_PAGE}                 id=navBtn_welcome
${SPH/SEC_ABOUT_BTN}                    id=navBtn_about
${SPH/SEC_CLOSE_ABT_BTN}                id=close-btn
${SPH/SEC_HAMBURGER}                    class=hb-root
${SPH/SEC_DROPDOWN_MENU}                id=dropdownMenu1
${SPH/SEC_PREFERENCES}                  id=goToPreference
${SPH/SEC_DISPLAY_PREFERENCE_CARD}      id=preferenceCardName_0
${SPH/SEC_RECORDSPER_LIST}              id=recordsPerListList
${SPH/SEC_OPTIONS_BTN}                  id=floatBtn_options
${SPH/SEC_SAVEBTN}                      id=floatBtn_SaveTxt
${SPH/SEC_MESSAGE_CENTER}               id=message-content
