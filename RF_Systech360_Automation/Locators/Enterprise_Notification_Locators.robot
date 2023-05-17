#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in Enterprise Notification Automation.
#   Project           :      Enterprise Notification Automation
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

${S360_EN_NOTI_RULES_CARD}           id=preferenceCardName_0
${S360_EN_ENT_SUMM_CARD}             id=preferenceCardName_1
${S360_EN_FIXED_FROM_RADIO_BUTTON}   id=fixedFromDateRadio
${S360_EN_FIXED_TO_RADIO_BUTTON}     id=fixedEndDateRadio
${S360_EN_ADD_FILTER_BTN}            id=newFilter
${S360_EN_FILTERS_XPATH}             (//*[contains(@id,'filter_')])
${S360_EN_DELETE_FILTER_BTN}         //*[@id='remove_filter']
${S360_EN_EDIT_FILTER_BTN}           //*[@id='edit_filter']
${S360_EN_LOADING_IMAGE}             xpath=(//*[contains(@class,'fa-spinner')])

# Add new filter details
${S360_EN_FILTER_NAME_TXTBOX}       //*[@id="filter-name"]
${S360_EN_CLOSE_BUTTON}             //*[@id="form_closeBtn"]
${S360_EN_APPROVE_BUTTON}            (//*[@id="Layer_1"])[1]
${S360_EN_ENABLE_DATE_BUTTON}          //*[@id="fixedFromDateRadio"]
${S360_EN_ENABLE_END_DATE_BUTTON}          //*[@id="fixedEndDateRadio"]
${S360_EN_ENABLE_DATE_BUTTON_2}      //*[@id="new"]/div[1]/div/app-search-template-dates/div[1]/div[2]/div[2]/div[1]/label
${S360_EN_FROM_DATE_TXTBOX}          (//*[@id="new"]//app-search-template-dates//p-calendar/span/input)[1]
${S360_EN_TO_DATE_TXTBOX}            (//*[@id="new"]//app-search-template-dates//p-calendar/span/input)[2]
${S360_EN_ADD_FILTER}                //*[@id="newFilter"]


${S360_EN_AVAI_SITES_SEARCHBOX}      xpath=(//*[@id='filter-sites']//input)[1]
${S360_EN_SEL_SITES_SEARCHBOX}       xpath=(//*[@id='filter-sites']//input)[2]
${S360_EN_SELECT_SINGLE_SITE_BTN}    xpath=(//*[@id='filter-sites']//button)[1]
${S360_EN_SELECT_ALL_SITE_BTN}       xpath=(//*[@id='filter-sites']//button)[2]
${S360_EN_REMOVE_SINGLE_SITE_BTN}    xpath=(//*[@id='filter-sites']//button)[3]
${S360_EN_REMOVE_ALL_SITE_BTN}       xpath=(//*[@id='filter-sites']//button)[4]
${S360_EN_SITE_SELECT_LISTS}         xpath=(//*[@id='filter-sites']//*[contains(@class,'picklist-source')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])


${S360_EN_SITE_REMOVE_LISTS}         xpath=(//*[@id='filter-sites']//*[contains(@class,'picklist-target')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])

${S360_EN_AVAI_PROD_SEARCHBOX}       xpath=(//*[@id='filter-products']//input)[1]
${S360_EN_SEL_PROD_SEARCHBOX}        xpath=(//*[@id='filter-products']//input)[2]
${S360_EN_SELECT_SINGLE_PROD_BTN}    xpath=(//*[@id='filter-products']//button)[1]
${S360_EN_SELECT_ALL_PROD_BTN}       xpath=(//*[@id='filter-products']//button)[2]
${S360_EN_REMOVE_SINGLE_PROD_BTN}    xpath=(//*[@id='filter-products']//button)[3]
${S360_EN_REMOVE_ALL_PROD_BTN}       xpath=(//*[@id='filter-products']//button)[4]
${S360_EN_PROD_SELECT_LISTS}         xpath=(//*[@id='filter-products']//*[contains(@class,'picklist-source')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
${S360_EN_PROD_REMOVE_LISTS}         xpath=(//*[@id='filter-products']//*[contains(@class,'picklist-target')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])

${S360_EN_STATE_DD}                  xpath=(//*[contains(@class, 'multiselect') and contains(@class,'pi-caret-down')])[1]
${S360_EN_RULE_STATE_ICONS}          xpath=(//*[@id='status_icon']/img[contains(@src,'icons')])
${S360_EN_STATE_SELECT_ALL_CHCKBOX}  xpath=(//*[contains(@class,'ui-chkbox-box')])[1]
${S360_EN_STATE_SENT_ICON}           xpath=(//img[contains(@src,'StateIcons_Sent')])
${S360_EN_STATE_FAILED_ICON}         xpath=(//img[contains(@src,'StateIcons_Failed')])
${S360_EN_STATE_PENDING_ICON}        xpath=(//img[contains(@src,'StateIcons_Pending')])
${S360_EN_STATE_READY_ICON}          xpath=(//img[contains(@src,'StateIcons_ReadyToSend')])
${S360_EN_STATE_INPROGRESS_ICON}     xpath=(//img[contains(@src,'StateIcons_InProgress')])
${S360_EN_STATE_COMP_ICON}           xpath=(//img[contains(@src,'StateIcons_ProcessCompleted')])
${S360_EN_CLOSE_STATE_DD_BTN}        xpath=(//*[contains(@class,'ui-multiselect-close')])

${S360_EN_BOOKMARK_ICON}             xpath=(//*[contains(@class,'icon_bookmark')])
${S360_EN_BOOKMARKED_BTN}            id=bookmark_button
${S360_EN_REMOVE_BM_BTN}             id=remove_bookmark

${S360_EN_FILTER_SEARCH_BOX}         xpath=(//*[@id='searchInternal']//input)[1]
${S360_EN_AUTOCOMP_TXT}              xpath=(//*[contains(@class,'ui-autocomplete-list-item')])
${S360_EN_NOTIFICATION_TAB}          id=notification_tab
${S360_EN_APPLY_FILTER_BTN}	         id=floatBtn_ApplyTxt

${S360_EN_PAGE_NUMBERS_BTN}          xpath=(//*[contains(@class,'ui-paginator-pages')])
${S360_EN_LOTNUMBER_DD}              id=lot_numbers
${S360_EN_LOT_SEARCHBOX}             (//*[@id='lot_numbers']//input)[1]
${S360_EN_LOT_AUTO_COMPLETE_TXTS}    xpath=(//*[contains(@id,'lot_numbers')]//*[contains(@class,'scrollable-content')]//*[contains(@class,'ng-option')])
${S360_EN_PROD_NAME_TXTBOX}          xpath=(//*[@id='product_name']/span)
${S360_EN_MANUF_NAME_TXTBOX}         xpath=(//*[@id='manufacturer']/span)
${S360_EN_LOT_STARTDATE_TXTBOX}      xpath=(//*[@id='start_date']/span)
${S360_EN_LOT_ENDDATE_TXTBOX}        xpath=(//*[@id='end_date']/span)
${S360_EN_TABLE_SORTBY_DD}           id=sort_by
${S360_EN_RULE_SEARCHBOX}            id=search_box
${S360_EN_RULE_SEARCH_BTN}           xpath=(//*[@id='search_box']/../p)
${S360_EN_INSP_CTRL_SEARCHBOX}       xpath=(//*[@id='root']//*[@id='searchBox'])
${S360_EN_INSP_CTRL_CLOSE_BTN}       id=close-icon
${S360_EN_COMMAND_TAB}               xpath=(//*[@role='tablist']//*[contains(@id,'mat-tab')])[1]
${S360_EN_DETAILS_TAB}               xpath=(//*[@role='tablist']//*[contains(@id,'mat-tab')])[2]
${S360_EN_NOTES_TAB}                 xpath=(//*[@role='tablist']//*[contains(@id,'mat-tab')])[3]
${S360_EN_FILES_TAB}                 xpath=(//*[@role='tablist']//*[contains(@id,'mat-tab')])[4]

${S360_EN_STATUS_ICON}               xpath=(//div[@id='status_icon']/img)
${S360_EN_STATUS_TEXT}               xpath=(//span[@id='status_text'])
#${S360_EN_RULE_NAME_TXT}             xpath=(//*[contains(@id,"filter_")])
#changes by Akash - changed locator to get rules text.
${S360_EN_RULE_NAME_TXT}             xpath=(//div[contains(@class, 'list-item')])
${S360_EN_SELECTED_RULE_NAME}        xpath=(//div[contains(@class, 'selectedRow')])

${S360_EN_COMMENTS_TXTBOX}           id=comments_content
${S360_EN_ADD_COMMENTS_BTN}          id=comments_addBtn
${S360_EN_COMMENTS_TXT}              xpath=(//*[contains(@id, 'comment_')])
${S360_EN_COMMENTS_HEADER}           xpath=(//*[contains(@id,'header_')])
#change by Akash - commented back below one
#${S360_EN_COMMENTS_HEADER}           (//*[@class="legendText"])

${S360_EN_CMD_UPDATE_STATE_BTN}      (//*[@id="openComments"])[2]
${S360_EN_CMD_UPDATE_STATE_BTN_SUM}     //*[@id="cmd_btn_Update State"]
${S360_EN_CMD_SEND_BTN}              //*[@id="cmd_btn_Send"]
${S360_EN_CURRENT_STATE_TXT}         id=current-state-txt
${S360_EN_NEW_STATE_DD}              id=new-state

${S360_EN_DD_STATES_LIST}            xpath=(//*[@id='select-state-wrapper']//img[contains(@src,'icons')])
${S360_EN_DD_STATE_SENT_ICON}        xpath=(//*[@id='select-state-wrapper']//img[contains(@src,'icons/Sent')])
${S360_EN_DD_STATE_FAILED_ICON}      xpath=(//*[@id='select-state-wrapper']//img[contains(@src,'icons/Failed')])
${S360_EN_DD_STATE_ACK_ICON}         xpath=(//*[@id='select-state-wrapper']//img[contains(@src,'icons/Acknowledge')])
${S360_EN_DD_STATE_COMP_ICON}        xpath=(//*[@id='select-state-wrapper']//img[contains(@src,'icons/ProcessCompleted')])
${S360_EN_UPDATE_STATE_OK_BTN}       id=state-update-submit
${S360_EN_UPDATE_STATE_CANCEL_BTN}   id=state-update-cancel

${S360_EN_DETALS_TAB_COLUMNS}        xpath=(//*[contains(@class,'datatable-header-cell-label')])
${S360_EN_EXPAND_COLLAPSE_INSP}      xpath=(//*[contains(@class,'arrow-wrapper')])

${S360_EN_NR_VIDEO_PLAY_BTN}         xpath=(//*[@tags='notificationrules']/span[@id='video-play-icon'])
${S360_EN_NR_REFRESH_ICON}           id=refresh_icon
${S360_EN_STATE_WARNING_TEXT}        xpath=(//*[contains(@class,'redText')])
${S360_EN_FILES_LIST}                xpath=(//*[@id='file-type'])
${S360_EN_FILES_HEADER}             //*[@id="mat-expansion-panel-header-12"]
${S360_EN_NO_DATA_MESSAGE}           xpath=(//*[contains(@class,'noData')])

# Notification Summary Locators
${S360_EN_NS_SEARCH_TEXTBOX}         xpath=(//*[@id='option-panel']//*[@id='searchBox'])
${S360_EN_NS_SEARCH_BTN}             xpath=(//*[@id='option-panel']//*[@id='searchBtn'])
${S360_EN_NR_NAME_COLUMN}            xpath=(//datatable-row-wrapper//div[2]/datatable-body-cell[1]//div/label)
${S360_EN_NR_IMAGE_COLUMN}           xpath=(//datatable-row-wrapper//div[2]/datatable-body-cell[1]//div/img)
${S360_EN_LOT_NUMBER_COLUMN}         xpath=(//datatable-row-wrapper//div[2]/datatable-body-cell[2]//div/label)
${S360_EN_PRODUCT_NAME_COLUMN}       xpath=(//datatable-row-wrapper//div[2]/datatable-body-cell[3]//div/label)
${S360_EN_MANUFACTURER_COLUMN}       xpath=(//datatable-row-wrapper//div[2]/datatable-body-cell[4]//div/label)
${S360_EN_LOT_STARTDATE_COLUMN}      xpath=(//datatable-row-wrapper//div[2]/datatable-body-cell[5]//div/label)
${S360_EN_LOT_ENDDATE_COLUMN}        xpath=(//datatable-row-wrapper//div[2]/datatable-body-cell[6]//div/label)
${S360_EN_TABLE_COLUMN_NAMES}        xpath=(//div/div[2]/datatable-header-cell/div/span[1])
${S360_EN_SEND_BUTTON}               xpath=(//*[@id="cmd_btn_Send"])
${S360_EN_SEARCH_RESULT}               //*[@class="list-item selectedRow ng-star-inserted"]
${S360_EN_APPLY_BUTTON}               (//*[@id="btn-icon"])[2]
