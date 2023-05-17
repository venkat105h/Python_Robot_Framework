#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in the Alert Test cases`.
#   © 2022   Systech International.  All rights reserved
#------------------------------------------------------------------
#

*** Settings ***
Documentation   Locators for each element used in TestSuite

*** Variables ***

#Added by Akash - alert subscription card
${S360_ALERT_SUBSCRIPTION_CARD}                           id=preferenceCardName_6
${S360_ALERT_AVAILABLE_NODES_SEARCHBOX}                   xpath=(//*[@id="sites"]//input)
${S360_ALERT_NODE_SELECT_LIST}                            xpath=(//*[@id='sites']//*[contains(@class,'picklist-source')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
${S360_ALERT_SINGLE_SELECT_BUTTON}                        xpath=(//*[@id='sites']//button)[1]
${S360_ALERT_EXISTING_RULES_ROW}                          xpath=//*[@id="extendedTable"]//datatable-body-row

${S360_ADD_RULE_BUTTON}                                   xpath=(//button[contains(@class,'btn-primary')])
${S360_ALERT_NAME_TEXTBOX}                                xpath=(//input[contains(@name,'ruleName')])
${S360_ALERT_COMPONENT_LIST}                              id=typeValue
${S360_ALERT_EVENT_LIST}                                  id=eventValue
${S360_ALERT_CONDITION_LIST}                              id=conditionValue
${S360_ALERT_COMMENT_BOX}                                 xpath=//textarea[contains(@value,'comment')]
${S360_ALERT_ADD_RULE_BUTTON}                             xpath=(//button[contains(@class,'mat-primary')])
${S360_ALERT_DELETE_RULE_ICON}                            xpath=(//span[contains(@class,'fa-trash')])
${S360_ALERT_EDIT_RULE_ICON}                              xpath=(//span[contains(@class,'fa-pencil')])
${S360_ALERT_DELETE_CONFIRM_OK}                           xpath=(//button[contains(@class,'mat-raised-button')])


${S360_GO_TO_ALERT_LOGS}                                  id=goToAlertLog
${S360_ALERT_COUNT}                                       xpath=(//span[contains(@class,'alert_count_single')])
${S360_ALERT_LOGS_DATATABLE}                              xpath=(//datatable-body[contains(@class,'datatable-body')])
${S360_ALERT_LOGS_DATAROW}                                xpath=(//datatable-body-row[contains(@class,'datatable-body-row')])
${S360_ALERT_LOGS_RECORD_UNREAD}                          xpath=(//datatable-body-row[contains(@class,'unread')])
${S360_ALERT_LOGS_RECORD_READ}                            xpath=(//datatable-body-row[contains(@class,'read')])
${S360_ALERT_LOGS_UNREAD_CHECKBOX}                        xpath=//*[@id="extendedTable"]//input[contains(@type,'checkbox')]
${S360_ALERT_LOGS_DATATABLE_CHECKBOX}                     xpath=//*[@id="extendedTable"]//datatable-body-cell[1]/div/input
${S360_ALERT_LOGS_MARK_SELECTED_AS_READ}                  xpath=//*[@id="main-content"]//div/button[2]
${S360_ALERT_LOGS_MARK_SELECTED_AS_UNREAD}                xpath=//*[@id="main-content"]//div/button[3]
${S360_ALERT_LOGS_DELETE_SELECTED}                        xpath=//*[@id="main-content"]//div/button[1]
${S360_ALERT_LOGS_REFRESH}                                xpath=//*[@id="main-content"]//div/button[4]
${S360_ALERT_CONFIRM_DELETE_BUTTON}                       xpath=//*[@id="mat-dialog-2"]//button[2]
${S360_ALERT_LOGS_EXPAND_ICON}                            xpath=//*[@id="extendedTable"]//datatable-row-wrapper[1]//datatable-body-cell[2]/div/a
${S360_ALERT_LOGS_DELETE_ICON}                            xpath=//*[@id="extendedTable"]//datatable-row-wrapper[1]//datatable-body-cell[6]/div/span[contains(@class,'fa-trash')]

