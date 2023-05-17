#------------------------------------------------------------------
#   Description       :      User defined Keywords for Enterprise Notification
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
Documentation  Necessary Libraries and Resources file are mentioned below
Library         BuiltIn
Library         Collections
Library         String
Library         SeleniumLibrary  timeout=20.0
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Generic_Locators.robot
Resource        ../Locators/Operator_Locators.robot
Resource        ../Locators/Enterprise_Notification_Locators.robot
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Designer_Keywords.robot
Resource        ../Keywords/UniCloud_Keywords.robot
Resource        ../Keywords/Request_Console_Keywords.robot
Resource        ../Locators/Request_Console_Locators.robot
Resource        ../Locators/Admin_Locators.robot
Variables       ../Variables/${TESTENV}_Variable.py

*** Keywords ***
S360_EN_Navigate to Cards In Operator
    [Documentation]  Navigate to Cards present in Operator welcome page
    
    [Arguments]  ${Card_ID}
    
    SEC/S360_Scroll Page To Location  0  0
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_WELCOME_LINK}
    Wait Until Element Is Visible  ${Card_ID}
    wait until keyword succeeds  5x  2s  Click Element  ${Card_ID}
    Wait Until Element Is Not Visible  ${S360_EN_LOADING_IMAGE} [1]  timeout=20
    run keyword and ignore error    Wait Until Element Is Visible  ${S360_EN_FILTERS_XPATH} [1]  timeout=20

S360_EN_Create Filter
    [Documentation]  Creates the new filter
    
    [Arguments]  ${FilterDetails}  ${StatesList}=${EMPTY}  ${SitesList}=${EMPTY}  ${ProductsList}=${EMPTY}
    
    # Click on add filter button
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Element Is Visible  ${S360_EN_ADD_FILTER_BTN}
    Run Keyword And Ignore Error  Wait Until Page Does not Contain  Loading...  timeout=10
    wait until element is visible    ${S360_EN_ADD_FILTER_BTN}
    Click Element  ${S360_EN_ADD_FILTER_BTN}
    
    # Enters filter name, from date and to date
    @{FilterDetails}=  Split String  ${FilterDetails}  ,
    wait until element is visible     ${S360_EN_FILTER_NAME_TXTBOX}
    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_FILTER_NAME_TXTBOX}
    wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_FILTER_NAME_TXTBOX}  ${FilterDetails}[0]
    click element  ${S360_EN_FIXED_FROM_RADIO_BUTTON}
    SEC/S360_Clear Text Field  ${S360_EN_FROM_DATE_TXTBOX}
    Input Text  ${S360_EN_FROM_DATE_TXTBOX}  ${FilterDetails}[1]
    click element  ${S360_EN_FIXED_TO_RADIO_BUTTON}
    SEC/S360_Clear Text Field  ${S360_EN_TO_DATE_TXTBOX}
    Input Text  ${S360_EN_TO_DATE_TXTBOX}    ${FilterDetails}[2]
    click element  ${S360_EN_FIXED_FROM_RADIO_BUTTON}
    #SEC/S360_Scroll Page To Location  0  0
    sleep   1s
    # Selects required states
    log    ${ProductsList}
    log     ${StatesList}
    ${StateStatus}=  Run Keyword And Return Status  Should Be Empty  ${StatesList}
    ${NoStateStatus}=  Run Keyword And Return Status  Should Be Equal  ${StatesList}  NO
    Run Keyword If  '${StateStatus}'=='${TRUE}'  Run Keywords  Click Element  ${S360_EN_STATE_DD}
    ...  AND  Click Element  ${S360_EN_STATE_SELECT_ALL_CHCKBOX}
    ...  ELSE IF  '${NoStateStatus}'=='${TRUE}'  Log  No States Selected
    ...  ELSE  S360_EN_Select States For Filter  ${StatesList}
    SEC/S360_Scroll Page To Location  0  500
    # Selects required sites
    ${SiteStatus}=  Run Keyword And Return Status  Should Be Empty  ${SitesList}
    ${NoSiteStatus}=  Run Keyword And Return Status  Should Be Equal  ${SitesList}  NO
    Run Keyword If  '${SiteStatus}'=='${TRUE}'  Click Element  ${S360_EN_SELECT_ALL_SITE_BTN}
    ...  ELSE IF  '${NoSiteStatus}'=='${TRUE}'  Log  No Sites Selected
    ...  ELSE  S360_EN_Select Sites For Filter  ${SitesList}
    SEC/S360_Scroll Page To Location  0  1000
    # Selects required products
    ${ProductStatus}=  Run Keyword And Return Status  Should Be Empty  ${ProductsList}
    ${NoProductStatus}=  Run Keyword And Return Status  Should Be Equal  ${ProductsList}  NO
    Run Keyword If  '${ProductStatus}'=='${TRUE}'  Click Element  ${S360_EN_SELECT_ALL_PROD_BTN}
    ...  ELSE IF  '${NoProductStatus}'=='${TRUE}'  Log  No Products Selected
    ...  ELSE  S360_EN_Select Products For Filter  ${ProductsList}
    
    # Save filter and verify success message
    S360_EN_Save/Apply Filter  ${SEC/S360_FLOAT_SAVE_BTN}
    #${Status}=  SEC/S360_Verify Success Message  ${Create_Filter_Msg_ID}
    #changes by Akash - changed parameter passed to success message.
    ${Status}=  SEC/S360_Verify Success Message  ${Create_Filter_Msg}
    
    [Return]  ${Status}
    
S360_EN_Update Filter
    [Documentation]  Creates the new filter
    
    [Arguments]  ${NameOfFilter}  ${FilterDetails}=${EMPTY}  ${StatesList}=${EMPTY}  ${SitesList}=${EMPTY}  ${ProductsList}=${EMPTY}
    
    # Hovers and clicks on filter edit button
    S360_Edit/Delete Filter  ${NameOfFilter}  ${S360_EN_EDIT_FILTER_BTN}
    
    # Updates filter name, from date, to date if required
    @{FilterDetails}=  Split String  ${FilterDetails}  ,
    Run Keyword If  '${FilterDetails}[0]'!='${EMPTY}'  Run Keywords  wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_FILTER_NAME_TXTBOX}
    ...  AND  wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_FILTER_NAME_TXTBOX}  ${FilterDetails}[0]
         #changes by Akash -added scroll to prevent calendar hide status dropdown
    ...  AND    SEC/S360_Scroll Page To Location  0  500
    ...  AND  click element   ${S360_EN_ENABLE_DATE_BUTTON}
    ...  AND  SEC/S360_Clear Text Field  ${S360_EN_FROM_DATE_TXTBOX}
    ...  AND  Input Text  ${S360_EN_FROM_DATE_TXTBOX}  ${FilterDetails}[1]
    ...  AND    sleep    2s
    ...  AND  click element   ${S360_EN_ENABLE_DATE_BUTTON_2}
    ...  AND  SEC/S360_Clear Text Field  ${S360_EN_TO_DATE_TXTBOX}
    ...  AND  Input Text  ${S360_EN_TO_DATE_TXTBOX}    ${FilterDetails}[2]

    #changes by Akash -added scroll to hide date
    SEC/S360_Scroll Page To Location  0  0
    # Update states if required
    ${StateStatus}=  Run Keyword And Return Status  Should Be Equal  ${StatesList}  ${EMPTY}
    Run Keyword If  '${StateStatus}'=='${TRUE}'  Click Element  ${ada}
    ...  ELSE  S360_EN_Select States For Filter  ${StatesList}

     #changes by Akash -added scroll to make sites dropdown visible
    SEC/S360_Scroll Page To Location  0  500
    # Update sites if required
    ${SiteStatus}=  Run Keyword And Return Status  Should Be Equal  ${SitesList}  ${EMPTY}
    Run Keyword If  '${SiteStatus}'=='${TRUE}'  Click Element  ${S360_EN_SELECT_ALL_SITE_BTN}
    ...  ELSE  Run Keywords  Click Element  ${S360_EN_REMOVE_ALL_SITE_BTN}
    ...  AND  S360_EN_Select Sites For Filter  ${SitesList}
    
     #changes by Akash -added scroll to make product dropdown visible
    SEC/S360_Scroll Page To Location  0  1000
    # Update products if required
    ${ProductStatus}=  Run Keyword And Return Status  Should Be Equal  ${ProductsList}  ${EMPTY}
    Run Keyword If  '${ProductStatus}'=='${TRUE}'  Click Element  ${S360_EN_SELECT_ALL_PROD_BTN}
    ...  ELSE  Run Keywords  Click Element  ${S360_EN_REMOVE_ALL_PROD_BTN}
    ...  AND  S360_EN_Select Products For Filter  ${ProductsList}
    
    # Saves and verifies success message
    S360_EN_Save/Apply Filter  ${SEC/S360_FLOAT_SAVE_BTN}
    ${Status}=  SEC/S360_Verify Success Message  ${Update_Filter_Msg_ID}
    
    [Return]  ${Status}
    
S360_EN_Select States For Filter
    [Documentation]  Selects required state for filter
    
    [Arguments]  ${StatesList}
    
    Click Element  ${S360_EN_STATE_DD}
    Wait Until Element Is Visible  ${S360_EN_STATE_SENT_ICON}
    
    ${TotalState}=  Get Length  ${StatesList}
    
    FOR    ${Index}  IN RANGE  0  ${TotalState}
        Click Element  ${StatesList}[${Index}]
    END

S360_EN_Select Sites For Filter
    [Documentation]  Selects required sites for filter
    
    [Arguments]  ${SitesList}
    
    @{SitesList}=  Split String  ${SitesList}  ,   
    ${TotalSites}=  Get Length  ${SitesList}
    
    FOR    ${SiteName}  IN  @{SitesList}
        Input Text  ${S360_EN_AVAI_SITES_SEARCHBOX}  ${SiteName}
        Click Element  ${S360_EN_SITE_SELECT_LISTS}
        Click Element  ${S360_EN_SELECT_SINGLE_SITE_BTN}
    END

S360_EN_Select Products For Filter
    [Documentation]  Selects required sites for filter
    
    [Arguments]  ${ProductsList}
    
    @{ProductsList}=  Split String  ${ProductsList}  ,    
    ${TotalProducts}=  Get Length  ${ProductsList}
    
    FOR    ${ProductName}  IN  @{ProductsList}
        Input Text  ${S360_EN_AVAI_PROD_SEARCHBOX}  ${ProductName}
        Click Element  ${S360_EN_PROD_SELECT_LISTS} [1]
        Click Element  ${S360_EN_SELECT_SINGLE_PROD_BTN}
    END

S360_Search Filter
    [Documentation]  Searches for the required filter and selects it
    
    [Arguments]  ${NameOfFilter}

    # Enters required filter name
    wait until element is visible   ${S360_EN_FILTER_SEARCH_BOX}
    Input Text  ${S360_EN_FILTER_SEARCH_BOX}  ${NameOfFilter}
    capture page screenshot
    Wait Until Element Is Visible  ${S360_EN_AUTOCOMP_TXT}
    # Searches exact filter name in autocomplete list and selects it
    ${Total_Matching_Txt}=  Get Element Count  ${S360_EN_AUTOCOMP_TXT}
    FOR    ${Index}  IN RANGE  1  ${Total_Matching_Txt}+1
        ${Text}=  Get Text  ${S360_EN_AUTOCOMP_TXT} [${Index}]
        ${Found_Status}=  Run Keyword And Return Status  Should Be Equal  ${NameOfFilter}  ${Text}  ignore_case=true
        Run Keyword If  '${Found_Status}'=='${TRUE}'  Run Keywords  Click Element  ${S360_EN_AUTOCOMP_TXT} [${Index}]
        ...  AND  Wait Until Element Is Not Visible  ${S360_EN_LOADING_IMAGE} [1]  timeout=20
        ...  AND  Exit For Loop
#        ...  AND  Wait Until Element Is Visible  ${S360_EN_COMMAND_TAB}  timeout=20
    END


S360_Edit/Delete Filter
    [Documentation]   Clicks on Edit or delete button for the filter

    [Arguments]  ${NameOfFilter}  ${ButtonID}

    # Clicks on Edit/Delete button of a filter
    SEC/S360_Scroll Page To Location  0  0
    Sleep  1S
    ${Total_Filters}=  Get Element Count  ${S360_EN_FILTERS_XPATH}
    FOR    ${Index}  IN RANGE  1  ${Total_Filters}+1
        ${Name}=  Get Text  ${S360_EN_FILTERS_XPATH} [${Index}]
        Run Keyword If  '${NameOfFilter}'=='${Name}'  Run Keywords  Mouse Over  ${S360_EN_FILTERS_XPATH} [${Index}]
        ...  AND  Click Element  ${S360_EN_FILTERS_XPATH} [${Index}]${ButtonID}
        ...  AND  Exit For Loop
    END

    Sleep  1S
    # Verifies success message if clicked on delete button
    ${EditStatus}=  Run Keyword and Return Status  Should Contain  ${ButtonID}  edit
    ${Status}=  Run Keyword If  '${EditStatus}'=='${TRUE}'  Wait Until Element Is Visible  ${S360_EN_FILTER_NAME_TXTBOX}
    ...  ELSE  SEC/S360_Verify Success Message  ${Delete_Filter_Msg_ID}

    Run Keyword If  '${Status}'=='${FALSE}'  Fail


S360_Delete Filter
    [Documentation]   Clicks on Edit or delete button for the filter

    [Arguments]  ${NameOfFilter}  ${ButtonID}

    # Clicks on Edit/Delete button of a filter
    SEC/S360_Scroll Page To Location  0  0
    wait until element is visible    ${S360_EN_FILTERS_XPATH}
    ${Total_Filters_2}=    Get Element Count  ${S360_EN_FILTERS_XPATH}
    ${Total_Filters}=  Get Element Count  ${S360_EN_FILTERS_XPATH}
    ${Total_Filters_1}=     Set Variable    ${Total_Filters + 1}
    IF    '${NameOfFilter}'== 'TestFilter1'
        ${Total_Filters}     Set Variable  ${Total_Filters_1}
    ELSE IF    '${Total_Filters_2}'=='1'
   ${Total_Filters}     Set Variable  ${Total_Filters_1}
    ELSE
    ${Total_Filters}     Set Variable    ${Total_Filters_2}
    END
        FOR    ${Index}  IN RANGE  1   ${Total_Filters}

            ${Name}=  Get Text  ${S360_EN_FILTERS_XPATH} [${Index}]
            continue for loop if  '${NameOfFilter}'!='${Name}'
            Mouse Over  ${S360_EN_FILTERS_XPATH} [${Index}]
            Click Element  ${S360_EN_FILTERS_XPATH} [${Index}]${ButtonID}
            sleep    1s
            ${EditStatus}=   SEC/S360_Verify Success Message  ${Delete_Filter_Msg_ID}
            Run Keyword If  '${EditStatus}'=='${FALSE}'  Fail
            sleep    1s
            click element    ${S360_EN_APPROVE_BUTTON}

        END

S360_Delete Filters
    [Documentation]   Clicks on Edit or delete button for the filter

    [Arguments]  ${NameOfFilter}  ${ButtonID}

    # Clicks on Edit/Delete button of a filter
    SEC/S360_Scroll Page To Location  0  0
    wait until element is visible    ${S360_EN_FILTERS_XPATH}
    ${Total_Filters}=  Get Element Count  //*[@class="filter-tag ng-star-inserted"]
    FOR    ${Index}  IN RANGE  1   ${Total_Filters+1}
         ${Name}=  Get Text  ${S360_EN_FILTERS_XPATH} [${Index}]
         continue for loop if    '${NameOfFilter}'!='${Name}'
         Mouse Over  ${S360_EN_FILTERS_XPATH} [${Index}]
         Click Element  ${S360_EN_FILTERS_XPATH} [${Index}]${ButtonID}
         ${EditStatus}=   SEC/S360_Verify Success Message  ${Delete_Filter_Msg_ID}
         Run Keyword If  '${EditStatus}'=='${FALSE}'  Fail
         EXIT FOR LOOP
    END






#    ${Total_Filters_2}=    Get Element Count  ${S360_EN_FILTERS_XPATH}
#    ${Total_Filters}=  Get Element Count  ${S360_EN_FILTERS_XPATH}
#    ${Total_Filters_1}=     Set Variable    ${Total_Filters + 1}
#    IF    '${NameOfFilter}'== 'TestFilter1'
#        ${Total_Filters}     Set Variable  ${Total_Filters_1}
#    ELSE IF    '${Total_Filters_2}'=='1'
#   ${Total_Filters}     Set Variable  ${Total_Filters_1}
#    ELSE
#    ${Total_Filters}     Set Variable    ${Total_Filters_2}
#    END
#        FOR    ${Index}  IN RANGE  1   ${Total_Filters}
#
#            ${Name}=  Get Text  ${S360_EN_FILTERS_XPATH} [${Index}]
#            continue for loop if  '${NameOfFilter}'!='${Name}'
#            Mouse Over  ${S360_EN_FILTERS_XPATH} [${Index}]
#            Click Element  ${S360_EN_FILTERS_XPATH} [${Index}]${ButtonID}
#            sleep    1s
#            ${EditStatus}=   SEC/S360_Verify Success Message  ${Delete_Filter_Msg_ID}
#            Run Keyword If  '${EditStatus}'=='${FALSE}'  Fail
#            sleep    1s
#            click element    ${S360_EN_APPROVE_BUTTON}
#
#        END


S360_EN_Bookmark a Filter
    [Documentation]  Bookmarks the filter
    
    [Arguments]  ${FilterName}
    
    SEC/S360_Scroll Page To Location  0  0
    S360_Search Filter  ${FilterName}
    Click Element  ${S360_EN_BOOKMARK_ICON}
    #${Status}=  SEC/S360_Verify Success Message  ${Bookmark_Filter_Msg_ID}
    #changes by Akash - changed message.
    ${Status}=  SEC/S360_Verify Success Message  ${Bookmark_Filter_Msg}
    Run Keyword If  '${Status}'=='${FALSE}'  Fail
    
S360_EN_Save/Apply Filter
    [Documentation]  Mouse hover on Options button and save changes
    [Arguments]  ${ButtonID}
    Mouse Over  ${ButtonID}
    Wait Until Element Is Visible  ${ButtonID}
    ${Enable_Status}=  Run Keyword And Return Status  Element Should Be Disabled  ${ButtonID}
    Run Keyword If  '${Enable_Status}'=='${FALSE}'  Run Keywords  Click Element  ${ButtonID}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=10
#    run keyword and ignore error    click element    ${SEC/S360_DISMISS_MSG_CNTR}

S360_EN_Verify UI of Notification Rules Page
    [Documentation]  Verifies all mandatory elements are present in Notification rules page
    
    Wait Until Element Is Visible  ${S360_EN_STATUS_ICON} [1]
    Element Should Be Visible  ${S360_EN_FILTERS_XPATH} [1]
    Element Should Be Visible  ${S360_EN_LOTNUMBER_DD}
    Element Should Be Visible  ${S360_EN_MANUF_NAME_TXTBOX}
    Element Should Be Visible  ${S360_EN_PROD_NAME_TXTBOX}
    Element Should Be Visible  ${S360_EN_LOT_STARTDATE_TXTBOX}
    Element Should Be Visible  ${S360_EN_LOT_ENDDATE_TXTBOX}
    Element Should Be Visible  ${S360_EN_STATUS_ICON} [1]
    Element Should Be Visible  ${S360_EN_STATUS_TEXT} [1]
    Element Should Be Visible  ${S360_EN_RULE_NAME_TXT} [1]
    Element Should Be Visible  ${S360_EN_RULE_SEARCHBOX}
    # Element Should Be Visible  ${S360_EN_TABLE_SORTBY_DD}
    Element Should Be Visible  ${S360_EN_COMMAND_TAB}
    Element Should Be Visible  ${S360_EN_DETAILS_TAB}
    Element Should Be Visible  ${S360_EN_NOTES_TAB}
    Element Should Be Visible  ${S360_EN_FILES_TAB}

S360_EN_Check the Details of Filter
    [Documentation]  Checks the created filter have the correct details
    
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_EN_PROD_NAME_TXTBOX}
    ${Selected_Prod_Name}=  Get Text  ${S360_EN_PROD_NAME_TXTBOX}
    ${Selected_Lot_Num}=  Get Text  ${S360_EN_LOTNUMBER_DD}
        
S360_EN_Verify Adding Comments In Notes
    [Documentation]  Verifies adding comments in notes tab
    
    [Arguments]  ${Comment}
    
    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_NOTES_TAB}
    Wait Until Element Is Visible  ${S360_EN_ADD_COMMENTS_BTN}
    ${Current_Time}=  Get Current Date  time_zone=local  exclude_millis=True
    
    # Adds a comment with timestamp
    wait until element is visible    //*[@id="NewCommentLbl"]
    click element    //*[@id="NewCommentLbl"]
    click element    ${S360_EN_COMMENTS_TXTBOX}
    Input Text  ${S360_EN_COMMENTS_TXTBOX}  ${Comment}_${Current_Time}
    Click Element  ${S360_EN_ADD_COMMENTS_BTN}
    sleep    3s
    ${Status}=  SEC/S360_Verify Success Message  ${Add_Comment_Msg_ID}
    sleep    4s
    Run Keyword If  '${Status}'=='${FALSE}'  Fail
    
    # Verifies first comment is equal to the recently added comment
    ${First_Comment}=  Get Text  ${S360_EN_COMMENTS_TXT} [1]
    Should Be Equal  ${First_Comment}  ${Comment}_${Current_Time}
    
S360_EN_Update State
    [Documentation]  Updates the state of the rule    
    
    [Arguments]  ${To_State}=Complete
    
    SEC/S360_Scroll Page To Location  0  0
    
    # Click on Updates state icon
    Click Element  ${S360_EN_COMMAND_TAB}
    Wait Until Element Is Visible  ${S360_EN_CMD_UPDATE_STATE_BTN_SUM}
    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_CMD_UPDATE_STATE_BTN_SUM}
    S360_EN_Click On New State Dropdown
    
    # Selects first state in the dropdown
    ${Current_State}=  S360_EN_Get Current State 
    ${Available_States}=  Get Element Count  ${S360_EN_DD_STATES_LIST}
    FOR    ${Index}  IN RANGE  1  ${Available_States}+1
        ${Selected_State}=  Get Element Attribute  ${S360_EN_DD_STATES_LIST} [${Index}]  src
        ${Found_Status}=  Run Keyword And Return Status  Should Contain  ${Selected_State}  ${To_State}  ignore_case=true
        Run Keyword If  '${Found_Status}'=='${TRUE}'  Run Keywords  wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_DD_STATES_LIST} [${Index}]
        ...  AND  run keyword and ignore error    S360_EN_Check For Warning Message If Ready State  ${To_State}
        ...  AND  run keyword and ignore error    Click Element  ${S360_EN_UPDATE_STATE_OK_BTN}
        ...  AND  Exit For Loop
    END

# update button is disabled after changing state to update, the steps below are unnecessary
#    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_CMD_UPDATE_STATE_BTN}
#    ${Status}=  SEC/S360_Verify Success Message  ${Update_State_Msg_ID}
#    Run Keyword If  '${Status}'=='${FALSE}'  Fail
#
#    # Verifies curent state is the new updated state
#    Wait Until Element Is Visible  ${S360_EN_NEW_STATE_DD}
#
#    ${New_Current_State}=  S360_EN_Get Current State
#    Click Element  ${S360_EN_UPDATE_STATE_CANCEL_BTN}
#    Should Contain  ${Selected_State}  ${New_Current_State}
    
    [Return]  ${Current_State}

S360_EN_Check For Warning Message If Ready State
    [Documentation]  Checks if warning message is displayed while changing state to ready
    
    [Arguments]  ${To_State}
    
    Run Keyword If  '${To_State}'=='Ready'  Run Keywords  Wait Until Element Is Visible  ${S360_EN_STATE_WARNING_TEXT}
    ...  AND  Click Element  ${S360_EN_UPDATE_STATE_OK_BTN}
    ...  ELSE  Click Element  ${S360_EN_UPDATE_STATE_OK_BTN}

S360_EN_Verify Updated State in Notes Tab
    [Documentation]  Verifies updated state comment has been added to notes tab
    #Akash- added argument for guardian
    [Arguments]  ${From_State}  ${To_State}  ${Send_Noti}=null  ${Guardian}=null

    Wait Until Element Is Visible    ${S360_EN_NOTES_TAB}
    wait until keyword succeeds    5x    1s    Click Element  ${S360_EN_NOTES_TAB}
    Wait Until Element Is Visible  ${S360_EN_ADD_COMMENTS_BTN}
    sleep    5s
    ${First_Comment}=  Get Text  ${S360_EN_COMMENTS_TXT} [1]
    ${Second_Comment}=  Get Text  ${S360_EN_COMMENTS_TXT} [2]   
    
    Run Keyword If  '${Send_Noti}'=='Send'  Run Keywords  Should Be Equal  ${OperatorUser} sent notification to ${Guardian}.  ${Second_Comment}
    ...  AND  Should Be Equal  '${Send_Notification_Comment}'  '${First_Comment}'
    ...  ELSE  Should Be Equal  ${OperatorUser} updated state from ${From_State} to ${To_State}.  ${First_Comment}

S360_EN_Get Current State
    [Documentation]  Retrieves the current state of the rule
    
    Wait Until Element Is Visible  ${S360_EN_CURRENT_STATE_TXT}
    ${Current_State}=  Get Text  ${S360_EN_CURRENT_STATE_TXT}
    ${Current_State}=  Set Variable If  '${Current_State}'=='In Progress'  InProgress  ${Current_State}
    
    [Return]  ${Current_State}

S360_EN_Check State of a Rule
    [Documentation]  Verifies state icon of the rule

    [Arguments]    ${NameOfRule}    ${Expected_State}
    
    ${Index_Number}=  S360_EN_Table Search Operation  ${NameOfRule}
    
    FOR    ${Index}  IN RANGE  1  30
        Click Element  ${S360_EN_NR_REFRESH_ICON}
        Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_EN_RULE_STATE_ICONS} [${Index_Number}]
        ${Rule_State}=  Get Element Attribute  ${S360_EN_RULE_STATE_ICONS} [${Index_Number}]  src
        ${Status}=  Run Keyword And Return Status  Should Contain  ${Rule_State}  ${Expected_State}
        Run Keyword If  '${Status}'=='${TRUE}'  Exit For Loop
        ...  ELSE  Sleep  2S
    END

    [Return]  ${Status}

S360_Check Files For Sent/Ready State
    [Documentation]  Checks if files are available when request is completed successfully

    [Arguments]  ${Current_State}

#    wait until keyword succeeds    5x    2s    Click Element  //*[@id="state-update-cancel"]
#    wait until keyword succeeds    5x    2s    Click Element  //*[@id="state-update-cancel"]
    wait until keyword succeeds    5x    2s    Click Element  ${S360_EN_FILES_TAB}

    Run Keyword If  '${Current_State}'=='Sent'  Run Keywords  Wait Until Element Is Visible  //*[@class="mat-expansion-panel-header-title"]
    ...  AND  Element Should Be Visible  //*[@class="mat-expansion-panel-body"]
    ...  ELSE IF  '${Current_State}'=='Ready'  Run Keywords  Wait Until Element Is Visible  ${S360_EN_NO_DATA_MESSAGE}
    ...  AND  Element Should Not Be Visible  ${S360_EN_FILES_LIST} [1]

S360_EN_Select Lot And Rule
    [Documentation]  Selects the required Lot and Rule in filter
    
    [Arguments]  ${LotNumbr}  ${NameOfRule}
    
    # Searches for a lot number and selects it
    SEC/S360_Scroll Page To Location  0  0
    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_LOTNUMBER_DD}
    wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_LOT_SEARCHBOX}  ${LotNumbr}
    wait until element is visible    ${S360_EN_LOT_AUTO_COMPLETE_TXTS}
    ${Matching_Lot_Nums}=  Get Element Count  ${S360_EN_LOT_AUTO_COMPLETE_TXTS}
    FOR    ${Index}  IN RANGE  1  ${Matching_Lot_Nums}+1
        ${Lot_Num}=  Get Text  ${S360_EN_LOT_AUTO_COMPLETE_TXTS} [${Index}]
        ${Lot_Match_Status}=  Run Keyword And Return Status  Should Be Equal  ${LotNumbr}  ${Lot_Num}
        Run Keyword If  '${Lot_Match_Status}'=='${TRUE}'  Run Keywords  Click Element  ${S360_EN_LOT_AUTO_COMPLETE_TXTS} [${Index}]
        ...  AND  Exit For Loop
    END

    # Searches for a rule name and clicks on it
    wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_RULE_SEARCHBOX}  ${NameOfRule}
    Click Element  ${S360_EN_RULE_SEARCH_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_EN_RULE_NAME_TXT} [1]
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_EN_RULE_NAME_TXT} [1]
    
    ${Matching_Rule_Names}=  Get Element Count  ${S360_EN_RULE_NAME_TXT}
    FOR    ${Index}  IN RANGE  1  ${Matching_Rule_Names}+1
        ${Rule_Name}=  Get Text  ${S360_EN_RULE_NAME_TXT} [${Index}]
        ${Rule_Match_Status}=  Run Keyword And Return Status  Should Be Equal  '${NameOfRule}'  '${Rule_Name}'
        Run Keyword If  '${Rule_Match_Status}'=='${TRUE}'  Run Keywords  Click Element  ${S360_EN_RULE_NAME_TXT} [${Index}]
        ...  AND  wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_COMMAND_TAB}
        ...  AND  Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_EN_CMD_UPDATE_STATE_BTN}  timeout=2
        ...  AND  Wait Until Element Is Visible  ${S360_EN_CMD_UPDATE_STATE_BTN}  timeout=10
        ...  AND  Exit For Loop
    END

S360_EN_Table Search Operation
    [Documentation]  checks if table displays the right rule name
    
    [Arguments]  ${NameOfRule}
    
    ${Index_Number}=  Set Variable  0
    wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_RULE_SEARCHBOX}  ${NameOfRule}
    SEC/S360_Scroll Page To Location  0  0
    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_RULE_SEARCH_BTN}
    Wait Until Element Is Visible  ${S360_EN_SELECTED_RULE_NAME} [1]
    
    # checks the rules displayed contains the searched text
    ${Matching_Rule_Names}=  Get Element Count  ${S360_EN_SELECTED_RULE_NAME}
    FOR    ${Index}  IN RANGE  1  ${Matching_Rule_Names}+1
        ${Rule_Name}=  Get Text  ${S360_EN_SELECTED_RULE_NAME} [${Index}]
#        Should Contain  ${Rule_Name}  ${NameOfRule}
        ${Rule_Name}=    split string    ${Rule_Name}    ${\n}
        ${Rule_Name}=    set variable    ${Rule_Name}[1]
        ${Index_Number}=  Set Variable If  '${Rule_Name}'=='${NameOfRule}'  ${Index_Number}+${Index}  ${Index_Number}
        Run Keyword If  '${Rule_Name}'=='${NameOfRule}'  Exit For Loop
    END

    [Return]  ${Index_Number}
    
S360_EN_Check Date Sorting Order
    [Documentation]  Checks the dates are sorted in Descending order in Comments popup

    [Arguments]  ${DateElementsXpath}  ${Asc/Desc}=DESC
    
    ${DateElementsLength}=  Get Element Count  ${DateElementsXpath}
    #changes by Akash - added a limit to pick number of comments from notes section
    ${NumOfDateElements}=   Set Variable If  ${DateElementsLength}>20      20    ${DateElementsLength}
    # verifies if previous date is greater than next date
    FOR    ${Index}  IN RANGE  1  ${NumOfDateElements}
        ${FirstHeaderSection}=  Get Text  ${DateElementsXpath} [${Index}]
        ${NextHeaderSection}=  Get Text  ${DateElementsXpath} [${Index}+1]
        #@{FirstDateSection}=  Get Regexp Matches  ${FirstHeaderSection}  [\\d/]+[, ]+[\\d: PAM]+
        #@{NextDateSection}=   Get Regexp Matches  ${NextHeaderSection}   [\\d/]+[, ]+[\\d: PAM]+
        #changes by Akash - as per latest date format
        @{FirstDateSection}=  Get Regexp Matches  ${FirstHeaderSection}  ([0-9]+(\/[0-9]+)+)
        @{NextDateSection}=   Get Regexp Matches  ${NextHeaderSection}   ([0-9]+(\/[0-9]+)+)
#        ${FirstDate}=  Convert Date  ${FirstDateSection}[0]  result_format=%m/%d/%Y %I:%M:%S %p  date_format=%m/%d/%Y %I:%M:%S %p
#        ${NextDate}=   Convert Date  ${NextDateSection}[0]   result_format=%m/%d/%Y %I:%M:%S %p  date_format=%m/%d/%Y %I:%M:%S %p
#        ${result}=  Subtract Date From Date  ${FirstDate}  ${NextDate}  date1_format=%m/%d/%Y %I:%M:%S %p  date2_format=%m/%d/%Y %I:%M:%S %p
#        Changes by Akash - to change date format as per UI
         ${FirstDate}=  Convert Date  ${FirstDateSection}[0]  result_format=%d/%m/%Y  date_format=%d/%m/%Y
         ${NextDate}=   Convert Date  ${NextDateSection}[0]   result_format=%d/%m/%Y  date_format=%d/%m/%Y
         ${result}=  Subtract Date From Date  ${FirstDate}  ${NextDate}  date1_format=%d/%m/%Y   date2_format=%d/%m/%Y

        Run Keyword If  ${result}<0 and '${Asc/Desc}'=='DESC'  Fail
        ...  ELSE IF  ${result}>0 and '${Asc/Desc}'=='ASC'  Fail
    END

#        ${FirstDate}=  Convert Date  ${FirstDateSection}[0]  result_format=%m/%d/%Y %I:%M:%S %p  date_format=%m/%d/%Y %I:%M:%S %p
#        ${NextDate}=   Convert Date  ${NextDateSection}[0]   result_format=%m/%d/%Y %I:%M:%S %p  date_format=%m/%d/%Y %I:%M:%S %p
#        ${result}=  Subtract Date From Date  ${FirstDate}  ${NextDate}  date1_format=%m/%d/%Y %I:%M:%S %p  date2_format=%m/%d/%Y %I:%M:%S %p
#        Changes by Akash - to change date format as per UI
         ${FirstDate}=  Convert Date  ${FirstDateSection}[0]  result_format=%d/%m/%Y  date_format=%d/%m/%Y
        ${NextDate}=   Convert Date  ${NextDateSection}[0]   result_format=%d/%m/%Y  date_format=%d/%m/%Y
        ${result}=  Subtract Date From Date  ${FirstDate}  ${NextDate}  date1_format=%d/%m/%Y   date2_format=%d/%m/%Y

        Run Keyword If  ${result}<0 and '${Asc/Desc}'=='DESC'  Fail
        ...  ELSE IF  ${result}>0 and '${Asc/Desc}'=='ASC'  Fail


S360_EN_Close/Open Inspector Control
    [Documentation]  Closes and opens the inspector control tab in EN
    
    [Arguments]  ${Close/Open}   ${RuleElement}
    
    ${IC_Visible_Status}=  Run Keyword And Return Status  Element Should Be Visible  ${S360_EN_COMMAND_TAB}
    
    Run Keyword If  '${IC_Visible_Status}'=='${TRUE}' and '${Close/Open}'=='Close'  Run Keywords  Click Element  ${S360_EN_INSP_CTRL_CLOSE_BTN}
    ...  AND  Element Should Not Be Visible  ${S360_EN_COMMAND_TAB}
    ...  AND  Element Should Not Be Visible  ${S360_EN_DETAILS_TAB}
    ...  AND  Element Should Not Be Visible  ${S360_EN_NOTES_TAB}
    ...  AND  Element Should Not Be Visible  ${S360_EN_FILES_TAB}
    ...  ELSE IF  '${IC_Visible_Status}'=='${FALSE}' and '${Close/Open}'=='Open'  Run Keywords  Click Element  ${RuleElement}
    ...  AND  wait until element is visible   ${S360_EN_COMMAND_TAB}
    ...  AND  Element Should Be Visible  ${S360_EN_COMMAND_TAB}
    ...  AND  Element Should Be Visible  ${S360_EN_DETAILS_TAB}
    ...  AND  Element Should Be Visible  ${S360_EN_NOTES_TAB}
    ...  AND  Element Should Be Visible  ${S360_EN_FILES_TAB}
    ...  ELSE  Fail  

S360_EN_Check Cards Disabled/Enabled
    [Documentation]  Checks if EN cards are enabled/disabled based on the arguments passed
    
    [Arguments]  ${Enable/Disable}
    
    ${Enable_Status}=  Set Variable If  '${Enable/Disable}'=='Enable'  ${TRUE}  ${FALSE}
    
    Wait Until Element Is Visible  ${S360_OP_NOTI_RULES_CARD_SECTION}
    
    # Returns true if disabled
    ${ENR_Card_Attr}=  Get Element Attribute  ${S360_OP_NOTI_RULES_CARD_SECTION}  class
    ${ENR_Card_Status}=  Run Keyword And Return Status  Should Contain  ${ENR_Card_Attr}  grey
    
    # Returns true if disabled
    ${ENS_Card_Attr}=  Get Element Attribute  ${S360_OP_EN_SUMM_CARD_SECTION}  class
    ${ENS_Card_Status}=  Run Keyword And Return Status  Should Contain  ${ENS_Card_Attr}  grey
    
    Run Keyword If  '${Enable_Status}'=='${ENR_Card_Status}' or '${Enable_Status}'=='${ENS_Card_Status}'  Fail
    
    Click Element  ${S360_EN_NOTI_RULES_CARD}
    Run Keyword If  '${Enable_Status}'=='${TRUE}'  Run Keywords  Wait Until Element Is Not Visible  ${S360_EN_NOTI_RULES_CARD}
    ...  AND  Wait Until Element Is Visible  ${S360_EN_ADD_FILTER_BTN}
    ...  AND  Element Should Be Visible  ${S360_EN_FILTER_SEARCH_BOX}
    ...  ELSE  Run Keywords  Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_EN_NOTI_RULES_CARD}
    ...  AND  Element Should Be Visible  ${S360_EN_NOTI_RULES_CARD}
    
S360_EN_Check Send/Update Button Disabled/Enabled
    [Documentation]  checks send command/update state button is enabled based on the privilege set for the user
    
    [Arguments]  ${ElementID}  ${Disable/Enable}  ${NameOfRule}  ${Summary_Card}=${FALSE}
    
    Run Keyword If  '${Summary_Card}'=='${FALSE}'  S360_EN_Select Lot And Rule  A0402-01353  ${NameOfRule}
    ...  ELSE  S360_EN_Search For Rule Matching Lot Number  ${Command_Check_Lot}  ${NameOfRule}
    run keyword and ignore error        wait until keyword succeeds    2x    5s    click element    ${S360_FIRST_ITEM_IN_NOTI_RULES}

    ${class_attr}=  Get Element Attribute  ${ElementID}  class
    ${disabled_status}=  Run Keyword And Return Status  Should Contain  ${class_attr}  disabled
    ${Update_button}=  Get Element Attribute  ${ElementID}  class
    ${Update_button}=  Run Keyword And Return Status  Should Contain  ${Update_button}  pencil

    Run Keyword If  '${Disable/Enable}'=='Enable' and '${disabled_status}'=='${TRUE}'  Fail
    ...  ELSE IF  '${Disable/Enable}'=='Disable' and '${disabled_status}'=='${FALSE}'  Fail

    Run Keyword If  '${Update_button}'=='${TRUE}' and '${disabled_status}'=='${TRUE}'  Run Keywords  Click Element  ${ElementID}
    ...  AND  Element Should Not Be Visible  ${S360_EN_CURRENT_STATE_TXT}
    ...  ELSE IF  '${Update_button}'=='${FALSE}' and '${disabled_status}'=='${TRUE}'  Run Keywords  Click Element  ${ElementID}
    ...  AND  Run Keyword And Expect Error  *  Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=5


S360_EN_Check Update Button Disabled/Enabled
    [Documentation]  checks send command/update state button is enabled based on the privilege set for the user

    [Arguments]  ${ElementID}  ${Disable/Enable}  ${NameOfRule}  ${Summary_Card}=${FALSE}

    Run Keyword If  '${Summary_Card}'=='${FALSE}'  S360_EN_Select Lot And Rule  ${Command_Check_Lot}  ${NameOfRule}
    ...  ELSE  S360_EN_Search For Rule Matching Lot Number  ${Command_Check_Lot}  ${NameOfRule}

    ${class_attr}=  Get Element Attribute  ${ElementID}  class
    ${disabled_status}=  Run Keyword And Return Status  Should Contain  ${class_attr}  disabled
    ${Update_button}=  Get Element Attribute  ${ElementID}  class
    ${Update_button}=  Run Keyword And Return Status  Should Contain  ${Update_button}  pencil

    Run Keyword If  '${Disable/Enable}'=='Enable' and '${disabled_status}'=='${TRUE}'  Fail
    ...  ELSE IF  '${Disable/Enable}'=='Disable' and '${disabled_status}'=='${FALSE}'  Fail

    Run Keyword If  '${Update_button}'=='${TRUE}' and '${disabled_status}'=='${TRUE}'  Run Keywords  Click Element  ${ElementID}
    ...  AND  Element Should Not Be Visible  ${S360_EN_CURRENT_STATE_TXT}
    ...  ELSE IF  '${Update_button}'=='${FALSE}' and '${disabled_status}'=='${TRUE}'  Run Keywords  Click Element  ${ElementID}
    ...  AND  Run Keyword And Expect Error  *  Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=5


S360_EN_Check Send Button
    [Documentation]  checks send command/update state button is enabled based on the privilege set for the user

    [Arguments]  ${ElementID}  ${Disable/Enable}  ${NameOfRule}  ${Summary_Card}=${FALSE}

    #Run Keyword If  '${Summary_Card}'=='${FALSE}'  S360_EN_Select Lot And Rule  ${Command_Check_Lot_1}}  ${NameOfRule}
    #change by Akash - to change command check variable
    Run Keyword If  '${Summary_Card}'=='${FALSE}'  S360_EN_Select Lot And Rule  ${Command_Check_Lot}  ${NameOfRule}
    ...  ELSE  S360_EN_Search For Rule Matching Lot Number  ${Command_Check_Lot}  ${NameOfRule}

    ${class_attr}=  Get Element Attribute  ${ElementID}  class
    ${disabled_status}=  Run Keyword And Return Status  Should Contain  ${class_attr}  disabled
    ${Update_button}=  Get Element Attribute  ${ElementID}  class
    ${Update_button}=  Run Keyword And Return Status  Should Contain  ${Update_button}  pencil

    Run Keyword If  '${Disable/Enable}'=='Enable' and '${disabled_status}'=='${TRUE}'  Fail
    ...  ELSE IF  '${Disable/Enable}'=='Disable' and '${disabled_status}'=='${FALSE}'  Fail

    Run Keyword If  '${Update_button}'=='${TRUE}' and '${disabled_status}'=='${TRUE}'  Run Keywords  Click Element  ${ElementID}
    ...  AND  Element Should Not Be Visible  ${S360_EN_CURRENT_STATE_TXT}
    ...  ELSE IF  '${Update_button}'=='${FALSE}' and '${disabled_status}'=='${TRUE}'  Run Keywords  Click Element  ${ElementID}
    ...  AND  Run Keyword And Expect Error  *  Wait Until Element Is Visible  ${SEC/S360_MSG_CENTER}  timeout=5

S360_EN_Check Columns In Details Tab
    [Documentation]  checks if all the mentioned columns are available in details tab

    [Arguments]  ${ElementID}
    
    ${Status}=  Set Variable  ${TRUE}
    #change by Akash - select row has not details. Added argument to be used correctly in both title and summary.
    #wait until keyword succeeds  5x  2s  Click Element    //*[@class="datatable-body-row datatable-row-odd ng-star-inserted"]
    wait until keyword succeeds  5x  2s  Click Element    ${ElementID}
    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_DETAILS_TAB}
    S360_EN_Expand/Collapse Inspector Control  Expand
    SEC/S360_Scroll Page To Location  0  200
    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${S360_EN_DETALS_TAB_COLUMNS} [1]
    
    ${Total_Column_Count}=  Get Element Count  ${S360_EN_DETALS_TAB_COLUMNS}
    @{Details_Tab_Column_Names}=  Split String  ${EN_Details_Tab_Columns}  ,
    
    FOR    ${Index}  IN RANGE  1  ${Total_Column_Count}+1
        ${Column_Name}=  Get Text  ${S360_EN_DETALS_TAB_COLUMNS} [${Index}]
        ${Status}=  Run Keyword And Return Status  List Should Contain Value  ${Details_Tab_Column_Names}  ${Column_Name}
        Run Keyword If  '${Status}'=='${FALSE}' and '${Index}'!='5'  Fail
    END
    Sleep  1S
     
    [Teardown]  S360_EN_Expand/Collapse Inspector Control  Collapse

S360_EN_Expand/Collapse Inspector Control
    [Documentation]  Expands/collapses the inspector control based on the argument
    
    [Arguments]  ${Expand/Collapse}
    
    ${Index_Num}=  SEC/S360_Find Visible Element Among Miltiple Matching Elements  ${S360_EN_EXPAND_COLLAPSE_INSP}
    SEC/S360_Scroll To Element  ${S360_EN_EXPAND_COLLAPSE_INSP} [${Index_Num}]
    ${Class_Attr}=  Get Element Attribute  ${S360_EN_EXPAND_COLLAPSE_INSP} [${Index_Num}]  class
    ${Expand_Status}=  Run Keyword And Return Status  Should Contain  ${Class_Attr}  expanded
    
    Run Keyword If  '${Expand_Status}'=='${TRUE}' and '${Expand/Collapse}'=='Collapse'  Click Element  ${S360_EN_EXPAND_COLLAPSE_INSP} [${Index_Num}]
    ...  ELSE IF  '${Expand_Status}'=='${FALSE}' and '${Expand/Collapse}'=='Expand'  Click Element  ${S360_EN_EXPAND_COLLAPSE_INSP} [${Index_Num}]

S360_EN_Notification Summary UI
    [Documentation]  Checks for all elements in notification summary UI
    
    run keyword and ignore error    3x    3s    click element    ${S360_EN_APPLY_BUTTON}
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Element Is Visible  ${S360_EN_NR_IMAGE_COLUMN} [1]
    Element Should Be Visible  ${S360_EN_FILTERS_XPATH} [1]
    Run Keyword And Ignore Error  Element Should Be Visible  ${S360_EN_NS_SEARCH_TEXTBOX}
    Element Should Be Visible  ${SEC/S360_ASCENDING_BTN}
    Element Should Be Visible  ${SEC/S360_DESCENDING_BTN}
    Element Should Be Visible  ${SEC/S360_SORT_BY_DD}
    
    ${Column_Count}=  Get Element Count  ${S360_EN_TABLE_COLUMN_NAMES}
    Should Be Equal As Integers  ${Column_Count}  ${8}
    
    Element Should Be Visible  ${S360_EN_COMMAND_TAB}
    Element Should Be Visible  ${S360_EN_DETAILS_TAB}
    Element Should Be Visible  ${S360_EN_NOTES_TAB}
    Element Should Be Visible  ${S360_EN_FILES_TAB}
    
S360_EN_Search For Rule Matching Lot Number
    [Documentation]  Searches the product with matching lot number and returns the index of the result
    
    [Arguments]  ${Lot_Number}  ${NameOfRule}
            
    Wait Until Element Is Visible  ${S360_EN_NR_IMAGE_COLUMN} [1]
    wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_NS_SEARCH_TEXTBOX}  ${NameOfRule}
    wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_NS_SEARCH_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_EN_NR_IMAGE_COLUMN} [1]
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_EN_NR_IMAGE_COLUMN} [1]
    
    ${Index_Number}=  Set Variable  ${0}
    ${Total_Matching_Names}=  Get Element Count  ${S360_EN_NR_NAME_COLUMN}
    
    FOR    ${Index}  IN RANGE  1  ${Total_Matching_Names}+1
        ${Lot_Number_Value}=  Get Text  ${S360_EN_LOT_NUMBER_COLUMN} [${Index}]
        ${Status}=  Run Keyword And Return Status  Should Be Equal  ${Lot_Number_Value}  ${Lot_Number}
        ${Index_Number}=  Set Variable If  '${Status}'=='${TRUE}'  ${Index}+${Index_Number}  ${Index_Number}
        Run Keyword If  '${Status}'=='${TRUE}'  Run Keywords  Click Element  ${S360_EN_NR_NAME_COLUMN} [${Index}]
        ...  AND  Wait Until Element Is Visible  ${S360_EN_COMMAND_TAB}
        ...  AND  Exit For Loop
    END

    [Return]  ${Index_Number}
    
S360_EN_Select Sort By and Order
     [Documentation]  Selects the sort by list and order(asc/desc)
     
     [Arguments]  ${Sort_Type}  ${Sort_Order}
     
     SEC/S360_Scroll Page To Location  0  0
     Wait Until Element Is Visible  ${S360_EN_NR_IMAGE_COLUMN} [1]
     Select From List By Value  ${SEC/S360_SORT_BY_DD}  ${Sort_Type}
     wait until keyword succeeds  5x  2S  Click Element  ${Sort_Order}
     Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${S360_EN_NR_IMAGE_COLUMN} [1]
     Wait Until Element Is Visible  ${S360_EN_NR_IMAGE_COLUMN} [1]


S360_EN_Send Notification
    [Documentation]  Click on send notification button and verifies notes
    #Akash- added argument for guardian
    [Arguments]   ${Guardian}

    wait until keyword succeeds  5x  2s    wait until element is visible    ${S360_EN_COMMAND_TAB}
    wait until keyword succeeds  5x  2s    click element    ${S360_EN_COMMAND_TAB}
    wait until keyword succeeds  5x  2s    Click Element    ${S360_EN_CMD_SEND_BTN}
    SEC/S360_Verify Success Message  ${Send_Notification_Msg_ID}
#
#    ${class_attr}=  Get Element Attribute  ${S360_EN_CMD_SEND_BTN}  class
#    Should Contain  ${class_attr}  disabled
    
    S360_EN_Verify Updated State in Notes Tab  Ready  In Progress  Send   ${Guardian}
    
S360_EN_Verify Request in Request Console
    [Documentation]  Verifies the request in request console and waits until state is completed
    
    S360_RC_Navigate To Request Console Menu
    #changes by Akash
    #${Current_DateTime}=  Get Current Date  result_format=%m/%d/%Y, %I:%M:%S %p
    ${Current_DateTime}=  Get Current Date  result_format=%d/%m/%Y, %H:%M:%S
    ${First_Request_Date}=  Get Text  ${S360_RC_UPDATED_ON_TEXT} [1]
    ${Difference}=  Subtract Date From Date  ${Current_DateTime}  ${First_Request_Date}  date1_format=%d/%m/%Y, %H:%M:%S   date2_format=%d/%m/%Y, %H:%M:%S
    # Run Keyword If  ${Difference}>${60}  fail

    ${State}=  Set Variable
    
    FOR    ${Index}  IN RANGE  1  60
        ${State}=  Get Text  ${S360_RC_REQUEST_STATE_TEXT} [1]
        Capture Page Screenshot
        Run Keyword If  '${State}'=='Completed' or '${State}'=='Failed'  Exit For Loop
        ...  ELSE  Run Keywords  Click Element  ${S360_RC_REFRESH_BTN}
        ...  AND  Sleep  2S
    END
    sleep    120s
    [Return]  ${State}
    
S360_EN_Enable all Privileges
    [Documentation]  Enables all privileges to work in Enterprise Notification
    
    [Arguments]  ${URL}
    
    CLD_Enable/Disable EN In UniCloud Eng-svt  Enable
    Go To  ${URL}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRole}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}
    SEC/S360_Navigate to User/Groups Page
    SEC_SDP_Update SDP Value in User Groups  ${Operator_Group_Name}  ${SEC/S360_OPERATOR_ROLE}  ${EN_Privilege}  Enable
    SEC/S360_Navigate to User/Groups Page
    SEC_SDP_Update SDP Value in User Groups  ${Operator_Group_Name}  ${SEC/S360_OPERATOR_ROLE}  ${EN_Update_Command_Privilege}  Enable
    SEC/S360_Navigate to User/Groups Page
    SEC_SDP_Update SDP Value in User Groups  ${Operator_Group_Name}  ${SEC/S360_OPERATOR_ROLE}  ${EN_Send_Command_Privilege}  Enable
    
S360_EN_Click On New State Dropdown
    [Documentation]  Clicks on dropdown till the dropdown appears
    
    Wait Until Element Is Visible  ${S360_EN_NEW_STATE_DD}
    
    FOR    ${Count}  IN RANGE  1  4
        wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_NEW_STATE_DD}
        ${Status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${S360_EN_DD_STATES_LIST} [1]
        Exit For Loop If  '${Status}'=='${TRUE}'
    END
