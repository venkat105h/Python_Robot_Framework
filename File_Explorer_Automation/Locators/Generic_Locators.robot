#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in File Explorer Automation
#   Project           :      UniSecure File Explorer
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
# Login
${UNI_USERNAME_TXT}             id=userName
${UNI_PASSWORD_TXT}             id=password
${UNI_ROLE_LIST}                id=roleList
${UNI_LOGIN_BTN}                id=loginBtn
${UNI_ACCEPT_BTN}               id=eusa-accept
${UNI_CANCEL_BTN}               id=eusa-reject
${UNI_WELCOME_LINK}             id=navBtn_welcome
${UNI_CHANGE_ROLE_DD}           id=dropdownMenu1
${UNI_LOGOUT_LINK}              id=logOut

${UNI_HAMBURGER_MENU}           xpath=//div[contains(@class,'hb-root')]
${UNI_BROWSE_HAM}               id=browseFolders
${UNI_FOLDERS_HAM}              id=browseFolders
${UNI_LOADING_IMG}              xpath=(//*[contains(@class, 'fa-spinner')])

${UNI_GO_TO_OPERATOR}           id=goToOperator
${UNI_GO_TO_DESIGNER}           id=goToDesigner
${UNI_SEARCH_BOX}               id=searchBox
${UNI_SEARCH_BTN}               id=searchBtn
${UNI_SORT_BY_DD}               id=sortByList
${UNI_ASCENDING_BTN}            id=AscdBtn
${UNI_DESCENDING_BTN}           id=DscdBtn
${UNI_PARENT_BREADCRUMB}        id=parentName
${UNI_POPUP_NO_BTN}             id=buttn_NoTxt
${UNI_POPUP_YES_BTN}            id=buttn_YesTxt
${UNI_TRASHCAN_ICON}            id=iconTrashCan
${UNI_TRASH_CAN_NAMES}          xpath=(//label[contains(@id, 'name_')])
${UNI_TRASHCAN_COUNT}           id=trashCanCount
${UNI_OPTN_RESTORE_BTN}         id=btnRestore
${UNI_OPTN_DELETE}              id=btnPurge
${UNI_SELECT_ALL_ITEMS}         checkBoxSelectALL
${UNI_DELETE_POP_BTN}           id=buttn_DeleteTxt

${UNI_FLOAT_OPTN_BTN}           id=float-btn-icon
${UNI_FLOAT_SAVE_BTN}           id=floatBtn_SaveTxt_item
${UNI_FLOAT_PUBLISH_BTN}        id=floatBtn_Publish
${UNI_FLOAT_CANCEL_BTN}         id=floatBtn_CancelTxt
${UNI_MSG_CENTER}               xpath=(//p[@id='message-message'])[1]
${UNI_DISMISS_MSG_CNTR}         id=close-all-button
${UNI_NAME_TXT}                 id=nameInput
${UNI_DESC_TXT}                 id=desciptionInput
${UNI_CARD_OPTION_MENU}         id=open-circular-nav-icon
${UNI_DELETE_CARD_ICON}         delete-menu-icon
${UNI_POPUP_MODAL}              xpath=(//div[@id='divPopModalMessage'])[2]
${UNI_CANCEL_POP_BTN}           id=buttn_CancelTxt
${UNI_VIDEO_PLAY_BTN}           xpath=(//span[@id='iconVideo'])
${UNI_VIDEO_SECTION}            xpath=(//div[@id='video-section'])[2]
${UNI_POPUP_TITLE}              xpath=(//h4[@id='pop-up-title'])[2]
${UNI_POPUP_CLOSE_BTN}          xpath=(//button[@aria-label='Dismiss'])[3]
${UNI_TOTAL_PAGES}              xpath=(//a[contains(@class, "page-link")])
${UNI_LAST_PAGE_BTN}            xpath=//a[@aria-label='Last']
${UNI_NEXT_BTN}                 xpath=//a[@aria-label='Next']
${UNI_FIRST_PAGE_BTN}           xpath=//a[@aria-label='First']
${UNI_ACTIVE_PAGE_NUMBER}       xpath=(//li[contains(@class,'active')]/a)
${UNI_ENABLE_BUTTON}            //*[@class="editswitch-label"]
