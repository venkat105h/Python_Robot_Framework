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
${SEC/S360_PREF_DISPLAY_CARD}            id=preferenceCardName_0
${SEC/S360_PREF_ACC_INFO_CARD}           id=preferenceCardName_1

${SEC/S360_PREF_FNAME_TXT_FIELD}         id=firstNameValue
${SEC/S360_PREF_LNAME_TXT_FIELD}         id=lastNameValue
${SEC/S360_PREF_EMAIL_TXT_FIELD}         id=emailValue
${SEC/S360_PREF_PWD_TXT_FIELD}           id=passwordValue
${SEC/S360_PREF_CPWD_TXT_FIELD}          id=verifyPwdValue
${SEC/S360_PREF_CHANGE_CHALL_QUES_LINK}  id=changeSecQuestion
${SEC/S360_PREF_FNAME_ERROR_MESSAGE}     id=firstName_requiredErrLbl
${SEC/S360_PREF_LNAME_ERROR_MESSAGE}     id=lastName_requiredErrLbl
${SEC/S360_PREF_EMAIL_ERROR_MESSAGE}     id=email_requiredErrLbl


${SEC/S360_PREF_MSGBAR_LOCATION_DD}      id=msgBarLocationList
${SEC/S360_PREF_DEFAULT_LAYOUT_DD}       id=defaultLayoutList
${SEC/S360_PREF_MAXMSG_LIST_DD}          id=maxMessagesList
${SEC/S360_PREF_CARDS_PERPAGE_DD}        id=numOfCardsList
${SEC/S360_PREF_DEFAULT_SORTING_DD}      id=defaultSortingList
${SEC/S360_PREF_RECORDS_PERLIST_DD}      id=recordsPerListList
${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}    xpath=//label[@id='enablePrefixChkBoxLbl']
${SEC/S360_PREF_ENABLE_HIDDEN_MSG_BTN}   id=enableMessagesBtn
${SEC/S360_PREF_CLOSE_FORM_BTN}          id=form_closeBtn
${SEC/S360_PREF_FIRST_NAME_FIELD}        id=firstNameValue
${SEC/S360_PREF_LAST_NAME_FIELD}         id=lastNameValue
${SEC/S360_PREF_EMAIL_FIELD}             id=emailValue
${SEC/S360_PREF_PASSWORD_FIELD}          id=passwordValue
${SEC/S360_PREF_VERIFY_PWD FIELD}        id=verifyPwdValue
${SEC/S360_PREF_CHANGE_CHALLENGE_QUE_LINK}  id=changeSecQuestion

${SEC/S360_PREF_PWD_REQ_ERROR_MESSAGE}   id=requiredErr
${SEC/S360_PREF_MIN_LEN_ERROR_MESSAGE}   id=minLenErr
${SEC/S360_PREF_SPL_CHAR_ERROR_MESSAGE}  id=specialCharErr
${SEC/S360_PREF_MIN_NUM_ERROR_MESSAGE}   id=minNumberErr
${SEC/S360_PREF_CAP_CHAR_ERROR_MESSAGE}  id=minCapCharErr
${SEC/S360_PREF_SMALL_CHAR_ERROR_MESSAGE}  id=minSmallCharErr
${SEC/S360_PREF_NO_SPACE_ERROR_MESSAGE}  id=noSpaceChar
${SEC/S360_PREF_PWD_ERROR_MSG_LIST}      xpath=(//*[@id='errorList']/li)

${SEC/S360_PREF_RESTORE_DEFAULT_BTN}     id=floatBtn_RestoreDefaultTxt