#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in Site Defined Privilege Automation.
#   Project           :      Site Defined Privilege Automation
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
${SEC_SDP_ADD_SDP_BTN}                  id=newSiteDefinedPrivilege
${SEC_SDP_NAME_INPUT}                   xpath=(//input[contains(@id, 'name_') and contains(@id, '_input')])
${SEC_SDP_DATA_TYPE_INPUT}              xpath=(//div[contains(@id, 'data_type_') and contains(@id, '_list')]/select)
${SEC_SDP_VALUE_INPUT}                  xpath=(//input[contains(@id, 'value_') and contains(@id, '_input')])
${SEC_SDP_DESCRIPTION_INPUT}            xpath=(//input[contains(@id, 'description_') and contains(@id, '_input')])
${SEC_SDP_ROLES_LIST}                   xpath=(//div[contains(@id, 'role_') and contains(@id, '_list')])
${SEC_SDP_ROLES_SEARCH_BOX}             xpath=(//div[contains(@id, 'role_') and contains(@id, '_list')]//input[@role='textbox'])
${SEC_SDP_ADMIN_ROLE_CHKBOX_ID}         xpath=(//li[contains(@class, 'ui-multiselect-item')])[1]
${SEC_SDP_BO_ROLE_CHKBOX_ID}            xpath=(//li[contains(@class, 'ui-multiselect-item')])[6]
${SEC_SDP_DESIGNER_ROLE_CHKBOX_ID}      xpath=(//li[contains(@class, 'ui-multiselect-item')])[2]
${SEC_SDP_INSPECTOR_ROLE_CHKBOX_ID}     xpath=(//li[contains(@class, 'ui-multiselect-item')])[3]
${SEC_SDP_OPERATOR_ROLE_CHKBOX_ID}      xpath=(//li[contains(@class, 'ui-multiselect-item')])[4]
${SEC_SDP_UNISER_ROLE_CHKBOX_ID}        xpath=(//li[contains(@class, 'ui-multiselect-item')])[5]
${SEC_SDP_SAVE_CHANGES_BTN}             xpath=(//button[contains(@id, 'ct-save-btn-')])
${SEC_SDP_CANCEL_CHANGES_BTN}           xpath=(//button[contains(@id, 'ct-cancel-btn')])
${SEC_SDP_EDIT_BTN_ID}                  id=ct-edit-btn-
${SEC_SDP_RESTORE_BTN_ID}               id=ct-reset-btn-
${SEC_SDP_DELETE_BTN_ID}                id=ct-delete-btn-
${SEC_SDP_EDIT_BTN}                     xpath=(//*[contains(@id, 'ct-edit-btn-')])
${SEC_SDP_DELETE_BTN}                   xpath=(//*[contains(@id, 'ct-delete-btn-')])
${SEC_SDP_RESET_BTN}                    xpath=(//button[contains(@id, 'ct-reset-btn-')])

${SEC_SDP_NAME_TEXT}                    xpath=(//label[contains(@id, 'name_')])
${SEC_SDP_DATA_TYPE_TEXT}               xpath=(//label[contains(@id, 'data_type_') and contains(@id, '_Txt')])
${SEC_SDP_VALUE_TEXT}                   xpath=(//label[contains(@id, 'value_') and contains(@id, '_Txt')])
${SEC_SDP_DESCRIPTION_TEXT}             xpath=(//label[contains(@id, 'description_') and contains(@id, '_Txt')])
${SEC_SDP_ROLES_TEXT}                   xpath=(//div[contains(@id, 'role_') and contains(@id, '_cell')]/label)
${SEC_SDP_VALUES_DD}                    xpath=(//select[contains(@id, 'value_') and contains(@id, '_list')])

${SEC_SDP_NAVIGATION_PAGES}             xpath=(//li[contains(@class, 'pages')])
${SEC_SDP_ACTIVE_PAGE}                  xpath=(//li[contains(@class, 'pages') and contains(@class, 'active')])
${SEC_SDP_FIRST_PAGE_BTN}               xpath=(//i[contains(@class, 'datatable-icon-prev')])
${SEC_SDP_PREVIOUS_PAGE_BTN}            xpath=(//i[contains(@class, 'datatable-icon-left')])
${SEC_SDP_NEXT_PAGE_BTN}                xpath=(//i[contains(@class, 'datatable-icon-right')])
${SEC_SDP_LAST_PAGE_BTN}                xpath=(//i[contains(@class, 'datatable-icon-skip')])