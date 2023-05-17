#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in Information Center Automation.
#   Project           :      UniSphere Operator Automation
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
Documentation   Locators for each element used in TestSuite

*** Variables ***
${S360_RC_REQUEST_COUNT_HAM}         xpath=//span[contains(@class, 'requestindicator') and not(contains(@class, 'link'))]
${S360_RC_REQUEST_COUNT_MENU}        xpath=//span[contains(@class, 'linkrequestindicator')]
${S360_RC_REFRESH_BTN}               id=refreshBtn
${S360_RC_REQUEST_TYPE_TEXT}         xpath=(//*[contains(@id,'request_type_') and contains(@id,'_Txt')])
${S360_RC_REQUEST_STATE_TEXT}        xpath=(//*[contains(@id,'state_') and contains(@id,'_Txt')])
${S360_RC_REQUESTOR_TEXT}            xpath=(//*[contains(@id,'requestor_') and contains(@id,'_Txt')])
${S360_RC_UPDATED_ON_TEXT}           xpath=(//*[contains(@id,'updated_on_') and contains(@id,'_Txt')])
${S360_RC_NODE_NAME_TEXT}            xpath=(//*[contains(@id,'node_') and contains(@id,'_Txt')])
${S360_RC_RESPONSE_TEXT}             xpath=(//*[contains(@id,'response_') and contains(@id,'_Txt')])

${SEC_RC_DELETE_REQUEST_BTN}         xpath=(//button[contains(@class,'fa-trash')])
${SEC_RC_DOWNLOAD_REQUEST_BTN}       xpath=(//button[contains(@class,'fa-download')])