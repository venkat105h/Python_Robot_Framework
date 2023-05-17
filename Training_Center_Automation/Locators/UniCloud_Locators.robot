#------------------------------------------------------------------
#	Description			:		This locator file contains all the element references that are made from Resources and the test scripts
#	Project				:		UniCloud
#	Author				:		Vikram Nagesh
#	© 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable

*** Settings ***
Documentation		This locator file contains all the element references

*** Variables ***
${CLD_USERNAME_TXT}		            id=userId
${CLD_LOGIN_BTN}                    id=loginbtn-submit
${CLD_WELCOME_LINK}					id=topnavbtn-welcome
${CLD_ADMIN_PARENT_TAB}				xpath=//a[contains(text(), 'Administrator')]
${CLD_TOP_PAGE_HEADER_BTN}          id=pageheadermenu-top
${CLD_CUSTOMERS_CARD}				xpath=//div/h4[contains(text(),'Customers')]
${CLD_ADD_CUSTOMER_BTN}             id=pagebody-add
${CLD_ENG_SVT_TEXT}                 xpath=(//div[contains(@class, 'unitable-text')]/label[contains(@id, 'Engineering SVT')])
${CLD_CUSTOMER_ID}                  xpath=(//datatable-row-wrapper//datatable-body-cell[2]/div/div/label)
${CLD_FEATURE_NAME}                 xpath=(//datatable-row-wrapper//datatable-body-cell[4]/div/div//label)
${CLD_ADD_FEATURE_BTN}              id=pagebody-add
${CLD_TABLE_DROPDOWNS}              xpath=(//datatable-body-cell/div/div/div/div/select)
${CLD_TABLE_VALUES_TEXTBOX}         xpath=(//datatable-body-cell/div/div/div/input)
${CLD_TABLE_TOGGLE_SWITCH}          xpath=(//datatable-body-cell/div/div/div/div/div)
${CLD_TABLE_SAVE_BTN}               id=common-save-0
${CLD_FLOAT_OPTION_BTN}             id=editfloatbtn-top
${CLD_FLOAT_SAVE_BTN}               id=floatBtn_TXT_Save
${CLD_SUCCESS_MESSAGE}              xpath=(//p[@id='message-message'])
${CLD_DELETE_FEATURE_BTN}			id=remove-
${CLD_SUBS_VIDEOS_FEATURE}			xpath=//label[text()='Subscription Videos']

${CLD_WEBTABLE_ELEMENT_ID}			xpath=//unicloud-uni-table/div
${CLD_LAST_PAGE_BTN}				class=datatable-icon-skip
${CLD_LAST_PAGE_BTN_ELEMENT_ID}		xpath=//li[contains(@class, 'pages active')]
${CLD_FIRST_PAGE_BTN}				class=datatable-icon-prev
${CLD_NEXT_PAGE_BTN}				class=datatable-icon-right