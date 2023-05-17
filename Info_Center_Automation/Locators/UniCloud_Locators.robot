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
${CLD_USERNAME_TXT}		                                id=userId
${CLD_LOGIN_BTN}                                        id=loginbtn-submit
${CLD_WELCOMELINK_ELEMENT_ID}							id=topnavbtn-welcome
${CLD_ADMIN_PARENTTAB_ELEMENT_ID}						xpath=//a[contains(text(), 'Administrator')]
${CLD_TOPPAGE_HEADER_BTN_ELEMENT_ID}					id=pageheadermenu-top
${CLD_INFOCENTER_CARD_ELEMENT_ID}						xpath=//div/h4[contains(text(),'Info Center')]
${CLD_ADD_INFOCENTER_ELEMENT_ID} 						id=newFileAttribute
${CLD_INFOCENTER_DESC_AND_TAGS_EDITBOX_ELEMENT_ID} 		//div[@class='unitable-text']//input[@class='text-input']
${CLD_INFOCENTER_VER_EDITBOX_ELEMENT_ID}				//datatable-body-cell[4]//input
${CLD_INFOCENTER_DESC_EDITBOX_ELEMENT_ID}				//datatable-body-cell[8]//input
${CLD_INFOCENTER_TAGS_EDITBOX_ELEMENT_ID}				//datatable-body-cell[10]//input
${CLD_INFOCENTER_PUBLISHED_DATE_ELEMENT_ID}				date
${CLD_DRAG_OR_CLICK_ELEMENT_ID}  						xpath=//span[contains(text(),'Click to add a file')]
${CLD_DRAG_OR_CLICK_FILEUPLOAD_ELEMENT_ID}				xpath=//input[@type='file']
${CLD_WEBTABLE_ROWELEMENT_ID}							xpath=(//div[contains(@class, 'custom-dropdown')]/select)
${CLD_SAVE_ELEMENT_ID}									xpath=//button[@id='common-save-0']
${CLD_ALWAYS_APPROVE_STATUS}							${TRUE}
${CLD_EDIT_NEW_ROWDATA_INTABLE_ELEMENT_ID}				xpath=//button[@id='common-edit-0']
${CLD_APPROVES_WITHIN_WEBTABLE_ELEMENT_ID}				//div[@class='toggle-switch']
${CLD_DELETE_BTN_ONPOPUP_ELEMENT_ID}					xpath=//div[@class='modal-footer']/button[text()='Delete']
${CLD_WEBTABLE_ELEMENT_ID}								xpath=//unicloud-uni-table/div
${CLD_LAST_PAGE_BTN}									class=datatable-icon-skip
${CLD_LAST_PAGE_BTN_ELEMENT_ID}							xpath=//li[contains(@class, 'pages active')]
${CLD_FIRST_PAGE_BTN}									class=datatable-icon-prev
${CLD_NEXT_PAGE_BTN}									class=datatable-icon-right
${CLD_LOADING_PROGRESS_TRAINING_CENTER_ELEMENT_ID}		xpath=//*[@id="main-content"]/unicloud-training-center/unicloud-center/div[3]/div[3]/a
${CLD_INFO_CENTER_GLOBAL_SEARCH_ELEMENT_ID}				//datatable-body-cell[11]//input

