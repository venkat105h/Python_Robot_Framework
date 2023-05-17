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
# Login
${SEC/S360_USERNAME_TXT}                id=userName
${SEC/S360_PASSWORD_TXT}                id=password
${SEC/S360_ROLE_LIST}                   id=roleList
${SEC/S360_LOGIN_BTN}                   id=loginBtn
${SEC/S360_ACCEPT_BTN}                  id=eusa-accept
${SEC/S360_CANCEL_BTN}                  id=eusa-reject
${SEC/S360_WELCOME_LINK}                id=navBtn_welcome
${SEC/S360_CHANGE_ROLE_DD}              id=dropdownMenu1
${SEC/S360_GO_TO_PREFERENCES}           id=goToPreference
${SEC/S360_GO_TO_OPERATOR}              id=goToOperator
${SEC/S360_GO_TO_DESIGNER}              id=goToDesigner
${SEC/S360_DISPLAY_CARD}                id=preferenceCardName_0
${SEC/S360_ACC_INFO_CARD}               id=preferenceCardName_1
${SEC/S360_DIRTY_FLAG}                  id=dirtyFlag
#changes by Akash - updated locator for unisecure
#${SEC/S360_PREF_POPUP_SAVE_BTN}         id=buttn_SaveTxt
${SEC/S360_PREF_POPUP_SAVE_BTN}         id=btn_confirm
${SEC/S360_NAV_LINKS}                   xpath=(//a[contains(@class,'assetTypeLink') and not(contains(@class,'-'))])
${SEC/S360_PIN_NAVIGATOR}               xpath=//*[@id="leftmenuinner "]/div/div/a/span


${SEC/S360_CARDS_NAME_ID}               xpath=(//h4[contains(@id, '_itemName_')])
${SEC/S360_LIST_NAME_ID}                xpath=//label[contains(@id, 'name_') and contains(@id, '-Lbl')]
${SEC/S360_LIST_DATES_ID}               xpath=(//label[contains(@id, 'updated_on_') and contains(@id, '-Lbl')])
${SEC/S360_LIST_ITEMS_PERPAGE_DD}       id=list_itemsPerPageList
${SEC/S360_CARDS_ITEMS_PERPAGE_DD}      id=cards_itemsPerPageList
${SEC/S360_SCROLL_MSG_CENTER}           xpath=//div[contains(@style, 'overflow: scroll')]
${SEC/S360_LOGOUT_LINK}                 id=logOut
${SEC/S360_SEARCH_BOX}                  id=searchBox
${SEC/S360_SEARCH_BTN}                  id=searchBtn
${SEC/S360_SORT_BY_DD}                  id=sortByList
${SEC/S360_ASCENDING_BTN}               id=AscdBtn
${SEC/S360_LISTVIEW_BTN}                id=listViewBtn
${SEC/S360_DESCENDING_BTN}              id=DscdBtn
${SEC/S360_PARENT_BREADCRUMB}           id=parentName
${SEC/S360_POPUP_NO_BTN}                id=buttn_CancelTxt
${SEC/S360_POPUP_YES_BTN}               id=buttn_YesTxt
${SEC/S360_TRASHCAN_ICON}               id=iconTrashCan
${SEC/S360_TRASH_CAN_NAMES}             xpath=(//label[contains(@id, 'name_')])
${SEC/S360_TRASHCAN_COUNT}              id=trashCanCount
${SEC/S360_OPTN_RESTORE_BTN}            id=btnRestore
${SEC/S360_OPTN_DELETE}                 id=btnPurge
${SEC/S360_SELECT_ALL_ITEMS}            checkBoxSelectALL
${SEC/S360_DELETE_POP_BTN}              id=buttn_DeleteTxt
${SEC/S360_CLOSE_MSG_CENTER}            xpath=//button[@id='close-center']

${SEC/S360_FLOAT_OPTN_BTN}              id=floatBtn_options
${SEC/S360_FLOAT_SAVE_BTN}              id=floatBtn_SaveTxt
${SEC/S360_FLOAT_PUBLISH_BTN}           id=floatBtn_Publish
${SEC/S360_FLOAT_CANCEL_BTN}            id=floatBtn_CancelTxt
${SEC/S360_MSG_CENTER}                  xpath=(//p[@id='message-message'])[1]
${SEC/S360_DISMISS_MSG_CNTR}            xpath=//div[@id='close-all-button']
${SEC/S360_NAME_TXT}                    id=nameInput
${SEC/S360_DESC_TXT}                    id=desciptionInput
${SEC/S360_CARD_OPTION_MENU}            id=open-circular-nav-icon
${SEC/S360_DELETE_CARD_ICON}            delete-menu-icon
${SEC/S360_POPUP_MODAL}                 xpath=(//div[@id='divPopModalMessage'])[2]
${SEC/S360_CANCEL_POP_BTN}              id=buttn_CancelTxt
${SEC/S360_VIDEO_PLAY_BTN}              xpath=(//span[@id='iconVideo'])
${SEC/S360_VIDEO_SECTION}               xpath=(//div[@id='video-section'])[2]
${SEC/S360_POPUP_TITLE}                 xpath=(//h4[@id='pop-up-title'])[2]
${SEC/S360_POPUP_CLOSE_BTN}             xpath=(//button[@aria-label='Dismiss'])[3]
${SEC/S360_TOTAL_PAGES}                 xpath=(//a[contains(@class, "page-link")])
${SEC/S360_LAST_PAGE_BTN}               xpath=//a[@aria-label='Last']
${SEC/S360_NEXT_BTN}                    xpath=//a[@aria-label='Next']
${SEC/S360_FIRST_PAGE_BTN}              xpath=//a[@aria-label='First']
${SEC/S360_ACTIVE_PAGE_NUMBER}          xpath=(//li[contains(@class,'active')]/a)
