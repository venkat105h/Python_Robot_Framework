*** Variables ***
${S360_OP_VIEWS_IMAGE}                                 (//*[@id="itemImage"])
${S360_OP_SOFTWARE_ARIA_EXPENDED}                      //*[@aria-expanded="false"]
${S360_OP_SOFTWARE_TAB_BUTTON}                         id=softwareTab
${S360_OP_DISPLAYUSERNAME}                             id=userDisplayImage
${S360_OP_SOFTWARE_TAB_VIEW}                           class=software-items-wrapper
${S360_OP_REFINE_BY_VIEW}                              class=refine-by-list-wrapper
${S360_OP_GROUP_BY_LABEL}                              id=groupByLbl
${S360_OP_REFINE_BY}                                   id=refine-by-component
${S360_OP_REFINE_BY_SUPPORTED_VERSION}                 id=refine_Supported_Versions_group
${S360_OP_REFINE_BY_CURRENT_ON_UPDATES}                id=refine_Current_On_Updates_group
${S360_OP_REFINE_BY_VERSION}                           id=refine_Version_group
${S360_OP_REFINE_BY_NODE}                             //*[@id="refine-by-component"]/p
${S360_OP_REFINE_NODE_LINES}                              //*[@id="refine_Node_Lines"]
${S360_OP_REFINE_NODE_LINES_COUNTS}                    //*[@id='refine_Node_Lines']/span[contains(@class,'count')]
${S360_OP_REFINE_NODE_SITE_SERVERS}                    //*[@id="refine_Node_Site_Servers"]/div
${S360_OP_REFINE_NODE_SITE_SERVERS_COUNTS}             //*[@id='refine_Node_Site_Servers']/span[contains(@class,'count')]
${S360_OP_REFINE_NODE_UNITRACE}                        id=refine_Node_Unitrace
${S360_OP_REFINE_NODE_UNITRACE_COUNTS}                 //*[@id='refine_Node_Unitrace']/span[contains(@class,'count')]
${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO}              id=refine_Supported_Versions_No
#${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO}              id=refine_Supported_Versions_No Sneha s updated xpath
${S360_OP_REFINE_BY_SUPPORTED_VERSION_NO_COUNTS}       //*[@id='refine_Supported_Versions_No']/span[contains(@class,'count')]
#${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES}             id=refine_Supported_Versions_Yes
${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES}             //li[@id='refine_Supported_Versions_Yes']
${S360_OP_REFINE_BY_SUPPORTED_VERSION_YES_COUNTS}      //*[@id='refine_Supported_Versions_Yes']/span[contains(@class,'count')]
${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO}             id=refine_Current_On_Updates_No
${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_NO_COUNTS}      //*[@id='refine_Current_On_Updates_No']/span[contains(@class,'count')]
${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES}            id=refine_Current_On_Updates_Yes
${S360_OP_REFINE_BY_CURRENT_ON_UPDATES_YES_COUNTS}     //*[@id='refine_Current_On_Updates_Yes']/span[contains(@class,'count')]
${S360_OP_REFINE_VERSIONS_LIST}                        (//li[contains(@id, 'refine_Version_')])
${S360_TITLES}                                         (//*[contains(@class, 'mat-expansion-panel')]/*[contains (@id, 'mat-expansion-panel-header')])
${S360_SERVER_NAME}                                    (//*[contains(@class,"server-name-num")])
${S360_TITLES_EXPANDED_CONTENT}                        (//*[contains(@class,"mat-expansion-panel-content")])
${S360_DISABLED_CHECKBOXES}                            (//*[contains(@class, 'disabled')])
${S360_DISABLED_CHECKBOX_NODE_COUNT}                   (//*[contains(@class, 'disabled')]//span[contains(@class,'count')])
${S360_CHECKED_VERSIONS}                               (//*[contains(@class, 'ng-touched')])
${S360_GROUP_BY_DROPDOWN}                              id=groupByList
${S360_OP_NODES_RIBBONS}                               //*[contains(@class, 'detailed_table_wrapper')]
${S360_OP_OVERVIEW_RIBBON}                             class=overview-panel
${S360_OP_OVERVIEW_RIBBON_BODY}                        //*[@class='overview-panel']//*[contains(@class, 'mat-expansion-panel-body')]
${S360_OP_OVERVIEW_RIBBON_HEADERS}                     (//*[@class="chart-header"])
${S360_OP_OVERVIEW_RIBBON_HEADERS_PERCENTAGES}         (//*[@class="radial-text"])
${S360_OP_OVERVIEW_RIBBON_HEADERS_CHART}               (//*[@class="arc"])
${S360_OP_PUBLISHED_SCENE_INPUT}                       //*[@formcontrolname="assetItem"]
${S360_OP_NO_DATA_AVAILABLE_TEXT}                      (//h4[contains(text(),'No Data Available')])
${S360_OP_OVERVIEW_RIBBON_CARDS}                       (//*[contains(@class, 'chart-card')])
${S360_OP_OVERVIEW_RIBBONS_NODE_COUNT}                 (//*[contains(@id,"mat-expansion-panel-header")]//span[@class="ng-star-inserted"])
${S360_OP_NODE_CONTENT}                                (//*[@class="item-details"])
${S360_OP_NODE_CONTENT_TIME}                           (//*[@class="item-details"]/p)
${S360_OP_SELECTED_NODE}                               (//div[contains(@class, 'selectedRow')])
${S360_OP_ICW}                                         //*[contains(@class, 'sidebar-wrapper')]
${S360_OP_ICW_ELEMENT}                              //*[@id="cdk-accordion-child-2"]/div/div/div/div[2]/strong
${S360_OP_ICW_HEADER_TITLE}                            //*[@class="current-component"]
${S360_OP_ICW_OVERVIEW_TAB}                            (//*[contains(@id, 'mat-tab-label')])[1]
${S360_OP_ICW_KB_UPDATES_TAB}                          (//*[contains(@id, 'mat-tab-label')])[2]
${S360_OP_ICW_OVERVIEW_RIBBON}                         (//*[@id="OverviewTxt"])
${S360_OP_ICW_OVERVIEW_RIBBON_CONTENT}                 //*[contains(@class, 'sidebar-wrapper')]//*[contains(@class, 'overview-wrapper')]
${S360_OP_ICW_SEARCH_BOX}                              id=searchBox
${S360_OP_ICW_TABS_CONTENT}                            //*[contains(@class, 'sidebar-wrapper')]//*[contains(@class, 'mat-expansion-panel-body')]
${S360_OP_ICW_KB_UPDATES_TAB_TABLE_COLUMNS}            (//*[@id="lot-details-data-table"]//datatable-header-cell)
${S360_OP_ICW_EXPAND_BUTTON}                           id=expand-collapse-button
${S360_OP_ICW_RETRACT_BUTTON}                          (//*[contains(@class, 'fa-caret-right')])
${S360_OP_ICW_CLOSE_BUTTON}                            id=close-icon
${S360_OP_SOFTWARE_TAB_ALERT_ICON}                     //*[@id="softwareTab"]//*[contains(@class, 'count-indicator')]
${S360_OP_RIBBON_RELEASE_NOTES}                        class=release-link
${S360_OP_RIBBON_SOFTWARE_IMAGES}                      (//*[contains(@id,"cdk-accordion-child-")])
${S360_OP_RIBBON_SOFTWARE_NODE_NAMES}                  (//*[contains(@class,"mat-expansion-panel-content")])
${S360_OP_SOFTWARE_RIBBONS_BODY}                       (//*[contains(@id,"cdk-accordion-child-")])
${S360_OP_SOFTWARE_RIBBONS_BODY}                       (//*[contains(@id,"cdk-accordion-child-")])
${S360_OP_SOFTWARE_NODE_NAMES}                         (//*[contains(@id,"cdk-accordion-child-")]//div/strong)
${S360_OP_SOFTWARE_HEADER_TITLE}                       (//*[contains(@class,"mat-expansion-panel-header-title")])
${S360_OP_SOFTWARE_RELEASE_NOTES}                      //*[contains(@class,"release-notes")]
#dashboard
${S360_OP_DASHBOARD_TAB}                               id=navBtn_dashboard
${S360_OP_DASHBOARD_OVERVIEW_TAB}                      id=OverviewTab
${S360_OP_DASHBOARD_NODE_STATUS_ARC}                   (//*[contains(@id, 'arc_Available_')])[1]
${S360_OP_DASHBOARD_OVERVIEW_TAB_CIRCLE}               //*[contains(@id,"squareNoteInsideNodeStatus")]
${S360_OP_DASHBOARD_GRAPHICAL_TAB}                     (//*[contains(@class,"tab-label")])[2]
${S360_OP_DASHBOARD_NODES_TAB}                         (//*[contains(@class,"tab-label")])[3]
${S360_OP_DASHBOARD_GRAPHICAL_TAB_CHART}               id=treeChart
${S360_OP_DASHBOARD_NODES_TAB_CONTENT}                 id=facetOperatorFilter
${SEC/S360_PARENT_BREADCRUMB_1}                        id=globalSearch_ParentLbl
${S360_OP_DASHBOARD_DEFAULT_SCENE_TEXT}                class=defaultSceneTxt





