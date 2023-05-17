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
#connection is not secured screen
${ADVANCED_BTN}                         id=details-button
${PROCEED_BTN}                          id=proceed-link
# Login
${SEC/S360_USERNAME_TXT}                id=userName
${SEC/S360_PASSWORD_TXT}                id=password
${SEC/S360_ROLE_LIST}                   id=roleList
${SEC/S360_LOGIN_BTN}                   id=loginBtn

${BROWSERWIDTH}                                            1440
${BROWSERHEIGHT}                                           1080
${SEC/S360_LOGIN_ERROR_MSG_ID}          id=loginErrorMsg
${SEC/S360_SEC_QUESTION_SETUP}          //*[@id="msgSecurityQuestionSetup"]
${SEC/S360_ACC_ID}                      id=accountId
${SEC/S360_ACCEPT_BTN}                  id=eusa-accept
${SEC/S360_CANCEL_BTN}                  id=eusa-reject
${SEC/S360_TRASHCAN_ITEM}             //*[@id="contentTable"]/div[2]/checkbox-datatable/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper[]
${SEC/S360_WELCOME_LINK}                id=navBtn_welcome
${SEC/S360_HAMBURGER_MENU}              xpath=//*[contains(@class,'fa fa-bars')]
${SEC/S360_REQUEST_CONSOLE_HAM}         id=hb_requestConsole
${SEC/S360_ADMIN_GEN_CRD}               (//*[contains(@id,'preferenceCardName_')])

${SEC/S360_ADMIN_USERS_GROUPS_CARD}                //h4[contains(@id, 'preferenceCardName_') and text()='Users/Groups']
${SEC/S360_ADMIN_SECURITY_POLICIES_CARD}           //h4[contains(@id, 'preferenceCardName_') and text()='Security Policies']
${SEC/S360_ADMIN_SCOPE_POLICIES_CARD}              //h4[contains(@id, 'preferenceCardName_') and text()='Scope Policies']
${SEC/S360_ADMIN_FILE_STORAGE_UTILIZATION_CARD}    //h4[contains(@id, 'preferenceCardName_') and text()='File Storage Utilization']
${SEC/S360_ADMIN_DATA_POOL_CATEGORIES_CARD}        //h4[contains(@id, 'preferenceCardName_') and text()='Data Pool Categories']
${SEC/S360_ADMIN_AUDIT_CARD}                       //h4[contains(@id, 'preferenceCardName_') and text()='Audit']

${SEC/S360_ADMIN_USERS_GROUPS_HEADER}                //a[@id='childName' and text()='Users/Groups']
${SEC/S360_ADMIN_SECURITY_POLICIES_HEADER}           //a[@id='childName' and text()=' Security Policies']
${SEC/S360_ADMIN_SCOPE_POLICIES_HEADER}              //a[@id='Scope Policy' and text()='Scope Policy']
${SEC/S360_ADMIN_FILE_STORAGE_UTILIZATION_HEADER}    //a[@id='parentName' and text()='File Storage Utilization']
${SEC/S360_ADMIN_DATA_POOL_CATEGORIES_HEADER}        //a[@id='parentName' and text()='Data Pool Categories']
${SEC/S360_ADMIN_AUDIT_HEADER}                       //a[@id='parentName' and text()='Audit']

${SEC/S360_OPER_NOTIFICATION_RULES_CARD}                 //h4[contains(@id, 'preferenceCardName_') and text()='Notification Rules']
${SEC/S360_OPER_ENTERPRISE_NOTIFICATION_SUMMARY_CARD}    //h4[contains(@id, 'preferenceCardName_') and text()='Enterprise Notification Summary']
${SEC/S360_OPER_PRODUCTION_CARD}                         //h4[contains(@id, 'preferenceCardName_') and text()='Production']
${SEC/S360_OPER_MY_VIEWS_CARD}                           //h4[contains(@id, 'preferenceCardName_') and text()='My Views']
${SEC/S360_OPER_MANAGE_SCENES_CARD}                      //h4[contains(@id, 'preferenceCardName_') and text()='Manage Scenes']
${SEC/S360_OPER_VAULT_CARD}                              //h4[contains(@id, 'preferenceCardName_') and text()='Vault']

${SEC/S360_OPER_NOTIFICATION_RULES_HEADER}                 //a[@id='parentName' and text()='Notification Rules']
${SEC/S360_OPER_ENTERPRISE_NOTIFICATION_SUMMARY_HEADER}    //a[@id='parentName' and text()='Notification Summary']
${SEC/S360_OPER_PRODUCTION_HEADER}                         //a[@id='productionBreadCrumb' and text()='Production']
${SEC/S360_OPER_MY_VIEWS_HEADER}                           //a[@id='View' and text()='My Views']
${SEC/S360_OPER_MANAGE_SCENES_HEADER}                      //a[@id='objectName' and text()='Manage Scenes']
${SEC/S360_OPER_VAULT_HEADER}                              //a[@id='parentName' and text()='Vault']


${SEC_LOADINGICON}                      id=iconLoading
${SEC/S360_SUPPORT_CENTER_HAM}          id=hb_supportCenter
${SEC/S360_CASE_HISTORY_HAM}            id=hb_caseHistory
${SEC/S360_RENEWAL_INFO_HAM}            id=hb_renewInfo
${SEC/S360_CASE_HISTORY_CARD}           xpath=(//*[@id='preferenceCardSection_0']/div)
${SEC/S360_RENEWAL_INFO_CARD}           xpath=(//*[@id='preferenceCardSection_1']/div)
${SEC/S360_VIDEO_PLAY_ICON}             id=video-play-icon
${SEC/S360_INVALID_TXT_BOX}             xpath=(//input[contains(@class,'ng-invalid')])

${SEC/S360_LOGOUT_LINK}                 //*[@id="logOut"]
${SEC/S360_CHANGE_ROLE_DD}             //*[@id="dropdownMenu1"]
${SEC/S360_GO_TO_PREFERENCES}           id=goToPreference
${SEC/S360_GO_TO_ADMIN}                 id=goToAdministrator
${SEC/S360_GO_TO_OPERATOR}              id=goToOperator
${SEC/S360_GO_TO_DESIGNER}              id=goToDesigner
${SEC/S360_GO_TO_BUSINESS_OWNER}        id=goToBusiness Owner
${SEC/S360_FIRST_CARD}                  id=preferenceCardName_0
${SEC/S360_DISPLAY_CARD}                id=preferenceCardName_0
${SEC/S360_ACC_INFO_CARD}               id=preferenceCardName_1
${SEC/S360_DIRTY_FLAG}                  id=dirtyFlag
${SEC/S360_NAV_LINKS}                   xpath=(//a[@class='assetTypeLink'])
${SEC/S360_PIN_NAVIGATOR}               xpath=//*[@id='pinNavigator']

${SEC/S360_CARDS_NAME_ID}               xpath=(//h4[contains(@id, '_itemName_')])
${SEC/S360_LIST_NAME_ID}                xpath=(//label[contains(@id, 'name_') and contains(@id, '-Lbl')])
${SEC/S360_LIST_DATES_ID}               xpath=(//label[contains(@id, 'updated_on_') and contains(@id, '-Lbl')])
${SEC/S360_LIST_ITEMS_PERPAGE_DD}       id=list_itemsPerPageList
${SEC/S360_CARDS_ITEMS_PERPAGE_DD}      id=cards_itemsPerPageList
${SEC/S360_SCROLL_MSG_CENTER}           xpath=//div[contains(@style, 'overflow: scroll')]
${SEC/S360_CLOSE_LINK}                 //*[@id="close-center"]
${SEC/S360_SEARCH_BOX}                  id=searchBox
${SEC/S360_SEARCH_BTN}                  id=searchBtn
${SEC/S360_SORT_BY_DD}                  //*[@id="sortByList"]
${SEC/S360_ASCENDING_BTN}               id=AscdBtn
${SEC/S360_DESCENDING_BTN}              id=DscdBtn
${SEC/S360_PARENT_BREADCRUMB}           id=parentName
${SEC/S360_POPUP_NO_BTN}                id=buttn_NoTxt
${SEC/S360_POPUP_YES_BTN}               id=buttn_YesTxt
${SEC/S360_TRASHCAN_ICON}               //span[@id='iconTrashCan']
${SEC/S360_TRASH_CAN_NAMES}             xpath=(//label[contains(@id, 'name_')])
${SEC/S360_TRASH_CAN_NAMES1}            //*[@id="contentTable"]/div[2]/checkbox-datatable/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper
${SEC/S360_TRASHCAN_COUNT}              id=trashCanCount
${SEC/S360_OPTN_RESTORE_BTN}            id=btnRestore
${SEC/S360_OPTN_DELETE}                 id=btnPurge
${SEC/S360_SELECT_ALL_ITEMS}            checkBoxSelectALL
${SEC/S360_DELETE_POP_BTN}              id=buttn_DeleteTxt
#changes by Akash - updated locator for unisecure
#${SEC/S360_PREF_POPUP_SAVE_BTN}         id=buttn_SaveTxt
${SEC/S360_PREF_POPUP_SAVE_BTN}         id=btn_confirm
${SEC/S360_CANCEL_POP_BTN}             //*[@id="buttn_CancelTxt"]
${SEC/S360_CLOSE_MSG_CENTER}            xpath=//button[@id='close-center']
${SEC/S360_SUCCES_MASSEGE}             (//*[@id="message-message"])


${SEC/S360_FLOAT_OPTN_BTN}              id=floatBtn_options
#${SEC/S360_FLOAT_SAVE_BTN}              //*[@id="btn-icon"]
${SEC/S360_FLOAT_SAVE_BTN}              //button[@id="floatBtn_SaveTxt"]    # changed for SEC/S360_Roles_Precondition_Create User And Groups -> SEC/S360_Create New User -> SEC/S360_Save Changes
${SEC/S360_FLOAT_PUBLISH_BTN}           id=floatBtn_Publish
${SEC/S360_FLOAT_PUBLISH_DISABLED_BTN}  (//button[@id='floatBtn_Publish' and @disabled])
${SEC/S360_FLOAT_CANCEL_BTN}            id=floatBtn_CancelTxt
${SEC/S360_MSG_CENTER}                 //*[@id="message-message"][1]
${SEC/S360_DISMISS_MSG_CNTR}            xpath=//div[@id='close-all-button']
${SEC/S360_SEARCH_LOT}                  //*[@id="notification_name"]/p/span
${SEC/S360_NAME_TXT}                    id=nameInput
${SEC/S360_YES}                          //*[@id="buttn_SaveTxt"]
${SEC/S360_DESC_TXT}                    id=desciptionInput
${SEC/S360_CARD_OPTION_MENU}            xpath=(//*[@id='open-circular-nav-icon'])
${SEC/S360_CARD_OPTION_2_MENU}           (//*[@id="open-circular-nav-icon"])[2]
${SEC/S360_CARD_OPTION_MENU_2}          (//*[@id="openMenuOnMouseEnter"])[2]
${SEC/S360_DELETE_CARD_ICON}            delete-menu-icon
${SEC/S360_DELETE_CARD_2_ICON}           (//*[@id="delete-menu-icon"])[2]
${SEC/S360_COPY_CARD_ICON}              copy-menu-icon
${SEC/S360_SESSION_EXP_POPUP}           xpath=(//div[@id='divPopModalMessage'])[1]
${SEC/S360_POPUP_MODAL}                 xpath=(//div[@id='divPopModalMessage'])[3]
${SEC/S360_VIDEO_PLAY_BTN}              //*[@id="video-play-icon"]
${SEC/S360_VIDEO_PLAY_VISION}              //*[@id="list-group-item-title"]
${SEC/S360_VIDEO_SECTION}               xpath=(//div[@id='video-section'])[2]
${SEC/S360_INTRO_MSG}                   xpath=//*[@id="main-content"]//p
${SEC/S360_POPUP_TITLE}                 xpath=(//h4[@id='pop-up-title'])[2]
${SEC/S360_POPUP_CLOSE_BTN}             xpath=(//button[@aria-label='Dismiss'])[3]
${SEC/S360_TOTAL_PAGES}                 xpath=(//a[contains(@class, "page-link")])
${SEC/S360_LAST_PAGE_BTN}               xpath=//a[@aria-label='Last']
${SEC/S360_NEXT_BTN}                    xpath=//a[@aria-label='Next']
${SEC/S360_FIRST_PAGE_BTN}              xpath=//a[@aria-label='First']
${SEC/S360_ACTIVE_PAGE_NUMBER}          xpath=(//li[contains(@class,'active')]/a)

${SEC/S360_TOP_BANNER_SOL_DD}           id=navBtnSolutions_2
${SEC/S360_NAV_GO_TO_ADMIN}             id=navBtn_GotoAdministrator
${SEC/S360_NAV_GO_TO_OPERATOR}          id=navBtn_GotoOperator
${SEC/S360_NAV_GO_TO_DESIGNER}          id=navBtn_GotoDesigner
${SEC/S360_DIRTY_FLAG}                  id=dirtyFlag
${SEC/S360_FORM_CANCEL_BTN}             id=form_closeBtn
${SEC/S360_CARDS_VIEW_BTN}              id=cardViewBtn
${SEC/S360_CLOSE_SUCCES_MASSEGE}        //*[@id="close-center"]
${SEC/S360_CARDS_VIEW_OVERVIEW}         //*[@id="open-circular-nav-icon"]
${SEC/S360_LIST_VIEW_BTN}               id=listViewBtn


${SEC/S360_DSG_MAP_PAGE}                xpath=//*[@id='map']

${SEC/S360_LV_FLOAT_OPTN_BTN}           id=menu_options
${SEC/S360_LV_FLOAT_EDIT_BTN}           id=edit-menu-item
${SEC/S360_LV_FLOAT_COPY_BTN}           id=copy-menu-item
${SEC/S360_LV_FLOAT_DELETE_BTN}         id=delete-menu-item
${SEC/S360_VIDEOS_TITLE}                xpath=(//p[@id='list-group-item-title'])
${SEC/S360_INTRO_ICON}                  id=btnFingerprintEventAccordion
${SEC/S360_MSGCNTR_ICON}                id=toggle-filter-icon
${SEC/S360_PREF_ENABLE_PREFIX_SWITCH}   xpath=//label[@id='enablePrefixChkBoxLbl']

${S360_ITEM_PER_PAGE}                   id=listItemsPerPage
${S360_HIGHLIGHTED_NODE_NAMES}       //*[@id="component_0_0"]/span


# Chinese Translation
${SEC/S360_LANGUAGE_SELECT_BOX}                id=language-list
${SEC/S360_LANGUAGE_SELECT_VALUE}              中文
${SEC/S360_SCREENSHOT_LOCATION}                C:/Manas Milind/Automation/My Fork/Systech360_Automation/RF_Systech360_Automation/ChineseTranslation/Screenshots
${SEC/S360_BROWSE_HAM}                         //li[@id='hb_browse']
${SEC/S360_INFO_CENTER_HAM}                    //li[@id='hb_infoCenter']
${SEC/S360_INFO_CENTER_GENERAL_HAM}            //li[@id='hb_general']
${SEC/S360_INFO_CENTER_PRODUCT_HAM}            //li[@id='hb_product']
${SEC/S360_INFO_CENTER_SYSTECH_HAM}            //li[@id='hb_sysGAMP']
${SEC/S360_TRAINING_CENTER_HAM}                //li[@id='hb_trainingCenter']
${SEC/S360_UNITRACE_HEADER}                    //a[@id='navBtnSolutions_1']
${SEC/S360_ABOUT_HEADER}                       //a[@id='navBtn_about']
${SEC/S360_MAIN_PLAY_VIDEO_ICON}               id=video-play-iconTopnav
${SEC/S360_SHOW_HIDE_INTRO_ICON}               //i[@class="fa fa-info fa-lg"]
${SEC/S360_PAGINATION_LAST_PAGE}               //span[contains(text(),'»»')]
${SEC/S360_CANCEL_GROUP_BTN}                   //span[@id='btnCancelNewGrp']
${SEC/S360_USER_GROUP}                         id=chkUserGroup_0
${S360_ACTIVATE_SYSTECH360_SCOPE_POLICIES}     //span[contains(text(),'激活Systech360范围策略')]
${S360_SCOPE_POLICY_CARD}                      id=preferenceCardName_2
${S360_ADMINISTRATOR_RIBBON}                   //a[@id='Administrator']
${S360_ADMINISTRATOR_RIBBON_SEC_POLICY}               //a[@id='homeSelected']
${S360_ADMINISTRATOR_LAST_PAGE_ARROW}           //span[contains(text(),'»»')]
${SEC/S360_ADMIN_FILE_STORAGE_UTILIZATION_CARD_zh}    //h4[contains(@id, 'preferenceCardName_') and text()='文檔存储利用']
${SEC/S360_ADMIN_DATA_POOL_CATEGORIES_CARD_zh}    //h4[contains(@id, 'preferenceCardName_') and text()='数据池类别']
${S360_FILE_STORAGE_UTILIZATION_DOCUMENTS_ROW}       //label[contains(text(),'Documents')]
${S360_FILE_STORAGE_UTILIZATION_DETAILS_TAB}        //label[@id='childrenTab']
${SEC/S360_ADMINISTRATOR_RIBBON_SEC_POLICY_NEW}             id=Administrator
${S360_DATA_POOL_REFRESH_ICON_zh}               //i[@title="刷新"]
${S360_AUDIT_FILTER_ICON}                    //i[@id='lblAddFilter']
${SEC/S360_ADMIN_AUDIT_CARD_zh}                       //h4[contains(@id, 'preferenceCardName_') and text()='审核']
${SEC/S360_ADMIN_AUDIT_FILTER_SAVE_zh}                 //button[@id='floatBtn_ApplyTxt']
${SEC/S360_AUDIT_FILTER_SEL_ITEM_2_SELECTED_zh}              //button[@title="将已选择的项目移动到”已选择”清单"]
${SEC/S360_AUDIT_FILTER_ALL_ITEM_2_SELECTED_zh}              //button[@title="将所有项目移动到”已选择”清单"]
${SEC/S360_AUDIT_FILTER_SEL_ITEM_2_AVAILABLE_zh}              //button[@title="将已选择的项目移动到”可用”清单"]
${SEC/S360_AUDIT_FILTER_ALL_ITEM_2_AVAILABLE_zh}              //button[@title="将所有项目移动到”可用”清单"]
${S360_FILTER_NAME_INPUT}           //input[@id='filter-name']
${S360_FILTER_DROP_DOWN_CHECKBOX}           //div[@class="ui-chkbox-box ui-widget ui-corner-all ui-state-default"]
${S360_FILTER_SUCCESS_MSG_zh}       //p[contains(text()," 成功创建。")]
${S360_FILTER_MSG_DETAILS_DRPDOWNBTN}        //div[@title='Details']
${S360_FILTER_MSG_DISMISS_ICON}       //div[@title='Dismiss']
${S360_FILTER_MSG_DISMISS_ALL_ICON}     //div[@title='Dismiss all messages']
${S360_FILTER_NEW_zh}        //div[contains(text(),'All_AUTO')]
${S360_ICW_CLOSE_ICON}       //button[@id='close-icon']
${S360_FILTER_NAME_REMOVE_FILTER}      //span[@id='remove_filter']
${S360_ITEMS_PER_PAGE_TEXT}       //label[contains(text(),'每页项目')]
${SEC/S360_PUBLISHED_SCENE_DROP_DOWN}        //select[@formcontrolname="assetItem"]
${SEC/S360_NEW_VIEW_zh}           //h4[contains(text(), "AUTO_VIEW")]   //span[contains(text(),'«')]

#####################SSO###############################

${AZURE_LOGIN_BUTTON}                                     id=IdpLoginBtn
${MICROSOFT_LOGIN_SCREEN}                                 id=lightbox
${ACCOUNT_SCREEN}                                         xpath=//*[@id="lightbox"]//div[contains(@class,'animate slide-in-back')]
${SSO_LOGIN_SCREEN}                                       xpath=//*[@id="lightbox"]//div[contains(@class,'animate slide-in-next')]
${SSO_LOGIN_EMAIL}                                        name=loginfmt
${ANOTHER_ACCOUNT_OPTION}                                 id=otherTileText
${SSO_LOGIN_NEXT_BUTTON}                                  id=idSIButton9
${SSO_LOGIN_PASSWORD}                                     name=passwd
${SSO_SIGNED_NO_BUTTON}                                   id=idBtn_Back
${SSO_EMAIL_LOGOUT}                                       id=tilesHolder
${SSO_FORGOT_EMAIL_MENU}                                  xpath=//*[@id="tilesHolder"]//div[contains(@aria-controls,'tileMenu0')]
${SSO_FORGOT_LINK}                                        id=forgetLink