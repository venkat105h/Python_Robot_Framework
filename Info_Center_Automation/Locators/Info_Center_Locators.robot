#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in Information Center Automation.
#   Project           :      UniSphere Information Center Automation
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
# Hamburger
${SPH/SEC_INFOCENTER_ON_HAMBURGER}      id=hb_infoCenter
${SPH/SEC_TRAINING_CENTER_ONHAM}        id=hb_trainingCenter
${SPH/SEC_SUPPORT_CENTER_ONHAM}         id=hb_supportCenter
${SPH/SEC_GENERAL_TXT}                  id=hb_general
${SPH/SEC_PRODUCT_TXT}                  id=hb_product
${SPH/SEC_GAMP_TXT}                     id=hb_sysGAMP
${SPH/SEC_SOLUTION_SUMMARY_TXT}         id=hb_solutionSummary
${SPH/SEC_RELEASE_NOTES_TXT}         	id=hb_releaseNotes

${SPH/SEC_GENERAL_TAB}                  id=generalTab
${SPH/SEC_DISABLED_CARD}                xpath=//div[@id='preferenceCardSection_
${SPH/SEC_PRODUCT_TAB}                  id=productTab
${SPH/SEC_GAMP_TAB}                     id=sysGAMPTab
${SPH/SEC_RELEASE_NOTES_CARD}           id=preferenceCardName_103
${SPH/SEC_SOLUTION_SUMMARY_CARD}        id=preferenceCardName_105
${SPH/SEC_CARD_SECTION}                 xpath=(//div[contains(@id, 'preferenceCardSection_')]/div)
${SPH/SEC_CARDS}                        xpath=(//h4[contains(@id, 'preferenceCardName_')])
${SPH/SEC_BREAD_CRUMBS_LINKS}           xpath=(//ul[@id='breadcrumb']/li)
${SPH/SEC_CASCADING_MENU_GEN}           xpath=(//li[@id='hb_general']//li[contains(@id, 'hb_')])
${SPH/SEC_CASCADING_MENU_PRO}           xpath=(//li[@id='hb_product']//li[contains(@id, 'hb_')])
${SPH/SEC_CASCADING_MENU_SYS}           xpath=(//li[@id='hb_sysGAMP']//li[contains(@id, 'hb_')])

${SPH/SEC_SEARCH_BOX}                   id=searchBox
${SPH/SEC_ITEMNAME}                     id=downloadItem_0
${SPH/SEC_ItemNameID}                   id=downloadItem_
${SPH/SEC_MULTIPLE_ITEMNAME}            xpath=//a[contains(@id, 'downloadItem_')]
${SPH/SEC_VIEWS_COUNT}                  id=viewsCounter_0
${SPH/SEC_VIEWS_COUNTID}                id=viewsCounter_
${SPH/SEC_MULTIPLE_VIEWS_COUNT}         xpath=//span[contains(@id, 'viewsCounter_')]
${SPH/SEC_LIKES_COUNT}                  id=likesCounter_0
${SPH/SEC_LIKES_COUNTID}                id=likesCounter_
${SPH/SEC_MULTIPLE_LIKES_COUNT}         xpath=//span[contains(@id, 'likesCounter_')]
${SPH/SEC_MULTIPLE_PUBLISHED_DATES}     xpath=//span[contains(@id, 'publishedDate_')]
${SPH/SEC_PUBLISHED_DATEID}             id=publishedDate_
${SPH/SEC_COMMENT_BTN}                  id=toggleComment_0
${SPH/SEC_COMMENT_BOX}                  id=commentTextArea_0
${SPH/SEC_ADDCOMMENT_BTN}               id=addComment_0
${SPH/SEC_SUCCESS_MESSAGE}              id=thankYouText_0
${SPH/SEC_SORTBY}                       id=sortDropDown
${SPH/SEC_ASCENDING}                    id=sortAscending
${SPH/SEC_DESCENDING}                   id=sortDescending
${SPH/SEC_REFINE_SOLUTION}              refine_Solutions_
${SPH/SEC_REFINE_VERSION}               refine_Versions_
${SPH/SEC_REFINE_LANGUAGE}              refine_Languages_
${SPH/SEC_REFINE_TOPIC}                 refine_Topics_
${SPH/SEC_NEWITEM_INDICATOR_SOL_SUM}    id=preferenceCardNewCount_105
${SPH/SEC_NEWITEM_INDICATOR_REL_NOTE}   id=preferenceCardNewCount_103

${SPH/SEC_REFINE_BY_TITLES}             xpath=(//li[@class='category-item-li'])
${SPH/SEC_TOTAL_PAGES}                  xpath=(//a[contains(@class, "page-link")])
${SPH/SEC_NEXT_BTN}                     xpath=//a[@aria-label='Next']