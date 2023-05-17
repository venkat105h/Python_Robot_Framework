#------------------------------------------------------------------
#   Description       :      Common methods which can be called in any test case
#   Project           :      UniSphere Information Center Automation
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
Documentation     Common method used accross Test Suite

Library           BuiltIn
Library           SeleniumLibrary
Library           DateTime
Library           ../Generic/Generic_Methods_IC.py
Resource         ../Locators/Info_Center_Locators.robot
Resource         ../Locators/Generic_Locators.robot
Variables         ../Variables/${TESTENV}_Variable.py

*** Keywords ***
SPH/SEC_Open Browser And Enter URL
    [Documentation]  Launched browser, Navigates to specified URL and Logs in to the solution by entering username and password
    [Arguments]    ${URL}   ${UsernameID}    ${Username}   ${PasswordID}   ${Password}   ${LoginBtn}  ${WelcomeLink}
    wait until keyword succeeds  10x  2s  Open Browser            ${URL}                  ${Browser_type}
	Set Window Size  		${WINDOW_WIDTH}  	    ${WINDOW_HEIGHT}
    Input Text              ${UsernameID}     		${Username}
    capture page screenshot
    Input Text              ${PasswordID}     		${Password}
    capture page screenshot
    Click Element           ${LoginBtn}
    capture page screenshot
    SPH/SEC_Accept End User License Agreement
    SPH/SEC_Wait For Element    ${WelcomeLink}


SPH/SEC_Accept End User License Agreement
    [Documentation]  Accept end user license agreement
    ${Status}=  Run Keyword and Return status   Wait Until Element Is Visible  ${SPH/SEC_ACCEPT_BTN}    5s
    Run Keyword If  '${Status}'=='${True}'  Run Keywords  SPH/SEC_Scroll Page To Location  0  2000
    ...  AND   click Element  ${SPH/SEC_ACCEPT_BTN}
    ...  AND   SPH/SEC_Scroll Page To Location  0  0


SPH/SEC_Scroll Page To Location
    [Documentation]  Scrolls to the location mentioned
	Sleep  2S
	[Arguments]    ${x_location}    ${y_location}
	Execute JavaScript    window.scrollTo(${x_location},${y_location})


SPH/SEC_If Multiple Pages Found
    [Documentation]  Navigates to multiple pages if more than ten artifacts are present in a single page.
    ...  Takes Total number of pages to navigate and the Files present in first page
    ...  Returns the total numbers of files found after navigating to all the pages
    [Arguments]  ${TotalNumberOfPages}  ${FileCount}
    SPH/SEC_Scroll Page To Location  0  1000
    FOR    ${Page}    IN RANGE    1    ${TotalNumberOfPages}
        Click Element  ${SPH/SEC_NEXT_BTN}
        ${FileCountPerPage}=  Get Element Count  ${SPH/SEC_MULTIPLE_ITEMNAME}
        ${FileCount} =  Evaluate  ${FileCountPerPage}+${FileCount}
    END

    [Return]  ${FileCount}


SPH/SEC_Navigate To Cards And Verify Content
    [Documentation]  Navigates to all the tabs
    ...  [TabName] argument takes name of the tab to be clicked to navigate to all the cards present in each tab
    [Arguments]  ${TabName}

    # Clicks on tab
    wait until keyword succeeds  8x  2s  Click Element   ${TabName}
    SPH/SEC_Wait For Element  ${SPH/SEC_CARDS} [1]

    # Navigates to all the cards and verifes if the artifacts are present when the card is enabled
    ${CardCount}=  Get Element Count  ${SPH/SEC_CARDS}
    FOR    ${Elements}    IN RANGE    1    ${CardCount} + 1
        Click Element       ${SPH/SEC_CARDS} [${Elements}]
		Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SPH/SEC_CARDS} [${Elements}]  timeout=3
        ${BreadcrumbCount}=  Get Element Count  ${SPH/SEC_BREAD_CRUMBS_LINKS}
        Run Keyword If  ${BreadcrumbCount}==3  Run Keywords  SPH/SEC_Wait For Element  ${SPH/SEC_ITEMNAME}
        ...  AND  Click Element       ${SPH/SEC_BREAD_CRUMBS_LINKS} [2]
        ...  AND  SPH/SEC_Wait For Element    ${SPH/SEC_CARDS} [1]
        ...  AND  Click Element  ${TabName}
	    ...  AND  Wait Until Element Is Visible  ${SPH/SEC_CARDS} [${Elements}]
    END


SPH/SEC_Verify Refine By Section
    [Documentation]  To verify filtering.
    ...  Total count of the artifacts must be equal to the number present beside the name under refine by section.
    ...  Takes ID of the checkbox to be checked and the name present beside it as an argument.
    [Arguments]  ${AttributeID}  ${AttributeName}

    # Selects checkbox for a solution
    Execute JavaScript  document.getElementById('${AttributeID}${AttributeName}_input').click()

    # Retrieve the numbers from the braces for that particular solution to compare
    # ...  with the total number of artifacts in that particular solution
    ${Text}=  Execute JavaScript  return document.getElementById('${AttributeID}${AttributeName}').innerText
    ${ExpectedCount}=  fetch_number  ${Text}

    # Counts the total number of artifacts present. If Total number of pages are more than 1, then it will navigate to all pages.
    ${FileCount}=           Get Element Count       ${SPH/SEC_MULTIPLE_ITEMNAME}
    ${PagesToNavigate}=     Get Element Count       ${SPH/SEC_TOTAL_PAGES}
    ${TotalNumberOfPages}=  Evaluate                ${PagesToNavigate}-2
    ${MultiplePages}=       Evaluate                ${TotalNumberOfPages}>0

    ${FileCount}=  Run Keyword If  ${MultiplePages}==True  SPH/SEC_If Multiple Pages Found  ${TotalNumberOfPages}  ${FileCount}

    # Unselects the checkbox
    Execute JavaScript  document.getElementById('${AttributeID}${AttributeName}_input').click()

    # Validates the total number of artifacts present
    Should Be Equal  ${FileCount}  ${ExpectedCount}
    SPH/SEC_Scroll Page To Location  0  0


SPH/SEC_Navigate To Display Preference
    [Documentation]  Navigates to Display preferences in User Preferences
    Click Element               ${SPH/SEC_DROPDOWN_MENU}
    Click Element               ${SPH/SEC_PREFERENCES}
	Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SPH/SEC_DISPLAY_PREFERENCE_CARD}  timeout=2
	Wait Until Element Is Visible  ${SPH/SEC_DISPLAY_PREFERENCE_CARD}  timeout=10
    Click Element               ${SPH/SEC_DISPLAY_PREFERENCE_CARD}


SPH/SEC_Change Records Per List
    [Documentation]  Changes the record per list in user preferences
    ...  ${Index}: Index number of the value to be changes on record per list dropdown
    [Arguments]      ${Index}
    SPH/SEC_Scroll Page To Location  0  0
    # Navigates to display preferences
    SPH/SEC_Navigate To Display Preference

    # Selects 20 in Records per list dropdown
    Select From List By Index   ${SPH/SEC_RECORDSPER_LIST}  ${Index}

    # Saves the changes
    #Mouse Over                  ${SPH/SEC_OPTIONS_BTN}
    Click Element               ${SPH/SEC_SAVEBTN}
    SPH/SEC_Wait For Element    ${SPH/SEC_Message_Center}

    # Clears cache by clicking about link (About link is altered to do so)
    Click Element               ${SPH/SEC_ABOUT_BTN}
    Click Element               ${SPH/SEC_WELCOME_PAGE}


SPH/SEC_Wait For Element
    [Documentation]  Waits till the page contains the required element
    ...  Takes Element address as an argument
    [Arguments]  ${Element}

    FOR    ${WaitCount}    IN RANGE    1    120
        ${Status}=  Run Keyword And Return Status  Page Should Contain Element  ${Element}
        Log  ${Status}
        Exit For Loop If  '${Status}'=='${TRUE}'
        Sleep  1S
    END

    Sleep  2S


SPH/SEC_Navigate To Info Center
    [Documentation]  Navigates to Info Center page
	SPH/SEC_Scroll Page To Location  0  0
    wait until keyword succeeds  5x  2s  Mouse Over     ${SPH/SEC_HAMBURGER}
    wait until keyword succeeds  5x  2s  Click Element  ${SPH/SEC_INFOCENTER_ON_HAMBURGER}
	Mouse Over  	${SPH/SEC_WELCOME_PAGE}
    SPH/SEC_Wait For Element  ${SPH/SEC_CARDS}


COM_Retrieve_Select_Box_Item_Status_And_Index
	[Documentation]  This keyword can be used to get the status if a select box value is present in the select box and returns the correct index
	...  Else it returns False and -1 as index
	...  This keyword takes three arguments, one with the select box object, two with the expected value from the select box, three if case sensitivity is YES or NO
	[Arguments]  ${Select_Box_Object}  ${Expected_Select_Box_Value}  ${Case_Sensitivity_yes_or_no}
	${Case_Sensitivity_yes_or_no}=  Convert To Lowercase  ${Case_Sensitivity_yes_or_no}
	${Expected_Select_Box_Value}=  Evaluate  """${Expected_Select_Box_Value}""".replace(' ','')
	${Expected_Select_Box_Value}=  Run Keyword If  '${Case_Sensitivity_yes_or_no}'=='no'  Convert To Lowercase  ${Expected_Select_Box_Value}
	...  ELSE IF  '${Case_Sensitivity_yes_or_no}'=='yes'  Set Variable  ${Expected_Select_Box_Value}
	@{Select_Box_Items}=  Get List Items  ${Select_Box_Object}
	Log  ${Select_Box_Items}
	${Select_Box_Items_Length}=  Get length  ${Select_Box_Items}
	&{Select_Box_Dict}=  Create Dictionary
	FOR  ${Index}  IN RANGE  0  ${Select_Box_Items_Length}
	    ${Temp_Value}=  Set Variable  ${Select_Box_Items}[${Index}]
	    ${Temp_Value}=  Evaluate  """${Temp_Value}""".replace('\\n','')
	    ${Item_Value}=  Evaluate  """${Temp_Value}""".replace(' ','')
	    ${Item_Value}=  Run Keyword If  '${Case_Sensitivity_yes_or_no}'=='no'  Convert To Lowercase  ${Item_Value}
	    ...  ELSE IF  '${Case_Sensitivity_yes_or_no}'=='yes'  Set Variable  ${Item_Value}
	    Set List Value  ${Select_Box_Items}  ${Index}  ${Item_Value}
	    Set To Dictionary  ${Select_Box_Dict}  ${Select_Box_Items}[${Index}]=${Index}
    END
	Log  ${Select_Box_Dict}
	${Select_Box_Contain_Value}=  Run Keyword And Return Status
	...  Dictionary Should Contain Key  ${Select_Box_Dict}  ${Expected_Select_Box_Value}
	${Expected_Index}=  Run Keyword If  '${Select_Box_Contain_Value}'=='${TRUE}'
	...  Get From Dictionary  ${Select_Box_Dict}  ${Expected_Select_Box_Value}
	...  ELSE  Set Variable  -1
	${Expected_Index}=  Convert To String  ${Expected_Index}
	[Return]  ${Select_Box_Contain_Value}  ${Expected_Index}


UNI_Get_Custom_Page_Screenshot
	[Documentation]  Page screen shot taken by suffixing the sent filename value with the timestamp
	[Arguments]  ${Filename_Value}
	Sleep  2s
	${date}=  Get Current Date  result_format=%m%d%Y
	${time}=  Get Current Date  result_format=%H%M%S
	Capture Page Screenshot  filename=${Filename_Value}_${date}_${time}.png

