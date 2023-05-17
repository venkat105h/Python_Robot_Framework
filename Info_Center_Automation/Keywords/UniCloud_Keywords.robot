#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by other Robot scrits.
#	Project				:		UniCloud
#	Author				:		Vikram Nagesh
#	© 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable

*** Settings ***
Documentation		This resource file has all the reusable keywords and variables.
Library				Collections
Library				SeleniumLibrary
Library				String
Library				DateTime
Library				../UniCloud_Resources/Excel_Data_Methods.py  WITH NAME  excel_data_methods
Library				../UniCloud_Resources/Generic_Methods.py  WITH NAME  generic_methods
Resource			../Locators/UniCloud_Locators.robot
Resource			../Locators/Generic_Locators.robot
Resource			../Locators/Info_Center_Locators.robot
Resource			../Keywords/Generic_Keywords.robot
Resource			../Variables/ExpectedVariablesValue_${LANGUAGE}.robot
Variables			../Variables/${TESTENV}_Variable.py


*** Variables ***
${BROWSER_TYPE}							Chrome
${LANGUAGE}								EN
${SERVER_DEV}							athena.systechcloud.net
${SERVER_DEVPORT}						8008
${SERVER_SVT}							athena.systechcloud.net
${SERVER_SVTPORT}						8008
${SERVER_QA}							athena.systechcloud.net
${SERVER_QAPORT}						8008
${DELAY}								0
${LOGIN_URL_DEV}						http://${SERVER_DEV}:${SERVER_DEVPORT}/UniCloud
${LOGIN_URL_SVT}						http://${SERVER_SVT}:${SERVER_SVTPORT}/UniCloud
${LOGIN_URL_QA}							http://${SERVER_QA}:${SERVER_QAPORT}/UniCloud
${VALID_USER}							Dinesh
${VALID_PASSWORD}						UniCloud@123
${WAITFACTOR}							0.05
${FILEPATHNOTAVAILABLE}					FilePathNotAvailable
${GENERALVARIABLE}						General
${PASS_STATUS}							PASS
${FAIL_STATUS}							FAIL
${SUCCESSFULLY_UPLOAD_MESSAGE}			File Uploaded Successfully
${FILE_NOT_FOUND_IN_EXCEL_MESSAGE}		File Not Provided In Excel
${OPERATION_ERROR_MESSAGE}				Operation error, look at logs
${WINDOW_WIDTH}							1920
${WINDOW_HEIGHT}						1080
${DELETE_UNSUCCESSFUL_MESSAGE}			Delete unsuccessful due to missing record
${DELETE_SUCCESSFUL_MESSAGE}			Delete successful
${TAG_LENGTH_ERROR_MESSAGE}				Tag length more than 15
${ICDESCRIPTIONXPATH}					xpath://label[contains(@id,'
${CLD_DELETE_BTN_ELEMENT_ID}			xpath://button[@id='less-common-remove-

*** Keywords ***
####################################### Navigation to specific page From Welcome Page functions ###########################################
CLD_Navigation to Welcome Page
    [Documentation]  Navigates to Welcome page

	Click Element  ${CLD_WELCOMELINK_ELEMENT_ID}
	Wait Until Element Is Not Visible  ${CLD_TOPPAGE_HEADER_BTN_ELEMENT_ID}


CLD_Navigation to Info Center Page From Welcome Page
    [Documentation]  Navigates to Info Center page
    ${url}=   Get Location
	Wait Until Element Is Visible  ${CLD_WELCOMELINK_ELEMENT_ID}  timeout=20
	Wait Until Element Is Visible  ${CLD_INFOCENTER_CARD_ELEMENT_ID}  timeout=60
	Click Element  ${CLD_INFOCENTER_CARD_ELEMENT_ID}
	Wait Until Element Is Visible  ${CLD_ADD_INFOCENTER_ELEMENT_ID}  timeout=40


CLD_Move To Welcome Page and back to desired page using parent tab
	[Arguments]  ${CLD_ADMIN_PARENTTAB_ELEMENT_ID}  ${CardElementID}

	Wait Until Element is Visible  ${CLD_ADMIN_PARENTTAB_ELEMENT_ID}
	Click Element  ${CLD_ADMIN_PARENTTAB_ELEMENT_ID}
	Wait Until Element is Visible  ${CardElementID}
	Click Element  ${CardElementID}
	SPH/SEC_Scroll Page To Location   0  0


CLD_Move To Welcome Page
    [Documentation]  Navigates to Welcome page using parent tab

    SPH/SEC_Scroll Page To Location  0  0
	Wait Until Element is Visible  ${CLD_ADMIN_PARENTTAB_ELEMENT_ID}
	Click Element  ${CLD_ADMIN_PARENTTAB_ELEMENT_ID}
	Wait Until Element is Visible  ${CLD_INFOCENTER_CARD_ELEMENT_ID}
	SPH/SEC_Scroll Page To Location  0  0
####################################### Add Link ###########################################


CLD_Click on Add Link
    [Documentation]  Clicks on Add Link in UniCloud page

	[Arguments]  ${linkElementID}  ${expectedElementVisibility}
	Wait Until Element is Visible   ${linkElementID}   timeout=30
	SPH/SEC_Scroll Page To Location   0  0
	Click Element  ${linkElementID}
	Wait Until Element is Visible   ${expectedElementVisibility}   timeout=30


####################################### Add Single Row Data on Table ###########################################
CLD_Add single row data into Info Center table
    [Documentation]  Enters values in all the fields

	[Arguments]   ${Data}
	
	${WebTableRowElement}=  Get Element Count   ${CLD_WEBTABLE_ROWELEMENT_ID}
	CLD_Select dropdown with Product Condition  ${CLD_WEBTABLE_ROWELEMENT_ID} [1]  ${Data}[${0}]
	CLD_Select dropdown with Language Condition  ${CLD_WEBTABLE_ROWELEMENT_ID} [2]  ${Data}[${2}]
	CLD_Select dropdown with Type Condition  ${CLD_WEBTABLE_ROWELEMENT_ID} [3]  ${Data}[${3}]

	Input Text  ${CLD_INFOCENTER_VER_EDITBOX_ELEMENT_ID}  ${Data}[1]
	Input Text  ${CLD_INFOCENTER_DESC_EDITBOX_ELEMENT_ID}  ${Data}[5]
	Input Text  ${CLD_INFOCENTER_TAGS_EDITBOX_ELEMENT_ID}  ${Data}[6]
	Execute JavaScript   document.getElementById('date').value='${Data}[7]'
	Input Text  ${CLD_INFO_CENTER_GLOBAL_SEARCH_ELEMENT_ID}  ${Data}[8]


####################################### Select right drop down value functions ###########################################
CLD_Select dropdown with Product Condition
    [Documentation]  Selects the product name from the dropdown

	[Arguments]   ${argument1}  ${argument2}
	${Select_Box_Contain_Value}  ${Expected_Index}=  COM_Retrieve_Select_Box_Item_Status_And_Index  ${argument1}  ${argument2}  No
	Run Keyword If  '${argument2}' == '${GENERALVARIABLE}'  Run Keyword And Continue On Failure  Select From List By Index   ${argument1}  0
	...  ELSE  Run Keyword And Continue On Failure  Select From List By Index  ${argument1}  ${Expected_Index}


CLD_Select dropdown with Version Condition
    [Documentation]  Selects the Version from the dropdown

	[Arguments]   ${argument1}  ${argument2}
	${Select_Box_Contain_Value}  ${Expected_Index}=  COM_Retrieve_Select_Box_Item_Status_And_Index  ${argument1}  ${argument2}  No
	Run Keyword If  '${argument2}' == '${GENERALVARIABLE}'  Run Keyword And Continue On Failure  Select From List By Index   ${argument1}  0
	Run Keyword If  '${argument2}' != '${GENERALVARIABLE}' and '${Select_Box_Contain_Value}'=='${TRUE}'  Run Keyword And Continue on Failure
	...  Select From List By Index  ${argument1}  ${Expected_Index}  ELSE  FAIL  ${argument1} not found in the Select Box


CLD_Select dropdown with Language Condition
    [Documentation]  Selects the Language name from the dropdown

	[Arguments]   ${argument1}  ${argument2}
	${Select_Box_Contain_Value}  ${Expected_Index}=  COM_Retrieve_Select_Box_Item_Status_And_Index  ${argument1}  ${argument2}  No
	Run Keyword If  '${argument2}' == '${GENERALVARIABLE}'  Run Keyword And Continue On Failure  Select From List By Index   ${argument1}  0
	Run Keyword If  '${argument2}' != '${GENERALVARIABLE}' and '${Select_Box_Contain_Value}'=='${TRUE}'  Run Keyword And Continue on Failure
	...  Select From List By Index  ${argument1}  ${Expected_Index}  ELSE  FAIL  ${argument1} not found in the Select Box


CLD_Select dropdown with Type Condition
    [Documentation]  Select the type of artifact from the dropdown

	[Arguments]   ${argument1}  ${argument2}
	${Select_Box_Contain_Value}  ${Expected_Index}=  COM_Retrieve_Select_Box_Item_Status_And_Index  ${argument1}  ${argument2}  No
	Run Keyword If  '${argument2}' == '${GENERALVARIABLE}'  Run Keyword And Continue On Failure  Select From List By Index   ${argument1}  0
	Run Keyword If  '${argument2}' != '${GENERALVARIABLE}' and '${Select_Box_Contain_Value}'=='${TRUE}'  Run Keyword And Continue on Failure
	...  Select From List By Index  ${argument1}  ${Expected_Index}  ELSE  FAIL  ${argument1} not found in the Select Box


####################################### Add file and save functions ###########################################
CLD_Add File to First row and Save
    [Documentation]  Upload the required file into UniCloud

	[Arguments]  ${FilePathAndFileName}  ${ApprovalStatus}
	${FileLoadStatus}=  Run Keyword And Return Status  Choose File  ${CLD_DRAG_OR_CLICK_FILEUPLOAD_ELEMENT_ID}  ${FilePathAndFileName}
	${UploadStatus}=  Run Keyword If  '${FileLoadStatus}'=='False'  CLD_Return fail status for File not found or file not processed error
	...   ELSE  Run Keyword And Continue On Failure  CLD_Save and Continue Approval  ${ApprovalStatus}
	${UploadStatus}=  Run Keyword If  '${UploadStatus}'=='${FAIL_STATUS}'  CLD_Return fail status for File not found or file not processed error
	...   ELSE  CLD_Return Pass status
	[Return]  ${UploadStatus}


CLD_Save and Continue Approval
    [Documentation]  Saves the data and Approves the file
	
	[Arguments]   ${ApprovalStatus}
	
	@{WebTableSaveElement}=  Get Webelements   ${CLD_SAVE_ELEMENT_ID}
	Click Element  ${WebTableSaveElement}[0]
	Wait Until Element Is Not Visible  ${CLD_LOADING_PROGRESS_TRAINING_CENTER_ELEMENT_ID}  timeout=120
	${PreSAVE_STATUS}=  Run Keyword If  '${ApprovalStatus}' == 'Yes'  Run Keyword And Return Status  CLD_Approve added single row data and Save
	${SAVE_STATUS}=  Run Keyword If  '${PreSAVE_STATUS}'=='False'  CLD_Return fail status for File not found or file not processed error
	...   ELSE  CLD_Return Pass status
	[Return]  ${SAVE_STATUS}


CLD_Return fail status for File not found or file not processed error
	[Return]  ${FAIL_STATUS}


CLD_Return Pass status
	[Return]  ${PASS_STATUS}


####################################### Approve after adding row data functions ###########################################
CLD_Approve added single row data and Save
    [Documentation]  Toggles Approve switch and save

    # Clicks on Edit
	@{WebTableEditElement}=  Get Webelements    ${CLD_EDIT_NEW_ROWDATA_INTABLE_ELEMENT_ID}
	Wait Until Element is Visible               ${WebTableEditElement}[0]
	Click Element                               ${WebTableEditElement}[0]

	# Clicks on Approve switch
	@{WebTableToggleSwitchElement}=  Get Webelements   ${CLD_APPROVES_WITHIN_WEBTABLE_ELEMENT_ID}
	Wait Until Element is Visible               ${WebTableToggleSwitchElement}[0]
	Click Element                               ${WebTableToggleSwitchElement}[0]

	# Clicks on Save button
	@{WebTableSaveElement}=  Get Webelements    ${CLD_SAVE_ELEMENT_ID}
	Wait Until Element is Visible               ${WebTableSaveElement}[0]
	Click Element                               ${WebTableSaveElement}[0]


####################################### Delete single row data functions ###########################################
CLD_Delete Row Matching Description
    [Documentation]  Deletes the specified artifact

	[Arguments]  ${ICDescription}

	log to console    Deleting ${ICDescription} ...
	# Retrieves the ID of element to be deleted to know the index number
	${descriptionID}=  Get Element Attribute  ${ICDESCRIPTIONXPATH}${ICDescription}')]  attribute=id

	# Fetch the index number
	${LengthOfDescription}=  get length         ${ICDescription}
	${AddOneToLengthOfDescription}=  Evaluate   ${LengthOfDescription} + 1
	${IndexNumber}=  Get Substring              ${descriptionID}  ${AddOneToLengthOfDescription}

	# Deletes the artifact with the index number
	Click Element                       ${CLD_DELETE_BTN_ELEMENT_ID}${IndexNumber}']
	Wait Until Element is Visible       ${CLD_DELETE_BTN_ONPOPUP_ELEMENT_ID}
	Click Element                       ${CLD_DELETE_BTN_ONPOPUP_ELEMENT_ID}
	Wait Until Element Is Not Visible   ${CLD_DELETE_BTN_ONPOPUP_ELEMENT_ID}


CLD_Delete Specific Records
    [Documentation]  Deletes the specific record from UniCloud
	[Arguments]  ${ICDescription}

    # Navigate to last page
	SPH/SEC_Scroll Page To Location  0  0
	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20
	Click Element   ${CLD_LAST_PAGE_BTN}

    # Gets the last page number
	${LastPageNumber}=  Get Text  ${CLD_LAST_PAGE_BTN_ELEMENT_ID}

	# Clicks on first page
	Click Element  ${CLD_FIRST_PAGE_BTN}
	Wait Until Element is Visible  ${CLD_WEBTABLE_ELEMENT_ID}  timeout=20
	SPH/SEC_Scroll Page To Location  0  0

	# Navigate through pages till the artifact is visible
	FOR   ${IndividualPage}  IN RANGE  1  ${LastPageNumber}+1
		${FoundStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${ICDESCRIPTIONXPATH}${ICDescription}')]
		Run Keyword If  '${FoundStatus}' == '${TRUE}'  Run Keywords  CLD_Delete Row Matching Description  ${ICDescription}
		...		AND  Exit For Loop
		...		ELSE  Click Element  ${CLD_NEXT_PAGE_BTN}
    END


####################################### Update Info Center ###########################################
CLD_Read Each Row Data From Excel And Call Add Info Center records
	[Documentation]		Reads each row data from the excel file and calls the add Info Center records function
	[Arguments]  ${ManifestFilePathAndFileName}  ${TotalValidRows}  ${WorksheetName}

	FOR  ${Row}  IN RANGE  2  ${TotalValidRows}
		@{preICList}=  excel_data_methods.read_each_row_data_from_info_center_worksheet  ${ManifestFilePathAndFileName}
		...   ${WorksheetName}  ${Row}
		Run Keyword If  '${preICList}[4]' != '${FILEPATHNOTAVAILABLE}'  CLD_Add Info Center records  ${preICList}
		...  ${WorksheetName}  ${Row}
		...  ELSE  CLD_Update failure status on Excel  ${WorksheetName}  ${Row}
    END


CLD_Update failure status on Excel
	[Documentation]  Updates failure status on Excel to the exact row and column specified

	[Arguments]  ${WorksheetName}  ${Row}
	Run Keyword If  ${Row}==2  generic_methods.update_one_off_status_time_to_excel  ${ManifestFilePathAndFileName}
	...   ${WorksheetName}  ${InfoCenterStatusColumnInExcel}
	generic_methods.update_status_to_excel  ${ManifestFilePathAndFileName}  ${WorksheetName}  ${Row}
	...   ${FAIL_STATUS}  ${FILE_NOT_FOUND_IN_EXCEL_MESSAGE}  ${InfoCenterStatusColumnInExcel}


CLD_Add Info Center records
	[Documentation]  Adds Info Center records

	[Arguments]  ${IClist}  ${WorksheetName}  ${Row}
	Run Keyword If  ${Row}==2  generic_methods.update_one_off_status_time_to_excel  ${ManifestFilePathAndFileName}
	...   ${WorksheetName}  ${InfoCenterStatusColumnInExcel}
	CLD_Click on Add Link  ${CLD_ADD_INFOCENTER_ELEMENT_ID}  ${CLD_DRAG_OR_CLICK_ELEMENT_ID}
	${verifyTagLength}=  generic_methods.getTaglengthgt15  ${IClist}[9]  ${IClist}[10]
	Run Keyword If  '${verifyTagLength}' == '${TRUE}'  generic_methods.update_status_to_excel  ${ManifestFilePathAndFileName}
	...   ${WorksheetName}  ${Row}  ${FAIL_STATUS}  ${TAG_LENGTH_ERROR_MESSAGE}  ${InfoCenterStatusColumnInExcel}
	...   ELSE  CLD_Add single row data into Info Center table    ${IClist}
	Sleep  2s
	#Instead of above Sleep 2s, we could use  Wait Until Element Is Visible  ${addInfoCenterElementID}
	Run Keyword If  '${verifyTagLength}' == '${TRUE}'  CLD_Move To Welcome Page and back to desired page using parent tab
	...   ${CLD_ADMIN_PARENTTAB_ELEMENT_ID}  ${CLD_INFOCENTER_CARD_ELEMENT_ID}
	...   ELSE  CLD_Upload Files on the first row  ${ICList}  ${WorksheetName}  ${Row}


CLD_Upload Files on the first row
	[Arguments]  ${IClist}  ${WorksheetName}  ${Row}
	${Upload_Status}=  CLD_Add File to First row and Save  ${IClist}[4]  ${IClist}[12]
	Run Keyword If  '${Upload_Status}' == '${FAIL_STATUS}'  generic_methods.update_status_to_excel  ${ManifestFilePathAndFileName}
	...   ${WorksheetName}  ${Row}  ${Upload_Status}  ${OPERATION_ERROR_MESSAGE}  ${InfoCenterStatusColumnInExcel}
	...   ELSE  generic_methods.update_status_to_excel  ${ManifestFilePathAndFileName}  ${WorksheetName}
	...   ${Row}  ${Upload_Status}  ${SUCCESSFULLY_UPLOAD_MESSAGE}  ${InfoCenterStatusColumnInExcel}
	Run Keyword If  '${Upload_Status}'=='${FAIL_STATUS}'   CLD_Move To Welcome Page and back to desired page using parent tab
	...   ${CLD_ADMIN_PARENTTAB_ELEMENT_ID}  ${CLD_INFOCENTER_CARD_ELEMENT_ID}

