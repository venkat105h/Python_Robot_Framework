#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in the Test cases`.
#   Project           :      Preferences Automation
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
${SEC/S360_SP_SAME_PWD_CHKBOX}             id=samePWD
${SEC/S360_SP_DISABLE_ACC_CHKBOX}          id=lockAccount
${SEC/S360_SP_REQ_SEC_QUES_CHKBOX}         id=reqSecQuestion
${SEC/S360_SP_FORCE_PWD_CHANGE_CHKBOX}     id=forcePassword

${SEC/S360_SP_SAME_PWD_DD}                 id=dropdownpassOccur
${SEC/S360_SP_DISABLE_ACC_DD}              id=dropdownLockAttempts
${SEC/S360_SP_REQ_SEC_QUES_DD}             id=dropdownReqSecQuestion
${SEC/S360_SP_FORCE_PWD_CHANGE_DAYS_DD}    id=dropdownForcePwd
${SEC/S360_SP_FORCE_PWD_CHANGE_MONTH_DD}   id=dropdownForcePwdMMDD
${SEC/S360_APPROVE_SUCC_MSG}               //*[@id="Layer_1"]

${SEC/S360_SP_LOGIN_SEC_QUES_TXT}          xpath=(//*[contains(@id,'lbluserSecQuestion_')])
${SEC/S360_SP_LOGIN_SEC_ANS_TXTBOX}        xpath=(//*[contains(@id,'txtAnswerSetup_')])
${SEC/S360_SP_SEC_QUES_OK_BTN}             id=btnOkSecurityQuestionSetup
${SEC/S360_SP_SEC_QUES_CANCEL_BTN}         id=btnCancelSecurityQuestionSetup
${SEC/S360_SP_EDIT_SEC_QUE_BTN}            (//*[@class="fa fa-pencil-square-o pencil-square-icon ng-star-inserted"])
${SEC/S360_SP_UPDATE_SEC_QUE_BTN}          xpath=(//*[contains(@id,'btnUpdateSecurityQuestionUser_')])
${SEC/S360_SP_UPDATE_SEC_QUE_DD}           xpath=(//*[contains(@id,'dropdownSecurityQuestionUser_')])
${SEC/S360_SP_UPDATE_BUTTON}               //*[@class="fa fa-pencil-square-o pencil-square-icon ng-star-inserted"]
${SEC/S360_SP_SAVE_BUTTON}                  (//*[@id="btn-icon"])[1]


${SEC/S360_SP_CHANGE_SEC_QUES_TXT}         xpath=(//*[contains(@id,'lblSecurityQuestionUser_')])
${SEC/S360_SP_CHANGE_SEC_ANS_TXTBOX}       xpath=(//*[contains(@id,'txtAnswerSecurityQuestionUser_')])
${SEC/S360_SP_SEC_QUESTIONS_ANSWERS}       //*[@id="txtAnswerSetup_

${SEC/S360_SP_ACC_DISABLE_POPUP}           xpath=(//*[@id='divPopModalMessage'])[2]

${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}         xpath=(//*[contains(@id,'lblSecurityQuestionUnlock_')])
${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX}      xpath=(//*[contains(@id,'txtAnswerUnlock_')])
${SEC/S360_SP_SEC_QUES_CANCEL_BTN}         id=btnCancelSecurityQuestionSetup

${SEC/S360_SP_DUPLICATE_ERR_MSG}           //*[@id="DuplicateAnswerErrorMsg"]
${SEC/S360_SP_INCORRECT_ANS_ERR_MSG}       id=successErrMessageSecQueUser
${SEC/S360_USERS/GROUPS}                  //*[@id="preferenceCardHeadSection_0"]
${SEC/S360_DISABLED_SCOPE_POLICY}          //*[@class="thumbnail uni-card-2-grey"]
${SEC/S360_SECURITY_POLICY_CARD}             //*[@id="preferenceCardName_1"]
${SEC/S360_SECURITY_POLICY_DROPDOWN}           //*[@id="dropdownReqSecQuestion"]
${SEC/S360_DISABLE_SCOPE_POLICY}           //*[@id="enforceScopPolicy"]
${SEC/S360_ADMIN_PAGE}                      //*[@id="homeSelected"]
${SEC/S360_ADMIN_PAGE}                      //*[@id="homeSelected"]
${SEC/S360_ENABLED_SCOPE_POLICY}             //*[@class="thumbnail uni-card-2"]
