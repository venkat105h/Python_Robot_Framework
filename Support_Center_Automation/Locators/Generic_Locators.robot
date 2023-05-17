#------------------------------------------------------------------
#   Description       :      Locators of each element
#   Project           :      UniSphere Support Center Automation
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
Documentation    Element address for each element that are common accross solution

*** Variables ***
# Login
${UNI_USERNAME_TXT}         	id=userName
${UNI_PASSWORD_TXT}         	id=password
${UNI_LOGIN_BTN}				      id=loginBtn
${UNI_ACCEPT_BTN}             id=eusa-accept
${UNI_CANCEL_BTN}             id=eusa-reject
${UNI_WELCOME_PAGE}				    id=navBtn_welcome
${UNI_HAMBURGER}               	class=hb-root
${UNI_CARDS}                   	xpath=(//h4[contains(@id, 'preferenceCardName_')])
${UNI_BREADCRUMBS}             	xpath=(//ul[@id='breadcrumb']/li)
${UNI_CARD_SECTION}             xpath=(//div[contains(@id, 'preferenceCardSection_')]/div
${UNI_SEARCH_BOX}               id=searchBox
${UNI_ITEM_NAME}                id=downloadItem_
${UNI_MULTIPLE_ITEM_NAME}       xpath=(//a[contains(@id, 'downloadItem_')])
${UNI_PUBLISHED}               	id=publishedDate_
${UNI_MULTIPLE_PUB_DATES} 		xpath=//span[contains(@id, 'publishedDate_')]
${UNI_SORT_BY}                  id=sortDropDown
${UNI_ASCENDING}               	id=sortAscending
${UNI_DESCENDING}              	id=sortDescending
${UNI_REFINE_SOLUTION}          refine_Solutions_
${UNI_REFINE_VERSION}           refine_Versions_
${UNI_REFINELANGUAGE}          	refine_Languages_
${UNI_REFINE_TOPIC}             refine_Topics_
${UNI_REFINE_BY_TITLES}         xpath=(//li[@class='category-item-li'])
${UNI_TOTAL_PAGES}              xpath=(//a[contains(@class, "page-link")])
${UNI_NEXT_BUTTON}              xpath=//a[@aria-label='Next']
${UNI_POPUP_TITLE}             	id=pop-up-title
