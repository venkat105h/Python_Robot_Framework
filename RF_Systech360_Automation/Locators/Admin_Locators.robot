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
${SEC_SECURITY_POLICIES_CARD}           id=preferenceCardName_4
${S360_SECURITY_POLICIES_CARD}          id=preferenceCardName_1
${SEC_USERGROUPS_CARD}                  id=preferenceCardName_0
${S360_USERGROUPS_CARD}                 id=preferenceCardName_0
${SEC/S360_REQ_SEC_QUES_CHKBOX}         id=reqSecQuestion
${CHOOSE_BUTTON}                       (//*[@class="uni-button"])[1]
${SEC/S360_ADD_NEW_USER_BTN}            id=lblAddNewUser
${SEC/S360_USERNAME_TXT_BOX}            id=txtBoxUserName
${SEC/S360_CENCEL_BUTTON}               //*[@id="floatBtn_CancelTxt"]
${SEC/S360_CENCEL_BUTTON}               //*[@id="floatBtn_CancelTxt"]
${SEC/S360_USERNAME_ERR_MSG}            xpath=//input[@id='txtBoxUserName']/../div/div[contains(@id,'err') and contains(@id,'UserName')]
${SEC/S360_PASSWORD_TXT_BOX}            id=txtPassword
${SEC/S360_VER_PASSWORD_TXT_BOX}        id=txtVerifyPwdTxt
${SEC/S360_FIRST_NAME_TXT_BOX}          id=txtFirstName
${SEC/S360_FNAME_ERR_MSG}               xpath=//input[@id='txtFirstName']/../div/div[contains(@id,'err') and contains(@id,'FirstName')]
${SEC/S360_LAST_NAME_TXT_BOX}           id=txtLastName
${SEC/S360_LNAME_ERR_MSG}               xpath=//input[@id='txtLastName']/../div/div[contains(@id,'err') and contains(@id,'LastName')]
${SEC/S360_EMAIL_TXT_BOX}               xpath=//input[@type='email']
${SEC/S360_EMAIL_ERR_MSG}               xpath=//input[@type='email']/../div/div[contains(@id,'err') and contains(@id,'Email')]
${SEC/S360_GRAVATOR_CHK_BOX}            id=chkSyncGravator
${SEC/S360_CHANGE_PIC_BTN}              id=changePicWithoutGravator
${SEC/S360_EXPIRE_PWD_CHK_BOX}          id=txtExpirePwd
${SEC/S360_ACC_DISABLE_CHK_BOX}         id=chkAccountDisable
${SEC/S360_SEL_ALL_GRP_CHK_BOX}         id=chkSelectAllGroups

${SEC/S360_ADD_NEW_GROUP_BTN}           xpath=//i[@id='newGroup']
${SEC/S360_GROUP_NAME_TXT_BOX}          id=txtBoxNewGroupName
${SEC/S360_GROUP_DESC_TXT_BOX}          id=txtBoxNewGroupDesc
${SEC/S360_UGROUP_NAME_TXT_BOX}         id=txtBoxGroupName_0
${SEC/S360_ROLES_TXT_BOX}               //div[@class="form-control" and @dnd-droppable]
${SEC/S360_SAVE_GROUP_BTN}              id=btnCreateNewGrp
${SEC/S360_UPDATE_GRP_BTN}              xpath=(//*[contains(@id,'btnUpdateGroup_')])
${SEC/S360_CANCEL_GROUP_BTN}            id=btnCancelUpdateGroup_0
${SEC/S360_GROUP_SEARCH_BOX}            id=existingGroupFilter
${SEC/S360_GROUP_NAME_TEXT}             xpath=(//a[contains(@id,'btnEditGroup1_')])
${SEC/S360_EDIT_GROUP_BTN}              xpath=(//span[contains(@id,'btnEditGroup2_')])
${SEC/S360_DELETE_GROUP_BTN}            xpath=(//*[contains(@id,'btnDeleteGroup_')])
${SEC/S360_OPEN_GROUP_EDITOR_BTN}       id=btnEditGroup3_0
${SEC/S360_ROLES_TAB}                   id=lblRoles
${SEC/S360_FIRST_USER_IMAGE}            xpath=(//*[@id='imageUser_0'])
${SEC/S360_USER_IMAGES}                 xpath=(//*[contains(@id, 'imageUser_')])
${SEC/S360_USERNAMES_TEXT}              xpath=(//h5[contains(@id,'userName_')]/span)
${SEC/S360_DELETE_USER_BTN}             xpath=(//*[contains(@id,'btnDeleteUser_')])

${SEC/S360_ADMIN_ROLE}                  (//*[contains(@id,"role_")]//img[contains(@src,"_icon_administrator")])[1]
${SEC/S360_DESIGNER_ROLE}               (//*[contains(@id,"role_")]//img[contains(@src,"_icon_designer")])[1]
${SEC/S360_OPERATOR_ROLE}               (//*[contains(@id,"role_")]//img[contains(@src,"_icon_inspector")])[1]
${SEC/S360_BUSINESS_OWNER_ROLE}         (//*[contains(@id,"role_")]//img[contains(@src,"_icon_businessowner")])[1]
${SEC/S360_INSPECTOR_ROLE}              (//*[contains(@id,"role_")]//img[contains(@src,"_icon_operator")])[1]
${SEC/S360_UNISECURE_SERVER_ROLE}       (//*[contains(@id,"role_")]//img[contains(@src,"_icon_productionoperator")])[1]

${SEC/S360_ADMIN_ROLE_TAB}              //*[contains(@id,"role_")]/img[contains(@src,"_icon_administrator")]
${SEC/S360_DESIGNER_ROLE_TAB}           //*[contains(@id,"role_")]/img[contains(@src,"_icon_designer")]
${SEC/S360_OPERATOR_ROLE_TAB}           id=role_2
${SEC/S360_BUSINESS_OWNER_ROLE_TAB}     //*[contains(@id,"role_")]/img[contains(@src,"_icon_businessowner")]
${SEC/S360_INSPECTOR_ROLE_TAB}          //*[contains(@id,"role_")]/img[contains(@src,"_icon_operator")]
${SEC/S360_UNISECURE_SERVER_ROLE_TAB}   //*[contains(@id,"role_")]/img[contains(@src,"_icon_productionoperator")]

${SEC/S360_FILTER_USER_DD}              id=listFilterCriteria
${SEC/S360_FILTER_USERNAME}             UserNameTxt
${SEC/S360_FILTER_FIRSTNAME}            FirstNameTxt
${SEC/S360_FILTER_LASTNAME}             LastNameTxt
${SEC/S360_ROLES_IN_GROUPS}             xpath=(//a[contains(@id, 'role_')])
${SEC/S360_ROLES_IN_GROUPS_ICON}        xpath=(//a[contains(@id, 'role_')]/img)
${SEC/S360_OPERATOR_ROLE_ICON}          xpath=(//a[contains(@id, 'role_')]/img)[3]
${SEC/S360_ROLES_IN_GROUPS_CHK_BOX}     xpath=(//a[contains(@id, 'role_')]/input)
${SEC/S360_USER_GROUP_NAME_TEXT}        xpath=(//div[contains(@id, 'name_')])
${SEC/S360_USER_GROUP_CHK_BOX}          xpath=(//input[contains(@id, 'chkUserGroup_')])
${SEC/S360_SEND_INVITE_BTN}             id=btnSendInvite
${SEC/S360_SAVE_SEND_INVITE_BTN}        id=btnSaveAndSendInvite
${SEC/S360_SAVE_SENDINVITE_CU_BTN}      id=btnSaveAndSendInvite

${SEC/S360_USER_TOGGLE_BTN}             id=btnExistingUsersToggle
${SEC/S360_GROUP_TOGGLE_BTN}            id=btnExistingGroupsToggle

# Expire Passoword dialog
${SEC/S360_RESET_PWD_HEADER}            id=resetPasswordHeading
${SEC/S360_RESET_PWD_TXT_BOX}           id=passwordInput
${SEC/S360_VER_RESET_PWD_TXT_BOX}       id=verifyPwdInput
${SEC/S360_RESET_NEXT_BTN}              id=nextBtn

${SEC/S360_ADM_POPUP_NO_BTN}            id=buttn_CancelTxt
${SEC/S360_ADM_POPUP_YES_BTN}           id=buttn_SaveTxt

#changes by Akash - added locators
${SEC/S360_ADMIN_BUTTON}                id=Administrator
${SEC_AUDIT_LOG_CARD}                   id=preferenceCardName_5
${SEC_AUDIT_LOG_FILTER_1}               id=newFilter

