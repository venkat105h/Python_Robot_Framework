#-----------------------------------------------------------------------------------------------------------------------
#	Description			:		This resource file is written to be reused for Unicloud functions.
#	Project				:		UniSphere
#	Author				:		Satya R
#	© 2018 Systech International. All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation     A resource file with reusable keywords and variables related to UniCloud.
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Resource        ../Locators/Locator_UniCloud.robot
#-----------------------------------------------------------------------------------------------------------------------
*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------------
#######################################################  UNICLOUD #####################################################
#-----------------------------------------------------------------------------------------------------------------------
UNICLOUD_Navigate to UniCloud page
    [Documentation]     This keyword is to Navigate to UniCloud login page.
    Go To   ${UNICLOUD_URL}

UNICLOUD_Login to UniCloud using URL and Username and Password parameters
    [Documentation]     This keyword is to enter username & password and loign for UniCloud environment.
    ...                 ${UNICLOUD_USER} is used to provide the login username of UniCloud environment.
    ...                 ${UNICLOUD_PASSWORD}  is used to provide the login password of UniCloud environment.
    [Arguments]		${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    Input Text  ${UNICLOUD_USERNAME_TXTBOX}	  ${UNICLOUD_USER}
    Input Text  ${UNICLOUD_PASSWORD_TXTBOX}   ${UNICLOUD_PASSWORD}
    Click Button  ${UNICLOUD_LOGIN_BUTTON}

UNICLOUD_Logout of UniCloud session
    [Documentation]     This keyword is to logout the UniCloud session.
    Wait Until Element Is Visible	${UNICLOUD_USERDISPLAY_DROPDOWN}  timeout=10
    Click Element 	${UNICLOUD_USERDISPLAY_DROPDOWN}
    Click Element 	${UNICLOUD_LOGOUT_DROPDOWN}
    Wait Until Element Is Visible   ${UNICLOUD_USERNAME_TXTBOX}  timeout=10

UNICLOUD_Systech UniCloud Should Be Open
    [Documentation]     This keyword is to verify the user is logged in to UniCloud by checking the Title.
    Wait Until Element Is Visible    ${UNICLOUD_USERDISPLAY_DROPDOWN}  timeout=10
    Title Should Be    ${UNICLOUD_PAGE_TITLE}

UNICLOUD_Navigation to Welcome Page
    [Documentation]     This keyword is to Navigate to Welcome page in the UniCloud.
    Click Element  ${UNICLOUD_WELCOME_BTN}
    Wait Until Element Is Not Visible  ${UNICLOUD_TOPHEADER_BTN}  timeout=10
    ${GetLocationValue}=  Get Location
    Log  ${GetLocationValue}
    Location Should Be	${WelcomePageURL}

UNICLOUD_Navigation to Add Customer Page From Welcome Page
    [Documentation]     This keyword is to Navigate to Add Customer page from Welcome page.
    Click Element  ${UNICLOUD_CUSTOMER_CARD}
    Wait Until Element Is Visible   ${UNICLOUD_ADDCUSTOMER_BUTTON}  timeout=10
    ${GetLocationValue}=  Get Location
    Log  ${GetLocationValue}

UNICLOUD_Click on Environment Record in First page
    [Documentation]     This keyword is to Click on Environment record in UniCloud with the MAID.
    ...                 ${ENVIRONENTID}  is to provide the generated Master Account ID(MAID) of the Unicloud Environment
    [Arguments]         ${ENVIRONENTID}
    Wait Until Element is Visible  ${UNICLOUD_ENVIRONMENTRECORDS_ENABLE}  timeout=10
	Wait Until Element Is Visible   ${UNICLOUD_CUSTOMER_ROW}//*[contains(text(),"${ENVIRONENTID}")]  timeout=20
    Set Focus To Element   ${UNICLOUD_CUSTOMER_ROW}//*[contains(text(),"${ENVIRONENTID}")]
    Click Element   ${UNICLOUD_CUSTOMER_ROW}//*[contains(text(),"${ENVIRONENTID}")]
    Wait Until Element Is Visible    ${UNICLOUD_MAID_ID}  timeout=10

UNICLOUD_Click on Environment Record(ID)
    [Arguments]         ${ENVIRONENTID}   ${i}   ${RowCount}      ${Paginationlinks}
    Wait Until Element is Visible  ${UNICLOUD_ENVIRONMENTRECORDS_ENABLE}  timeout=10
	Wait Until Element Is Visible   ${UNICLOUD_CUSTOMER_ROW}//*[contains(text(),"${ENVIRONENTID}")]  timeout=10
    Set Focus To Element   ${UNICLOUD_CUSTOMER_ROW}//*[contains(text(),"${ENVIRONENTID}")]
	Log  ${RowCount}
	Log  ${i}
    ${IDVal}=  Evaluate  ${i} *${RowCount}
	Log  ${IDVal}
    FOR     ${g}   IN RANGE  1  ${RowCount}
        ${environmentsearch}=   Get Text   //datatable-row-wrapper[${g}]/datatable-body-row/div[2]/datatable-body-cell[2]/div/div/label
        log to console  ${environmentsearch}
        Run Keyword If  "${ENVIRONENTID}" == "${environmentsearch}"  Run Keywords  Click Element   //*[contains(@id,'${ENVIRONENTID}')]  AND  Exit For loop
#        ${IDVal}=  Evaluate  ${IDVal}+1
    END

UNICLOUD_Click on Environment Record in All pages
    [Arguments]  ${ENVIRONENTID}  ${Paginationlinks}  ${RowCount}
    ${Totaltext}=  get text  //*[@id="pagebody-table"]/div/ngx-datatable/div/datatable-footer/div/div
    ${TotalConvert}=  Convert To String  ${Totaltext}
    @{Total}=    Split String  ${TotalConvert}    total
    log to console   ${Total}[-1]
    @{TotalVal}=   Split String From Right  ${TotalConvert}   total -1
    log to console   @{TotalVal}
    ${TotalValue}=  Evaluate    @{Total}
    ${TotalRecord}=  Convert To Integer  ${TotalValue}
    log to console  ${TotalRecord}
    ${PageCountNo}=  Evaluate    ${TotalRecord}/11
    ${PageCount}=  Convert to Integer  ${PageCountNo}
    log to console  ${PageCount}
    FOR    ${i}   IN RANGE  ${PageCount}+1
        ${Status}=  run keyword and return status   UNICLOUD_Click on Environment Record(ID)    ${ENVIRONENTID}  ${i}   ${RowCount}   ${Paginationlinks}
        log to console  ${Status}
        Run Keyword If  ${Status}== False     Click Element   //i[@class="datatable-icon-right"]
        Run Keyword If  ${Status}== True      exit for loop
        Run Keyword If  ${i} == ${PageCount}  exit for loop
    END

UNICLOUD_Click on Environment Record
    [Documentation]  This keyword is to Check the Paginations in Trash page
    [Arguments]         ${ENVIRONENTID}
    ${Paginationlinks}=    Get Element Count  //*[@id="pagebody-table"]/div/ngx-datatable/div/datatable-footer/div/datatable-pager/ul/li
    ${RowCount}=   Get Element Count  //datatable-row-wrapper/datatable-body-row/div[2]
	${Pagination_Status}=  Run Keyword And Return Status  Element Should Be Visible  //i[@class="datatable-icon-right"]
    log to console  ${Paginationlinks}
    Run Keyword If  '${Pagination_Status}'=='${FALSE}'   UNICLOUD_Click on Environment Record in First page   ${ENVIRONENTID}
	Run Keyword If  ${Paginationlinks} == 5 and '${Pagination_Status}'=='${TRUE}'  UNICLOUD_Click on Environment Record in First page   ${ENVIRONENTID}
	Run Keyword If  ${Paginationlinks} > 5 and '${Pagination_Status}'=='${TRUE}'   UNICLOUD_Click on Environment Record in All pages    ${ENVIRONENTID}  ${Paginationlinks}  ${RowCount}

UNICLOUD_Select the Account Disable Checkbox
	[Documentation]     This keyword is to Select the Account Disable checkbox.
	Wait Until Element Is Visible   ${UNICLOUD_DISACCOUNT_CHKBOX}  timeout=10
	COMMON_Scroll to top of the page
	click element    ${UNICLOUD_DISACCOUNT_CHKBOX}

UNICLOUD_UnSelect the Account Disable Checkbox
	[Documentation]     This keyword is to Unselect the Account Disable checkbox.
	Wait Until Element Is Visible   ${UNICLOUD_DISACCOUNT_CHKBOX_DISABLED}  timeout=10
	Wait Until Element Is Visible   ${UNICLOUD_DISACCOUNT_CHKBOX_DISABLED}  timeout=10
	COMMON_Scroll to top of the page
	click element    ${UNICLOUD_DISACCOUNT_CHKBOX_DISABLED}

UNICLOUD_Disable the product
	[Documentation]     This keyword is to Disable the product in the UniCloud.
	...                 ${ProductName} is used to provide the Product name to disable.
	[Arguments]   ${ProductName}
	${var}=    set variable   3
	Wait Until Element Is Visible   ${UNICLOUD_ADDCUS_ROW}  timeout=10
	${Count}=   Get Element Count   ${UNICLOUD_ADDCUS_ROW}
	FOR    ${j}  IN RANGE   ${Count}
        ${ActualProductName}=   Run Keyword And Continue On Failure	Get Text   xpath=${UNICLOUD_ADDCUSPRODUCTNAME_ROW} [${var}]
	    log to console  ${ActualProductName}
	    ${var}=   Evaluate    ${var}+8
        Run Keyword If  "${ActualProductName}" == "${ProductName}"
        ...              Run Keywords   Click Element   ${UNICLOUD_ADDCUS_COMMONEDITBTN}${j}
        ...              AND   Click Element    ${UNICLOUD_CUSTOMER_ROW} [${j+1}]${UNICLOUD_ENABLEDISABLE_SLIDER}
        ...              AND   Click Element    ${UNICLOUD_CUSTOMER_ROW} [${j+1}]${UNICLOUD_FEATURE_DRPDWN}
        ...              AND   Select From List By Label   //*[@id="${UNICLOUD_FEATUREACCESS_OPT}-${j}"]  Access
        ...              AND   Click Element   ${UNICLOUD_ADDCUS_COMMONSAVEBTN}${j}
	    Run Keyword If  "${ActualProductName}" == "${ProductName}"    exit for loop
    END

UNICLOUD_Delete the products
	[Documentation]     This keyword is to Delete the products in the UniCloud page.
	COMMON_Scroll to right of the page
	Wait Until Element Is Visible   ${UNICLOUD_ADDCUS_ROW}  timeout=10
	${Count}=   Get Element Count   ${UNICLOUD_ADDCUS_ROW}
	log to console  ${Count}
	FOR    ${j}  IN RANGE   ${Count}
        Click Element   ${UNICLOUD_ADDCUS_DELETEBTN}
	    Exit For Loop If    ${j} == ${Count}
    END

UNICLOUD_Add Products in the Customer Summary
    [Documentation]     This keyword is to Add the UniSecure, UniSphere, UniTrace
    ...                 and UniSeries Products in the UniCloud page.
    ...                 ${ProductName} is used to provide the product names(UniSecure, UniSphere,UniTrace and UniSeries)
	[Arguments]   ${ProductName}

    Wait Until Element Is Visible   ${UNICLOUD_ADDFEATURE_BTN}  timeout=10
	Click Element  ${UNICLOUD_ADDFEATURE_BTN}
	FOR    ${j}  IN RANGE   1
	    ${rowcount}=   Evaluate  ${j}+1
	    Wait Until Element Is Visible  ${UNICLOUD_CUSTOMER_ROW} [${rowcount}]${UNICLOUD_ENABLEDISABLE_SLIDER}  timeout=10
	    Run keyword if     '${ProductName}' == 'UniSecure'
        ...   UNICLOUD_Select the options in the add feature
	    ...     ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNISECURESCAN_DRPDWN}
	    ...     ${UNICLOUD_FEATUREACCESS_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}
	    Run keyword if     '${ProductName}' == 'Systech360'
        ...   UNICLOUD_Select the options in the add feature
	    ...      ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNISPHEREASST_DRPDWN}
	    ...      ${UNICLOUD_FEATUREACCESS_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}
	    Run keyword if     '${ProductName}' == 'UniTrace'
        ...   UNICLOUD_Select the options in the add feature
	    ...      ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNITRACEMANAGED_DRPDWN}
	    ...      ${UNICLOUD_FEATUREACCESS_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}
	    Run keyword if     '${ProductName}' == 'UniSeries'
        ...   UNICLOUD_Select the options in the add feature
	    ...      ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNITRACEMANAGED_DRPDWN}
	    ...      ${UNICLOUD_FEATUREACCESS_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}
	    Exit For Loop If    ${j} == 0
    END

UNICLOUD_Select the options in the add feature
    [Documentation]  This keywod is used to select the options in the Add Feature columns.
    [Arguments]    ${j}  ${rowscount}  ${Productname}  ${UNICLOUD_FEATURE_DRPDWN}
    ...            ${UNICLOUD_FEATURE_OPT}    ${UNICLOUD_SYSTEMRESPONSE_OPT}  ${UNILOUD_VALUE}=${EMPTY}
	Run Keywords   UNICLOUD_Enable/Disable the Slider in Add Feature table   ${rowscount}
	...   AND   UNICLOUD_Select Product in the Solution Column   ${j}    ${ProductName}
	...   AND   UNICLOUD_Select Feature access in the Feature column
	...              ${UNICLOUD_FEATURE_DRPDWN}  ${j}   ${UNICLOUD_FEATURE_OPT}
	...   AND   UNICLOUD_Select System response in the System response column  ${j}   ${UNICLOUD_SYSTEMRESPONSE_OPT}
    ${ValueStatus}=  Run Keyword And Return Status  Should Be Empty  ${UNILOUD_VALUE}
    Run Keyword If  '${ValueStatus}'=='${FALSE}'  Input Text   ${UNICLOUD_FEATURE_VALUE}    ${UNILOUD_VALUE}
  UNICLOUD_Click on Save button on added feature   ${j}

UNICLOUD_Enable/Disable the Slider in Add Feature table
    [Documentation]  This keyword is used to click on the slider for enabling and disabling the feature
    ...              ${rowcount} is used to provide the index of the row count
    [Arguments]  ${rowcount}
    Wait Until Element Is Visible   ${UNICLOUD_CUSTOMER_ROW} [${rowcount}]${UNICLOUD_ENABLEDISABLE_SLIDER}  timeout=10
    Click Element    ${UNICLOUD_CUSTOMER_ROW} [${rowcount}]${UNICLOUD_ENABLEDISABLE_SLIDER}

UNICLOUD_Select Product in the Solution Column
    [Documentation]  This keyword is used to select the product in the Solution column.
    ...              ${j}  is used to provide the index of the dropdown.
    ...              ${ProductName} is used to provide the product name to select inthe dropdown.
    [Arguments]  ${j}     ${ProductName}
    Click Element    //*[@id='${UNICLOUD_SOLUTIONCOL_DRPDWN}${j}']
	Select From List By Label  //*[@id='${UNICLOUD_SOLUTIONCOL_DRPDWN}${j}']  ${ProductName}

UNICLOUD_Select Feature access in the Feature column
    [Documentation]  This keyword is to select the Feature access in the Feature column
    ...              ${Feature_dropdown} is used to provide the dropdown id
    ...              ${j}  is used to provide the index of the dropdown id
    ...              ${option} is used to provide the option to select in the dropdown.
    [Arguments]   ${Feature_dropdown}    ${j}    ${option}
	Click Element    //*[@id="${Feature_dropdown}${j}"]
	Select From List By Label   //*[@id="${Feature_dropdown}${j}"]  ${option}

UNICLOUD_Select System response in the System response column
    [Documentation]  This keyword is to select the System response option
    ...              ${j} is used to provide the index of the dropdown.
    ...              ${Option} is used to provide the option to select.
    [Arguments]  ${j}   ${Option}
    Click Element   //*[@id="${UNICLOUD_SYSTEMRESPONSE_DRPDWN}${j}"]
	Select From List By Label   //*[@id="${UNICLOUD_SYSTEMRESPONSE_DRPDWN}${j}"]  ${Option}

UNICLOUD_Click on Save button on added feature
    [Documentation]  This keyword is to click on the save button in the added feature for a particular row.
    ...              ${j} is used to provide the index of the row count.
    [Arguments]      ${j}
     Click Element   ${UNICLOUD_ADDCUS_COMMONSAVEBTN}${j}

UNICLOUD_Select the logon message checkbox
    [Documentation]  This keyword is to select the logon message checkbox.
    Wait Until Element Is Visible    ${UNICLOUD_MESSAGE_ICON}
    wait until keyword succeeds    5x    1s    click element    ${UNICLOUD_MESSAGE_ICON}
    Wait Until Element Is Visible   ${UNICLOUD_LOGONMSG_CHKBOX}  timeout=10
	COMMON_Scroll to top of the page
	UnSelect Checkbox    ${UNICLOUD_LOGONMSG_CHKBOX}
	Select Checkbox   ${UNICLOUD_LOGONMSG_CHKBOX}

UNICLOUD_UnSelect the logon message checkbox
    [Documentation]  This keyword is to Unselect the logon message checkbox.
    Wait Until Element Is Visible    ${UNICLOUD_MESSAGE_ICON}
    wait until keyword succeeds    5x    1s    click element    ${UNICLOUD_MESSAGE_ICON}
    Wait Until Element Is Visible   ${UNICLOUD_LOGONMSG_CHKBOX}  timeout=10
    COMMON_Scroll to top of the page
	Select Checkbox   ${UNICLOUD_LOGONMSG_CHKBOX}
	UnSelect Checkbox    ${UNICLOUD_LOGONMSG_CHKBOX}
	click element    ${UNICLOUD_MESSAGE_OK_BUTTON}
	Execute JavaScript    window.scrollTo(0,0)
    wait until keyword succeeds    5x    1s    click element    ${UNICLOUD_CLOSE_MSG_CENTER}

UNICLOUD_Select the OnPrem Only checkbox
    [Documentation]  This keyword is to select the  OnPrem Only checkbox.
    Wait Until Element Is Visible    ${UNICLOUD_ONPREM_CHKBOX}  timeout=10
    COMMON_Scroll to bottom of the page
	UnSelect Checkbox     ${UNICLOUD_ONPREM_CHKBOX}
	Select Checkbox    ${UNICLOUD_ONPREM_CHKBOX}

UNICLOUD_Check the OnPrem Single/Multi
    [Documentation]  This keyword is to check the Single or Multi text in the Customer page.
    Wait Until Element Is Visible    ${UNICLOUD_MULTI_ID}  timeout=10
    Page Should Contain Element    ${UNICLOUD_MULTI_ID}

UNICLOUD_Click on Customer in Breadcrumb
    [Documentation]  This keyword is to click on Customer in the Breadcrumb
    Wait Until Element Is Visible  ${UNICLOUD_PARENTBREADCRUMB_LINK}  timeout=10
    Page Should Contain Element    ${UNICLOUD_PARENTBREADCRUMB_LINK}
    Click Element  ${UNICLOUD_PARENTBREADCRUMB_LINK}
    Wait Until Element Is Visible  ${UNICLOUD_ADDFEATURE_BTN}  timeout=10

UNICLOUD_Check the Current date
    [Documentation]  This keyword is to check the current date in the logon message field.
    Wait Until Element Is Visible   ${UNICLOUD_EXPIRYDATE_DATE}  timeout=10
    ${Dateincheckbox}=   Get Element attribute       ${UNICLOUD_EXPIRYDATE_DATE}  min
    log to console   ${Dateincheckbox}
    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d
    log to console  ${CurrentDate}
    ${datetime}=	Convert Date  ${CurrentDate}  datetime
    ${Day}=    Convert To String   ${datetime.day}
    ${Year}=   Convert To String   ${datetime.year}
    ${Month}=   Convert To String   ${datetime.month}
    should be equal  ${Dateincheckbox}  ${CurrentDate}

UNICLOUD_Enter the Date
    [Documentation]  This keyword is to enter the Future date in the logon message.
    [Arguments]    ${Days}
    log to console  Entered date element
    Set Focus To Element   ${UNICLOUD_EXPIRYDATE_DATE}
    Mouse over   ${UNICLOUD_EXPIRYDATE_DATE}
    Click Element   ${UNICLOUD_EXPIRYDATE_DATE}
    ${my_date_to_select}=   Get Current Date   UTC    ${Days}    result_format=%Y-%m-%d
    log to console   ${my_date_to_select}
    Execute JavaScript  document.getElementById('login-message-date').value='${my_date_to_select}'

UNICLOUD_Enter logon message for all products
    [Documentation]  This keyword is to enter te logon message in the logon textarea.
    Click Element   ${UNICLOUD_LOGON_TEXTAREA}
    Clear Element Text  ${UNICLOUD_LOGON_TEXTAREA}
    Input Text  ${UNICLOUD_LOGON_TEXTAREA}    ${LOGONMSG}
    click element    ${UNICLOUD_MESSAGE_OK_BUTTON}
    Execute JavaScript    window.scrollTo(0,0)
    wait until keyword succeeds    5x    1s    click element    ${UNICLOUD_CLOSE_MSG_CENTER}

UNICLOUD_Click on Save button
	[Documentation]     This keyword is to click on the Save button.
	Wait Until Element Is Visible  ${UNICLOUD_ADDCUSTOMER_FLOATBUTTON}  timeout=10
	Mouse over     ${UNICLOUD_ADDCUSTOMER_FLOATBUTTON}
	repeat keyword    5 times    Click Element  ${UNICLOUD_ADDCUSTOMER_SAVEBUTTON}
	Wait Until Element Is Visible  ${UNICLOUD_SAVEMSG_MSGBOX}  timeout=10

UNICLOUD_Check the Error message for entering the past date
    [Documentation]   This keyword is to check the error message when user svaes the page with the past date
    Wait Until Element Is Visible  ${UNICLOUD_SAVEMSG_MSGBOX}  timeout=10
    Page Should Contain Element  ${UNICLOUD_SAVEMSG_MSGBOX}
    Page Should Contain   An invalid date was entered.

# Keywords for Data Pool
UNICLOUD_Login_And_Enable_Or_Disable_Data_Pool
	[Documentation]  This keyword is used to enable or disable the Data pool in UniCloud
	...  This keyword takes one argument whether to enable or disable Data Pool
	[Arguments]  ${Disable_Enable_Status}
	UNICLOUD_Navigate to UniCloud page
	UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
	UNICLOUD_Systech UniCloud Should Be Open
	UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	UNICLOUD_Enabled_Or_Disable_A_Feature_Of_A_Solution  Systech360  DataPool  ${Disable_Enable_Status}
	UNICLOUD_Click on Save button
	COMMON_Scroll to top of the page
	UNICLOUD_Logout of UniCloud session

UNICLOUD_Enabled_Or_Disable_A_Feature_Of_A_Solution
	[Documentation]  This keyword is used to enable or disable a feature of a solution in the UniCloud
	...  This keyword accepts 3 arguments, one the ${SolutionName}, two the ${FeatureName}, three the disable or enable status
	[Arguments]  ${SolutionName}  ${FeatureName}  ${Disable_Enable_Status}
	${Disable_Enable_Status}=  Convert To Lowercase  ${Disable_Enable_Status}
	${Index}=  Set Variable   3
	Wait Until Element Is Visible  ${UNICLOUD_ADDCUS_ROW}  timeout=10
	${Count}=   Get Element Count  ${UNICLOUD_ADDCUS_ROW}
	FOR     ${RowNumber}  IN RANGE  1  ${Count}+1
	    ${ActualSolutionName}=  Get Text  xpath=${UNICLOUD_ADDCUSPRODUCTNAME_ROW} [${Index}]
	    ${ActualSolutionStatus}=  Get Element Attribute  (${UNICLOUD_ENABLEDISABLE_SLIDER}) [${RowNumber}]  title
	    ${ActualSolutionStatus}=  Convert To Lowercase  ${ActualSolutionStatus}
	    ${OnePlusIndex}=  Evaluate  ${Index} + 1
	    ${ActualFeatureName}=  Get Text  xpath=${UNICLOUD_ADDCUSPRODUCTNAME_ROW} [${OnePlusIndex}]
	    ${Index}=  Evaluate  ${Index} + 8
	    ${OneLessRowNumber}=  Evaluate  ${RowNumber} - 1
	    Run Keyword If  '${ActualSolutionName}'=='${SolutionName}' and '${ActualFeatureName}'=='${FeatureName}'
	    ...  Click Element  ${UNICLOUD_ADDCUS_COMMONEDITBTN}${OneLessRowNumber}
	    ...  ELSE  Continue For Loop
	    ${SolutionEnableStatus}=  Run Keyword And Return Status  Should Contain  ${ActualSolutionStatus}  ${Disable_Enable_Status}
	    Run Keyword If  '${SolutionEnableStatus}'!='${TRUE}'
	    ...  Run Keywords  Click Element  ${UNICLOUD_CUSTOMER_ROW} [${RowNumber}]${UNICLOUD_ENABLEDISABLE_SLIDER}
	    ...  AND  Click Element  ${UNICLOUD_ADDCUS_COMMONSAVEBTN}${OneLessRowNumber}
	    ...  AND  Exit For Loop
	    ...  ELSE  Run Keywords  Click Element  ${UNICLOUD_ADDCUS_COMMONSAVEBTN}${OneLessRowNumber}
	    ...  AND  Exit For Loop
    END

UNICLOUD_Add Products feature in the Customer Summary
    [Documentation]     This keyword is to Add the UniSecure, UniSphere, UniTrace
    ...                 and UniSeries Products feature in the UniCloud page.
    ...                 ${ProductName} is used to provide the product names(UniSecure, UniSphere,UniTrace and UniSeries)
  	[Arguments]   ${ProductName}  ${UNICLOUD_FEATURE_OPT}  ${UNICLOUD_SYSTEMRESPONSE_OPT}  ${UNICLOUD_VALUE}=${EMPTY}

    Wait Until Element Is Visible   ${UNICLOUD_ADDFEATURE_BTN}  timeout=10
  	Click Element  ${UNICLOUD_ADDFEATURE_BTN}
  	FOR  ${j}  IN RANGE   1
  	    ${rowcount}=   Evaluate  ${j}+1
  	    Wait Until Element Is Visible  ${UNICLOUD_CUSTOMER_ROW} [${rowcount}]${UNICLOUD_ENABLEDISABLE_SLIDER}  timeout=10
  	    Run keyword if     '${ProductName}' == 'UniSecure'
  	    ...   UNICLOUD_Select the options in the add feature
  	    ...     ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNISECURESCAN_DRPDWN}
  	    ...     ${UNICLOUD_FEATURE_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}  ${UNICLOUD_VALUE}
  	    Run keyword if     '${ProductName}' == 'Systech360'
  	    ...   UNICLOUD_Select the options in the add feature
  	    ...      ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNISPHEREASST_DRPDWN}
  	    ...      ${UNICLOUD_FEATURE_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}  ${UNICLOUD_VALUE}
  	    Run keyword if     '${ProductName}' == 'UniTrace'
  	    ...   UNICLOUD_Select the options in the add feature
  	    ...      ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNITRACEMANAGED_DRPDWN}
  	    ...      ${UNICLOUD_FEATURE_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}  ${UNICLOUD_VALUE}
  	    Run keyword if     '${ProductName}' == 'UniSeries'
  	    ...   UNICLOUD_Select the options in the add feature
  	    ...      ${j}   ${rowcount}   ${ProductName}  ${UNICLOUD_FEATUREUNITRACEMANAGED_DRPDWN}
  	    ...      ${UNICLOUD_FEATURE_OPT}   ${UNICLOUD_SYSTEMRESPONSE_OPT}  ${UNICLOUD_VALUE}
  	    Exit For Loop If    ${j} == 0
    END
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
