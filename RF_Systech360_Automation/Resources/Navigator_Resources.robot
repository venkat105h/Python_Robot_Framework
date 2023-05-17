#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by other Robot scrits.
#	Project				:		UniSphere
#	Author				:		Satya R
#	© 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable

*** Settings ***
Documentation     A resource file with reusable keywords and variables related to Navigator.
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           String
Library           robot.libraries.DateTime
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ..${/}Resources${/}COMMON_RESOURCE.robot
Resource          ..${/}Resources${/}SOL_RESOURCE.robot
Resource          ..${/}Resources${/}SPHSEC_RESOURCE.robot
Resource          ..${/}Resources${/}TRC_RESOURCE.robot
Resource          ..${/}Resources${/}UNICLOUD_RESOURCE.robot
Resource          ../Resources/Common_Variable.robot
Library           ../Resources/GenericMethods.py  WITH NAME  Generic_Methods


*** Keywords ***
NAV_IMPORTVARIABLE_Import the Role Variable File
    [Documentation]  This keyword is to Import the Role Variable File at the run time
    Run Keyword If   '${Role}' == 'Designer'   Import Resource   ${CURDIR}/Designer_Variable.robot
    Run Keyword If   '${Role}' == 'Operator'   Import Resource   ${CURDIR}/Operator_Variable.robot
    Run Keyword If   '${Role}' == 'BO'         Import Resource   ${CURDIR}/BO.robot
    log to console    ${Role}

NAV_Check the Left navigation menu
    [Documentation]  This keyword is to Check the Left navigation menu is displayed in the page
    Wait Until Element Is Visible  ${UNISPHERE_LEFTMENUINNER_XPATH}      timeout=20
    Page should Contain Element  ${UNISPHERE_LEFTMENUINNER_XPATH}

NAV_Check the UI of the Left navigation Menu
    [Documentation]  This keyword is to Check the UI of the Left navigation Menu
    Page should contain Element   ${UNISPHERE_TOGGLE_PIN}
    Page should contain Element   ${UNISPHERE_TRASH_ICON}
    Page should contain Element   ${UNISPHERE_LEFTMENUINNERFIRST_XPATH}
    ${LeftMenuLinks}=    Get Element Count    ${UNISPHERE_LEFTMENUINNER_XPATH}
    Run Keyword If   '${Solution}' == 'UniSphere' and '${Role}' == 'Designer'
    ...               pass execution if   ${LeftMenuLinks}==${UNISPHERELEFTMENUNAVIGATIONLINKS}  Navigator links found
    Run Keyword If   '${Solution}' == 'UniSphere' and '${Role}' == 'Operator'
    ...               pass execution if   ${LeftMenuLinks}==${UNISPHERELEFTMENUNAVIGATIONLINKS}  Navigator links found
    Run Keyword If   '${Solution}' == 'UniSecure' and '${Role}' == 'Designer'
    ...               pass execution if   ${LeftMenuLinks}==${UNISECURELEFTMENUNAVIGATIONLINKS}  Navigator links found
    Run Keyword If   '${Solution}' == 'UniSecure' and '${Role}' == 'Operator'
    ...               pass execution if   ${LeftMenuLinks}==${UNISECURELEFTMENUNAVIGATIONLINKS}  Navigator links found
    Run Keyword If   '${Solution}' == 'UniSeries' and '${Role}' == 'Designer'
    ...               pass execution if   ${LeftMenuLinks}==${UNISERIESLEFTMENUNAVIGATIONLINKS}  Navigator links found
    Run Keyword If   '${Solution}' == 'UniSeries' and '${Role}' == 'Operator'
    ...               pass execution if   ${LeftMenuLinks}==${UNISERIESLEFTMENUNAVIGATIONLINKS}  Navigator links found

NAV_Click on Pin Navigator
    [Documentation]   This keyword is to click on Pin Navigator
    wait until keyword succeeds  5x  3s  Click Element   ${UNISPHERE_TOGGLE_PIN}
    Wait Until Element Is Visible   ${UNISPHERE_TOGGLED_PINLEFT}    timeout=20
    page should contain element  ${UNISPHERE_TOGGLED_PINLEFT}

NAV_Click off Pin Navigator
    [Documentation]  This keyword is to click off Pin Navigator
    Wait Until Element Is Visible    ${UNISPHERE_TOGGLE_PIN}    timeout=20
    wait until keyword succeeds  5x  3s  Click Element   ${UNISPHERE_TOGGLE_PIN}
    Wait Until Element Is Visible   ${UNISPHERE_TOGGLE_PIN}    timeout=20
    page should contain element  ${UNISPHERE_TOGGLE_PIN}

NAV_Navigate to Trash page
    [Documentation]  This keyword is to Navigate to Trash page
    Wait Until Element Is Visible   ${UNISPHERE_TRASH_ICON}    timeout=20
    Click Element  ${UNISPHERE_TRASH_ICON}
    Wait Until Element Is Visible  ${UNISPHERE_TRASH_DESCRIPTION}    timeout=20

NAV_Check the UI of the Trash page
    [Documentation]  This keyword is to check the UI of the Trash page
    run keyword and continue on failure     Wait Until Element Is Visible   ${UNISPHERE_TRASHPAGE_ID}    timeout=20
    run keyword and continue on failure     Wait Until Element Is Visible   ${UNISPHERE_TRASH_BREADCRUMB}    timeout=20
    run keyword and continue on failure     Wait Until Element Is Visible   ${UNISPHERE_TRASH_BREADCRUMB}    timeout=20
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_TRASH_BREADCRUMB}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_TRASHCAN_ICON}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_TRASH_DESCRIPTION}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_TRASHVIDEO_ICON}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_SEARCH_TEXTBOX}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_SORTBY_LABEL}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_ASCENDING_BUTTON}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_DESCENDING_BUTTON}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_SORTBY_LIST}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_TRASHTABLETOTAL_TEXT}
    run keyword and continue on failure     Mouse over  ${UNISECURE_FLOATBTN_ICON}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_RESTORE_BTN}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_DELETE_BTN}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_ITEMSPERPAGE_LABEL}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_ITEMSPERPAGE_ID}
    run keyword and continue on failure     Page should contain element  ${UNISPHERE_ITEMSPERPAGE_OPTIONS}

NAV_Compare the Trashcancount and Trash page count
    [Documentation]  This keyword is to Compare the Trashcancount and Trash page count
     ${Totaltext}=  get text  ${UNISPHERE_TRASHTABLETOTAL_TEXT}
     ${TotalConvert}=  Convert To String  ${Totaltext}
     @{Total}=    Split String  ${TotalConvert}    0 Selected /
     log to console   @{Total}[-1]
     @{TotalVal}=   Split String From Right  @{Total}[-1]   Total  -1
     log to console   @{TotalVal}
     ${TotalValue}=  Evaluate    @{TotalVal}
     ${Trashvaluetext}=  get text   ${UNISPHERE_TRASHCANCOUNT_LINK}
     ${TrashValueRemove}=  Remove String   ${Trashvaluetext}  (    )
     ${TrashValueInt}=   Convert To Integer   ${TrashValueRemove}
     Log to console  ${TrashValueRemove}
     should be equal  ${TotalValue}   ${TrashValueInt}

NAV_Check the Select All checkbox functionality
    [Documentation]  This keyword is to check the Select All checkbox functionality
    Sleep  5s
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    NAV_Check the Restore button is disabled
    NAV_Check the Delete button is disabled
    Mouse Over   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    wait until keyword succeeds  5x  1s   Unselect Checkbox  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    wait until keyword succeeds  5x  1s   Select Checkbox  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    Sleep  2s

NAV_Check the UnSelect All checkbox functionality
    [Documentation]  This keyword is to Check the UnSelect All checkbox functionality
    Sleep  5s
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    NAV_Check the Restore button is enabled
    NAV_Check the Delete button is enabled
    wait until keyword succeeds  5x  1s   UnSelect Checkbox  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    Sleep  2s
#  	 Wait Until Element Is Visible  ${UNSELECTALLHIDE}    timeout=20
#    Page Should Contain Element  ${UNSELECTALLHIDE}
#    Mouse Over  ${UNISECURE_FLOATBTN_ICON}

NAV_Check the Restore button is disabled
    [Documentation]  This keyword is to Check the Restore button is disabled
    wait until keyword succeeds  5x  2s  Mouse Over  ${UNISECURE_FLOATBTN_ICON}
    Page Should Contain Element  ${UNISPHERE_RESTORE_BTNDISABLED}

NAV_Check the Restore button is enabled
    [Documentation]  This keyword is to Check the Restore button is enabled
    wait until keyword succeeds  5x  2s  Mouse Over  ${UNISECURE_FLOATBTN_ICON}
    Page Should Not Contain Element  ${UNISPHERE_RESTORE_BTNDISABLED}
    Page Should Contain Element  ${UNISPHERE_RESTORE_BTNXPATH}

NAV_Click the Restore button
    [Documentation]  This keyword is to Click the Restore button
    Mouse Over  ${UNISECURE_FLOATBTN_ICON}
    Wait Until Element Is Visible  ${UNISPHERE_RESTORE_BTNXPATH}    timeout=20
    Page Should Contain Element  ${UNISPHERE_RESTORE_BTNXPATH}
    Click Element  ${UNISPHERE_RESTORE_BTNXPATH}

NAV_Check the Delete button is disabled
    [Documentation]  This keyword is to Check the Delete button is disabled
    Mouse Over  ${UNISECURE_FLOATBTN_ICON}
    Page Should Contain Element  ${UNISPHERE_DELETE_BTNDISABLED}

NAV_Check the Delete button is enabled
    [Documentation]  This keyword is to Check the Delete button is enabled
    Mouse Over  ${UNISECURE_FLOATBTN_ICON}
    Page Should Not Contain Element  ${UNISPHERE_DELETE_BTNDISABLED}
    Page Should Contain Element  ${UNISPHERE_DELETE_BTNXPATH}

NAV_Click the Delete button
    [Documentation]  This keyword is to Click the Delete button
    Mouse Over  ${UNISECURE_FLOATBTN_ICON}
    Wait Until Element Is Visible  ${UNISPHERE_DELETE_BTNXPATH}    timeout=20
    wait until keyword succeeds  5x  2s  Page Should Contain Element  ${UNISPHERE_DELETE_BTNXPATH}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_DELETE_BTNXPATH}
    Wait Until Element Is Visible   ${UNISPHERE_DELETECONFIRMATION_BTN}    timeout=20
    wait until keyword succeeds  5x  2s  Mouse Over  ${UNISPHERE_DELETECONFIRMATION_BTN}
    wait until keyword succeeds  5x  2s  Click Element   ${UNISPHERE_DELETECONFIRMATION_BTN}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}    timeout=20

NAV_Select a item in the table and click on Restore
    [Documentation]  This keyword is to Select a item in the table and click on Restore
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    Click Element   ${UNISPHERE_TRASHTABLEFIRST_CHKBX}
    ${RestoreText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Log To Console  ${RestoreText}
    Click Element  ${UNISPHERE_TRASHSEARCH_BTN}
    Input Text  ${UNISPHERE_TRASHSEARCH_BTN}   ${RestoreText}
    Click Element  ${UNISPHERE_SEARCH_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    Select Checkbox   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    NAV_Click the Restore button
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}    timeout=20
    Page should contain  ${UNISPHERE_TRASHRESTORE_MESSAGEPREFIX}
    Click Element  ${UNISECURE_WELCOME_ID}

NAV_Select a item in the table and click on Delete
    [Documentation]  This keyword is to Select a item in the table and click on Delete
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    Click Element   ${UNISPHERE_TRASHTABLEFIRST_CHKBX}
    ${DeleteText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Log To Console  ${DeleteText}
    Click Element  ${UNISPHERE_TRASHSEARCH_BTN}
    Input Text  ${UNISPHERE_TRASHSEARCH_BTN}   ${DeleteText}
    Click Element  ${UNISPHERE_SEARCH_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    Select Checkbox   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    NAV_Click the Delete button
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}    timeout=20
    Page should contain  ${UNISPHERE_TRASHDELETE_MESSAGEPREFIX}
    wait until keyword succeeds  3x  2s  Click Element  ${UNISECURE_WELCOME_ID}

NAV_Search the Trash items
    [Documentation]  This keyword is to Search the Trash items
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
	Sleep  3s
    Click Element   ${UNISPHERE_TRASHTABLEFIRST_CHKBX}
    ${SearchText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Log To Console  ${SearchText}
    Click Element  ${UNISPHERE_TRASHSEARCH_BTN}
    Input Text  ${UNISPHERE_TRASHSEARCH_BTN}   ${SearchText}
    Click Element  ${UNISPHERE_SEARCH_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}    timeout=20
    ${ExpectedSearchText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Should be equal as strings    ${ExpectedSearchText}    ${SearchText}

NAV_Clear the Search box
    [Documentation]  This keyword is to clear the Search box
    Wait Until Element Is Visible  ${UNISPHERE_TRASHSEARCH_BTN}    timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_TRASHSEARCH_BTN}
    wait until keyword succeeds  5x  2s  Clear Element Text  ${UNISPHERE_TRASHSEARCH_BTN}
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_SEARCH_BTN}
    Click Element  ${UNISECURE_WELCOME_ID}

NAV_Click on Descending order
    [Documentation]  This keyword is to Click on Descending order
    Wait Until Element Is Visible  ${UNISPHERE_DESCENDING_BUTTON}    timeout=20
    Click Element  ${UNISPHERE_DESCENDING_BUTTON}
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20

NAV_Click on Ascending order
    [Documentation]  This keyword is to Click on Ascending order
    Wait Until Element Is Visible  ${UNISPHERE_ASCENDING_BUTTON}    timeout=20
    Click Element  ${UNISPHERE_ASCENDING_BUTTON}
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20

NAV_Select Updated By option in Trash page
    [Documentation]  This keyword is to Select Updated By option in Trash page
    Wait Until Element Is Visible  ${UNISPHERE_SORTBY_LIST}    timeout=20
    Click Element  ${UNISPHERE_SORTBY_LIST}
    Select From List By Index  ${UNISPHERE_SORTBY_LIST}  1
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20

NAV_Select Updated On option in Trash page
    [Documentation]  This keyword is to Select Updated On option in Trash page
    Wait Until Element Is Visible  ${UNISPHERE_SORTBY_LIST}    timeout=20
    Click Element  ${UNISPHERE_SORTBY_LIST}
    Select From List By Index  ${UNISPHERE_SORTBY_LIST}  2
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20

NAV_Check the Descending order in Trash page
    [Documentation]  This keyword is to Check the Descending order in Trash page
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${AscendingText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    log to console  ${AscendingText}
    NAV_Click on Descending order
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${DescendingText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    log to console  ${DescendingText}
    Should Not Be Equal As Strings    ${DescendingText}  ${AscendingText}

NAV_Check the Ascending order in Trash page
    [Documentation]  This keyword is to Check the Ascending order in Trash page
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${DescendingText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    NAV_Click on Descending order
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${AscendingText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Should Not Be Equal As Strings    ${DescendingText}  ${AscendingText}

NAV_Check the order in Trash page is Ascending Order
    [Documentation]  This keyword is to check the order in trash page is Ascending order.
    ...              ${COLUMN_NUMBER} is used to provide the Trash table column xpaths for checking the ascending order.
    [Arguments]   ${COLUMN_NUMBER}

	Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${RowCount}=  Get Element Count   ${UNISPHERE_TABLE_ROWS}

    :For  ${k}  IN RANGE  1  ${RowCount}
    \  ${First_Item_Name}=  get text  //datatable-row-wrapper[${k}]/datatable-body-row/div[2]/${COLUMN_NUMBER}/div/div
    \  ${First_Item_Name}=  Convert To Lowercase	${First_Item_Name}
    \  ${Second_Item_Name}=  get text  //datatable-row-wrapper[${k}+1]/datatable-body-row/div[2]/${COLUMN_NUMBER}/div/div
    \  ${Second_Item_Name}=  Convert To Lowercase	${Second_Item_Name}
    \  Continue For Loop If  '${First_Item_Name}'=='${Second_Item_Name}'
    \  ${result}=  Generic_Methods.compare_string  ${First_Item_Name}  ${Second_Item_Name}
    \  Run Keyword If  '${result}'=='${TRUE}'  fail

NAV_Check the order of Dates in Trash page is Ascending Order
    [Documentation]  This keyword is to check the order in trash page is Ascending order.
    ...              ${COLUMN_NUMBER} is used to provide the Trash table column xpaths for checking the ascending order.
    [Arguments]   ${COLUMN_NUMBER}
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${RowCount}=  Get Element Count   ${UNISPHERE_TABLE_ROWS}
    log to Console   ${RowCount}
    ${TableContents}=  Create List
    :FOR  ${k}  IN RANGE   ${RowCount}
    \     ${j}=  Evaluate  ${k}+1
    \     Run Keyword If  ${k} == ${RowCount}-1    exit for loop
    \     log to console  ${k}
    \     ${values}=    Get Text  //datatable-row-wrapper[${j}]/datatable-body-row/div[2]/${COLUMN_NUMBER}/div/div
    \     Append to List   ${TableContents}    ${values}
    \     log to console   ${TableContents}
    @{sorted} =  copy list   ${TableContents}
    log to console   ${sorted}
    Generic_Methods.sort_dates_ascending   ${sorted}
    log to console   ${sorted}
    Lists Should be Equal  ${TableContents}  ${sorted}

NAV_Check the order of Dates in Trash page is Descending Order
    [Documentation]  This keyword is to check the order in trash page is Descending order.
    ...              ${COLUMN_NUMBER} is used to provide the Trash table column xpaths for checking the descending order.
    [Arguments]   ${COLUMN_NUMBER}
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${RowCount}=  Get Element Count   ${UNISPHERE_TABLE_ROWS}
    log to Console   ${RowCount}
    ${TableContents}=  Create List
    :FOR  ${k}  IN RANGE   ${RowCount}
    \     ${j}=  Evaluate  ${k}+1
    \     Run Keyword If  ${k} == ${RowCount}-1    exit for loop
    \     log to console  ${k}
    \     ${values}=    Get Text  //datatable-row-wrapper[${j}]/datatable-body-row/div[2]/${COLUMN_NUMBER}/div/div
    \     Append to List   ${TableContents}    ${values}
    \     log to console   ${TableContents}
    @{sorted} =  copy list   ${TableContents}
    Generic_Methods.sort_dates_descending  ${sorted}
    Log  ${sorted}
    lists should be equal  ${TableContents}  ${sorted}

NAV_Check the order in Trash page is Descending Order
    [Documentation]  This keyword is to check the order in trash page is Descending order.
    ...              ${COLUMN_NUMBER} is used to provide the Trash table column xpaths for checking the descending order.
    [Arguments]   ${COLUMN_NUMBER}
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    ${RowCount}=  Get Element Count   ${UNISPHERE_TABLE_ROWS}

	:For  ${k}  IN RANGE  1  ${RowCount}
    \  ${First_Item_Name}=  get text  //datatable-row-wrapper[${k}]/datatable-body-row/div[2]/${COLUMN_NUMBER}/div/div
    \  ${First_Item_Name}=  Convert To Lowercase	${First_Item_Name}
    \  ${Second_Item_Name}=  get text  //datatable-row-wrapper[${k}+1]/datatable-body-row/div[2]/${COLUMN_NUMBER}/div/div
    \  ${Second_Item_Name}=  Convert To Lowercase	${Second_Item_Name}
    \  Continue For Loop If  '${First_Item_Name}'=='${Second_Item_Name}'
    \  ${result}=  Generic_Methods.compare_string  ${First_Item_Name}  ${Second_Item_Name}
    \  Run Keyword If  '${result}'=='${FALSE}'  fail

NAV_Check the Expand/Collapse icon for each link in Navigator menu
    [Documentation]  This keyword is to Check the Expand/Collapse icon for each link in Navigator menu
    ${LeftMenuLinks}=    Get Element Count    ${UNISPHERE_LEFTMENUINNER_XPATH}
    log to console   ${LeftMenuLinks}
    ${expandcollapse}=   Get Element Count    ${UNISPHERE_EXPANDCOLLAPSE_BTN}
    log to console   ${expandcollapse}
    should be equal as numbers   ${LeftMenuLinks}  ${expandcollapse}

NAV_Check user is able to Expand/Collapse each icon in Navigator menu
    [Documentation]  This keyword is to Check user is able to Expand/Collapse each icon in Navigator menu
    @{expandcollapse}=   Get WebElements    ${UNISPHERE_EXPANDCOLLAPSE_BTN}
	${j}   set variable  1
    :FOR  ${i}  IN  @{expandcollapse}
    \     Click Element  ${i}
    \     Wait Until Element Is Visible    ${UNISPHERE_EXPANDCOLLAPSE_ROTATEDOWN} [${j}]    timeout=20
	\	  ${j}=   evaluate  ${j}+1
    \     sleep  2s
    \     wait until keyword succeeds  5x  3s   Click Element  ${i}

NAV_Check the Expand/Collapse child items
    [Documentation]  This keyword is to Check the Expand/Collapse child items for each link in Navigator menu
     @{expandcollapse}=   Get WebElements    ${UNISPHERE_EXPANDCOLLAPSE_BTN}
     ${j}   set variable  0
    :FOR  ${i}  IN  @{expandcollapse}
    \     Click Element  ${i}
	\	  ${j}=   evaluate  ${j}+1
    \     Wait Until Element Is Visible  ${UNISPHERE_EXPANDCOLLAPSE_ROTATEDOWN} [${j}]    timeout=20
    \     Sleep  2s
    \     ${Child}=  Get Element Count    ${UNISPHERE_EXPANDCOLLAPSE_BTN} [${j}]/../../..${UNISPHERE_EXPANDCOLLAPSE_CHILDITEMS}
    \     capture page screenshot
    \     ${test1}  Convert To String  ${Child}
    \     ${TotalChilds}=  evaluate  ${test1}
    \     run keyword if  ${TotalChilds} == 0  Run keywords   Click Element  ${i}  AND   log to console  no child is displayed in the navigator
    \     run keyword if  ${TotalChilds} > 0   Run keywords   Click Element    //li[${j}]${UNISPHERE_LEFTNAVIGATIONMENU_LINKS}
    ...    AND   NAV_Total displayed in the table
    ...    AND   Click Element  ${i}
    ...    AND   should be equal as numbers   ${TotalChilds}   ${TotalChildValue}


Check the Total child in the parent
    [Arguments]  ${j}
    ${j}=   evaluate  ${j}+1
    Click Element    //li[${j}]${UNISPHERE_LEFTNAVIGATIONMENU_LINKS}

NAV_Total displayed in the table
    [Documentation]  This keyword is used to get the total value in the table
    Wait Until Element Is Visible    ${UNISPHERE_TABLEVIEW_BTN}    timeout=20
    wait until keyword succeeds  5x  2s   Click Element   ${UNISPHERE_TABLEVIEW_BTN}
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLETOTAL_TEXT}    timeout=20
    sleep  5s
    ${Totaltext}=  get text  ${UNISPHERE_TRASHTABLETOTAL_TEXT}
    log to console  ${Totaltext}
    ${TotalConvert}=  Convert To String  ${Totaltext}
    ${TotalConvert}=  Remove String  ${TotalConvert}  ,
    @{Total}=    Split String  ${TotalConvert}    0 Selected /
    log to console   @{Total}[-1]
    @{TotalVal}=   Split String From Right  @{Total}[-1]   Total  -1
    log to console   @{TotalVal}
    ${TotalChildValue}=  Evaluate    @{TotalVal}
    set global variable  ${TotalChildValue}

NAV_Navigate to each left menu link
    [Documentation]  This keyword is to Navigate to each left menu link
    @{LeftMenuLinks}=    Get WebElements    ${UNISPHERE_ASSETTYPELINK_XPATH}
    :FOR  ${i}  IN  @{LeftMenuLinks}
    \   Click Element  ${i}
    \   run keyword and continue on failure     Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}    timeout=20

NAV_Create Data for Trashcan page verifications
    [Documentation]  This keyword is to create data for Trash page verifications.
    Wait Until Element Is Visible   ${UNISPHERE_ASSETTYPELINK_XPATH}       timeout=20
    @{LeftMenuLinks}=    Get WebElements    ${UNISPHERE_ASSETTYPELINK_XPATH}
    #log to console   @{LeftMenuLinks}
    :FOR  ${i}  IN  @{LeftMenuLinks}
    \   Click Element  ${i}
    \   run keyword and continue on failure   Wait Until Element Is Visible   ${UNISPHERE_ADDNEWITEM_BTN}      timeout=20
    \   run keyword and continue on failure   Click Element  ${UNISPHERE_ADDNEWITEM_BTN}
    \   NAV_Declare Random variables for new data
    \   run keyword and continue on failure   NAV_Create New Data   ${New_Name}  ${New_Description}
    \   wait until keyword succeeds  5x  3s  Click Element  ${i}
    \   Wait Until Element Is Visible   ${UNISPHERE_ADDNEWITEM_BTN}    timeout=20
    \   run keyword and continue on failure   NAV_Search the New data in Card View  ${New_Name}
    \   run keyword and continue on failure   NAV_Click on delete icon for Searched Card Item
    \   run keyword and continue on failure   NAV_Click Yes button in the Delete Confirmation popup
    \   NAV_Navigate to Trash page
    \   run keyword and continue on failure   NAV_Search the Deleted items in Trash page  ${New_Name}

NAV_Create Data
    [Documentation]  This keyword is to Navigate to each left menu link
    Wait Until Element Is Visible   //li${UNISPHERE_LEFTNAVIGATIONMENU_LINKS}    timeout=20
    ${LeftMenuLinks}=    Get Element Count    xpath=//li${UNISPHERE_LEFTNAVIGATIONMENU_LINKS}
    :FOR  ${i}  IN RANGE  ${LeftMenuLinks}
    \   Click Element  //li[${i}+1]${UNISPHERE_LEFTNAVIGATIONMENU_LINKS}
    \   run keyword and continue on failure   Wait Until Element Is Visible   ${UNISPHERE_ADDNEWITEM_BTN}      timeout=20
    \   run keyword and continue on failure   Click Element  ${UNISPHERE_ADDNEWITEM_BTN}
    \   NAV_Declare Random variables for new data
    \   run keyword and continue on failure   NAV_Create New Data   ${New_Name}  ${New_Description}
    \   wait until keyword succeeds  5x  3s  Click Element  //li[${i}+1]${UNISPHERE_LEFTNAVIGATIONMENU_LINKS}
    \   Wait Until Element Is Visible   ${UNISPHERE_ADDNEWITEM_BTN}    timeout=20
    \   run keyword and continue on failure    NAV_Search the New data in Card View  ${New_Name}
    \   run keyword and continue on failure    NAV_Click on delete icon for Searched Card Item
    \   run keyword and continue on failure    NAV_Click Yes button in the Delete Confirmation popup
    \   NAV_Navigate to Trash page
    \   run keyword and continue on failure    NAV_Search the Deleted items in Trash page   ${New_Name}

NAV_Create Bulk data for Pagination verification
    [Arguments]  ${Iterations}
    [Documentation]  This keyword is to create the bulk data for pagination verifications.
    ...              ${Iterations} is used to provide the number of times to create the data for checking the pagination.
    :FOR  ${a}  IN RANGE  ${Iterations}
    \   run keyword and continue on failure  NAV_Create Data
    \   Run Keyword If  ${a} == ${Iterations}    exit for loop

NAV_Search the Deleted items in Trash page
    [Arguments]    ${New_Name}
    [Documentation]  This keyword is to Search the Deleted items in Trash page
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    Click Element   ${UNISPHERE_TRASHTABLEFIRST_CHKBX}
    ${SearchText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Log To Console  ${SearchText}
    Click Element  ${UNISPHERE_TRASHSEARCH_BTN}
    Input Text  ${UNISPHERE_TRASHSEARCH_BTN}    ${New_Name}
    Click Element  ${UNISPHERE_SEARCH_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}    timeout=20
    ${ExpectedSearchText}=  Get Text  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}
    Should be equal as strings    ${ExpectedSearchText}    ${New_Name}

NAV_Search the New data in Card View
   [Documentation]  This keyword is to Search the new data in the Card view.
   [Arguments]    ${New_Item}
   Wait Until Element Is Visible  ${UNISPHERE_CARDVIEW_BTN}    timeout=20
   wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_CARDVIEW_BTN}
   wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${UNISPHERE_CARD_IMAGE_XPATH}    timeout=20
   Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
   wait until keyword succeeds  5x  2s  Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${New_Item}
   Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
   Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${UNISPHERE_CARDS_LIST}
   Wait Until Element Is Visible   ${UNISPHERE_CARD_IMAGE_XPATH}    timeout=20
   Set Focus To Element   ${UNISPHERE_CARD_IMAGE_XPATH}
   Set Focus To Element   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}

NAV_Search the New data in Table View
   [Documentation]  This keyword is to Search the new data in the Table view.
   [Arguments]    ${New_Item}
   Wait Until Element Is Visible    //div/asset-list/div[1]/table    timeout=20
   Wait Until Element Is Visible  ${UNISPHERE_CARDSSEARCH_BOX}    timeout=20
   run keyword and ignore error   Click Element   ${UNISPHERE_TABLEVIEW_BTN}
   sleep  5s
   Wait Until Element Is Visible  selectAllHeader    timeout=20
   Click Element  ${UNISPHERE_CARDSSEARCH_BOX}
   Input Text  ${UNISPHERE_CARDSSEARCH_BOX}    ${New_Item}
   Click Element  ${UNISPHERE_CARDSSEARCH_BTN}
   Wait Until Element Is Visible   ${UNISPHERE_TABLE_LIST}    timeout=20
   Set Focus To Element   ${UNISPHERE_TABLE_LIST}

NAV_Click on delete icon for Searched Card Item
    [Documentation]  This keyword is to check on the delete icon for the Searched Card Item
    Sleep  5s
    wait until keyword succeeds  5x  2s  Mouse down   ${UNISPHERE_CARDOPTIONS_MENU}
    Set Focus To Element   ${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}
    Wait Until Element Is Visible  ${UNISPHERE_CARDSDELETE_BTN}    timeout=20
    Mouse over  ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Double Click Element   ${UNISPHERE_CARDSDELETE_BTN}
    Sleep  5s
    Wait Until Element Is Visible   ${UNISPHERE_DELETECONFIRMATION_BTN}    timeout=20

NAV_Click on delete icon for Searched table Item
    [Documentation]  This keyword is to check on the delete icon for the Searched table Item
    Sleep  5s
    wait until keyword succeeds  5x  2s  Mouse down   menu_options
    wait until keyword succeeds  5x  2s  Click Element   delete-menu-item
    Wait Until Element Is Visible   ${UNISPHERE_DELETECONFIRMATION_BTN}    timeout=20

NAV_Click Yes button in the Delete Confirmation popup
    [Documentation]  This keyword is to check the Yes button in the delete Confirmation popup.
    Wait Until Element Is Visible   ${UNISPHERE_DELETECONFIRMATION_BTN}    timeout=20
    wait until keyword succeeds  5x  2s  Click Element  ${UNISPHERE_DELETECONFIRMATION_BTN}
    Wait Until Element Is Visible  ${UNISECURE_MESSAGE_ID}    timeout=20

NAV_Declare Random variables for new data
    [Documentation]  This keyword is to Declare Random variables for new data.
    ${New_Name} =    COMMON_Return UniqueNameData
    set global variable  ${New_Name}
    log to console   ${New_Name}
    ${New_Description} =    COMMON_Return UniqueDesData
    set global variable  ${New_Description}
    log to console   ${New_Description}

COMMON_Return UniqueNameData
    [Documentation]   Returns unique ${UNISPHERE_ADDNEWITEM_BTN}
    [Arguments]     ${suffix}=5
    ${unique}=    generate random string    5    [LOWER]
    ${result}=    Set Variable   ${unique}${suffix}
    [Return]    ${result}

COMMON_Return UniqueDesData
    [Documentation]   Create unique description
    [Arguments]    ${prefix}=DeleteDescription    ${suffix}=8
    ${unique}=    COMMON_Return UniqueNameData
    ${result}=    Set Variable    ${prefix}${unique}
    [Return]    ${result}

NAV_Create New Data
    [Documentation]  This keyword is to create new data
    [Arguments]    ${New_SiteServers_name}  ${New_SiteServers_Description}
    Click Element  ${UNISPHERE_NAME_TEXTBOX}
    Input Text    ${UNISPHERE_NAME_TEXTBOX}    ${New_SiteServers_name}
    Click Element  ${UNISPHERE_DESCRIPTION_TEXTBOX}
    Input Text    ${UNISPHERE_DESCRIPTION_TEXTBOX}    ${New_SiteServers_Description}
    Wait Until Element Is Visible   ${UNISECURE_FLOATBTN_ICON}    timeout=20
    Mouse Over   ${UNISECURE_FLOATBTN_ICON}
    Click Element    ${UNISECURE_SAVE_BTN}
    Wait Until Element Is Visible   ${UNISECURE_MESSAGE_ID}    timeout=20

NAV_Check the Paginations in Trash page
    [Documentation]  This keyword is to Check the Paginations in Trash page
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS}    timeout=20
    ${Paginationlinks}=    Get Element Count  ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
    log to console  ${Paginationlinks}
    Run Keyword If  ${Paginationlinks} == 0  Pass Execution   No Paginations Found
	Run Keyword If  ${Paginationlinks} == 5  NAV_Check the Paginations with links disabled
	Run Keyword If  ${Paginationlinks} > 5   NAV_Check the Paginations navigation

NAV_Check the Paginations with links disabled
    [Documentation]  This keyword is to check the paginations with links are disabled.
    Page Should contain Element   //datatable-pager/ul/li[1]/a/i
    Page Should Contain Element   //datatable-pager/ul/li[2]/a/i
    Page Should Contain Element   //datatable-pager/ul/li[4]/a/i
    Page Should Contain Element   //datatable-pager/ul/li[5]/a/i

NAV_Check the Paginations navigation
     [Documentation]  This keyword is to check the paginations navigation.
     COMMON_Scroll to bottom of the page
     @{Pagination_links} =  Get WebElements  ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
     ${Pagination_Countlinks} =  Get Element Count   ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
     log to console  ${Pagination_Countlinks}
    :FOR  ${i}  In RANGE  ${Pagination_Countlinks}
    \   ${Pagelink}=   Evaluate  ${i}+1
    \   run keyword if  ${Pagelink} == 1
    \   ...        NAV_Check First/Previous/Next/Last Pagination is disabled    //li[${Pagelink}]${UNISPHERE_PAGINATIONDISABLED_LINK}
    \   run keyword if  ${Pagelink} == 2
    \   ...        NAV_Check First/Previous/Next/Last Pagination is disabled   //li[${Pagelink}]${UNISPHERE_PAGINATIONDISABLED_LINK}
    \   run keyword if  ${Pagelink} == 3   log to console  First Page
    \   run keyword if  ${Pagelink} == ${Pagination_Countlinks}-2
    \   ...        Run keywords   NAV_Click on Page in the Trash page   ${Pagelink}
    \   ...        AND    NAV_Check First/Previous/Next/Last Pagination is disabled    //li[${Pagination_Countlinks}]${UNISPHERE_PAGINATIONDISABLED_LINK}
    \   ...        AND    NAV_Check First/Previous/Next/Last Pagination is disabled    //li[${Pagination_Countlinks}-1]${UNISPHERE_PAGINATIONDISABLED_LINK}
    \   ...        AND    NAV_Check First/Previous/Next/Last Pagination is enabled     ${UNISPHERE_PAGINATIONFIRST_LINK}
    \   ...        AND    NAV_Check First/Previous/Next/Last Pagination is enabled     ${UNISPHERE_PAGINATIONPREV_LINK}
    \   Exit For Loop If    ${Pagelink} == ${Pagination_Countlinks}-2
    \   run keyword if  ${Pagelink} == ${Pagination_Countlinks}-1
    \   ...        Run keywords   NAV_Check First/Previous/Next/Last Pagination is disabled   //li[${Pagination_Countlinks}-1]${UNISPHERE_PAGINATIONDISABLED_LINK}
    \   ...        AND    NAV_Check First/Previous/Next/Last Pagination is enabled    ${UNISPHERE_PAGINATIONFIRST_LINK}
    \   ...        AND    NAV_Check First/Previous/Next/Last Pagination is enabled    ${UNISPHERE_PAGINATIONPREV_LINK}
    \   Exit For Loop If    ${Pagelink} == ${Pagination_Countlinks}-1
    \   run keyword if  ${Pagelink} == ${Pagination_Countlinks}
    \   ...        Run keywords   NAV_Check First/Previous/Next/Last Pagination is disabled  //li[${Pagination_Countlinks}]${UNISPHERE_PAGINATIONDISABLED_LINK}
    \   ...        AND    NAV_Check First/Previous/Next/Last Pagination is disabled    //li[${Pagination_Countlinks}-1]${UNISPHERE_PAGINATIONDISABLED_LINK}
    \   Exit For Loop If    ${i} == ${Pagination_Countlinks}
    \   run keyword if  ${Pagelink} > 3
    \   ...        Run Keywords  NAV_Click on Page in the Trash page   ${Pagelink}
    \   ...        AND   log to console  ${Pagelink}
    \   ...        AND   NAV_Check First/Previous/Next/Last Pagination is enabled    //datatable-pager/ul/li[1]/a/i
    \   ...        AND   NAV_Check First/Previous/Next/Last Pagination is enabled    //datatable-pager/ul/li[${Pagination_Countlinks}-1]/a/i
    \   ...        AND   NAV_Check First/Previous/Next/Last Pagination is enabled    //datatable-pager/ul/li[2]/a/i

NAV_Check First/Previous/Next/Last Pagination is disabled
    [Documentation]  This keyword is to check the First/Previous pagination link is disabled
    [Arguments]      ${Paginationlink}
    wait until keyword succeeds  5x  2s  Page should Contain Element   ${Paginationlink}
    log to console  First/Previous/Next/Last link is Disabled

NAV_Check First/Previous/Next/Last Pagination is enabled
    [Documentation]  This keyword is to check the First/Previous pagination link is enabled
    [Arguments]      ${Paginationlink}
    wait until keyword succeeds  5x  2s  Page should Contain Element   ${Paginationlink}
    log to console  First/Previous/Next/Last link is Enabled

NAV_Click on Last pagination link in Trash page
     [Documentation]  This keyword is to Click on Last pagination link in Trash page
     COMMON_Scroll to bottom of the page
     Wait Until Element Is Visible   ${UNISPHERE_TRASHPAGINATIONALL_LINKS}    timeout=20
     ${Pagination_Countlinks} =  Get Element Count   ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
     log to console  ${Pagination_Countlinks}
     run keyword if  ${Pagination_Countlinks} > 5
     ...             NAV_Click on Last link in the Trash page   ${Pagination_Countlinks}
     run keyword if  ${Pagination_Countlinks} < 5
     ...     Run Keywords  NAV_Check First/Previous/Next/Last Pagination is disabled  ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}]/a
     ...     AND   NAV_Check First/Previous/Next/Last Pagination is disabled   ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}-1]/a

NAV_Click on Next pagination link in Trash page
     [Documentation]   This keyword is to Click on Next pagination link in Trash page
     COMMON_Scroll to bottom of the page
     ${Pagination_Countlinks} =  Get Element Count   ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
     log to console  ${Pagination_Countlinks}
     run keyword if  ${Pagination_Countlinks} > 5
     ...             NAV_Click on Next link in the Trash page   ${Pagination_Countlinks}
     run keyword if  ${Pagination_Countlinks} < 5
     ...     Run Keywords  NAV_Check First/Previous/Next/Last Pagination is disabled   ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}]/a
     ...     AND   NAV_Check First/Previous/Next/Last Pagination is disabled   ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}-1]/a

NAV_Click on Next link in the Trash page
    [Documentation]   This keyword is to Click on Next pagination link in Trash page
    [Arguments]    ${Pagelink}
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}-1]/a    timeout=20
    wait until keyword succeeds  5x  5s   Click Element  ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}-1]/a

NAV_Click on Last link in the Trash page
    [Documentation]   This keyword is to Click on Last pagination link in Trash page
    [Arguments]    ${Pagelink}
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}]/a    timeout=20
    wait until keyword succeeds  5x  5s   Double Click Element  ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}]/a
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}-1]/a    timeout=20
    NAV_Check First/Previous/Next/Last Pagination is disabled    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}]/a
    NAV_Check First/Previous/Next/Last Pagination is disabled    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}-1]/a

NAV_Click on First link in the Trash page
    [Documentation]   This keyword is to Click on First pagination link in Trash page
    COMMON_Scroll to bottom of the page
    ${Pagination_Countlinks} =  Get Element Count   ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [1]/a    timeout=20
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [1]/a
    NAV_Check First/Previous/Next/Last Pagination is enabled    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}]/a
    NAV_Check First/Previous/Next/Last Pagination is enabled    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}-1]/a

NAV_Click on Previous link in the Trash page
    [Documentation]   This keyword is to Click on Previous pagination link in Trash page
    COMMON_Scroll to bottom of the page
    ${Pagination_Countlinks} =  Get Element Count   ${UNISPHERE_TRASHPAGINATIONALL_LINKS}
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [2]/a    timeout=20
    wait until keyword succeeds  5x  2s   Click Element  ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [2]/a
    NAV_Check First/Previous/Next/Last Pagination is enabled    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}]/a
    NAV_Check First/Previous/Next/Last Pagination is enabled    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagination_Countlinks}-1]/a

NAV_Click on Page in the Trash page
    [Documentation]   This keyword is to Click on page links in Trash page
    [Arguments]    ${Pagelink}
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}+1]/a    timeout=20
    Click Element  ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}]/a
    Wait Until Element Is Visible    ${UNISPHERE_TRASHPAGINATIONALL_LINKS} [${Pagelink}-1]/a    timeout=20

NAV_Check the Pagination options in the Items per page
    [Documentation]   This keyword is to Check the Pagination options in the Items per page
    ${Itemsperpagenumber}=  get text   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]/option[1]
    ${TotalValue}=  NAV_No of records displayed in the table
    ${TotalRecord}=  Convert To Integer  ${TotalValue}
    log to console  ${TotalRecord}
    Run keyword if     0 > ${TotalRecord} < 10   log to console   Records are lesss than 10
    Run Keyword if    10 < ${TotalRecord} < 20
    ...               Run Keywords  log to Console   Ten to Twenty
    ...               AND   NAV_Select the Items Per Page  20
    ...               AND  NAV_Check the number of records displayed in the trash page  20
    Run Keyword if    20 < ${TotalRecord} < 30
    ...               Run Keywords  log to Console   Twenty to Thirty
    ...               AND   NAV_Select the Items Per Page  30
    ...               AND  NAV_Check the number of records displayed in the trash page  30
    Run Keyword if    30 < ${TotalRecord} < 40
    ...               Run Keywords  log to Console   Thirty to Fourty
    ...               AND   NAV_Select the Items Per Page  40
    ...               AND  NAV_Check the number of records displayed in the trash page  40
    Run Keyword if    40 < ${TotalRecord} < 50
    ...               Run Keywords  log to Console   Fourty to Fifty
    ...               AND   NAV_Select the Items Per Page  50
    ...               AND  NAV_Check the number of records displayed in the trash page  50
    Run Keyword if    50 < ${TotalRecord} < 60
    ...               Run Keywords  log to Console   Fifty to Sixty
    ...               AND   NAV_Select the Items Per Page  60
    ...               AND  NAV_Check the number of records displayed in the trash page  60
    Run Keyword if         ${TotalRecord} > 60
    ...               Run Keywords  log to Console   More thanSixty
    ...               AND   NAV_Select the Items Per Page  60
    ...               AND  NAV_Check the number of records displayed in the trash page  60

NAV_Select the Items Per Page
    [Documentation]   This keyword is to Select the Items Per Page
    [Arguments]  ${Option}
    Mouse Over   //Select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]
    Click Element  //Select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]
    Run keyword if  ${Option} == 10   Run Keywords   Click Element  //*[@id="listItemsPerPage"]/option[1]
    ...       AND   Wait Until Element Is Visible   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]    timeout=20
    Run keyword if  ${Option} == 20   Run Keywords    Click Element  //*[@id="listItemsPerPage"]/option[2]
    ...       AND   Wait Until Element Is Visible   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]    timeout=20
    Run keyword if  ${Option} == 30   Run Keywords    Click Element  //*[@id="listItemsPerPage"]/option[3]
    ...       AND   Wait Until Element Is Visible   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]    timeout=20
    Run keyword if  ${Option} == 40   Run Keywords    Click Element  //*[@id="listItemsPerPage"]/option[4]
    ...       AND   Wait Until Element Is Visible   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]    timeout=20
    Run keyword if  ${Option} == 50   Run Keywords    Click Element  //*[@id="listItemsPerPage"]/option[5]
    ...       AND   Wait Until Element Is Visible   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]    timeout=20
    Run keyword if  ${Option} == 60   Run Keywords    Click Element  //*[@id="listItemsPerPage"]/option[6]
    ...       AND   Wait Until Element Is Visible   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]    timeout=20

NAV_Check the number of records displayed in the trash page
     [Documentation]  This keyword is to check the Check the number of records displayed in the trash page
     [Arguments]  ${Option}
     ${SelectedItemsperpage}=  Convert To Integer  ${Option}
     ${RecordRow} =  Get Element Count   //datatable-selection/datatable-scroller/datatable-row-wrapper/datatable-body-row
     log to console  ${RecordRow}
     ${RecordRow} =  Convert To Integer  ${RecordRow}
     Run keyword if   ${RecordRow} == ${SelectedItemsperpage}  pass execution   No of rows is equal to the no of Items per page selected in the dropdown
     run keyword if   ${RecordRow} < ${SelectedItemsperpage}
     ...            Run Keywords   log to console  No of rows is less than the Pagination
     ...            AND  pass execution   No of rows is less than the Pagination
     run keyword if  ${RecordRow} > ${SelectedItemsperpage}
     ...            Run Keywords   log to console  No of rows is greater than the Pagination
     ...            AND  fail

NAV_Check the number of records displayed in the trash page by default
     [Documentation]   This keyword is to Check the number of records displayed in the trash page by default
     COMMON_Scroll to bottom of the page
     ${RecordRow} =  Get Element Count   //datatable-selection/datatable-scroller/datatable-row-wrapper/datatable-body-row
     log to console  ${RecordRow}
     ${NoOfRows}=  Convert To Integer  ${RecordRow}
     ${Itemsperpagenumber}=  get text   //select[@id="${UNISPHERE_ITEMSPERPAGE_ID}"]/option[1]
     ${NoofRecords}=  Convert To Integer  ${Itemsperpagenumber}
     log to console  ${Itemsperpagenumber}
     ${TotalValue}=  NAV_No of records displayed in the table
     log to console   ${TotalValue}
     run keyword if   ${RecordRow} == 10  should be equal   ${NoofRecords}   ${NoOfRows}
     run keyword if   ${RecordRow} < 10  should be equal   ${TotalValue}    ${NoOfRows}

NAV_No of records displayed in the table
    [Documentation]  This keyword is used to get the Selected in the table
    Wait Until Element Is Visible    ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
    Select Checkbox   ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}
    Wait Until Element Is Visible   ${UNISPHERE_TRASHTABLETOTAL_TEXT}    timeout=20
    ${Totaltext}=  get text  ${UNISPHERE_TRASHTABLETOTAL_TEXT}
    ${TotalConvert}=  Convert To String  ${Totaltext}
    @{Total}=    Split String  ${TotalConvert}    0 Selected /
    log to console   @{Total}[-1]
    @{TotalVal}=   Split String From Right  @{Total}[-1]   Total  -1
    log to console   @{TotalVal}
    ${TotalValue}=  Evaluate    @{TotalVal}
    [Return]    ${TotalValue}

NAV_Delete all the Trash page
    [Documentation]   This keyword is to Delete all the Trash page
    Wait Until Element Is Visible    ${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    timeout=20
	${NavigationStatus}=  Run Keyword And Return Status  Element Should Be Visible  ${UNISPHERE_LAST_PAGE_BTN}

	Run Keyword If  '${NavigationStatus}'=='${TRUE}'  NAV_Navigate to Pages and delete items
	...  ELSE  Run Keywords  NAV_Check the Select All checkbox functionality
    ...  AND  run keyword and continue on failure  NAV_Click the Delete button
    ...  AND  SPH/SEC_Close the message center

NAV_Navigate to Pages and delete items
	[Documentation]  Navigates to multiple pages and deletes items

	Click Element  ${UNISPHERE_LAST_PAGE_BTN}
	Wait Until Element Is Visible  ${UNISPHERE_ACTIVE_PAGE_LINK}  timeout=10
	${LastPageNumber}=  Get Text  ${UNISPHERE_ACTIVE_PAGE_LINK}
	${LastPageNumber}=  Convert To Integer  ${LastPageNumber}
	Click Element  ${UNISPHERE_FIRST_PAGE_BTN}
	Wait until Element Is Visible  ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}  timeout=10
    :FOR  ${j}  IN RANGE   0  ${LastPageNumber}
    \   NAV_Check the Select All checkbox functionality
    \   run keyword and continue on failure  NAV_Click the Delete button
    \   SPH/SEC_Close the message center

NAV_Check the Trash can empty message
    [Documentation]   This keyword is to Check the Trash can empty message
    Wait Until Element Is Visible   ${UNISPHERE_TRASHEMPTY_MESSAGE}    timeout=20
    Page Should Contain Element   ${UNISPHERE_TRASHEMPTY_MESSAGE}
