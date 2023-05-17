*** Settings ***
Documentation   Locators for each element used in TestSuite

*** Variables ***
${VAULT_ELEMENT}                            id=preferenceCardHead_5
${VAULT_ELEMENT_FOR_VERIFICATION}           id=parentName
${IMPORT_BUTTON}                            id=toggle-file-icon
${CHOOSE_BUTTON}                            xpath=//span[@class='ui-fileupload-choose ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left']//input
${UPLOAD_BUTTON}                            id=upload_Btn
${CLOSE_UPLOAD_WINDOW_BUTTON}               id=btnCloseFMM
${NEW_FILTER_BUTTON}                        id=newFilter
${FILTER_DETAILS_BUTTON}                    id=btnExistingProfilesToggle
${FILTER_APPLY_BUTTON}                      id=floatBtn_ApplyTxt_item
${FILTER_NAME_INPUT_FIELD}                  id=filter-name
${VAULT_CARD_ELEMENT}                       xpath=//*[@id="file_info"]/p[1]
${FILE_TYPE}                                id=file_type_list
${EXTENTION_TYPE_BY_FILE_EXTENTION}         xpath=//*[@id="file_type_list"]/option[contains(text(),'By File Extension')]
${EXTENTION_TYPE_DWG}                       xpath=//*[@id="file_type_list"]/option[contains(text(),'DWG')]
${EXTENTION_TYPE_EXCEL}                     xpath=//*[@id="file_type_list"]/option[contains(text(),'Excel')]
${EXTENTION_TYPE_GUARDIAN_EXPORT}           xpath=//*[@id="file_type_list"]/option[contains(text(),'Guardian Export')]
${EXTENTION_TYPE_JSON}                      xpath=//*[@id="file_type_list"]/option[contains(text(),'JSON')]
${EXTENTION_TYPE_MDB}                       xpath=//*[@id="file_type_list"]/option[contains(text(),'Mdb')]
${EXTENTION_TYPE_OTHER}                     xpath=//*[@id="file_type_list"]/option[contains(text(),'Other')]
${EXTENTION_TYPE_PDF}                       xpath=//*[@id="file_type_list"]/option[contains(text(),'PDF')]
${EXTENTION_TYPE_POWER_POINT}               xpath=//*[@id="file_type_list"]/option[contains(text(),'PowerPoint')]
${EXTENTION_TYPE_RAR}                       xpath=//*[@id="file_type_list"]/option[contains(text(),'RAR')]
${EXTENTION_TYPE_STEP}                      xpath=//*[@id="file_type_list"]/option[contains(text(),'STEP')]
${EXTENTION_TYPE_SYSTECH_ARCHIVE}           xpath=//*[@id="file_type_list"]/option[contains(text(),'Systech Archive')]
${EXTENTION_TYPE_VISIO}                     xpath=//*[@id="file_type_list"]/option[contains(text(),'VISIO')]
${EXTENTION_TYPE_WORD}                      xpath=//*[@id="file_type_list"]/option[contains(text(),'Word')]
${EXTENTION_TYPE_XML}                       xpath=//*[@id="file_type_list"]/option[contains(text(),'XML')]
${EXTENTION_TYPE_ZIP}                       xpath=//*[@id="file_type_list"]/option[contains(text(),'ZIP')]
${STATE_APPROVED}                           xpath=//*[@id="state_list"]/option[1]
${STATE_DRAFT}                              xpath=//*[@id="state_list"]/option[2]
${STATE_VALIDATED}                          xpath=//*[@id="state_list"]/option[3]
${ENABLE/DISABLE_SWITCH}                    id=file_status_disabled
${SWITHCH_ENABLE}                           id=file_status_switch
${DESCRIPTION_ELEMENT}                      id=descriptionInputId
${TOPIC_ELEMENT}                            css=#topicsInputId > div > ul > li > input
${CHANGE_CONTROL_ID}                        id=ccidInputId
${CHANGE_DESCRIPTION}                       id=newDescriptionInputId
${ADD_ANYWAY_BUTTON_F1}                     id=replace_existing_file_0
${ADD_ANYWAY_BUTTON_F3}                     id=replace_existing_file_1
${ADD_ANYWAY_BUTTON_F4}                     id=replace_existing_file_2
${ADD_ANYWAY_BUTTON_F5}                     id=replace_existing_file_3
${REMOVE_FILTER}                            xpath=//app-filter-bookmark[@id='filter_1']//span[@id='remove_filter']
${Filter_NEW1}                              xpath=//*[@id="filter_1"]/span
${UPLOAD_DIALOGUE_CLOSE_BUTTON}             id=file_upload_modal_close_btn
${CLEAR_UPLOAD_POPUP}                       xpath=//div[@class='ng-star-inserted']//div[1]//div[4]//button[1]//span[1]  #//button[@id='file_remove_btn_0']
${CLEAR_UPLOAD_POPUP_TOP_BUTTON}            xpath=//span[contains(text(),'Clear')]  #//button[@id='clear_Btn']
${INPUT_FIELD_IN_SEARCH}                    xpath=//div[@class='input-group']//input[@placeholder='Search']
${IGNORE_UPLOAD_SECOND_TIME}                id=mark_as_skipped_0
${USER_BUTTON}                              id=dropdownMenu1
${LOG_OUT_BUTTON}                           id=logOut
${FILTER_SEARCH_INPUT_FIELD}                id=search_input
${SEARCH_FILTER_BUTTON}                     id=search_icon
${DELETE_VAULT_CARD_BUTTON}                 xpath=//div[@title="Delete"]
${COMMANDS_BUTTON}                          xpath=//div[contains(text(),'Commands')]
${DELETE_BUTTON_FROM_DELETE_POPUP}          id=buttn_DeleteTxt
${UPLOAD_CHECKMARK_1}                       //*[@id="file_upload_success_0"]
${FILE_NAME_ELEMENT}                        id=owerview_row_0_value
${FILE_STATE_ELEMNET}                       id=owerview_row_1_value
${FILE_TYPE_ELEMENT}                        id=owerview_row_2_value
${FILE_ADDED_BY_ELEMENT}                    id=owerview_row_3_value
${FILE_DESCRIPTION_ELEMENT}                 id=owerview_row_6_value
${DOWNLOAD_BUTTON}                          xpath=//div[@title="Download"]
${ADD_ANYWAY_LOCATOR}                       id=replace_existing_file_0
${NEW1_FILTER_LOCATOR}                      xpath=//div[contains(text(),'new1')]
${CLEAR_UPLOAD_BUTTON}                      xpath=//span[@class='fa fa-times ng-star-inserted']
${CLEAR_BUTTON}                             id=clear_Btn
${VERSION_LOCATOR_1}                        xpath=//span[contains(text(),'(1)')]
${VERSION_LOCATOR_2}                        xpath=//span[contains(text(),'(2)')]
${VERSION_LOCATOR_3}                        xpath=//span[contains(text(),'(3)')]
${VERSION_BUTTON}                           id=mat-tab-label-0-2
${VERSION_LABLE_LOCATOR}                    id=version_value_0
${VAULT_FILE_D}                             xpath=//p[contains(text(),'d')]
${MAX_CHAR}                                 xpath=//span[contains(text(),'Max length 512 characters')]
${FILE_CCID}                                id=ccid_value_0
${FILE_CHANGE_DESCRIPTION}                  id=change_description_value_0
${FILE_TOPIC}                               id=chip_
${UPDATE_STATE}                             xpath=//div[@title="Update State"]
${NEW_COMMENT_INPUT_FIELD}                  id=comments_content
${ADD_COMMENT_BUTTON}                       id=comments_addBtn
${SEARCH_COMMENT_INPUT_FIELD}               xpath=//div[@id='search']//input[@id='searchBox']
${NOTES_TAB}                                xpath=//div[contains(text(),'Notes')]
${COMMENT_SEARCH_BUTTON}                    id=searchBtn
${DRAFT_STATE_INSPECTOR_VIEW}               xpath=//span[contains(text(),'Draft')]
${APPROVED_STATE_INSPECTOR_VIEW}            xpath=//span[contains(text(),'Approved')]
${VALIDATED_STATE_INSPECTOR_VIEW}           xpath=//span[contains(text(),'Validated')]
${NEW_STATE_DROPDOWN}                       xpath=//label[contains(text(),'Select a state')]
${STATE_DROPDOWN_DRAFT_ELEMENT}             id=select-state-labeldraft
${STATE_DROPDOWN_APPROVED_ELEMENT}          id=select-state-labelapproved
${UPDATE_FILE_STATE_DIALOGUE_OK_BUTTON}     id=state-update-submit
${UPDATE_FILE_STATE_DIALOGUE_CANCEL_BUTTON}  id=state-update-cancel
${NOTE_TAB_COMMENT}                         id=comment_0
${REFERENCES_TAB}                           xpath=//div[contains(text(),'References')]
${ADD_REFERENCE_BUTTON}                     id=add_reference
${ADD_REFERENCE_DIALOGUE_HEADER}            xpath=//*[@id="ui-dialog-25-label"]/p-header/span
${URL_REFERENCE_RADIO_BUTTON}               id=url_referance_radio
${INPUT_URL_REFERENCE_TAB}                  id=url_input
${INPUT_DESCRIPTION_REFERENCE_TAB}          id=description
${SAVE_BUTTON_REFERENCE_TAB}                xpath=//button[contains(text(),'Save')]  #id=state-update-submit #not working with id
${CONFIRMATION_DIALOGUE_MESSAGE}            id=message-message
${CLEAR_REFERENCE_BUTTON}                   xpath=//i[@class='fa fa-times-circle fa-lg delete-icon pointer']
${USAGE}                                    xpath=//*[@class='custom_progress_bar']
${USER_DROPDOWN}                            id=dropdownMenu1
${ADMINISTRATOR_USER}                       id=goToAdministrator
${FILE_STORAGE_UTILIZATION}                 id=preferenceCardHeadSection_3
${STORAGE_USAGE}                            xpath=//h4[contains(text(),'Storage Usage')]
${SORT_DROPDOWN}                            id=sort_by
${SORT_BY_NAME}                             xpath=//span[@class='ng-star-inserted'][contains(text(),'Name')]
${SORT_BY_SIZE}                             xpath=//span[@class='ng-star-inserted'][contains(text(),'Size')]
${FILE_1_LOCATOR}                           id=file_name_0
${FILE_2_LOCATOR}                           id=file_name_1
${FILE_3_LOCATOR}                           id=file_name_2
${DESCENDING_ORDER}                         id=desc
${DESCENDING_ORDER}                         id=desc
${ASCENDING_ORDER}                          id=asc
