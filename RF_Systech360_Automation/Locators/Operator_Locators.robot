#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in Information Center Automation.
#   Project           :      UniSphere Operator Automation
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

${S360_OP_NOTI_RULES_CARD}           id=preferenceCardName_0
${S360_OP_NOTI_RULES_CARD_SECTION}   xpath=(//*[@id='preferenceCardSection_0']/div)
${S360_OP_EN_SUMM_CARD}              id=preferenceCardName_1
${S360_OP_EN_SUMM_CARD_SECTION}      xpath=(//*[@id='preferenceCardSection_1']/div)
${S360_OP_PRODUCTION_CARD}           id=preferenceCardName_2
${S360_OP_MY_VIEWS_CARD}             id=preferenceCardName_3
${S360_OP_MANAGE_SCENES_CARD}        id=preferenceCardName_4
${S360_OP_NAV_DASHBOARD_BTN}         id=navBtn_dashboard
${SEC_OP_NAV_ACTION_ITEM_ICON}       id=Action-icon
${SEC_OP_APROOVED_SCENE_1}           //*[@id="PublishedScene_itemName_0"]
${SEC_OP_PUBLISHED_SCENE_1}          //*[@id="PublishedScene_itemName_0"]
${SEC_OP_PUBLISHED_VIDEO}          //*[@id="video-play-icon"]
${SEC_OP_TEMP_SCENE_1}               //*[@id="ApprovedScene_itemName_0"]


${S360_DEFAULT_VIEW_NAME}            xpath=//div[contains(@class, 'defaultSceneLable')]/P/span
${S360_WEL_PAGE_COL/EXP_BTN}         xpath=(//i[@id='btnCollapse'])

${S360_PIN_ICON}                     id=pin-icon
${S360_EXPAND_SCENE}                 xpath=//a[@id='publishedSceneFilter-item']/..//*[@id='expandCollapse']
${S360_SCENE_LIST}                   xpath=(//a[@id='publishedSceneFilter-item']/../..//*[contains(@id,'childItem')])
${S360_EXPAND_PUBLISHED_SCENE}       xpath=(//a[@id='PublishedScene-item']/..//*[@id='expandCollapse'])[1]
${S360_EXPAND_APPR_SCENE}            xpath=//a[@id='PublishedScene-item']/../..//*[@title='Approved Scene']//*[@id='expandCollapse']
${S360_EXPAND/COLLAPSE_APPR_SCENE}   xpath=//*[@id="btnApprovedFamilyToggle"]/i
${S360_EXPAND/COLLAPSE_PUBLI_SCENE}  xpath=//*[@id="btnNewPublishFamilyToggle"]/i
${S360_NAV_APPR_SCENES_LIST}         xpath=(//*[@title='Approved Scene']//*[contains(@id,'childItem')])
${S360_ADD_NEW_SCENE}                id=newScene
${S360_OP_DEFAULT_MENU_ICON}         xpath=(//i[@id='setDefault-menu-item'])
${S360_OP_BOOKMARK_ICON}             xpath=//*[contains(@class,'bookmarkIcon')]
${S360_OP_NO_PUB_SCENE}              id=p_lblNoItemFound
${S360_OP_NO_APPRO_SCENE}            id=a_lblNoItemFound
${S360_OP_NO_MY_VIEW}                id=cards_noItemFound
${S360_OP_MY_VIEW_SCENE_LIST}        xpath=//*[@id="newScene"]/div[2]//select
${S360_CARDS}                        xpath=(//h4[contains(@id, 'preferenceCardName_')])
${S360_BREADCRUMBS}                  xpath=(//ul[@id='breadcrumb']/li)
${S360_DUPLICATE_WARNING}            //div[@id='toggle-details-container']//li[@class=wrapword ng-tns-c24-60 ng-star-inserted']//span
${S360_APPROVE_SUCCES_MSG}           //*[@id="Layer_1"]


${S360_NPS_PANEL}                    id=lblNewPublishedFamily
${S360_AS_PANEL}                     id=lblApprovedFamily
${S360_PUB_SEARCH_BOX}               xpath=//div[@id='sectionNewPublishedScene']//input[@id='searchBox']
${S360_APPR_SEARCH_BOX}              xpath=//div[@id='sectionApprovedScenes']//input[@id='searchBox']
${S360_APPR_SEARCH_BUTTON}          (//*[@id="searchBtn"])[2]
${S360_PUB_SEARCH_BTN}               xpath=//div[@id='sectionNewPublishedScene']//button[@id='searchBtn']
${S360_APPR_SEARCH_BTN}            (//*[@id="searchBtn"])[2]
${S360_ACCEPT_BUTTON}                id=approveBtn
${S360_REJECT_BUTTON}                id=rejectBtn
${S360_RETRACT_BUTTON}               id=retractBtn
${S360_APPROVE_BUTTON}               id=approveBtn


${S360_PUB_ITEM_PER_PAGE_DD}         id=p_listItemsPerPage
${S360_APP_ITEM_PER_PAGE_DD}         id=a_listItemsPerPage
${S360_VIEW_ITEM_PER_PAGE_DD}        id=cards_itemsPerPageList
${S360_SCENE_ASCENDING_BTN}          xpath=(//*[@id='AscdBtn'])
${S360_LAST_APPROVED_SCENE}         (//*[@aria-label="Last"])
${S360_SCENE_DESCENDING_BTN}         xpath=(//*[@id='DscdBtn'])
${S360_SCENE_SORT_BY_DD}             xpath=(//*[@id='sortByList'])
${S360_PUB_ITEM_PER_PAGE_LBL}        id=p_lblItemsPerPage
${S360_APP_ITEM_PER_PAGE_LBL}        id=a_lblItemsPerPage
${S360_VIEW_ITEM_PER_PAGE_LBL}       id=cards_itemsPerPage
${S360_PUB_CARD_ID}                  xpath=(//h4[@id='PublishedScene_itemName_0'])[1]
${S360_PUB_CARD_NAME}               (//*[@class="wrap_fixed_Head"])
${S360_NEW_PUB_CARD_NAME}             //*[@id="rejectBtn"]
${S360_APPR_PUB_CARD_NAME}            //*[@id="retractBtn"]
${S360_NEW_PUB_CARD_NAME_1}            //*[@id="PublishedScene_itemName_"]
${S360_PUB_REJECTED_CARD_NAME}       xpath=(//div[@id='sectionNewPublishedScene']//h4[contains(@id,'PublishedScene_itemName_')])
${S360_APP_CARD_NAME}                //*[@id="ApprovedScene_itemName_0"]
${S360_APP_CARD_NAME_APPR}            //*[@id="ApprovedScene_itemName_0"][@title="TestSceneOp1 "]
${S360_APP_CARD_FIRST_APPR_NAME}      //*[@id="ApprovedScene_itemName_0"]
${S360_APP_CARD_NAME_1}               //*[@id="PublishedScene_itemName_0"]
${S360_VIEW_CARD_FIRST_NAME}          //*[@id="publishedSceneFilter_itemName_0"]
${S360_VIEW_CARD_NAME}                //*[@id="publishedSceneFilter_itemName_0"]
${S360_VIEW_CARDS_NAME}               //*[@id="openMenuOnMouseEnter"]
${S360_VIEW_CARDS_NAME_LIST}          //*[@class="datatable-checkbox ng-star-inserted"]
${S360_DELETED_VIEW_CARD_NAME}       //*[@id="name_0-Lbl"]
${S360_VIEW_LIST_CARD_NAME}          xpath=//label[contains(@id,'name_' ) ]
${S360_COMMENT_BUTTON}               id=toggleComment_0
${S360_COMMEN_TBOX}                  id=commentTextArea_0
${S360_ADD_COMMENT_BUTTON}           id=addComment_0
${S360_SUCCESS_MESSAGE}              id=thankYouText_0
${S360_SORT_BY}                      id=sortDropDown
${S360_ASCENDING}                    id=sortAscending
${S360_DESCENDING}                   id=sortDescending
${S360_TOTAL_PAGES}                  xpath=(//a[contains(@class, "page-link")])
${S360_NEXT_BUTTON}                  xpath=//a[@aria-label='Next']
${S360_SET_DEFAULT_BTN}              //*[@id="setDefaultBtn"]
${S360_NAV_SET_DEFAULT_BTN}          xpath=(//ul[contains(@class,'dropdown-menu show')]/li/a)
${S360_NODE_TAB_RIBBONS}                        (//*[contains(@id,'componentFacet_')])
${S360_NODE_TAB_RIBBON_IMAGE}                   (//*[contains(@id, "imagecomponent")])
${S360_NODE_TAB_ESCALATION_CRITICAL}            id=refine_Escalation_Critical
${S360_NODE_TAB_ESCALATION_CRITICAL_COUNT}      //*[@id='refine_Escalation_Critical']/span[contains(@class,'count')]
${S360_NODE_TAB_ESCALATION_NORMAL}              id=refine_Escalation_Normal
${S360_NODE_TAB_ESCALATION_NORMAL_COUNT}        //*[@id='refine_Escalation_Normal']/span[contains(@class,'count')]
${S360_NODE_TAB_ESCALATION_WARNING}             id=refine_Escalation_Warning
${S360_NODE_TAB_ESCALATION_WARNING_COUNT}       //*[@id='refine_Escalation_Warning']/span[contains(@class,'count')]
${S360_NODE_TAB_STATUS_OFFLINE}                 id=refine_Status_Offline
${S360_NODE_TAB_STATUS_OFFLINE_COUNT}           //*[@id='refine_Status_Offline']/span[contains(@class,'count')]
${S360_NODE_TAB_STATUS_ACTIVE}                  id=refine_Status_Active
${S360_NODE_TAB_STATUS_ACTIVE_COUNT}            //*[@id='refine_Status_Active']/span[contains(@class,'count')]
${S360_NODE_TAB_STATUS_AVAILABLE}               refine_Status_Available
${S360_NODE_TAB_STATUS_AVAILABLE_COUNT}         //*[@id='refine_Status_Available']/span[contains(@class,'count')]
${S360_NODE_ICW_HEARTBEAT}                      //div[contains(text(),'Heartbeat')]
${S360_OP_NODE_EMPTY_MSG}                       //div[contains(text(),' No data to display ')]
${S360_NODE_ICW_HEARTBEAT_OVERVIEW_VALUES}      (//*[contains(@id,'keyValue_value_')])
${S360_NODE_ICW_HEARTBEAT_OVERVIEW_NAME}        (//*[contains(@id,'keyValue_name_')])
${S360_NODE_REFINE_BY_AREA}             id=refine-by-component
${S360_NODE_VERTICAL_DIVIDER}           class=vertical-divider
${S360_NODE_TAB INTERFACE}              id=facetGrid
${S360_NODE_REFINE_BY_NODE}             id=refine_Node_group
${S360_NODE_REFINE_BY_ESCALATION}      //*[@id="refine_Escalation_group"]
${S360_NODE_REFINE_BY_STATUS}           id=refine_Status_group
${S360_NODE_TOP_NODES}                  (//*[contains(@id, 'componentFacet_0_')])

# Dashboard
${S360_DASHBOARD}                    class=overviewContainer
#${S360_COMPONENTS}                   //*[@id="retractBtn"]
${S360_COMPONENTS}                    (//*[@class="statusText"])
${S360_COMPONENTSS}                  xpath=(//*[@class="caption-first"]/div)
${S360_OPEN_COMMENTS_BTN}            xpath=(//span[@id='openComments'])
${S360_COMMENTS_LABEL}               id=commentsLbl
${S360_COMMENTS_TXT_AREA}            id=comments_content
${S360_COMMENTS_ADD_BTN}             //*[@id="comments_addBtn"]
${S360_COMMENTS_CANCEL_BTN}          id=comments_cancelBtn
${S360_COMMENTS_OK_BTN}              id=comments_okBtn
${S360_COMMENTS_X_BTN}               xpath=(//*[@id="commentsModal"]//button/span)
${S360_COMMENTS_SEARCH_FIELD}        id=comments_searchBox
${S360_COMMENTS_SECTION}             xpath=(//*[contains(@id, 'description_')])
${S360_COMMENTS_HIGHLIGHTED_TEXT}    xpath=(//*[contains(@id, 'description_')]/span[@class='highlightText'])
${S360_COMMENTS_DATE_ELEMENTS}       xpath=(//*[contains(@id, 'header_')])

${S360_NODE_NAMES}                   xpath=(//*[contains(@class,"statusText")]/h6)
${S360_NODE_NAMES_HIGHLIGHTED_TEXT}  xpath=(//*[contains(@id, 'description_')]/span[@class='highlightText'])
${S360_NODE_DETAILS_TABLE}           id=Outsideborderdiv
${S360_NODE_COUNT_TABLE}             xpath=(//div[@id='itemCountOrgnizationSites']//*[@class='numberCountDisplay'])[2]
${S360_SITE_COUNT_TABLE}             xpath=(//div[@id='itemCountOrgnizationSites']//*[@class='numberCountDisplay'])[1]
${S360_ORGN_COUNT_TABLE}             xpath=(//div[@id='itemCountOrgSites']//*[@class='numberCountDisplay'])[1]
${S360_ENVR_COUNT_TABLE}             xpath=(//div[@id='itemUtilizationTrends']//*[@class='numberCountDisplay'])[1]
${S360_NODE_TAB_VIEW}                //*[@id="nodesTab"]
${S360_NODDE_TAB}                     (//*[@id='nodesTab'])[2]
${S360_NODE_TAB}                     id=nodesTab
#${S360_NODE_TAB_IN_DASHBOARD}        (//*[@id='nodesTab'])[2]
${S360_NODE_TAB_IN_DASHBOARD}        (//*[@id='nodesTab'])
${S360_GRAPHICAL_TAB}                //*[@id="graphicalTab"]
#${S360_GRAPHICAL_TAB_DASHBOARD}      (//*[@id="nodesTab"])[1]
${S360_GRAPHICAL_TAB_DASHBOARD}      (//*[@id="graphicalTab"])
${S360_OVERVIEW_TAB}                 id=overviewTab

${S360_REFINE_BY_NODE}               refine_Node_Site_Servers
${S360_REFINE_BY_NODE_SITE}          //*[@class="facetGrid-item ng-star-inserted"]

${S360_REFINE_BY_SITE_SERVER}        refine_Node_Site_Servers
${S360_REFINE_BY_CLOUDS}             refine_Node_Clouds
${S360_REFINE_BY_DATA_SOURCES}       refine_Node_Data_Sources_Servers
${S360_GRAPH_ELEMENTS}               xpath=(//div[@id='treeChart']//*[name()='image'])
${S360_LINES_ICONS}                  xpath=(//*[@class='node']/*[@height='20' and @width='20'])
${S360_PLU_ARC}                      xpath=(//*[contains(@id, 'arc_Available_')])[2]
${S360_DIAGNOSTICS_ICON}             id=openDiag
${S360_DIAGNOSIS_POPUP}              xpath=(//div[@id='divPopModal'])[2]
${S360_NODE_IMAGES}                  xpath=(//img[contains(@id, 'imagecomponent_')][1])
${S360_NODE_DETAILS_SWITCH}          xpath=//*[@id='enablePrefixChkBoxLbl']/span[1]

${S360_PUB_NAVIGATION_LINKS}         xpath=(//*[@id='p_pagination']//a[contains(@class, "page-link")])
${S360_PUB_FIRST_PAGE_LINK}          xpath=(//*[@id='p_pagination']//a[@aria-label="First"])
${S360_PUB_LAST_PAGE_LINK}           xpath=(//*[@id='p_pagination']//a[@aria-label="Last"])
${S360_PUB_NEXT_PAGE_LINK}           xpath=(//*[@id='p_pagination']//a[@aria-label="Next"])
${S360_PUB_ACTIVE_PAGE_LINK}         xpath=(//*[@id='p_pagination']//li[contains(@class,'active')])/a
${S360_PUB_LAST_PAGE_NUM_LINK}       xpath=(//*[@id='p_pagination']//a[@aria-label="Next"]/../preceding-sibling::li[1]/a)

${S360_APPR_NAVIGATION_LINKS}        xpath=(//*[@id='a_pagination']//a[contains(@class, "page-link")])
${S360_APPR_FIRST_PAGE_LINK}         xpath=(//*[@id='a_pagination']//a[@aria-label="First"])
${S360_APPR_LAST_PAGE_LINK}          xpath=(//*[@id='a_pagination']//a[@aria-label="Last"])
${S360_APPR_NEXT_PAGE_LINK}          xpath=(//*[@id='a_pagination']//a[@aria-label="Next"])
${S360_APPR_ACTIVE_PAGE_LINK}        xpath=(//*[@id='a_pagination']//li[contains(@class,'active')])/a
${S360_APPR_LAST_PAGE_NUM_LINK}      xpath=(//*[@id='a_pagination']//a[@aria-label="Next"]/../preceding-sibling::li[1]/a)
${S360_VIEW_LAST_PAGE_NUM_LINK}      xpath=(//*[@id='cards_pagination']//a[@aria-label="Next"]/../preceding-sibling::li[1]/a)
${S360_OP_VIDEO_SECTION}              //*[@id="video"]
${S360_OP_POPUP_TITLE}               //*[@id="list-group-item-desc"]
${S360_OP_POPUP_CLOSE_BTN}           xpath=(//button[@aria-label='Dismiss'])[4]
${S360_OP_LIST_VIEW_NAMES}           //*[@id="name_0-Lbl"]/span
${My_Views_Header}                              xpath=//a[@id='View']
${SEC/S360_CARDS_VIEW_BTN}           //*[@id="cardViewBtn"]
${SEC/S360_LIST_VIEW_BTN}          //*[@id="listViewBtn"]
${S360_OP_TOTAL_PAGES}               xpath=(//a[contains(@class, "page-link")])
${S360_OP_LAST_PAGE_BTN}             xpath=//a[@aria-label='Last']
${S360_OP_NEXT_BTN}                  xpath=//a[@aria-label='Next']
${S360_OP_FIRST_PAGE_BTN}            xpath=//a[@aria-label='First']
${S360_OP_ACTIVE_PAGE_NUMBER}        xpath=(//li[contains(@class,'active')]/a)

${S360_VIEW_DEFAULT_ICON}            xpath=//i[contains(@class,'bookmarkIcon')]
${S360_VIEW_IMAGE_BT_NO}             id=buttn_NoTxt
${S360_VIEW_List_CHECKBOX}           xpath=//input[contains(@id,'checkBox_')]

################################################# Node Tab#######################################################################
${S360_NODE_REFINE_BY_AREA}                    (//div[@class='refine-by-list-wrapper'])[1]
${S360_NODE_VERTICAL_DIVIDER}                  (//*[@class='vertical-divider'])[1]
${S360_NODE_TAB_INTERFACE}                     (//*[@class='table-wrapper']/div[3])

######   NODE  ##############
${S360_NODE_REFINE_BY_NODE}                     (//*[@id='refine_Node_group']/P)[1]
${S360_NODE_REFINE_BY_NODECLOUDS}
${S360_NODE_REFINE_BY_NODELINE}                (//*[@id='refine_Node_Lines']/div)[1]
${S360_NODE_REFINE_BY_NODE_SITE_SERVER}        (//*[@id='refine_Node_Site_Servers']/div)[1]
${S360_NODE_REFINE_BY_NODEUNITRACE}            (//*[@id='refine_Node_Unitrace']/div)[1]
#Missing${S360_NODE_REFINE_BY_NODEUNISECURE}=      (//*[@id='refine_Node_UniSecure']/div)[1]

#########   ESCALATION   ######
${S360_NODE_REFINE_BY_ESCALATION}=              (//*[@id='refine_Escalation_group']/p)
${S360_NODE_REFINE_BY_ESC_CRITICAL}=            (//*[@id="refine_Escalation_Critical"]/div)
${S360_NODE_REFINE_BY_ESC_WARNING}=             (//*[@id="refine_Escalation_Warning"]/div)
${S360_NODE_REFINE_BY_ESC_NORMAL}=              (//*[@id="refine_Escalation_Normal"]/div)
#########   STATUS   ######
${S360_NODE_REFINE_BY_STATUS}=                  (//*[@id='refine_Status_group']/p)
${S360_NODE_REFINE_BY_STATUS_ACTIVE}=           (//*[@id="refine_Status_Active"]/div)
${S360_NODE_REFINE_BY_STATUS_AVAILABLE}=        (//*[@id="refine_Status_Available"]/div)
${S360_NODE_REFINE_BY_STATUS_UNAVAILABL}=       (//*[@id="refine_Status_Maintenance"]/div)
${S360_NODE_REFINE_BY_STATUS_OFFLINE}=          (//*[@id="refine_Status_Offline"]/div)


############TAB INTERFACE  #############
${S360_COMPONENTS}=     (//h6[contains(@id,'component_0_')])

####################################################### ICW ############################################################

${ICW_TAB_HEARTBEAT_OVRVIEW_RIBBON}                 (//*[text()=' Overview '])[1]
${ICW_TAB_HEARTBEAT_PROINFO_RIBBON}                 (//*[text()=' Provider Information '])
${ICW_TAB_SYSTEMHEALTH_RIBBON}                      (//*[text()=' System Health '])
${ICW_TAB_SYSCHECK_RIBBON}                          (//*[text()=' Systech Checks '])
${ICW_TAB_SOFTWARE_RIBBON}                          (//mat-panel-title[text()=' Software '])
${S360_NODE_ICW}                                    //*[@id="root"]/..
${S360_NODE_ICW_CLOSEBTN}                           //*[@id="close-icon"]
${S360_NODE_COMPONENTS_TILE}                        (//*[contains(@id,'componentFacet_0_')]/div[1])
${S360_NODE_ICW_EXPAND}                             //*[@id="expand-collapse-button"]
#${S360_NODE_ICW_COLLAPSE}                           //*[@id="facetOperatorFilter"]/div/div[2] - sneha updated locator
${S360_NODE_ICW_COLLAPSE}                           //i[@class='fa fa-caret-right']
${S360_NODE_ICW_NODE_NAME}                         (//*[@class="ng-star-inserted"]/p)[1]
#${S360_NODE_ICW_NODE_NAME}                          //p[@class='title_ellipsis']
${S360_NODE_ICW_NODE_STATUS}                        (//*[@class="ng-star-inserted"]/p)[2]
${S360_NODE_LINES}                                   //*[@id="refine_Node_Lines"]/div
${S360_NODE_COMENTS}                                //*[@id="header_0"]/p
${S360_NODE_ICW_TABS}                               (//*[@class='mat-tab-label-content'])
${S360_NODE_ICW_SEARCH_BOX}                         (//*[@id="searchBox"])
${S360_NODE_ICW_SEARCH_BTN}                         (//*[@id="searchBtn"])
${S360_NODE_ICW_RIBBON}                             (//*[contains(text(),' Commands ')])[2]
${S360_NODE_COMPONENTS_EXPANDS_BTN}                 (//*[contains(@id,'componentFacet_0_')]/span)
${S360_NODE_COMPONENTS_SUBTILE}                     (//h6[contains(@id,"component_1_")])
${S360_NODE_COMPONENTS_SUBTILE_STATUS}              (//p[contains(@id,'componentstatus_1_')])
${S360_NODE_ICW_DIAGNOSTICS_FUNTION}                (//*[@id="update-state"])
${S360_NODE_ICW_MSG_RIBBON}                         (//*[contains(text(),' Messages')])[2]
${S360_NODE_ICW_NODE_COMMENT}                       (//*[contains(@id,'comments_data_')])
${S360_NODE_ICW_TABINFO}                            (//*[contains(@id,"keyValue_name_")])
${S360_NODE_ICW_NOTE_RIBBON}                        (//mat-panel-title[contains(text(),'Notes')])
${S360_NODE_ICW_ADDED_COMMENT}                      (//*[@id="header_0"]/p)
${S360_NODE_ICW_DIGNO}                              (//*[@id="update-state"])
${S360_NODE_ICW_EMPTY_MSG}                          (//*[contains(text()," No data to display ")])
${S360_NODE_ICW_NO_COMMENT_MSG}                     (//*[contains(text(),' There are no comments ')])
${S360_NODE_LINES}                                                         (//*[@id="refine_Node_Lines"]/div)[1]

${S360_GRA_NODE_ICW_POINTER}                        (//*[@class='node pointer'])
${S360_GRA_NODE_ICW_SUBPOINTER}                     (//*[@class='node pointer'])
${S360_GRA_NODE_ICW_SHOW/HIDE}                      id=enablePrefixChkBoxLbl
${S360_GRA_NODE_ICW_INTERFACE}                      (//*[@id="treeChart"])
${S360_NODE_ICW_PRE/NXT_BTN}                        (//*[contains(@class,'chevron')])
${S360_NODE_ICW_NODE_STATUS}                        (//div[@class="ng-star-inserted"]/p)[2]
${S360_NODE_ICW_COMP_STATUS}                        //*[@id="componentstatus_0_0"]
${S360_NODE_ICW_COMP_Name}                          //*[@id="component_0_0"]
#Sneha added  xpath for nodestatus
####################################################### Overview Tab ###################################################

${S360_OVERVIEW_TABLE_CARDS}                    (//*[contains(@class,'wrap-fixed-head-orgsite')])
${S360_OVERVIEW_NODE_STATUS}                    (//*[@id="squareNoteInsideNodeStatus"]//*[contains(@class,'legend')])
${S360_OVERVIEW_NODE_STATUS_COLORS}             (//*[@id="squareNoteInsideNodeStatus"]//*[local-name()='rect'])
${S360_OVERVIEW_PACKAGELINE_STATUS}             (//*[@id="squareInsidePackingLines"]//*[contains(@class,'legend')])
${S360_OVERVIEW_PACKAGELINE_STATUS_COLORS}      (//*[@id="squareInsidePackingLines"]//*[local-name()='rect'])
${S360_OVERVIEW_TOTAL_NODES_ON_GRAPH}           (//*[@id='squareNoteInsideNodeStatus']//*[contains(@id,'arc_')]/following-sibling::*[local-name()='text'])
${S360_OVERVIEW_EMPTY_PCKGLINE_MSG}             (//*[@id="squareInsidePackingLines"]//*[contains(text(),"No data to display")])

####################################################### Chinese Translation ###################################################

${S360_NOTI_RULES_ICON}         //img[@class="disabled ng-star-inserted"]
${ICW_COMMAND_TAB_SEND_ICON}         //span[contains(text(),'发送')]
${ICW_COMMAND_TAB_UPDATE_STATE_ICON}        //div[@id='cmd_btn_Update State']
${ICW_DETAILS_TAB}        //div[contains(text(),' 细节 ')]
${ICW_NOTES_TAB}        //div[contains(text(),' 注释 ')]
${ICW_FILES_TAB}        //div[contains(text(),' 文件 ')]
${S360_NOTI_RULES_FILTER_STATE_DROP_DOWN}        //span[contains(text(),'选择')]
${S360_NOTI_RULES_FILTER_STATE_ACK_FAIL}       //div[contains(text(),' 确认失败 ')]
${S360_VAULT_CARD_DESC}            //div[contains(text(), 'Systech360 保管库提供对工件（例如PDF、图纸）的集中管理，以描述和/或支持您的制造环境。')]
${S360_OPERATOR_BREADCRUMB}      id=Operator
${S360_OP_PROD_LOT_RADIO_BTN}         //label[contains(text(), " 批 ")]
${S360_PROD_NODE_ICW_EXPAND}            //*[@class="arrow-wrapper ng-star-inserted"]
${S360_ICW_MSGS_TAB}            //div[contains(text(), " 消息 ")]
${S360_NODE_ICW_HEARTBEAT_zh}           //div[contains(text(),' 心跳 ')]
${S360_NODE_ICW_SYSTEMHEALTH_zh}           //div[contains(text(),' 系统运行状况 ')]
${ICW_TAB_SOFTWARE_RIBBON_zh}              //mat-panel-title[text()=' 软件 ']
${ICW_TAB_HEARTBEAT_PROINFO_RIBBON_zh}             //mat-panel-title[text()=' 提供商信息 ']
${S360_NODE_ICW_MSG_RIBBON_zh}                     //*[contains(text(),' 消息 (1) ')]
${S360_NODE_ICW_NOTES_TAB_zh}          //div[contains(text(),' 注释 ')]
${SEC/S360_OPER_PRODUCTION_CARD_zh}         //h4[contains(@id, 'preferenceCardName_') and text()='生产']
${SEC/S360_OPER_MY_VIEWS_CARD_zh}              //h4[contains(@id, 'preferenceCardName_') and text()='我的试图']
${SEC/S360_OPER_MANAGE_SCENES_CARD_zh}         //h4[contains(@id, 'preferenceCardName_') and text()='管理场景']
${SEC/S360_OPER_VAULT_CARD_zh}                 //h4[contains(@id, 'preferenceCardName_') and text()='保管库']
