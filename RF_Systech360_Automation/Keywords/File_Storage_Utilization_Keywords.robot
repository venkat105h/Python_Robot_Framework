
#------------------------------------------------------------------
#   Description       :      User defined Keywords for File storage Utilization
#   Project           :      File storage Utilization Automation
#   Author            :      Neeraj Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Library         BuiltIn
Library         String
Library         Collections
Library         SeleniumLibrary  timeout=20.0
Library         DiffLibrary
Library         OperatingSystem
Resource        ../Locators/File_Storage_Utilization_Locators.robot
Resource        ../Locators/Enterprise_Notification_Locators.robot
Resource        ../Keywords/Admin_Keywords.robot
Resource        ../../File_Explorer_Automation/Keywords/File_Explorer_Keywords.robot

*** Keywords ***
UNI_Enter_Name_And_Description
	[Documentation]  Enters name and description. Takes name and description as arguments
	[Arguments]  ${Name}  ${Description}
	# Waits until name text box is visible and enters name and descrption
	wait until element is visible  ${SEC_NAME_TXT_BOX}  timeout=10
	input text  ${SEC_NAME_TXT_BOX}  ${Name}
	input text  ${SEC_DESC_TXT_BOX}  ${Description}

SEC_Precondition_Navigate_To_Export/Import
	[Documentation]  Navigates to Export/Import page
	# mouse overs on ham burger menu
	wait until element is visible    ${SEC/S360_HAMBURGER_MENU}
	mouse over  ${SEC/S360_HAMBURGER_MENU}
	# waits menu options to display and looks for Export/Import link
	wait until element is visible  ${SEC_EI_EXPORT_IMPORT_LINK}  timeout=10
	# clicks on Export/Import link
	click element  ${SEC_EI_EXPORT_IMPORT_LINK}
	# mouse overs on welcome button inorder to close menu opetions
	mouse over  ${SEC/S360_WELCOME_LINK}

SEC_Precondition_Navigate_To_EIR_OR_RC
	[Documentation]  Navigates to Export/Import Request or resquest page based on the locator.
	[Arguments]  ${EIR_Or_RC}  ${Locator}  ${View_Name}
	#  ${Locator} - Export/Import Requests locator OR Request Console locator
	# waits for '${EIR_Or_RC}' element to be visible and clicks on it
	wait until element is visible  ${Locator}  timeout=10
	click element  ${Locator}
	# clicks on list view button if '${View_Name}' is equal to 'List_View'. Not checking for cards view becuase by
	# default view will be in cards view
	run keyword if  '${EIR_Or_RC}'=='EIR'  run keyword if  '${View_Name}'=='List_View'  click element  ${SEC/S360_LIST_VIEW_BTN}

SEC_EX/IM_Create_Export_Import_Request
	[Documentation]  Creates Export report with mandatory/non mandatory fields
	@{Test_Data}=  Split String  ${Export_Data}  :
	# waits for add new item button and click on it once visible
    wait until element is visible  ${SEC_ADD_NEW_ITEM_BTN}  timeout=10
    click element  ${SEC_ADD_NEW_ITEM_BTN}
    ${unique}=    generate random string  4   [NUMBERS]
    log to console  ${Test_Data}[0]${unique}
	UNI_Enter_Name_And_Description  ${Test_Data}[0]${unique}  ${Test_Data}[1]
	# calls keyoword for creating new file and browsing created file based on the input
    SEC_EI_Create_File_For_Export_Request  ${Test_Data}[2]
    SEC/S360_Scroll Page To Location  0  0
	# mouse overs on left menu button and clicks on save
	#wait until element is visible  ${SEC/S360_FLOAT_OPTN_BTN}  timeout=10
	#wait until keyword succeeds  5x  2s  mouse over  ${SEC/S360_FLOAT_OPTN_BTN}
	Wait Until Element Is Visible  ${SEC/S360_FLOAT_SAVE_BTN}  timeout=10
	Click Element  ${SEC/S360_FLOAT_SAVE_BTN}
	# verifies whether success message displayed contains correct message ID for edit operation
	Run Keyword and Continue on Failure  SEC/S360_Verify Success Message  ${SEC_EI_SM_CREATE}
	#mouse over  ${SEC/S360_FLOAT_OPTN_BTN}
    Wait Until Element Is Visible  ${SEC_EI_FLOAT_RUN_BTN}  timeout=10
    wait until keyword succeeds    6x    1s    Click Element  ${SEC_EI_FLOAT_RUN_BTN}
    wait until element is visible  ${SEC/S360_MSG_CENTER}   timeout=20
    run keyword and ignore error    SEC/S360_Verify Success Message  ${SEC_EI_EXPORT_SM_RUN}


SEC_EI_Create_File_For_Export_Request
	[Documentation]  This Keyword is used to create new file export request in UniSecure
	[Arguments]  ${File_Name}
	# cliks on Browse button
	Execute JavaScript  window.scrollTo(0, 500)
	click element  ${SEC_EI_BROWSE_BTN}
	run keyword and ignore error  Wait Until Page Contains  Loading...  timeout=20
	run keyword and ignore error  Wait Until Page Does Not Contain  Loading...
	# waits until text is visble and enters '${File_Name}' into it
	wait until element is visible  ${SEC_EI_BROWSE_FILE_TXT_BOX}  timeout=10
	input text  ${SEC_EI_BROWSE_FILE_TXT_BOX}  ${File_Name}
	# clicks on Ok button
	wait until keyword succeeds  3x  2s  click element  ${SEC_EI_BROWSE_FILE_OK_BTN}

SEC_BO_Create_Report
	[Documentation]  This Keyword is used to creates new business owner report and takes report details as argument
	[Arguments]  ${Report_Title}  ${Report_Desc}  ${Report_Long_Desc}  ${Dashboard_Name}
	${random_int}=  Evaluate  random.randint(000, 999)  modules=random, sys
	${Report_Title}=  Catenate  SEPARATOR=  ${Report_Title}  ${random_int}
	Set Global Variable  ${Created_Report_Title}  ${Report_Title}
	SEC_Navigate_To_Create_Report_Page  ${Dashboard_Name}
	# Clicks on new create new user button and enters details of report
	Input text  ${SEC_BO_REPORT_TXT_FLD}  ${Report_Title}
	Input text  ${SEC_BO_REPORT_DESC_TXT_FLD}  ${Report_Desc}
	Input text  ${SEC_BO_REPORT_LONG_DESC_TXT_FLD}  ${Report_Long_Desc}
	# Clicks on save button and verifies success message
	Mouse Over  ${SEC_BO_PUBLISH_FLOAT_OPTIONS}
	Click element  ${SEC_BO_PUBLISH_FLOAT_SAVE}
	run keyword and ignore error  wait until element is not visible  ${SEC_LOADINGICON}  timeout=15
	Run Keyword And Continue on Failure  SEC/S360_Verify Success Message  ${SEC_BO_REPORT_SM_CREATE}


SEC_Navigate_To_Create_Report_Page
	[Documentation]  This Keyword is used to navigate business owner report in Unisecure
	[Arguments]  ${Dashboard_Name}
	wait Until Page Contains Element   ${SEC_BO_DASHBOARDS_TXTS}  timeout=10
	wait until element is visible  ${SEC_BO_DASHBOARDS_TXTS}  timeout=20
	${Dashboards_Names}=  Get Element Count  ${SEC_BO_DASHBOARDS_TXTS}
	@{allWebElements}  Get Webelements  ${SEC_BO_DASHBOARDS_TXTS}
	FOR    ${index}  IN RANGE  0  ${Dashboards_Names}
	    ${Dashboard_txt}=  get text  ${allWebElements}[${index}]
	    run keyword if  '${Dashboard_txt}'=='${Dashboard_Name}'  Run Keywords  click element  ${allWebElements}[${index}]
	    ...  AND  exit for loop
    END
	wait until element is visible  ${SEC_BO_CREATE_NEW_REPORT_BTN}  timeout=10
	Click element  ${SEC_BO_CREATE_NEW_REPORT_BTN}
	wait until element is visible  ${SEC_BO_REPORT_TXT_FLD}  timeout=10

S360_FSU_Navigate To File Storage Utilization Card
    [Documentation]  This Keyword is used to navigate to file storage utilization
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=20
    wait until keyword succeeds  3x  2s  Click Element  ${SEC/S360_WELCOME_LINK}
    Wait Until Element is visible  ${S360_FILE_STORAGE_UTILISATION_CARD}  timeout=20
    click Element  ${S360_FILE_STORAGE_UTILISATION_CARD}
    Wait Until Element Is Visible   ${S360_GRAPHIC_TAB}  timeout=240

S360_FSU_Navigate To Details Tab
    [Documentation]  This Keyword is used to navigate to details tab file storage utilization
    S360_FSU_Navigate To File Storage Utilization Card
    Wait Until Element is visible  ${S360_DETAIL_TAB}  timeout=20
    Click Element  ${S360_DETAIL_TAB}

S360_FSU_Search owners and select owner
    [Documentation]  This Keyword is used to search name of owner and select that owner while creating filter
    SEC/S360_Scroll Page To Location  0  2000
    Wait Until Element is visible  ${S360_SEARCH_AVAILABLE_OWNERS_TEXT_FIELD}  timeout=20
    Click Element  ${S360_SEARCH_AVAILABLE_OWNERS_TEXT_FIELD}
    Input Text  ${S360_SEARCH_AVAILABLE_OWNERS_TEXT_FIELD}  ${OWNER_NAME}
    Click Element  ${S360_FSU_OWNER_SELECT_LISTS} [1]
    Click Element  ${S360_SELECT_SINGLE_OWNER_BTN}

S360_FSU_Click Apply button
   [Documentation]  This Keyword is used to click on apply button for creation of filter
    wait until element is visible  ${FILTER_APPLY_BUTTON}
    click element  ${FILTER_APPLY_BUTTON}

S360_FSU_Verify Storage Files
    [Documentation]  This Keyword is used to create filter and to verify expected files
    ${List_Of_File}=  create List
    Wait Until Element is visible  ${S360_FSU_DETAILED_TABLE_ROW}  timeout=240
    ${TotalElements}=   Get Element Count  ${S360_FSU_DETAILED_TABLE_ROW}
    FOR    ${Index}  IN RANGE  1  ${TotalElements}+1
        ${Text}=  Get Text  (//*[@id="file-list-table"]//datatable-row-wrapper[${Index}]//label)[1]
        Append To List  ${List_Of_File}  ${Text}
    END
    ${Actual_Document_File}=  Count Values In List  ${List_Of_File}  ${Expected_Doc_File_Type}
    ${Expected_Document_File}=  Convert To Integer  ${Expected_Document_File}
    run keyword and ignore error    should be equal  ${Actual_Document_File}  ${Expected_Document_File}
    ${Actual_Vault_File}=  Count Values In List  ${List_Of_File}  ${Expected_Vault_File_Type}
    ${Expected_Vault_File}=  Convert To Integer  ${Expected_Vault_File}
    run keyword and ignore error  should be equal  ${Actual_Vault_File}   ${Expected_Vault_File}
    ${Actual_Export_File}=  Count Values In List  ${List_Of_File}  ${Expected_Export_File_Type}
    ${Expected_Export_File}=  Convert To Integer  ${Expected_Export_File}
    run keyword and ignore error  should be equal  ${Actual_Export_File}  ${Expected_Export_File}
    ${Actual_BO_File}=  Count Values In List  ${List_Of_File}  ${Expected_BO_File_Type}
    ${Expected_BO_File}=  Convert To Integer  ${Expected_BO_File}
    run keyword and ignore error  should be equal  ${Actual_BO_File}  ${Expected_BO_File}

SEC/S360_FSU_Verify Sort By Text
    [Documentation]  This Keyword is used to verifies sort by text in Ascending or descending order
    [Arguments]  ${Element_Locator}  ${Asc/Desc}
    ${Total_Element_Count}=  Get Element Count  ${Element_Locator}
    FOR    ${Index}  IN RANGE  1  ${Total_Element_Count}
        ${First_String}=  Get Text  ${Element_Locator} [${Index}]
        ${First_String}=  Convert To Uppercase	${First_String}
        ${Next_String}=   Get Text  ${Element_Locator} [${Index}+1]
        ${Next_String}=  Convert To Uppercase	${Next_String}
        Continue For Loop If  '${First_String}'=='${Next_String}'
        ${Result}=  compare_string  ${First_String}  ${Next_String}
        Run Keyword If  '${Asc/Desc}'=='ASC' and '${Result}'=='${TRUE}'  fail
        ...  ELSE IF  '${Asc/Desc}'=='DESC' and '${Result}'=='${FALSE}'  fail
    END

SEC/S360_FSU_Verify Sort By Value
    [Documentation]  Verifies sort by size in Ascending or descending order
    [Arguments]  ${Element_Locator}  ${Asc/Desc}
    ${ACTUAL_LIST}=  Create list
    ${Total_Element_Count}=  Get Element Count  ${Element_Locator}
    FOR    ${Index}  IN RANGE  1  ${Total_Element_Count}
        ${First_String}=  Get Text  ${Element_Locator} [${Index}]
        @{List}=  Split String  ${First_String}  ${SPACE}
        ${List_Value}=  Run Keyword If  '${List}[1]' == 'Bytes'  Evaluate   ${List}[0]
        ...  ELSE IF  '${List}[1]' == 'KB'  Evaluate    ${List}[0]*1024
        ...  ELSE IF  '${List}[1]' == 'MB'  Evaluate    ${List}[0]*1024*1024
        ...  ELSE IF  '${List}[1]' == 'GB'  Evaluate    ${List}[0]*1024*1024*1024
        ...  ELSE IF  '${List}[1]' == 'TB'  Evaluate    ${List}[0]*1024*1024*1024*1024
        Append To List   ${ACTUAL_LIST}  ${List_Value}
    END
    Log   ${ACTUAL_LIST}
    ${Result}=  Run Keyword If  '${Asc/Desc}'=='ASC'  sort_ascending    ${ACTUAL_LIST}
    ...  ELSE IF  '${Asc/Desc}'=='DESC'  sort_descending   ${ACTUAL_LIST}
    Run Keyword If  '${Asc/Desc}'=='ASC'  Lists Should Be Equal  ${Result}   ${ACTUAL_LIST}
    ...  ELSE IF  '${Asc/Desc}'=='DESC'   Lists Should Be Equal  ${Result}   ${ACTUAL_LIST}

Verify Creating A New User
     [Documentation]  This Keyword is used to verifies creating a new user with all valid details
     @{User_Details}=  Split String  ${FSU_User_Details}  ,
     Set Global Variable  ${User_Details}
    @{Groups_List}=  Split String  ${All_Group_Name}  ,
    Set Global Variable  ${Groups_List}
     ${Success_Status}=  SEC_S360_UG_Create New User  ${User_Details}  ${Groups_List}  ${Create_User_Msg}
     Run Keyword If  '${Success_Status}'=='${FALSE}'  Fail
     SEC/S360_Common Logout
     SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${AdminRole}
     Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}
     Element Should Be Visible  preferenceCardName_1

Verify Creating a Group
    [Documentation]  This Keyword is used to verfies creating a new Group with roles
    @{Roles_List}=  Create List  ${SEC/S360_DESIGNER_ROLE}   ${SEC/S360_OPERATOR_ROLE}
    SEC/S360_Create New Group  ${FSU_User_Group_Name}  ${FSU_Group_Description}  @{Roles_List}
    SEC/S360_Verify Success Message In Two Parts  ${Create_Group_Msg_ID}
    ${Index_Number}=  SEC/S360_Search UserGroup  ${FSU_User_Group_Name}
    Run Keyword If  '${Index_Number}'=='0'  Fail

Verify Creating a Group For Unisecure
    [Documentation]  This Keyword is used to Verfies creating a new Group with roles
    SEC/S360_Navigate to User/Groups Page
    @{Roles_List}=  Create List   ${SEC/S360_DESIGNER_ROLE}  ${SEC/S360_OPERATOR_ROLE}
    SEC/S360_Create New Group  ${FSU_User_Group_Name1}  ${FSU_Group_Description}  @{Roles_List}
    SEC/S360_Verify Success Message In Two Parts  ${Create_Group_Msg_ID}
    ${Index_Number}=  SEC/S360_Search UserGroup  ${FSU_User_Group_Name1}
    Run Keyword If  '${Index_Number}'=='0'  Fail

S360_FSU_Verify New filters fields
    [Documentation]  This Keyword is used to verify new filter fields of file storage utilization card
    Wait Until Element is visible  ${S360_Filter_Button}  timeout=20
    Click Element  ${S360_Filter_Button}
    Element should be visible   ${FILTER_NAME_INPUT_FIELD}
    Element should be visible   ${S360_RELATIVE_FROM_DATE_INPUT_FIELD}
    Element should be visible   ${S360_EN_FIXED_FROM_RADIO_BUTTON}
    Element should be visible   ${S360_EN_FROM_DATE_TXTBOX}
    Element should be visible   ${S360_EN_FIXED_TO_RADIO_BUTTON}
    Element should be visible   ${S360_EN_TO_DATE_TXTBOX}
    Element should be visible   ${S360_FSU_FILETYPE_DD}
    Element should be visible   ${S360_FSU_STORAGELOCATION_DD}
    Element should be visible   ${S360_FSU_FILTERSIZE}
    Element should be visible   ${S360_FSU_AVAI_OWNER_SEARCHBOX}

S360_FSU_Create new Filter
    [Documentation]  This Keyword is used to create new filter with default in file storage utilization
    Wait Until Element is visible  ${S360_Filter_Button}  timeout=20
    Click Element  ${S360_Filter_Button}
    Wait Until Element is visible  ${FILTER_NAME_INPUT_FIELD}
    Click Element  ${FILTER_NAME_INPUT_FIELD}
    Input Text  ${FILTER_NAME_INPUT_FIELD}  ${FILTER_NAME}
    Click Element  ${S360_RELATIVE_FROM_DATE_INPUT_FIELD}
    Input Text  ${S360_RELATIVE_FROM_DATE_INPUT_FIELD}  ${RELATIVE_FROM_DATE}
    S360_FSU_Search owners and select owner
    S360_FSU_Click Apply button

S360_FSU_Verify Filter Title
    [Documentation]  This Keyword is used to verify  filter title in file storage utilization
    [Arguments]  ${Expected_Filter}
    Wait Until Element is visible  ${S360_FILTERS_LABEL}  timeout=20
    ${Total_Filter_Count}=  Get Element Count  ${S360_FILTERS_LABEL}
    FOR    ${Index}  IN RANGE  1  ${Total_Filter_Count}+1
        ${Filter_Text}=  Get Text  ${S360_FILTERS_LABEL} [${Index}]
        ${Found_Status}=  Run Keyword And Return Status  should be equal  ${Filter_Text}  ${Expected_Filter}
        Run keyword if  '${Found_Status}'== '${FALSE}'  Continue For Loop
        Run keyword if  '${Found_Status}'== '${TRUE}'  Run keywords    Mouse over  ${S360_FILTERS_LABEL} [${Index}]
        ...  AND  Element Attribute Value Should Be  ${S360_FILTERS_LABEL} [${Index}]  title  ${Expected_Filter}
        ...  AND  Exit For Loop
    END
    [Return]  ${Found_Status}

360_FSU_verify filter numeric fields
    [Documentation]  This Keyword is used to verify numeric criteria for fields in file storage utilization
    Wait Until Element is visible  ${S360_Filter_Button}  timeout=20
    Click Element  ${S360_Filter_Button}
    Wait Until Element is visible  ${FILTER_NAME_INPUT_FIELD}
    Click Element  ${FILTER_NAME_INPUT_FIELD}
    ${Random_Input} =  Generate Random String  3  [LETTERS]
    Input Text  ${FILTER_NAME_INPUT_FIELD}  ${Random_Input}
    Click Element  ${S360_RELATIVE_FROM_DATE_INPUT_FIELD}
    Input Text  ${S360_RELATIVE_FROM_DATE_INPUT_FIELD}  ${Random_Input}
    Click Element  ${FILTER_NAME_INPUT_FIELD}
    Element should be visible  ${S360_FSU_ERROR_MSG}
    SEC/S360_Scroll Page To Location  0  300
    click element  ${S360_EN_FIXED_FROM_RADIO_BUTTON}
    SEC/S360_Clear Text Field  ${S360_EN_FROM_DATE_TXTBOX}
    Input Text  ${S360_EN_FROM_DATE_TXTBOX}  ${Random_Input}
    Click Element  ${FILTER_NAME_INPUT_FIELD}
    ${text_value}=  get text    ${S360_EN_FROM_DATE_TXTBOX}
    should be empty    ${text_value}
    click element  ${S360_EN_FIXED_TO_RADIO_BUTTON}
    SEC/S360_Clear Text Field  ${S360_EN_TO_DATE_TXTBOX}
    Input Text  ${S360_EN_TO_DATE_TXTBOX}    ${Random_Input}
    Click Element  ${FILTER_NAME_INPUT_FIELD}
    ${text_value}=  get text    ${S360_EN_TO_DATE_TXTBOX}
    should be empty    ${text_value}

S360_FSU_Select FileType For Filter
    [Documentation]  This Keyword is used to Select FileType for filter
    [Arguments]  ${FileTypeList}
    Click Element  ${S360_FSU_FILETYPE_DD}
    Wait Until Element Is Visible  ${S360_FSU_FILETYPE_GARDIANEXPORT}
    ${Total}=  Get Length  ${FileTypeList}
    FOR    ${Index}  IN RANGE  0  ${TotalFileTYpe}
        Click Element  ${FileTypeList}[${Index}]
    END

S360_FSU_Select StorageLocation For Filter
    [Documentation]  This Keyword is used to Select  StorageLocation for filter
    [Arguments]  ${StorageLocationList}
    Click Element  ${S360_FSU_STORAGELOCATION_DD}
    Wait Until Element Is Visible  ${S360_FSU_STORAGELOCATION_REPORT}
    ${Total}=  Get Length  ${StorageLocationList}
    FOR    ${Index}  IN RANGE  0  ${TotalState}
        Click Element  ${StorageLocationList}[${Index}]
    END

S360_FSU_Select Owners For Filter
    [Documentation]  This Keyword is used to Select owner for filter
    [Arguments]  ${OwnersList}
    @{OwnersList}=  Split String  ${OwnersList}  ,
    ${TotalOwners}=  Get Length  ${OwnersList}
    FOR    ${OwnerName}  IN  @{OwnersList}
        Input Text  ${S360_FSU_AVAI_OWNER_SEARCHBOX}  ${OwnerName}
        Click Element  ${S360_FSU_OWNER_SELECT_LISTS} [1]
        Click Element  ${S360_FSU_SELECT_SINGLE_OWNER_BTN}
    END

S360_FSU_Create Filter
    [Documentation]  This Keyword is used to create the new filter
    #changed owner list from divya to empty - akash
    [Arguments]  ${FilterDetails}  ${FileTypeList}=${EMPTY}  ${StorageLocationList}=${EMPTY}  ${OwnersList}=${empty}  ${FileSize}=${EMPTY}
    # Click on add filter button
    SEC/S360_Scroll Page To Location  0  0
    Wait Until Element Is Visible  ${S360_EN_ADD_FILTER_BTN}
    Run Keyword And Ignore Error  Wait Until Page Does not Contain  Loading...  timeout=10
    Click Element  ${S360_EN_ADD_FILTER_BTN}
    # Enters filter name, from date and to date
    @{FilterDetails}=  Split String  ${FilterDetails}  ,
    wait until keyword succeeds  2x  2s  Click Element  ${S360_EN_FILTER_NAME_TXTBOX}
    wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_FILTER_NAME_TXTBOX}  ${FilterDetails}[0]
    SEC/S360_Scroll Page To Location  0  500
    click element  ${S360_EN_FIXED_FROM_RADIO_BUTTON}
    ${count1}=    get element count    ${S360_EN_FROM_DATE_TXTBOX}
    Clear Field Of Characters    ${S360_EN_FROM_DATE_TXTBOX}     ${count1}
#    SEC/S360_Clear Text Field  ${S360_EN_FROM_DATE_TXTBOX}
    Input Text  ${S360_EN_FROM_DATE_TXTBOX}  ${FilterDetails}[1]
    sleep    10s
    click element  ${S360_EN_FIXED_TO_RADIO_BUTTON}
    ${count2}=    get element count    ${S360_EN_TO_DATE_TXTBOX}
    Clear Field Of Characters    ${S360_EN_TO_DATE_TXTBOX}     ${count2}
    Input Text  ${S360_EN_TO_DATE_TXTBOX}    ${FilterDetails}[2]
    sleep    10s
    SEC/S360_Scroll Page To Location  0  500
    # Selects required File type
    ${FileTypeStatus}=  Run Keyword And Return Status  Should Be Empty  ${FileTypeList}
    ${NoFileTypeStatus}=  Run Keyword And Return Status  Should Be Equal  ${FileTypeList}  NO
    Run Keyword If  '${FileTypeStatus}'=='${TRUE}'  Run Keywords  Click Element  ${S360_FSU_FILETYPE_DD}
    ...  AND  Click Element  ${S360_FSU_SELECT_ALL_CHCKBOX}
    ...  AND  Click Element  ${S360_FSU_CLOSE_DD_BTN}
    ...  ELSE IF  '${NoFileTypeStatus}'=='${TRUE}'  Log  No FileType Selected
    ...  ELSE  S360_FSU_Select FileType For Filter  ${FileTypeList}
    # Selects required Storage allocation
    ${StorageLocationStatus}=  Run Keyword And Return Status  Should Be Empty  ${StorageLocationList}
    ${NoStorageLocationStatus}=  Run Keyword And Return Status  Should Be Equal  ${StorageLocationList}  NO
    Run Keyword If  '${StorageLocationStatus}'=='${TRUE}'  Run Keywords  Click Element  ${S360_FSU_STORAGELOCATION_DD}
       ...  AND  Click Element  ${S360_FSU_SELECT_ALL_CHCKBOX}
       ...  AND  Click Element  ${S360_FSU_CLOSE_DD_BTN}
       ...  ELSE IF  '${NoFileTypeStatus}'=='${TRUE}'  Log  No StorageLocation
       ...  ELSE  S360_FSU_Select StorageLocation For Filter  ${StorageLocationList}
    SEC/S360_Scroll Page To Location  0  1000
    # Selects required owners
    ${OwnerStatus}=  Run Keyword And Return Status  Should Be Empty  ${OwnersList}
    ${NoOwnerStatus}=  Run Keyword And Return Status  Should Be Equal  ${OwnersList}  NO
    Run Keyword If  '${OwnerStatus}'=='${TRUE}'  Click Element  ${S360_FSU_SELECT_ALL_OWNER_BTN}
    ...  ELSE IF  '${NoOwnerStatus}'=='${TRUE}'  Log  No Owner Selected
    ...  ELSE  S360_FSU_Select Owners For Filter  ${OwnersList}
    # Enter file size for filter
    ${FileSizeStatus}=  Run Keyword And Return Status  Should Be Empty  ${FileSize}
    Run Keyword If  '${FileSizeStatus}'=='${FALSE}'  Run Keywords  SEC/S360_Clear Text Field  ${S360_FSU_FILTER_SIZE}
    ...  AND  Input Text  ${S360_FSU_FILTER_SIZE}  ${FileSize}

S360_FSU_Update Filter
    [Documentation]  update the  filter
    [Arguments]  ${NameOfFilter}  ${FilterDetails}=${EMPTY}  ${FileTypeList}=${EMPTY}  ${StorageLocationList}=${EMPTY}  ${OwnersList}=${EMPTY}  ${FileSize}=${EMPTY}
    # Hovers and clicks on filter edit button
    S360_Edit/Delete Filter  ${NameOfFilter}  ${S360_EN_EDIT_FILTER_BTN}
    # Updates filter name, from date, to date if required
    ${FilterDetails}=  Split String  ${FilterDetails}  ,
    ${count1}=    get element count    ${S360_EN_FROM_DATE_TXTBOX}
    ${count2}=    get element count    ${S360_EN_TO_DATE_TXTBOX}

    Run Keyword If  '${FilterDetails}[0]'!='${EMPTY}'  Run Keywords  wait until keyword succeeds  5x  2s  Click Element  ${S360_EN_FILTER_NAME_TXTBOX}
    ...  AND  wait until keyword succeeds  5x  2s  Input Text  ${S360_EN_FILTER_NAME_TXTBOX}  ${FilterDetails}[0]
    ...  AND  wait until keyword succeeds  5x  2s  click element   ${S360_EN_FIXED_FROM_RADIO_BUTTON}
    ...  AND  Clear Field Of Characters    ${S360_EN_FROM_DATE_TXTBOX}     ${count1}
    ...  AND  Input Text  ${S360_EN_FROM_DATE_TXTBOX}  ${FilterDetails}[1]
   ...  AND  wait until keyword succeeds  5x  2s  click element   ${S360_EN_FIXED_TO_RADIO_BUTTON}
    ...  AND  Clear Field Of Characters    ${S360_EN_TO_DATE_TXTBOX}     ${count2}
    ...  AND  Input Text  ${S360_EN_TO_DATE_TXTBOX}    ${FilterDetails}[2]
    SEC/S360_Scroll Page To Location  0  500
    # Selects required File type
    ${FileTypeStatus}=  Run Keyword And Return Status  Should Be Empty  ${FileTypeList}
    ${NoFileTypeStatus}=  Run Keyword And Return Status  Should Be Equal  ${FileTypeList}  NO
    Run Keyword If  '${FileTypeStatus}'=='${TRUE}'  Run Keywords  Click Element  ${S360_FSU_FILETYPE_DD}
    ...  AND  Click Element  ${S360_FSU_SELECT_ALL_CHCKBOX}
    ...  AND  Click Element  ${S360_FSU_CLOSE_DD_BTN}
    ...  ELSE IF  '${NoFileTypeStatus}'=='${TRUE}'  Log  No FileType Selected
    ...  ELSE  S360_FSU_Select FileType For Filter  ${FileTypeList}
    # Selects required Storage allocation
    ${StorageLocationStatus}=  Run Keyword And Return Status  Should Be Empty  ${StorageLocationList}
    ${NoStorageLocationStatus}=  Run Keyword And Return Status  Should Be Equal  ${StorageLocationList}  NO
    Run Keyword If  '${StorageLocationStatus}'=='${TRUE}'  Run Keywords  Click Element  ${S360_FSU_STORAGELOCATION_DD}
       ...  AND  Click Element  ${S360_FSU_SELECT_ALL_CHCKBOX}
       ...  AND  Click Element  ${S360_FSU_CLOSE_DD_BTN}
       ...  ELSE IF  '${NoFileTypeStatus}'=='${TRUE}'  Log  No StorageLocation
       ...  ELSE  S360_FSU_Select StorageLocation For Filter  ${StorageLocationList}
    SEC/S360_Scroll Page To Location  0  1000
    # Selects required owners
    ${OwnerStatus}=  Run Keyword And Return Status  Should Be Empty  ${OwnersList}
    ${NoOwnerStatus}=  Run Keyword And Return Status  Should Be Equal  ${OwnersList}  NO
    Run Keyword If  '${OwnerStatus}'=='${TRUE}'  Click Element  ${S360_FSU_SELECT_ALL_OWNER_BTN}
    ...  ELSE IF  '${NoOwnerStatus}'=='${TRUE}'  Log  No Owner Selected
    ...  ELSE  S360_FSU_Select Owners For Filter  ${OwnersList}
    # Enter file size for filter
    ${FileSizeStatus}=  Run Keyword And Return Status  Should Be Empty  ${FileSize}
    Run Keyword If  '${FileSizeStatus}'=='${FALSE}'  Run Keywords  clear element text    ${S360_FSU_FILTER_SIZE}
    ...  AND  Input Text  ${S360_FSU_FILTER_SIZE}  ${FileSize}

Remove Filters
    [Documentation]  This Keyword is used to remove all filters
    [Arguments]  ${Filter_Name}
    Run keyword and ignore error  wait until element is visible  xpath=//*[contains(@id,"filter_")]
    ${Total_Filter_Count}=  Get Element Count  xpath=//*[contains(@id,"filter_")]
    FOR    ${a}  IN RANGE  ${Total_Filter_Count}
        ${Filter_Text}=  get Text  xpath=//*[@id="filter_${a}"]/span
        ${Filter_Hover} =  Catenate  xpath=//*[@id="filter_${a}"]/span
        ${Remove_Filter} =  Catenate  xpath=//app-filter-bookmark[@id='filter_${a}']//span[@id='remove_filter']
        Run Keyword If  '${Filter_Text}' == '${Filter_Name}'  Run Keywords   wait until element is visible    ${Filter_Hover}  timeout=10s
        ...  AND  sleep  1s  #not able to remove filters
        ...  AND  mouse over  ${Filter_Hover}
        ...  AND  wait until element is visible  ${Remove_Filter}  timeout=10s
        ...  AND  click element  ${Remove_Filter}
        ...  AND  sleep  1s  #not able to remove filters
    END

SEC_BO_Delete_Report
	[Documentation]  Deletes report and takes report name as argument
	[Arguments]  ${Report_Name}  ${Popup_Delete_No}
	run keyword and ignore error  wait until element is visible  ${SEC_BO_REPORTS_TXTS}  timeout=10
	${Reports_Count}=  get element count  ${SEC_BO_REPORTS_TXTS}
    @{allWebElements}  Get Webelements  ${SEC_BO_REPORTS_TXTS}
    FOR    ${index}  IN RANGE  0  ${Reports_Count}
        ${Report_Txt}=  get text  ${allWebElements}[${index}]
        ${Status}=   Run keyword and return status  should contain  ${Report_Txt}  ${Report_Name}
        run keyword if  '${Status}'== '${True}'  Run Keywords  wait until element is visible  ${SEC_BO_RR_PUBLISH_MENU_BTN}  timeout=10
	    ...  AND  click element  ${SEC_BO_RR_PUBLISH_MENU_BTN}
	    ...  AND  wait until element is visible  ${SEC_BO_REPORTS_DELETE}
	    ...  AND  click element  ${SEC_BO_REPORTS_DELETE}
	    ...  AND  wait until element is visible  ${SEC/S360_DELETE_POP_BTN}  timeout=25
	    ...  AND  click element  ${SEC/S360_DELETE_POP_BTN}
	    ...  AND  Wait Until Element is Not Visible  ${SEC/S360_DELETE_POP_BTN}  timeout=10
	    ...  AND  Run Keyword And Continue on Failure  SEC/S360_Verify Success Message  ${SEC_BO_REPORT_SM_DELETE}
    END

S360_Delete Export/Import card
    [Documentation]  Deletes a card
    ...  ${FileName}: Name of the card to be deleted
    ...  ${MessageID}: Expected Message prefix
    [Arguments]    ${Filename}  ${MessageID}
    Wait Until Element Is Visible   ${SEC/S360_SEARCH_BOX}  timeout=15
    SEC/S360_Clear Text Field  ${SEC/S360_SEARCH_BOX}
    Input Text  ${SEC/S360_SEARCH_BOX}  ${Filename}
    Wait Until Element Is Visible  ${SEC/S360_SEARCH_BTN}  timeout=15
    Click Element  ${SEC/S360_SEARCH_BTN}
    run keyword and ignore error  Wait Until Page Contains  Loading...  timeout=10
    run keyword and ignore error  Wait Until Page Does Not Contain  Loading...  timeout=10
    Wait Until Element Is Visible  ${SEC/S360_CARDS_NAME_ID} [1]  timeout=15
    ${TotalElement}=  Get Element Count  ${SEC/S360_CARDS_NAME_ID}
    # Deletes a card
    FOR    ${Index}  IN RANGE  1  ${TotalElement}+1
        Mouse Over  ${SEC/S360_CARD_OPTION_MENU}
        Wait Until Element Is Visible    ${SEC/S360_DELETE_CARD_ICON}  timeout=15
        Execute Javascript      document.getElementById('${SEC/S360_DELETE_CARD_ICON}').click()
        Wait Until Element Is Visible    ${SEC/S360_DELETE_POP_BTN}  timeout=15
        Click Element           ${SEC/S360_DELETE_POP_BTN}
        Sleep  2S  # Till pop is dismissed and other elements are clickable
        Wait Until Element Is Visible  ${SEC/S360_DELETE_POP_BTN}
        Click Element  ${SEC/S360_DELETE_POP_BTN}
        SEC/S360_Verify Success Message  ${MessageID}
    END

S360_FSU_Verify storage Usage Table
    [Documentation]  This keywords verify storage usage table
    Wait Until Element Is Visible  ${S360_STORAGEALLOC_LABEL}  timeout=20
    Element Should Be Visible  ${S360_REMAINING_LABEL}
    Element Should Be Visible  ${S360_USED_LABEL}
    Element Should Be Visible  ${S360_PERCENTAGEUSED_LABEL}
    ${Storage_Txt}=  Get Text  ${S360_STORAGEALLOC_TXT}
    @{Storage_Txt}=  Split String  ${Storage_Txt}  ${SPACE}
    ${Result}=  compare_Value  ${Storage_Txt}[1]  0
    Run Keyword if  '${Result}'=='${False}'  Fail
    ${Used_Txt}=  Get Text  ${S360_STORAGEALLOC_TXT}
    @{Used_Txt}=  Split String  ${Used_Txt}  ${SPACE}
    ${Result1}=  compare_Value  ${Used_Txt}[1]  0
    Run Keyword if  '${Result1}'=='${False}'  Fail

S360_FSU_Create Vault Filter
    [Documentation]  This Keyword is used to create new filter with default in file storage utilization
    Click on new filter button
    Run keyword and ignore Error  Remove Filters  ${FILTER_NAME}
    Fill Filter Name  ${FILTER_NAME}
    SEC/S360_Scroll Page To Location  0  2000
    Wait Until Element is visible  ${S360_SEARCH_AVAILABLE_OWNERS_TEXT_FIELD} [3]  timeout=20
    Click Element  ${S360_SEARCH_AVAILABLE_OWNERS_TEXT_FIELD} [3]
    Input Text  ${S360_SEARCH_AVAILABLE_OWNERS_TEXT_FIELD} [3]  ${OWNER_NAME}
#    Click Element  ${S360_VAULT_OWNER_SELECT_LISTS} [1]
    Click Element    //*[@id="filter-owners"]/div/div[2]/div/button[2]
    S360_FSU_Click Apply button


S360_FSU_Delete vault file
    Open Vault Page
    S360_FSU_Create Vault Filter
    sleep    11s
    SEC/S360_Scroll Page To Location  0  0
    Run keyword and ignore error  Wait Until Element Is Visible  ${S360_Filter_Ok_POPUP}  timeout=20s
    Run keyword and ignore error  Click Element  ${S360_Filter_Ok_POPUP}
    wait until element is visible    //*[@id="mat-tab-label-0-1"]/div
    click element    //*[@id="mat-tab-label-0-1"]/div
    Click on Delete
    Click on Delete From Popup
    Remove Filters  ${FILTER_NAME}

SEC/S360_Verify Pychart Section Percent
    [Documentation]  This keyword verify pychart section and return percentage value of that section
    [Arguments]  ${Pychart_Section}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_FSU_PROGRESS_BAR}
    Wait Until Element Is Not Visible  ${S360_FSU_PROGRESS_BAR}
    Wait Until Element Is Visible  ${Pychart_Section}
    ${Section_Text}=  Get Text  ${Pychart_Section}
    Log to Console  ${Section_Text}
    @{Actual_List}=  Split String  ${Section_Text}  ${SPACE}
    ${Percent_Value}=  Remove String  ${Actual_List}[1]  %
    [Return]  ${Percent_Value}

SEC/S360_Verify Pychart Sections
    [Documentation]
    ${Pychart_List}=   Create list
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${S360_FSU_PROGRESS_BAR}
    Wait Until Element Is Not Visible  ${S360_FSU_PROGRESS_BAR}    timeout=260
    Wait Until Element Is Visible  ${S360_PYCHART_SECTIONS}
    ${Total_Items_Count}=  Get Element Count  ${S360_PYCHART_SECTIONS}
    FOR    ${Item}  IN RANGE  1  ${Total_Items_Count}+1
        ${Section_Text}=  Get Text  ${S360_PYCHART_SECTIONS} [${Item}]
        Log to Console  ${Section_Text}
        @{Actual_List}=  Split String  ${Section_Text}  ${SPACE}
        ${Percent_Value}=  Remove String  ${Actual_List}[1]  %
        Append To List  ${Pychart_List}  ${Percent_Value}
    END
    [Return]  ${Pychart_List}

S360_FSU_Delete All Created Data
    SEC/S360_Login Precondition  ${SEC_SVT_URL}  ${OWNER_NAME}  ${Password}  ${AdminRole}
#    COM_Navigate_To_Any_Card  ${SEC_AdminBO_CardPath}  ${SEC_BO_RR_Card_Name}
#    SEC_BO_Delete_Report  ${Sec_Bo_Report_Title1}  DELETE
    wait until keyword succeeds    3x    1s    SEC_Precondition_Navigate_To_Export/Import
    SEC_Precondition_Navigate_To_EIR_OR_RC  EIR  ${SEC_EI_Export/Import_Requests}  Cards_View
    Run Keyword and ignore error  S360_Delete Export/Import card  ${OWNER_NAME}  ${SEC_EI_SM_DELETE}
    SEC/S360_FE_Navigate to Browse Folder
    Wait Until Element Is Visible  ${SEC/S360_EXIM_FOLDERS}
    Click Element  ${SEC/S360_EXIM_FOLDERS}
    ${Total_Items_Count}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}
    FOR    ${Item}  IN RANGE  0  ${Total_Items_Count}
        @{Total_Items}=  Get WebElements  ${SEC/S360_UPLOADED_FILE_NAME}
        ${Item_Name}=  Get Text  ${Total_Items}[0]
        SEC/S360_FE_Context Click On File/Folder  ${Item_Name}  ${SEC/S360_DELETE_MENU}
    END
    wait until keyword succeeds  3x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    wait until Element Is Not visible  ${SEC/S360_CLOSE_FMM_BTN}
    wait until element is visible  ${SEC/S360_WELCOME_LINK}
    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_ADMIN}
    SEC/S360_Navigate to User/Groups Page
    @{Groups_List}=  Split String  ${FSU_User_Group_Name1}  ,
    run keyword and ignore error  SEC/S360_Delete User Groups  @{Groups_List}
    SEC/S360_Switch Between UniSecure/Systech360   ${SEC/S360_NAV_GO_TO_ADMIN}  ${SEC/S360_ACC_INFO_CARD}
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  2x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    Wait Until Element Is Visible  ${SEC/S360_UPLOAD_FILE_BTN}  timeout=10
    ${Total_Items_Count}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}
    FOR    ${Item}  IN RANGE  0  ${Total_Items_Count}
        @{Total_Items}=  Get WebElements  ${SEC/S360_UPLOADED_FILE_NAME}
        ${Item_Name}=  Get Text  ${Total_Items}[0]
        SEC/S360_FE_Context Click On File/Folder  ${Item_Name}  ${SEC/S360_DELETE_MENU}
    END
    wait until keyword succeeds  3x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    wait until Element Is Not visible  ${SEC/S360_CLOSE_FMM_BTN}
    S360_FSU_Navigate To Details Tab
    Remove Filters  ${FILTER_NAME}
    SEC/S360_Navigate To Different Role  ${SEC/S360_GO_TO_OPERATOR}
    run keyword and ignore error    S360_FSU_Delete vault file
    SEC/S360_Login Precondition  ${SPH_SVT_URL}  ${Username}  ${Password}  ${AdminRole}
    SEC/S360_Navigate to User/Groups Page
    @{Users_List}=  Split String  ${OWNER_NAME}  ,
    run keyword and ignore error  SEC/S360_Delete Users  @{Users_List}
    @{Groups_List}=  Split String  ${FSU_User_Group_Name}  ,
    run keyword and ignore error  SEC/S360_Delete User Groups  @{Groups_List}
