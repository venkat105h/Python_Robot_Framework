#------------------------------------------------------------------
#   Description       :      Test Cases for Support Center
#   Project           :      UniSphere Support Center Automation
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
Documentation   Test cases for UniSphere Support Center
Library         BuiltIn
Library         SeleniumLibrary
Library         Collections
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Support_Center_Locators.robot
Resource        ../Locators/Generic_Locators.robot
Resource        ../Keywords/Generic_Keywords.robot
Variables       ../Variables/${TESTENV}_Variable.py


*** Keywords ***
SPH/SEC_SC_Verify Cascading menu of Support center
    [Documentation]  To Verify all the options when mouse hovered on Support Center.

    # Click on Hamburger menu and mouse hover in Support Center
    Wait Until Element Is Visible  ${UNI_HAMBURGER}  timeout=10
    Click Element   ${UNI_HAMBURGER}
	UNI_Get_Custom_Page_Screenshot  Support_Center
    click element  ${SPH/SEC_SUPPORT_CENTER_ON_HAM}
#    Mouse Over      ${SPH/SEC_SUPPORT_CENTER_ON_HAM}
    # Verify if elements are visible
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible   ${SPH/SEC_CASE_HISTORY}     message=CaseHistory is not displayed
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible   ${SPH/SEC_RENEWAL_INFO}     message=RenewalInfo is not displayed
    Run Keyword And Ignore Error  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible   ${SPH/SEC_SOFTWARE_PATCH}   message=SoftwarePatch is not displayed
#    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible   ${SPH/SEC_LIVE_CHAT}        message=LiveChat is not displayed
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible   ${SPH/SEC_CONTACT_SUPPORT}  message=ContactSupport is not displayed

SPH/SEC_SC_Navigate To Renewal Info Page
    [Documentation]  Navigates to Renewal Info Card from Hamburger menu
	Sleep  2s
    Click Element   ${UNI_HAMBURGER}
    Click Element   ${SPH/SEC_SUPPORT_CENTER_ON_HAM}
    UNI_Wait For Element  ${SPH/SEC_SOFTWARE_CARD}
    Mouse Over  ${UNI_WELCOME_PAGE}
    Click Element   ${SPH/SEC_RENEWAL_INFO_CARD}
    UNI_Wait For Element  ${SPH/SEC_SITES} [1]

SPH/SEC_SC_Verify Cascading Menu And Enabled Cards
    [Documentation]  To Verify disabled cards are disabled in cascading menu
    ...  ${CenterName}        : Name of the Center to verify cascading menu
    ...  ${CascadingMenuName} : Address of Cascading menu list

    [Arguments]     ${CascadingMenuName}     ${CenterName}

    @{CardNameList}=  Create List
    @{MenuNameList}=  Create List

    # Clicks on the tab to be checked
    Mouse Over      ${UNI_HAMBURGER}
    Click Element   ${CenterName}
    Mouse Over      ${UNI_WELCOME_PAGE}

    #Waits until cards are displayed
    UNI_Wait For Element  ${UNI_CARDS}

    # Counts the number of cards
    ${TotalCardsCount}=    Get Element Count  ${UNI_CARDS}

    # Retrieves card name and insert into array if disabled
    FOR    ${Index}    IN RANGE    0    ${TotalCardsCount}
           ${Text}=   Get Text    ${UNI_CARDS} [${Index} + 1]
           ${AttributeValue}=  Get Element Attribute  ${UNI_CARD_SECTION} [${Index}+1]  class
           ${DisabledStatus}=  Run Keyword And Return Status  Should Contain  ${AttributeValue}  grey
           Run Keyword If  ${DisabledStatus}==True  Insert Into List  ${CardNameList}  ${Index}  ${Text}
    END
    # Mouse houvers on Cascading menu to be checked
     Mouse Over  ${UNI_HAMBURGER}
     Mouse Over  ${CenterName}

    # Counts the number of sub-cascading menu
     ${TotalMenuCount}=  Get Element Count  ${CascadingMenuName}

     # Retrieves menu name and insert into array if disabled
    FOR    ${Index}    IN RANGE    0    ${TotalMenuCount}
           ${Text}=   Get Text    ${CascadingMenuName} [${Index} + 1]
           ${AttributeValue}=  Get Element Attribute  ${CascadingMenuName} [${Index}+1]  class
           ${DisabledStatus}=  Run Keyword And Return Status  Should Contain  ${AttributeValue}  disabled
           Run Keyword If  ${DisabledStatus}==True  Insert Into List  ${MenuNameList}  ${Index}  ${Text}
    END
     Mouse Over    ${UNI_WELCOME_PAGE}

    #Verifies if Cascading Menu list and Cards list are same
     Lists Should Be Equal       ${CardNameList}           ${MenuNameList}

SPH/SEC_SC_Verify Breadcrumbs
    [Documentation]  To verify breadcrumbs bar is appended when a card is clicked and should be same name as the card.
    ...  ${CardName} : Name of the card to be clicked on.

    [Arguments]  ${CardName}

    # Click on Support Center
    UNI_Wait For Element  ${SPH/SEC_SUPPORT_CENTER_ON_HAM}
    Click Element   ${SPH/SEC_SUPPORT_CENTER_ON_HAM}
    UNI_Wait For Element  ${CardName}

    # Retrieves card name of being clicked to verify same name displayed in breadcrumb
    ${ExpectedValue}=  Get Text  ${CardName}

    # Clicks on Card
    Click Element           ${CardName}
    UNI_Wait For Element    ${SPH/SEC_CHAT_HEADER}

    # Retrieves the value of last navigated breadcrumb
    ${TotalBreadcrumbCount}=    Get Element Count  ${UNI_BREADCRUMBS}
    ${ActualValue}=  Get Text    ${UNI_BREADCRUMBS} [${TotalBreadcrumbCount}]

    # Verifies if the card name and the breadcrumb names are same
    ${Status}=  Run Keyword And Return Status  Should Be Equal  ${ActualValue}  ${ExpectedValue}
    Run Keyword If  ${Status}==True  Log  Actual and expected values are equal
    ...  ELSE  Fail  Actual and expected values are not equal.

SPH/SEC_SC_Live Chat
    [Documentation]  Verifies the working of Live chat feature

    Select Frame                        ${SPH/SEC_LIVE_CHAT_FRAME}
    UNI_Wait For Element                ${SPH/SEC_FIRST_NAME_TXT}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${SPH/SEC_FIRST_NAME_TXT}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${SPH/SEC_LAST_NAME_TXT}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${SPH/SEC_EMAIL_TXT}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${SPH/SEC_CHAT_BUTTON}
    Unselect Frame

SPH/SEC_SC_Contact Support With Only Mandatory Fields
    [Documentation]  Verifies the working of Contact Support feature by entering only mandatory fields

    # Navigate to Contact Support page
    UNI_Scroll Page To Location  0  0
    Click Element               ${UNI_BREADCRUMBS} [2]
    UNI_Wait For Element        ${UNI_CARDS} [1]
    Click Element               ${SPH/SEC_CONTACT_SUPPORT_CARD}
	UNI_Wait For Element        ${SPH/SEC_PHONE_NUMBER}

    # Enter values into mandatory fields
    Input Text                  ${SPH/SEC_PHONE_NUMBER}     ${Var_Phone_Number}
    Input Text                  ${SPH/SEC_COMPANY_NAME}     ${Var_Company_Name}
    Input Text                  ${SPH/SEC_JOB_TITLE}        ${Var_Job_Title}
    Input Text                  ${SPH/SEC_STREET_ADDRESS}   ${Var_Street_Address}
    Input Text                  ${SPH/SEC_COUNTRY}          ${Var_Country}
    Input Text                  ${SPH/SEC_SERIAL_NUMBER}    ${Var_Serial_Number}
    Input Text                  ${SPH/SEC_DESCRIPTION}      ${Var_Description}

    # Verifies submit button should be enabled
    Element Should Be Enabled   ${SPH/SEC_SUBMIT_BUTTON}

SPH/SEC_SC_Contact Support With One Missing Mandatory Fields
    [Documentation]  Verifies the working of Contact Support feature by missing a mandatory fields

    # Navigate to Contact Support page
    UNI_Scroll Page To Location  0  0
    Click Element               ${UNI_BREADCRUMBS} [2]
    UNI_Wait For Element        ${UNI_CARDS} [1]
    Click Element               ${SPH/SEC_CONTACT_SUPPORT_CARD}
	UNI_Wait For Element        ${SPH/SEC_EMAIL}

    # Enter values into fields
    Input Text                  ${SPH/SEC_EMAIL}            ${Var_Email_ID}
    Input Text                  ${SPH/SEC_PHONE_NUMBER}     ${Var_Phone_Number}
    Input Text                  ${SPH/SEC_COMPANY_NAME}     ${Var_Company_Name}
    Input Text                  ${SPH/SEC_JOB_TITLE}        ${Var_Job_Title}
    Input Text                  ${SPH/SEC_STREET_ADDRESS}   ${Var_Street_Address}
    Input Text                  ${SPH/SEC_COUNTRY}          ${Var_Country}
    Input Text                  ${SPH/SEC_DESCRIPTION}      ${Var_Description}

    # Verifies submit button should be disabled
    Element Should Be Disabled  ${SPH/SEC_SUBMIT_BUTTON}

SPH/SEC_SC_Contact Support With all Fields
    [Documentation]  Verifies the working of Contact Support feature by entering only mandatory fields

    # Navigate to Contact Support page
    UNI_Scroll Page To Location  0  0
	Sleep  2s
    Click Element               ${UNI_BREADCRUMBS} [2]
    UNI_Wait For Element        ${UNI_CARDS} [1]
    Click Element               ${SPH/SEC_CONTACT_SUPPORT_CARD}
	UNI_Wait For Element        ${SPH/SEC_FIRST_NAME}

    # Enter values into fields
    Input Text                  ${SPH/SEC_FIRST_NAME}       ${Var_First_Name}
    Input Text                  ${SPH/SEC_LAST_NAME}        ${Var_Last_Name}
    Input Text                  ${SPH/SEC_EMAIL}            ${Var_Email_ID}
    Input Text                  ${SPH/SEC_PHONE_NUMBER}     ${Var_Phone_Number}
    Input Text                  ${SPH/SEC_COMPANY_NAME}     ${Var_Company_Name}
    Input Text                  ${SPH/SEC_JOB_TITLE}        ${Var_Job_Title}
    Input Text                  ${SPH/SEC_STREET_ADDRESS}   ${Var_Street_Address}
    Input Text                  ${SPH/SEC_ADD_ADDRESS}      ${Var_Addition_Address}
    Input Text                  ${SPH/SEC_CITY}             ${Var_City}
    Input Text                  ${SPH/SEC_STATE}            ${Var_State}
    Input Text                  ${SPH/SEC_COUNTRY}          ${Var_Country}
    Input Text                  ${SPH/SEC_SERIAL_NUMBER}    ${Var_Serial_Number}
    Input Text                  ${SPH/SEC_DESCRIPTION}      ${Var_Description}
    UNI_Scroll Page To Location  0  0

    # Verifies submit button should be enabled
    Element Should Be Enabled   ${SPH/SEC_SUBMIT_BUTTON}

SPH/SEC_SC_Verify Case History Page UI
    [Documentation]  To Verify the UI of Case History page

    # Navigate to Case History Card
    Click Element               ${UNI_BREADCRUMBS} [2]
    UNI_Wait For Element        ${UNI_CARDS} [1]
    Click Element               ${SPH/SEC_CASE_HISTORY_CARD}
    UNI_Wait For Element        ${SPH/SEC_ACCOUNT_NAME}
    Sleep  3S

    # Elements to be visible
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_ACCOUNT_NAME}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CURRENT_DATE}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_SELECT_SITE}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_TOTAL_SITES}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_GRAPHICAL_TAB}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_DETAILS_TAB}

    ${ClassAttribute}=  Get Element Attribute  ${SPH/SEC_GRAPHICAL_TAB}  class
    Run Keyword And Continue On Failure  Should Contain  ${ClassAttribute}  ${Var_Class_Attr_Val}
	Select From List By Index  ${SPH/SEC_SELECT_SITE}  0
	Click Element  ${SPH/SEC_SELECT_SITE}
	Sleep  1S

    # Charts to be displayed
    ${TotalCharts}=  Get Element Count  ${SPH/SEC_NUM_OF_CHARTS}
    Run Keyword If  '${TotalCharts}'!='${Var_ExpectedNumOfCharts}'  Fail

SPH/SEC_SC_Verify Case History Page Details Tab UI
    [Documentation]  To Verify all elements present in Details Tab
    # Navigate to Details tab
    Click Element  ${SPH/SEC_DETAILS_TAB}

    # Charts to be displayed
    ${NumOfColumns}=  Get Element Count  ${SPH/SEC_DETAILS_TABLE_HEADER}
    Run Keyword And Continue On Failure  Run Keyword If  '${NumOfColumns}'!='${Var_ExpectedNumOfColumns}'  Fail

    # Open customer details page
    Click Element  ${SPH/SEC_FIRST_CASE_ID}

    # following elements in case history page should be visible
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CUST_ACC_NAME}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CUST_ID}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_TOTAL_SITE}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_ID}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_SITE_NAME}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_STATUS}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_DESC}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_PRIORITY}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_IN_PROD}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_ORIGIN}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_ROOT_CAUSE}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_RESOLUTION}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_OPEN_DATE}
    Run Keyword And Continue On Failure  Element Should Be Visible   ${SPH/SEC_CASE_CLOSE_DATE}

    # Clicks on close button
    Click Element  ${SPH/SEC_CLOSE_BUTTON} [3]

SPH/SEC_SC_Verify Searching an Artifact
    [Documentation]  To verify when an artifact is searched, only the arifacts
    ...  containing Searched Text must be displayed.
    ...  ${SearchFile}:  File to be searched for

    [Arguments]  ${SearchFile}

    # Navigate to Software card
    Mouse Over              ${UNI_HAMBURGER}
    Click Element           ${SPH/SEC_SUPPORT_CENTER_ON_HAM}
    UNI_Wait For Element    ${UNI_CARDS} [1]
    Click Element           ${SPH/SEC_SOFTWARE_CARD}
    UNI_Wait For Element    ${UNI_MULTIPLE_ITEM_NAME} [1]


    # Enters Search file name in search bar
    Input Text  ${UNI_SEARCH_BOX}   ${SearchFile}

    # To verify if all the artifacts displayed contains the searched text
    ${TotalFileCount}=  Get Element Count  ${UNI_MULTIPLE_ITEM_NAME}
    FOR    ${Index}    IN RANGE    0      ${TotalFileCount}
           ${Value}=   Get Text           ${UNI_ITEM_NAME} [${Index}]
           ${Result}=  Should Contain     ${Value}  ${SearchFile}
           Log  ${Result}
    END
    [Teardown]  UNI_Clear Text from Text Field  ${SearchFile}  ${UNI_SEARCH_BOX}

SPH/SEC_SC_Verify Sorting By Published Descending Order
    [Documentation]  To verify sorting by Published Date. It should be sortred in Descending order of their Published Date.

    # Creates a list to store actual values
    @{ActualSort}=  Create List

    # Select Published Date under Sort By dropdown
    Select From List By Index  ${UNI_SORT_BY}  0

    # Click on Descending
    Click Element  ${UNI_DESCENDING}

    # Stores all the Published Date values in ActualSort List in the same order as displayed
    ${TotalPublishedDateElement}=  Get Element Count  ${UNI_MULTIPLE_PUB_DATES}
    FOR    ${Index}    IN RANGE    0    ${TotalPublishedDateElement}
           ${Value}=  Get Text    ${UNI_Published}${Index}
           Insert Into List       ${ActualSort}  ${Index}  ${Value}
    END
    # Create a duplicate List to compare
    ${ExpectedSort}=  Copy List   ${ActualSort}

    # Sort the duplicate List in descending order
    sort_dates_descending  ${ExpectedSort}

    # Validates if both the Lists are equal
    Lists Should Be Equal  ${ExpectedSort}  ${ActualSort}

SPH/SEC_SC_Verify Viewing Release Note
    [Documentation]  Clicks on Release Notes and verifies it opens in new tab

    # Click on Release note button
    Click Element  ${SPH/SEC_RELEASE_NOTES} [1]

    # Get back to Main windows
#    @{Windows_Names}=  Get Window Titles
#    Switch Window  MAIN
    go back

#    # Verifies total number of windows should not be <2
#    ${NumOfWindows}=  Get Length  ${Windows_Names}
#    Run Keyword If  ${NumOfWindows}<2  Fail

SPH/SEC_SC_Verify Clicking On A Software
    [Documentation]  After clicking on an item, verifies ok button is enabled only after selecting a site.

    [Arguments]  ${SceneName}  ${FileName}

    # Enters Search file name in search bar
	reload page
	Wait Until Element is Visible  ${UNI_SEARCH_BOX}  timeout=15
    Wait Until Element Is Enabled  ${UNI_SEARCH_BOX}  timeout=15
    Click Element  ${UNI_SEARCH_BOX}
    Input Text  ${UNI_SEARCH_BOX}   ${FileName}
    sleep    11s

    # Clicks on second item in the list
    Click Element  ${UNI_MULTIPLE_ITEM_NAME} [1]
    sleep    11s
#    Wait Until Element Is Visible  ${SPH/SEC_SOFT_ACK_POPUP}    timeout=15

    # Checks if Ok button in popup is disabled
    run keyword and ignore error  Element Should Be Disabled  ${SPH/SEC_POPUP_OK_BTN}
    run keyword and ignore error  wait until keyword succeeds    3x    3s    click element    ${SPH/SEC_POPUP_OK_BTN}

    # Selects the scene from the list
#    Select From List By Label   ${SPH/SEC_SELECT_SITE_DD}  ${SceneName}
    Select From List By Label   //h4[text()='Software Acknowledgement']//following::select[1]    ${SceneName}
	UNI_Get_Custom_Page_Screenshot  Support_Center
    Wait Until Element Is Visible  ${SPH/SEC_SITE_CHK_BOX}  10
    Select Checkbox  ${SPH/SEC_SITE_CHK_BOX}

    # Verifies Ok button in popup is enabled and clicks on cancel button
    ${Ok_Btn_Status}=  Run Keyword And Return Status  Element Should Be Enabled   ${SPH/SEC_POPUP_OK_BTN}
    Run Keyword If  '${Ok_Btn_Status}'=='${TRUE}'  Click Element  ${SPH/SEC_POPUP_CANCEL_BTN}
    ...  ELSE  Run Keywords  Click Element  ${SPH/SEC_POPUP_CANCEL_BTN}
    ...  AND  Fail

    [Teardown]  UNI_Clear Text from Text Field  ${FileName}  ${UNI_SEARCH_BOX}

UNI_Navigate Through Pages
    [Documentation]  Navigates to multiple pages if more than ten artifacts are present in a single page.
    ...  Takes Total number of pages to navigate and the Files present in first page
    ...  Returns the total number of files found after navigating to all the pages

    [Arguments]  ${TotalNumberOfPages}  ${FileCount}  ${ElementID}  ${ExpectedValue}

    FOR    ${Page}    IN RANGE    1    ${TotalNumberOfPages}
	   UNI_Scroll Page To Location  0  10000
       Click Element  ${UNI_NEXT_BUTTON}
	   UNI_Scroll Page To Location  0  0
       UNI_Verify Element Values  ${ElementID}   ${ExpectedValue}
       ${FileCountPerPage}=  Get Element Count  ${SPH/SEC_SITES}
       ${FileCount} =  Evaluate  ${FileCountPerPage}+${FileCount}
    END
    [Return]  ${FileCount}



UNI_Get Elemnet Count in One Page
    [Documentation]  Retrieves values for the element

    ${Count}=    get element count    //*[@class="item-published ng-star-inserted"]

    [Return]   ${Count}


UNI_Verify Element Values
    [Documentation]  Retrieves values for the element

    [Arguments]  ${ElementID}  ${ExpectedValue}

    ${NoOfSites}=  Get Element Count  ${SPH/SEC_SITES}
    FOR    ${Count}  IN RANGE  0  ${NoOfSites}-1
         ${Index}=  Evaluate  ${Count}+1
         ${Text}=   Get Text  ${ElementID} [${Index}]
         Should be equal as Strings  ${Text}  ${ExpectedValue}
    END
UNI_Verify Refine By Section In Renewal Info
    [Documentation]  To verify filtering.
    ...  Total count of the artifacts must be equal to the number present beside the name under refine by section.
    ...  Takes ID of the checkbox to be checked and the name present beside it as an argument.
    ...  Also verfies the data displayed in correct

    [Arguments]  ${AttributeID}  ${RefineByValue}
# ${ElementID}
    # Selects checkbox for a solution
    sleep    17s
    Execute JavaScript  document.getElementById('${AttributeID}${RefineByValue}_input').click()

    # Retrieve the numbers from the braces for that particular solution to compare
    # ...  with the total number of artifacts in that particular solution
    ${Text1}=  Execute JavaScript  return document.getElementById('${AttributeID}${RefineByValue}').innerText
    ${Text}=  get text    //*[@id="refine_Versions_${RefineByValue}"]/span
    click element     //*[@id="refine_Versions_${RefineByValue}"]/span
    sleep    5s
    ${ExpectedCount}=  fetch_number  ${Text}

    # Counts the total number of artifacts present. If Total number of pages are more than 1, then it will navigate to all pages.
    ${FileCount}=           Get Element Count       ${SPH/SEC_SITES}
    click element     //*[@id="refine_Versions_${RefineByValue}"]/span
    ${PagesToNavigate}=     Get Element Count       ${UNI_TOTAL_PAGES}
    ${TotalNumberOfPages}=  Evaluate                ${PagesToNavigate}-2
    ${MultiplePages}=       Evaluate                ${TotalNumberOfPages}>1
    UNI_Verify Element Values  ${AttributeID}  ${RefineByValue}
    ${FileCount}=  Run Keyword If  '${MultiplePages}'=='${TRUE}'
    ...  UNI_Navigate Through Pages  ${TotalNumberOfPages}  ${FileCount}  ${AttributeID}  ${RefineByValue}    ELSE    UNI_Get Elemnet Count in One Page

    # Unselects the checkbox
    Execute JavaScript  document.getElementById('${AttributeID}${RefineByValue}_input').click()

    # Validates the total number of artifacts present
    Should Be Equal  ${FileCount}  ${ExpectedCount}
    UNI_Scroll Page To Location  0  0


UNI_Verify Refine By Sections In Renewal Info
    [Documentation]  To verify filtering.
    ...  Total count of the artifacts must be equal to the number present beside the name under refine by section.
    ...  Takes ID of the checkbox to be checked and the name present beside it as an argument.
    ...  Also verfies the data displayed in correct

    [Arguments]  ${AttributeID}  ${RefineByValue}  ${ElementID}

    # Selects checkbox for a solution
    Execute JavaScript  document.getElementById('${AttributeID}${RefineByValue}_input').click()

    # Retrieve the numbers from the braces for that particular solution to compare
    # ...  with the total number of artifacts in that particular solution
    ${Text}=  Execute JavaScript  return document.getElementById('${AttributeID}${RefineByValue}').innerText
    ${ExpectedCount}=  fetch_number  ${Text}

    # Counts the total number of artifacts present. If Total number of pages are more than 1, then it will navigate to all pages.
    ${FileCount}=           Get Element Count       ${SPH/SEC_SITES}
    ${PagesToNavigate}=     Get Element Count       ${UNI_TOTAL_PAGES}
    ${TotalNumberOfPages}=  Evaluate                ${PagesToNavigate}-2
    ${MultiplePages}=       Evaluate                ${TotalNumberOfPages}>0
    UNI_Verify Element Values  ${ElementID}  ${RefineByValue}

    ${FileCount}=  Run Keyword If  '${MultiplePages}'=='${TRUE}'
    ...  UNI_Navigate Through Pages  ${TotalNumberOfPages}  ${FileCount}  ${ElementID}  ${RefineByValue}

    # Unselects the checkbox
    Execute JavaScript  document.getElementById('${AttributeID}${RefineByValue}_input').click()

    # Validates the total number of artifacts present
    Should Be Equal  ${FileCount}  ${ExpectedCount}
    UNI_Scroll Page To Location  0  0
