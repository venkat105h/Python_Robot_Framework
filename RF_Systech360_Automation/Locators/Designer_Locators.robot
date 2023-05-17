#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in Designer
#   Project           :      UniSphere Designer Automation
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
${S360_ADD_SCENE}            id=newScene
${S360_SCENE_ICON}           id=Scene-icon
${S360_SCENE_ITEM}           id=Scene-item
${S360_ORGANIZATION_ITEM}    id=Organization-item
${S360_SITES_ITEM}           id=Site-item
${S360_ENV_ITEM}             id=Environment-item
${S360_CLOUD_ITEM}           id=Cloud-item
${S360_SITE_SERVER_ITEM}     id=SiteServer-item
${S360_DATA_SOURES_ITEM}     id=DataSource-item
${S360_SHOW_SUBORDINATES}    id=parent_loadChildrenLbl
${S360_SUB_SEARCH_BOX}       id=parent_searchBox
${S360_FIRST_SUB_ITEM}       //*[contains(@class,'item-image')]
${S360_DROP_PANEL}           //*[contains(@class,'ui-picklist-target')]
${S360_SCENE_CARD_NAME}      xpath=(//h4[contains(@id, '_itemName_')])
${S360_SEARCH_BOX}           //input[@id='filterTextBox']
${S360_SEARCH_BTN}           ${S360_SEARCH_BOX}/../i
${S360_SUBORDINATES_NAME}    xpath=((//div[@class='uni_panel_head'])[2]/..//*[@class="childImageTitle"])
${S360_HIGHLIGHTED_SUB_NAMES}    //*[@class="highlightText"]/..
${SEC_DSG_NAV_FAMILY_ICON}   id=Family-icon
${S360_SEARCHAVAILABLEOWNERSTEXTFIELD}    xpath=(//input[contains(@class,'ui-picklist-filter ')])
${S360_OWNERSELECTLIST}                   xpath=(//*[@id='filter-users']//*[contains(@class,'picklist-source')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
${S360_SELECTSINGLEOWNERBUTTON}           xpath=//div[@class='ui-picklist-buttons-cell']/button[2]
${S360_PICKLIST_ITEM}        id=pick_item_0


# Chinese Translation
${S360_LANDING_PAGE_REQUIRED_LEGEND}           //span[contains(text(),'必填')]
${S360_LANDING_PAGE_PIN_NAVIGATOR}             //span[@title="固订导航"]
${S360_SCENES_ELLIPSIS_ICON}                   //span[@id="open-circular-nav-icon"]
${S360_SCENES_ELLIPSIS_EDIT_ICON}              //i[@id="edit-menu-icon"]
${S360_SCENES_ELLIPSIS_EXPORT_ICON}             //i[@id="export-menu-icon"]
${S360_SCENES_ELLIPSIS_DELETE_ICON}             //i[@id="delete-menu-icon"]
${S360_SCENES_ELLIPSIS_PRINT_ICON}              //i[@id="print-menu-icon"]
${S360_SCENES_ELLIPSIS_DUPLICATE_ICON}          //i[@id="copy-menu-icon"]
${S360_ADD_NEW_BTN}                     //a[@id='newScene']
${S360_SCENES_ADD_NEW_SHOW_HIDE_INTRO_ICON}      //a[@title="显示/关闭 简介"]
${S360_SCENES_ADD_NEW_COMMENTS_BTN}            //span[@id='openComments']
${S360_SCENES_ADD_NEW_COMMENTS_CLOSE_BTN}         //button[@class="close ng-star-inserted"]
${S360_SCENES_ADD_NEW_COMMENTS_CANCEL_BTN}        //button[@id='comments_cancelBtn']
${S360_SCENES_ADD_NEW_GRAPHICAL_TAB}             //label[@id='graphicTab']
${S360_SCENES_ADD_NEW_COMMENTS_FIELD}            //textarea[@id='comments_content']
${S360_SCENES_ADD_NEW_COMMENTS_FIELD_ADD_BTN}               //button[@id='comments_addBtn']
