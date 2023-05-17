#------------------------------------------------------------------
#   Description       :      Test Cases for Information Center
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
Documentation     Necessary Libraries and Resources file are mentioned below

Library      BuiltIn
Library      SeleniumLibrary
Library      Collections
Library      ../Generic/Generic_Methods_IC.py
Resource      ./Generic_Keywords.robot
Resource     ../Locators/Generic_Locators.robot
Resource     ../Locators/Info_Center_Locators.robot
Variables    ../Variables/${TESTENV}_Variable.py

*** Keywords ***
SPH/SEC_IC_Verify Cascading menu of Info center
    [Documentation]  To Verify all the options when mouse hovered on Information Center.
    # Click on Hamburger menu and mouse hover in Information Center
	Wait Until Element Is Visible  ${SPH/SEC_HAMBURGER}  timeout=10
	Click Element   ${SPH/SEC_HAMBURGER}
	Click Element	${SPH/SEC_INFOCENTER_ON_HAMBURGER}
	UNI_Get_Custom_Page_Screenshot  Info_Center
	Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${SPH/SEC_GENERAL_TXT}  timeout=10
    # Verify if elements are visible
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible  ${SPH/SEC_GENERAL_TXT}
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible  ${SPH/SEC_PRODUCT_TXT}
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible  ${SPH/SEC_GAMP_TXT}
    Click Element  ${SPH/SEC_WELCOME_PAGE}


SPH/SEC_IC_Verify 3 Tabs Displayed After Clicking on Info center
    [Documentation]  To Verify 3 tabs are displayed when clicked on Information Center in Hamburger menu.
    # Click on Hamburger menu and click on Information Center
    Click Element   ${SPH/SEC_HAMBURGER} 
    Click Element   ${SPH/SEC_INFOCENTER_ON_HAMBURGER} 

    # Mouse hover on Systech GAMP Tab, so that General Tab is visible
    Mouse Over	${SPH/SEC_WELCOME_PAGE}
    UNI_Get_Custom_Page_Screenshot  Info_Center
	Run Keyword And Ignore Error  Wait Until Element Is Visible  ${SPH/SEC_GENERAL_TAB}  timeout=10

    # To Verify Tabs are displayed.
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible  ${SPH/SEC_GENERAL_TAB}
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible  ${SPH/SEC_PRODUCT_TAB}
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  3x  2s  Element Should Be Visible  ${SPH/SEC_GAMP_TAB}


SPH/SEC_IC_Verify Cascading Menu And Enabled Cards
    [Documentation]  To Verify disabled cards are disabled in cascading menu
    ...  ${MenuName}          : Cascading menu to be checked
    ...  ${TabName}           : Tab name  to be clicked and checked
    ...  ${CascadingMenuName} : Address of sub-cascading menu list
    [Arguments]     ${MenuName}    ${CascadingMenuName}

    @{CardNameList}=  Create List
    @{MenuNameList}=  Create List

    # Mouse hovers on Cascading menu to be checked
     Click Element  ${SPH/SEC_HAMBURGER}
     Click Element  ${SPH/SEC_INFOCENTER_ON_HAMBURGER}
     UNI_Get_Custom_Page_Screenshot  Info_Center
     Click Element  ${MenuName}
	Sleep  3S

    # Counts the number of sub-cascading menu
    ${TotalMenuCount}=  Get Element Count  ${CascadingMenuName}

    # Retrieves menu name and insert into array if disabled
    FOR    ${Index}    IN RANGE    0    ${TotalMenuCount}
        ${Text}=   Get Text    ${CascadingMenuName} [${Index} + 1]
        ${AttributeValue}=  Get Element Attribute  ${CascadingMenuName} [${Index}+1]  class
        ${DisabledStatus}=  Run Keyword And Return Status  Should Contain  ${AttributeValue}  disabled
        Run Keyword If  '${DisabledStatus}'=='${TRUE}'  Insert Into List  ${MenuNameList}  ${Index}  ${Text}
    END

    # Clicks on the tab to be checked
    Click Element   ${MenuName}

    #Waits until cards are displayed
    SPH/SEC_Wait For Element  ${SPH/SEC_CARDS}
    UNI_Get_Custom_Page_Screenshot  Info_Center
    Mouse Over  ${SPH/SEC_WELCOME_PAGE}

    # Counts the number of cards
    ${TotalCardsCount}=    Get Element Count  ${SPH/SEC_CARDS}
    Log  ${TotalCardsCount}

    # Retrieves card name and insert into array if disabled
    FOR    ${Index}    IN RANGE    0    ${TotalCardsCount}
        ${Text}=   Get Text    ${SPH/SEC_CARDS} [${Index} + 1]
        ${AttributeValue}=  Get Element Attribute  ${SPH/SEC_CARD_SECTION} [${Index}+1]  class
        ${DisabledStatus}=  Run Keyword And Return Status  Should Contain  ${AttributeValue}  grey
        Run Keyword If  '${DisabledStatus}'=='${TRUE}'  Insert Into List  ${CardNameList}  ${Index}  ${Text}
    END

    #Verifies if Cascading Menu list and Cards list are same
    Lists Should Be Equal       ${CardNameList}           ${MenuNameList}


SPH/SEC_IC_Verify When Tab Is Clicked The Respective Tab Is Activated
    [Documentation]  To Verify when a particular tab is clicked, it is focused in that particular tab.
    ...  ${TabName}:  Name of the Tab to be clicked to verify UI of each tab
    # Name of the tab to be clicked
    [Arguments]     ${TabName}

    # Click on above mentioned Tab
    Click Element   ${TabName}

    # Waits util card are displayed under the tab
    SPH/SEC_Wait For Element  ${SPH/SEC_CARDS}

    # Counts the number of cards
    ${TotalCardsCount}=    Get Element Count  ${SPH/SEC_CARDS}
    Log  ${TotalCardsCount}

    # Retrieves card name
    FOR    ${Index}    IN RANGE    1    ${TotalCardsCount} + 1
        ${Text}=  Get Text    ${SPH/SEC_CARDS} [${Index}]
        Log  ${Text}
    END

    # Gets the value of class attribute, which is changed to 'tab-selected' when clicked on tab
    ${ClassName}=  Get Element Attribute  ${TabName}  ${Attribute_Name}
    ${Status}=  Run Keyword And Return Status  Should Contain  ${ClassName}  ${Expected_Value}
    Run Keyword If  '${Status}'=='${TRUE}'  Log  clicked on General Tab
    ...  ELSE  Fail  Did not click on required Tab


SPH/SEC_IC_Verify Breadcrumbs
    [Documentation]  To verify breadcrumbs bar is appended when a card is clicked and should be same name as the card.

    [Arguments]  ${CardNameID}

    # Retrieves card name of being clicked to verify same name displayed in breadcrumb
    ${ExpectedValue}=  Get Text  ${CardNameID}

    # Clicks on Card
    Click Element           ${CardNameID}
    SPH/SEC_Wait For Element    ${SPH/SEC_ITEMNAME}

    # Retrieves the value of last navigated breadcrumb
    ${TotalBreadcrumbCount}=    Get Element Count  ${SPH/SEC_BREAD_CRUMBS_LINKS}
    ${ActualValue}=  Get Text    ${SPH/SEC_BREAD_CRUMBS_LINKS} [${TotalBreadcrumbCount}]

    # Verifies if the card name and the breadcrumb names are same
    ${Status}=  Run Keyword And Return Status  Should Be Equal  ${ActualValue}  ${ExpectedValue}
    Run Keyword If  '${Status}'!='${TRUE}'  Fail


SPH/SEC_IC_Verify Searching an Artifact
	[Documentation]  To verify when an artifact is searched, only the arifacts
	...  containing Searched Text must be displayed.
	...  ${SearchFile}:  File to be searched for
	[Arguments]  ${SearchFile}
	
	${Result}=  Set Variable  ${FALSE}
	# Enters Search file name in search bar
	Input Text  ${SPH/SEC_SEARCH_BOX}    ${SearchFile}

	# To verify if all the artifacts displayed contains the searched text
	${TotalFileCount}=  Get Element Count  ${SPH/SEC_MULTIPLE_ITEMNAME}
	FOR    ${Index}    IN RANGE    0      ${TotalFileCount}
		 ${Value}=   Get Text		${SPH/SEC_ItemNameID}${Index}
		 ${Result}=  Run Keyword And Return Status 	Should Contain     ${Value}  ${SearchFile}
    END

#    ${CharacterCount}=  Get Length  ${SearchFile}
#    FOR    ${Index}    IN RANGE    ${CharacterCount}
#        Press Keys    ${SPH/SEC_SEARCH_BOX}     \\8
#    END
    Input Text    ${SPH/SEC_SEARCH_BOX}    ${EMPTY}    TRUE

	[Return]	${Result}


SPH/SEC_IC_Verify Clicking on First Artifact
    [Documentation]  To verify when an artifacts is clicked, it should open
    ...  and simultaneously views count should increase by 1.
    # Get the views count before clicking artifact
    ${ViewCountBeforeClick}=  Get Text  ${SPH/SEC_VIEWS_COUNT} 

    # Clicks on first artifact
    Click Element  ${SPH/SEC_ITEMNAME}

    # Get back to Main windows
    @{Windows_Names}=  Get Window Titles
    Switch Window  MAIN

    # Verifies total number of windows should not be <2
    ${NumOfWindows}=  Get Length  ${Windows_Names}
    Run Keyword If  ${NumOfWindows}<2  Fail

    # Get the views count after clicking artifact
    ${ViewCountAfterClick}=  Get Text  ${SPH/SEC_VIEWS_COUNT} 

    # Evaluates the difference between ViewCountAfter and ViewCountAfter
    ${Difference}=  Evaluate   ${ViewCountAfterClick} - ${ViewCountBeforeClick}
    Run Keyword If  ${Difference}!=1  Fail


SPH/SEC_IC_Verify Liking an Artifact
    [Documentation]  To verify when an artifacts is liked, Likes count is increased by 1.
    # Get the likes count before clicking Like button
    ${LikesCountBeforeClick}=  Get Text  ${SPH/SEC_LIKES_COUNT}

    # Click on Like button
    Click Element  ${SPH/SEC_LIKES_COUNT}

    # Get the likes count after clicking Like button
    ${LikesCountAfterClick}=  Get Text  ${SPH/SEC_LIKES_COUNT}

    # Evaluates the difference between LikesCountAfter and LikesCountBefore
    ${Difference}=  Evaluate  ${LikesCountAfterClick} - ${LikesCountBeforeClick}
    Run Keyword If  ${Difference}==1  Log  PASSED
    ...  ELSE  Fail  Test Case failed as value is ${Difference}


SPH/SEC_IC_Verify Adding a Comment
    [Documentation]  To Verify we should be able to add comment and a successful message is displayed.
    # Add comment in Comment text box for first Artifact
    wait until keyword succeeds    5x    1s    Click Element  ${SPH/SEC_COMMENT_BTN}
    Input Text     ${SPH/SEC_COMMENT_BOX}         Test
    Click Element  ${SPH/SEC_ADDCOMMENT_BTN}

    # Verify Success message
    ${Message}=  Get Text  ${SPH/SEC_SuccessMessage}
    ${Status}=  Run Keyword And Return Status  Element Should Be Visible  ${SPH/SEC_SuccessMessage}

    Click Element  ${SPH/SEC_COMMENT_BTN} 

    Run Keyword If  ${Status}==False  Fail


SPH/SEC_IC_Verify Sorting By Likes Ascending Order
    [Documentation]  To verify sorting by likes. It should be sortred in Ascending order of their Likes Count.
    # Select Likes under Sort By dropdown
    Select From List By Index  ${SPH/SEC_SORTBY}  3

    # Click on Ascending
    Click Element  ${SPH/SEC_ASCENDING} 

    # Checks if the first value of likes count is greater than or equal to the second value
    ${TotalLikesCountElement}=  Get Element Count  ${SPH/SEC_MULTIPLE_LIKES_COUNT}
    FOR    ${Index}  IN RANGE    0    ${TotalLikesCountElement}-1
        ${NextIndex}=      Evaluate    ${Index}+1
        ${FirstValue}=     Get Text    ${SPH/SEC_LIKES_COUNTID}${Index}
        ${SecondValue}=    Get Text    ${SPH/SEC_LIKES_COUNTID}${NextIndex}
        ${Result}=         Evaluate    ${FirstValue}<=${SecondValue}
        Run Keyword If  ${Result}==False  Fail
    END


SPH/SEC_IC_Verify Sorting By Views Descending Order
    [Documentation]  To verify sorting by Views. It should be sortred in Descending order of their Views Count.
    # Select Views under Sort By dropdown
    Select From List By Index  ${SPH/SEC_SORTBY}  2

    # Click on Descending
    Click Element  ${SPH/SEC_Descending}

    # Checks if the first value of views count is greater than or equal to the second value
    ${TotalViewsCountElement}=  Get Element Count  ${SPH/SEC_MULTIPLE_VIEWS_COUNT}
    FOR    ${Index}  IN RANGE    0    ${TotalViewsCountElement}-1
            ${NextIndex}=      Evaluate    ${Index}+1
            ${FirstValue}=     Get Text    ${SPH/SEC_VIEWS_COUNTID}${Index}
            ${SecondValue}=    Get Text    ${SPH/SEC_VIEWS_COUNTID}${NextIndex}
            ${Result}=         Evaluate    ${FirstValue}>=${SecondValue}
            Run Keyword If  ${Result}==False  Fail
    END


SPH/SEC_IC_Verify Sorting By Published Descending Order
    [Documentation]  To verify sorting by Published Date. It should be sortred in Descending order of their Published Date.
    # Creates a list to store actual values
    @{ActualSort}=  Create List

    # Select Published Date under Sort By dropdown
    Select From List By Index  ${SPH/SEC_SORTBY}  0

    # Click on Descending
    Click Element  ${SPH/SEC_Descending}

    # Stores all the Published Date values in ActualSort List in the same order as displayed
    ${TotalPublishedDateElement}=  Get Element Count  ${SPH/SEC_MULTIPLE_PUBLISHED_DATES}
    FOR    ${Index}    IN RANGE    0    ${TotalPublishedDateElement}
           ${Value}=  Get Text    ${SPH/SEC_PUBLISHED_DATEID}${Index}
           Insert Into List       ${ActualSort}  ${Index}  ${Value}
    END

    # Create a duplicate List to compare
    ${ExpectedSort}=  Copy List   ${ActualSort}

    # Sort the duplicate List in descending order
    sort_dates_descending  ${ExpectedSort}

    # Validates if both the Lists are equal
    Lists Should Be Equal  ${ExpectedSort}  ${ActualSort}


SPH/SEC_IC_Navigate To Specific Card
    [Documentation]  Navigate to Specific card
    [Arguments]  ${CascadingMenuName}  ${SubMenuName}

    # Navigate to specific card for the cascading menu
    Click Element              ${SPH/SEC_HAMBURGER}
    Click Element                 ${SPH/SEC_INFOCENTER_ON_HAMBURGER}
    UNI_Get_Custom_Page_Screenshot  Info_Center
    Click Element                 ${CascadingMenuName}
    Click Element              ${SubMenuName}
    UNI_Get_Custom_Page_Screenshot  Info_Center
    Mouse Over                ${SPH/SEC_WELCOME_PAGE}
    SPH/SEC_Wait For Element   ${SPH/SEC_MULTIPLE_ITEMNAME} [1]


SPH/SEC_IC_Records Per Page In Information Center
    [Documentation]  Verify number of records per page displayed
    # Change the value of record per list in Preferences and navigate to Information Center
    SPH/SEC_Change Records Per List  1

    SPH/SEC_IC_Navigate To Specific Card  ${SPH/SEC_PRODUCT_TXT}  ${SPH/SEC_RELEASE_NOTES_TXT}

    # Verifies if Total Count is less than 20
    ${TotalFileCount}=  Get Element Count  ${SPH/SEC_MULTIPLE_ITEMNAME}
    Run Keyword If  ${TotalFileCount}>20  Fail

    # Change the value of record per list in Preferences and navigate to Information Center
    SPH/SEC_Change Records Per List  0

    SPH/SEC_IC_Navigate To Specific Card  ${SPH/SEC_PRODUCT_TXT}  ${SPH/SEC_RELEASE_NOTES_TXT}

    # Verifies if Total Count is less than 10
    ${TotalFileCount}=  Get Element Count  ${SPH/SEC_MULTIPLE_ITEMNAME}
    Run Keyword If  ${TotalFileCount}>10  Fail


SPH/SEC_IC_Verify Documents in All Enabled Cards
    [Documentation]  To Navigate to all the cards present and verify if all the enabled card contains artifacts.
    # Navigates to Information center page
    Click Element           ${SPH/SEC_HAMBURGER} 
    Click Element           ${SPH/SEC_INFOCENTER_ON_HAMBURGER} 
    SPH/SEC_Wait For Element    ${SPH/SEC_CARDS} [1]
    Mouse Over  ${SPH/SEC_GAMP_TAB}

    SPH/SEC_Navigate To Cards And Verify Content   ${SPH/SEC_GENERAL_TAB}
    SPH/SEC_Navigate To Cards And Verify Content   ${SPH/SEC_PRODUCT_TAB}
    SPH/SEC_Navigate To Cards And Verify Content   ${SPH/SEC_GAMP_TAB}


SPH/SEC_IC_Verify New Item Indicator Count
    [Documentation]  Verifies the Artifacts uploaded in UniCloud present in UniSphere/UniSecure
    [Arguments]  ${TabName}   ${NewItemIndicator}  ${CardName}   ${ExpectedCount}

    # Navigates to Info center page
    SPH/SEC_Navigate To Info Center
    Click Element           ${TabName}
    SPH/SEC_Wait For Element    ${CardName}

    # Get the new Item indicator count
     Click Element           ${CardName}
     wait until element is visible    ${NewItemIndicator}  timeout=120
     ${NewArtifacts}=  Get Text  ${NewItemIndicator}
     ${NewArtifacts} =    fetch from left    ${NewArtifacts}    ${slicer1}
     ${NewArtifacts} =    fetch from right    ${NewArtifacts}    ${slicer2}
     SPH/SEC_Wait For Element    ${SPH/SEC_ITEMNAME}

    # Verifies the total number of documents upploaded
	Run Keyword If   '${NewArtifacts}'!='${ExpectedCount}'  Fail

