#------------------------------------------------------------------
#   Description       :      Locators of elements in Training Center
#   Project           :      UniSphere Training Center Automation
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
Documentation    Address of each element of Training Center

*** Variables ***
# Login
${UNI_USERNAME_TXT_BOX}                 id=userName
${UNI_PASSWORD_TXT_BOX}                 id=password
${UNI_LOGIN_BUTTON}                     id=loginBtn
${UNI_ACCEPT_BTN}                       id=eusa-accept
${UNI_CANCEL_BTN}                       id=eusa-reject
${UNI_WELCOME_LINK}                     id=navBtn_welcome
${UNI_HAMBURGER_MENU}                   class=hb-root

# Hamburger
${UNI_INFO_CENTER_ON_HAM}               id=hb_infoCenter
${UNI_TRAINING_CENTER_ON_HAM}           id=hb_trainingCenter
${UNI_SUPPORT_CENTER_ON_HAM}            id=hb_supportCenter

${UNI_CARDS_LINK}                       xpath=(//h4[contains(@id, 'preferenceCardName_')])
${UNI_BREADCRUMB_LINK}                  xpath=(//ul[@id='breadcrumb']/li)

${UNI_SEARCH_TXT_BOX}                   id=searchBox
${UNI_ITEM_NAME}                        id=downloadItem_0
${UNI_ITEM_NAME_ID}                     id=downloadItem_
${UNI_MULTIPLE_ITEM_NAME}               xpath=//a[contains(@id, 'downloadItem_')]
${UNI_VIEWS_COUNT}                      id=viewsCounter_0
${UNI_VIEWS_COUNT_ID}                   id=viewsCounter_
${UNI_MULTIPLE_VIEWS_COUNT}             xpath=//span[contains(@id, 'viewsCounter_')]
${UNI_LIKES_COUNT}                      id=likesCounter_0
${UNI_LIKES_COUNTID}                    id=likesCounter_
${UNI_MULTIPLE_LIKES_COUNT}             xpath=//span[contains(@id, 'likesCounter_')]
${UNI_PUBLISHED_DATE}                   id=publishedDate_0
${UNI_MULTIPLE_PUBLISHED_DATE}          xpath=//span[contains(@id, 'publishedDate_')]
${UNI_PUBLISHED_DATE_ID}                id=publishedDate_
${UNI_COMMENT_BUTTON}                   id=toggleComment_0
${UNI_COMMENT_TXT_BOX}                  id=commentTextArea_0
${UNI_ADD_COMMENT_BTN}                  id=addComment_0
${UNI_SUCCESS_MSG}                      id=thankYouText_0
${UNI_SORT_BY_DD}                       id=sortDropDown
${UNI_ASCENDING_BTN}                    id=sortAscending
${UNI_DESCENDING_BTN}                   id=sortDescending
${UNI_SORTBY_LIKES_BTN}                 id=sortBy_Likes

${UNI_REFINE_BY_SOL_ID}                 refine_Solutions_
${UNI_REFINE_BY_VER_ID}                 refine_Versions_
${UNI_REFINE_BY_LANG_ID}                refine_Languages_
${UNI_REFINE_BY_TOP_ID}                 refine_Topics_
${UNI_REFINE_BY_MORE_TOPICS}            id=more_Topics

${UNI_REFINE_BY_TITLES}                 xpath=(//li[@class='category-item-li'])
${UNI_TOTAL_PAGES_LINK}                 xpath=(//a[contains(@class, "page-link")])
${UNI_NEXT_BTN}                         xpath=//a[@aria-label='Next']
