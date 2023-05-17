*** Settings ***
Documentation   Locators for each element used in TestSuite

*** Variables ***
${S360_FILE_STORAGE_UTILISATION_CARD}       id=preferenceCardName_3
${S360_GRAPHIC_TAB}                         id=graphicTab
${S360_DETAIL_TAB}                          id=childrenTab
${S360_STORAGEALLOC_LABEL}                  id=storage-allocation
${S360_REMAINING_LABEL}                     id=remaining
${S360_USED_LABEL}                          id=used
${S360_PERCENTAGEUSED_LABEL}                id=percentage-used
${S360_STORAGEALLOC_TXT}                    id=storage-allocation-txt
${S360_REMAINING_TXT}                       id=remaining-txt
${S360_USED_LABEL}                          id=used-txt
${S360_FSU_PROGRESS_BAR}                    xpath=//datatable-progress[@class="ng-star-inserted"]
${S360_Filter_Button}                       id=newFilter
${FILTER_APPLY_BUTTON}                     //*[@id="floatBtn_ApplyTxt"]
${S360_SEARCH_AVAILABLE_OWNERS_TEXT_FIELD}  xpath=(//input[contains(@class,'ui-picklist-filter ')])
${S360_SERACH_Button}                       xpath=(//span[contains(@class,'ui-picklist-filter-')])
${S360_FILTER_FLOAT_BTN}                    id=floatBtn_options
${S360_SELECT_SINGLE_OWNER_BTN}             xpath=(//button[contains(@class,'ui-button')])
${S360_RELATIVE_FROM_DATE_INPUT_FIELD}      id=relativeFromDate
${S360_FSU_INTRO_MSG}=                      xpath=//*[@id="main-content"]//p
${S360_FSU_DETAILED_TABLE_ROW}              xpath=//*[@id="file-list-table"]//datatable-body-row/div[2]
${S360_FSU_GRAPHIC_TABLE_ROW}               xpath=//*[@id="storage-data-table"]//datatable-body-row/div[2]
${S360_FSU_GRAPHIC_TABLE_TYPE_CELL}         xpath=(//*[@id="storage-data-table"]//datatable-body-cell[1]//label)
${S360_FSU_GRAPHIC_TABLE_USED_CELL}         xpath=(//*[@id="storage-data-table"]//datatable-body-cell[2]//label)
${S360_FSU_GRAPHIC_TABLE_NAME_CELL}         xpath=(//*[@id="storage-data-table"]//datatable-body-cell[3]//label)
${S360_FSU_GRAPHIC_TABLE_TYPE_TAB}          xpath=//*[@id="storage-data-table"]//datatable-header-cell[1]/div
${S360_FSU_GRAPHIC_TABLE_USED_TAB}          xpath=//*[@id="storage-data-table"]//datatable-header-cell[2]/div
${S360_FSU_GRAPHIC_TABLE_NAME_TAB}          xpath=//*[@id="storage-data-table"]//datatable-header-cell[3]/div
${S360_FSU_DETAILED_TABLE_TYPE_CELL}        xpath=(//*[@id="file-list-table"]//datatable-body-cell[1]//label)
${S360_FSU_DETAILED_TABLE_TYPE_TAB}         xpath=//*[@id="file-list-table"]//datatable-header-cell[1]/div
${S360_FSU_FILETYPE_ITEMS}                  xpath=(//*[contains(text(),'File type')]/..//*[@id='file-pattern']//li)
${S360_FSU_STORAGELOCATION_ITEMS}           xpath=(//*[contains(text(),'Storage location')]/..//*[@id='file-pattern']//li)
# Add new filter details
${S360_FSU_BOOKMARKED_FILTER}               xpath=(//*[contains(@class,'selected-filter ng')])
${S360_FSU_INVALID_DATES_MSG}              //*[@id="DateRangeValid"]
${S360_FSU_CLOSE_DD_BTN}                    xpath=(//*[contains(@class,'ui-multiselect-close')])
${S360_FSU_FILETYPE_LIST_BOX}               xpath=//*[contains(@class, 'label-container')][1]
${S360_FSU_SELECT_ALL_CHCKBOX}              xpath=(//*[contains(@class,'ui-chkbox-box')])[1]
${S360_FSU_FILETYPE_DD}                     xpath=(//*[contains(@class, 'multiselect') and contains(@class,'pi-caret-down')])[1]
${S360_FSU_FILETYPE_GARDIANEXPORT}          xpath=//*[@id="file-pattern"]//li[3]/div[2]
${S360_FSU_STORAGELOCATION_REPORT}          xpath=//*[@id="file-pattern"]//li[5]/div[2]
${S360_FSU_STORAGELOCATION_DD}              xpath=(//*[contains(@class, 'multiselect') and contains(@class,'pi-caret-down')])[2]
${S360_FSU_STORAGELOCATION_LIST_BOX}        xpath=//*[contains(@class, 'label-container')][1]
${S360_FSU_FILTER_SIZE}                     xpath= //*[@id="filter-size"]
${S360_FSU_ERROR_MSG}                       xpath=(//*[contains(@class,"error-message")])
${S360_FILTERS_LABEL}                       xpath=(//*[contains(@id,'filter_')]//div)
${S360_FILTERS_EMPTY_TABLE}                 xpath=//*[contains(@class,'empty-row')]
${S360_Filter_Ok_POPUP}                     id=buttn_OkTxt
${S360_Delete_Button}                      (//*[@id="update-state"])[1]
${S360_PYCHART_SECTIONS}                    xpath=//*[@class='arc']
${S360_PYCHART_DOCUMENT_SECTION}            xpath=//*[@class='arc'][3]
# Add Owner details
${S360_FSU_AVAI_OWNER_SEARCHBOX}            xpath=(//*[@id='filter-users']//input)[1]
${S360_FSU_SEL_OWNER_SEARCHBOX}             xpath=(//*[@id='filter-users']//input)[2]
${S360_FSU_SELECT_SINGLE_OWNER_BTN}         xpath=(//*[@id='filter-users']//button)[1]
${S360_FSU_SELECT_ALL_OWNER_BTN}            xpath=(//*[@id='filter-users']//button)[2]
${S360_FSU_REMOVE_SINGLE_OWNER_BTN}         xpath=(//*[@id='filter-users']//button)[3]
${S360_FSU_REMOVE_ALL_OWNER_BTN}            xpath=(//*[@id='filter-users']//button)[4]
${S360_FSU_OWNER_SELECT_LISTS}              xpath=(//*[@id='filter-users']//*[contains(@class,'picklist-source')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
${S360_FSU_OWNER_REMOVE_LISTS}              xpath=(//*[@id='filter-users']//*[contains(@class,'picklist-target')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
${S360_VAULT_OWNER_SELECT_LISTS}            xpath=(//*[@id='filter-owners']//*[contains(@class,'picklist-source')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
${SEC_ADD_NEW_ITEM_BTN}		 				xpath=(//a[contains(@id,'new')])
${SEC_NAME_TXT_BOX}			 				id=nameInput
${SEC_DESC_TXT_BOX}			 				id=desciptionInput
${SEC_VA_MAIN_VIDEO_PLAY_ICON}				xpath=(//span[@id='video-play-icon'])[1]
# Export Import details
${SEC_EI_SM_CREATE}							SEC000137I
${SEC_EI_EXPORT_SM_RUN}						SEC000187I
${SEC_EI_SM_DELETE}							SEC000109I
${SEC_EI_EXPORT/IMPORT_REQUESTS_CRD}		id=preferenceCardHead_0
${SEC_RC_DEL_BTN}							(//*[contains(@id,'btnDelete_')])
${SEC_EI_LIST_VIEW_ITEMS_NAME}				(//td[contains(@id, 'name_') and contains(@class, 'description')])
${SEC_EI_REQUEST_NAMES}						(//h4[contains(@id,'JobDefinitions_itemName_')])
${SEC_EI_UPDATOR_NAMES}						(//label[contains(@id,'updated_by')])
${SEC_EI_UPDATOR_NAMES_EN}					(//label[contains(@id,'updated_by')])
${SEC_EI_UPDATOR_NAMES_ZH}					(//label[contains(@id,'更新者')])
${SEC_EI_UPDATED_ON_NAMES_EN}				(//label[contains(@id,'updated_on_')])
${SEC_EI_UPDATED_ON_NAMES_ZH}				(//label[contains(@id,'更新时间_')])
${SEC_EI_UPDATED_ON_NAMES}					(//label[contains(@id,'updated_on_')])
${SEC_EI_REQUEST_NAME_VALUES}				(//tr/td[1])
${SEC_EI_REQUESTOR_VALUES}					(//tr/td[3])
${SEC_EI_RC_START_TIME_VALUES}				(//tr/td[4])
${SEC_EI_RC_END_TIME_VALUES}				(//tr/td[5])
${SEC_EI_Export/Import_Requests}			id=preferenceCardHead_0
${SEC_EI_Request_Console}					id=preferenceCardHead_1
${SEC_EI_EXPORT_IMPORT_LINK}				id=exportImport
${SEC_EI_NAVIGATE_BACK}						id=ExportImport
${SEC_EI_BROWSE_BTN}						id=lblBrowse
${SEC_EI_BROWSE_FILE_TXT_BOX}				id=importFileNameTxtId
${SEC_EI_FILE_NAMES}						(//p[@id='newFolderNameLbl'])
${SEC_EI_BROWSE_FILE_OK_BTN}				id=okBtnId
${SEC_EI_EXPORT_ALL_BTN}					(//input[contains(@id,'AllSelection')])
${SEC_EI_RADIO_BTNS}						(//input[contains(@id,'radBtn')])
${SEC_EI_TABS}								(//label[contains(@id,'tab_') and not (@hidden)])
${SEC_EI_TAB_ITEM_NAMES}					(//label[contains(@id,'_lblName_')])
${SEC_EI_TAB_ITEM_CHECK_BOXES}				(//input[contains(@id,'chkBox_')])
${SEC_EI_NAV_ITEMS}							(//span[contains(@id,'assetName_')])
${SEC_FLOAT_SAVE_ITEM}						id=floatBtn_SaveTxt
${SEC_FLOAT_SAVE_ITEM}						id=floatBtn_SaveTxt
${SEC_EI_RC_SORT_BY_LST}			 		id=listSortBy
${SEC_CARDS_VIEW_ITEMS_NAME}				(//label[contains(@id, '_lblName_')])
${SEC_LIST_VIEW_ITEMS_NAME}					(//label[contains(@id, '_lblName_')])
${SEC_EXPORT_IMPORT_ALL_CHECK_BOX}			id=exportImportAllItems
${SEC_EI_RC_ASC_BTN}						id=ascdBtn
${SEC_EI_RC_DESC_BTN}						id=dscdBtn
${SEC_EI_FLOAT_RUN_BTN}						id=floatBtn_RunNowTxt_item
${SEC_EI_IMPORT_RADIO_BTN}					id=radBtnImport
${SEC_CARDS_VIEW_BTN}						id=cardViewBtn

# Message Center
${SEC_SUCCESS_MESSAGE}						(//*[@id='message-message'])
${SEC_CLOSE_SUCCESS_MESSAGE_BTN}			(//*[@id='close-all-button'])

# Business Owner
${SEC_BO_PA_Card}							id=preferenceCardName_0
${SEC_BO_RR_Card}							id=preferenceCardName_1
${SEC_BO_PA_Card_Name}					    Perform Analysis
${SEC_BO_RR_Card_Name}					    Review Reports
${SEC_AdminBO_CardPath}						(//*[contains(@id,'preferenceCardName_')])
${Sec_Bo_Report_Title1}				        Report_
${Sec_Bo_Report_Desc1}					    Reports short description
${Sec_Bo_Report_Long_Desc1}			        Reports long description
${Sec_Bo_Dashboard_Name}				    Fingerprint Acquisition

# Creates new report in Performance Analysis
${SEC_BO_CREATE_NEW_REPORT_BTN}				id=createReport
${SEC_BO_REPORT_TXT_FLD}					id=txtBoxReportTitle
${SEC_BO_REPORT_DESC_TXT_FLD}				id=txtBoxShortDesc
${SEC_BO_REPORT_LONG_DESC_TXT_FLD}			id=txtBoxLongDesc
${SEC_BO_DASHBOARDS_TXTS}					(//a[contains(@id,'lblDashboardName_')])

#OPERATIONS ON REPORTS
${SEC_BO_REPORTS_PUBLISH}					(//a[contains(@id,'publish')])
${SEC_BO_RR_PUBLISH_MENU_BTN}				(//a[@id='dropdownMenu']/span)
${SEC_BO_REPORTS_DELETE}					(//a[contains(@id,'delete')])
${SEC_BO_PUBLISH_BTN}						id=btnPublish
${SEC_BO_PUBLISH_FLOAT_OPTIONS}				id=btnOptions
${SEC_BO_PUBLISH_FLOAT_SAVE}				id=btnSave
${SEC_BO_REPORT_SM_CREATE}					SEC000173I

# Review Reports
${SEC_BO_REPORT_TITLE_HEADER}				id=headerTitle
${SEC_BO_REPORT_DESC_HEADER}				id=headerDesc
${SEC_BO_REPORT_PUBLISH_HEADER}				id=headerPublished
${SEC_BO_REPORT_OWNER_HEADER}				id=headerOwner
${SEC_BO_REPORTS_TXTS}						(//a[contains(@id,'view')])
${SEC_BO_REPORT_SM_DELETE}					SEC000175I
