#------------------------------------------------------------------
#   Description       :      Test Cases for Training Center
#   Project           :      Systech360 Training Center Automation
#   Author            :      Dinesh Kumar
#   © 2019   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Pre-conditions / Pre-requisites:
#   - NA
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation  Test cases for UniSphere Training Center
Library     BuiltIn
Library     SeleniumLibrary    timeout=50
Library     String
Library     Collections
Resource    ../Locators/Generic_Locators.robot
Resource    ../Locators/Training_Center_Locators.robot
Variables   ../Variables/${TESTENV}_Variable.py
Library     ../Generic/GenericMethods.py
Resource    ../Keywords/Generic_Keywords.robot

*** Keywords ***
SPH/SEC_TC_Verify Cascading menu of Training center
    [Documentation]  To Verify all the options when mouse hovered on Training Center.

    # Click on Hamburger menu and mouse hover in Training Center
    Click Element   ${UNI_HAMBURGER_MENU}
    Click Element      ${UNI_TRAINING_CENTER_ON_HAM}
	Wait Until Page Contains Element  ${SEC/SPH_TRAINING_SCHEDULE_ON_HAM}
	UNI_Get_Custom_Page_Screenshot  Training_Center

    # Verify if elements are visible
    Element Should Be Visible  ${SEC/SPH_TRAINING_SCHEDULE_ON_HAM}      message=TrainingScheduleText is not displayed
    Element Should Be Visible  ${SEC/SPH_UNRESTRICTED_VIDEOS_ON_HAM}    message=UnrestrictedVideosText is not displayed
    Element Should Be Visible  ${SEC/SPH_VIDEO_SUBS_ON_HAM}     message=VideoSubscriptionText is not displayed
    Mouse Over  ${UNI_WELCOME_LINK}

SPH/SEC_TC_Verify Clicking on Training Center
    [Documentation]  To Verify all the Tabs are displayed when clicked on Training Center in Hamburger menu.

    # Click on Hamburger menu and click on Training Center
    Click Element   ${UNI_HAMBURGER_MENU}
    Click Element   ${UNI_TRAINING_CENTER_ON_HAM}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/SPH_TRAINING_SCHEDULE_CARD}
    Wait Until Element Is Visible  ${SEC/SPH_TRAINING_SCHEDULE_CARD}

    # Mouse hover on Video Subscription Card, so that Training Schedule Card is visible
    Mouse Over  ${UNI_WELCOME_LINK}

    # To Verify cards are displayed.
    Element Should Be Visible   ${SEC/SPH_TRAINING_SCHEDULE_CARD}      message=TrainingScheduleCard is not displayed
    Element Should Be Visible   ${SEC/SPH_UNRESTRICTED_VIDEOS_CARD}    message=UnrestrictedVideosCard is not displayed
    Element Should Be Visible   ${SEC/SPH_VIDEO_SUBS_CARD}     message=VideoSubscriptionCard is not displayed

SPH/SEC_TC_Verify Calendars in Training Schedule
     [Documentation]  To verify if Training Schedule contains calender

    # Clicks on Training Schedule Card
    Click Element           ${SEC/SPH_TRAINING_SCHEDULE_CARD}
    UNI_Wait For Element    ${SEC/SPH_TRAINING_COURSES} [1]

    # Gets the number of calenders present
    ${NumberOfTrainingCourses}=  Get Element Count  ${SEC/SPH_TRAINING_COURSES}

    # Returns back to Training Center page
    Click Element           ${UNI_BREADCRUMB_LINK} [2]
    UNI_Wait For Element    ${SEC/SPH_UNRESTRICTED_VIDEOS_CARD}

    UNI_Scroll Page To Location  0  0

    # Verifies if calender is present
    ${Status}=  Evaluate  ${NumberOfTrainingCourses}>0
    Run Keyword If  '${Status}'=='${FALSE}'  Fail

SPH/SEC_TC_Verify Breadcrumbs
    [Documentation]  To verify breadcrumbs bar is appended when a card is clicked and should be same name as the card.
    ...  ${CardName} : Name of the card to be clicked.

    [Arguments]  ${CardName}

    # Retrieves card name of being clicked to verify same name displayed in breadcrumb
    ${ExpectedValue}=  Get Text  ${CardName}

    # Clicks on Card
    Click Element           ${CardName}
    UNI_Wait For Element    ${UNI_ITEM_NAME}

    # Retrieves the value of last navigated breadcrumb
    ${TotalBreadcrumbCount}=    Get Element Count  ${UNI_BREADCRUMB_LINK}
    ${ActualValue}=  Get Text    ${UNI_BREADCRUMB_LINK} [${TotalBreadcrumbCount}]

    # Verifies if the card name and the breadcrumb names are same
    ${Status}=  Run Keyword And Return Status  Should Be Equal  ${ActualValue}  ${ExpectedValue}
    Run Keyword If  '${Status}'!='${TRUE}'  Fail

SPH/SEC_TC_Verify Searching an Artifact
    [Documentation]  To verify when an artifact is searched, only the arifacts
    ...  containing Searched Text must be displayed.
    ...  ${SearchFile}:  File to be searched for

    [Arguments]  ${SearchFile}
    Log  ${SearchFile}
    # Enters Search file name in search bar
    Input Text  ${UNI_SEARCH_TXT_BOX}  ${SearchFile}

    # To verify if all the artifacts displayed contains the searched text
    ${TotalFileCount}=  Get Element Count       ${UNI_MULTIPLE_ITEM_NAME}
    FOR    ${Index}    IN RANGE    1         ${TotalFileCount}
           ${ActualidPath}=  catenate  SEPARATOR=  ${UNI_ITEM_NAME_ID}  ${Index}
           ${Value} =   Get Text               ${ActualidPath}
           ${LValue}=   Convert To Lowercase   ${Value}
           ${Result}=  should contain  ${LValue}  ${SearchFile}
    END
    ${CharacterCount}=  Get Length    ${SearchFile}
    FOR    ${Index}    IN RANGE     ${CharacterCount}
        Press Key    ${UNI_SEARCH_TXT_BOX}    \\8
    END

SPH/SEC_TC_Verify Clicking on First Artifact
    [Documentation]  To verify when an artifacts is clicked, it should open
    ...  and simultaneously views count should increase by 1.
	Click Element  ${UNI_SORT_BY_DD}
    wait until element is visible  ${UNI_SORTBY_LIKES_BTN}
    Click Element  ${UNI_SORTBY_LIKES_BTN}
	
    # Get the views count before clicking artifact
    ${ViewCountBeforeClick}=  Get Text  ${UNI_VIEWS_COUNT}

    # Clicks on first artifact
    Click Element  ${UNI_ITEM_NAME}

    # Get back to Main windows
#    ${Windows_name}=  Get Window Titles
#    Switch Window  MAIN
    go back

    # Get the views count after clicking artifact
    ${ViewCountAfterClick}=  Get Text  ${UNI_VIEWS_COUNT}

    # Evaluates the difference between ViewCountAfter and ViewCountAfter
    ${Difference}=  Evaluate   ${ViewCountAfterClick} - ${ViewCountBeforeClick}
    Run Keyword If  ${Difference}==1  Log  Clicked on first artifact successfully
    ...  ELSE   Fail  Test Case failed as value is ${Difference}

SPH/SEC_TC_Verify Liking an Artifact
    [Documentation]  To verify when an artifacts is liked, Likes count is increased by 1.

    # Get the likes count before clicking Like button
    ${LikesCountBeforeClick}=  Get Text  ${UNI_LIKES_COUNT}

    # Click on Like button
    Click Element  ${UNI_LIKES_COUNT}

    # Get the likes count after clicking Like button
    ${LikesCountAfterClick}=  Get Text  ${UNI_LIKES_COUNT}

    # Evaluates the difference between LikesCountAfter and LikesCountBefore
    ${Difference}=  Evaluate  ${LikesCountAfterClick} - ${LikesCountBeforeClick}
    Run Keyword If  ${Difference}==1  Log  PASSED
    ...  ELSE  Fail  Test Case failed as value is ${Difference}

SPH/SEC_TC_Verify Adding a Comment
    [Documentation]  To Verify we should be able to add comment and a successful message is displayed.

    # Select Likes under Sort By dropdown
    Select From List By Index  ${UNI_SORT_BY_DD}  3

    # Add comment in Comment text box for first Artifact
    Click Element  ${UNI_COMMENT_BUTTON}
    Input Text     ${UNI_COMMENT_TXT_BOX}  Test
    Click Element  ${UNI_ADD_COMMENT_BTN}

    # Verify Success message
    ${Message}=  Get Text  ${UNI_SUCCESS_MSG}
    ${Status}=  Run Keyword And Return Status  Element Should Be Visible  ${UNI_SUCCESS_MSG}
    Click Element  ${UNI_COMMENT_BUTTON}

    Run Keyword If  '${Status}'!='${TRUE}'  Fail

SPH/SEC_TC_Verify Sorting By Likes Ascending Order
   [Documentation]  To verify sorting by likes. It should be sortred in Ascending order of their Likes Count.

    # Select Likes under Sort By dropdown
    Select From List By Index  ${UNI_SORT_BY_DD}  3

    # Click on Ascending
    Click Element  ${UNI_ASCENDING_BTN}

    # Checks if the first value of likes count is greater than or equal to the second value
    ${TotalLikesCountElement}=  Get Element Count  ${UNI_MULTIPLE_LIKES_COUNT}
     FOR    ${Index}  IN RANGE    0    ${TotalLikesCountElement}-1
            ${NextIndex}=      Evaluate    ${Index}+1
            ${FirstValue}=     Get Text    ${UNI_LIKES_COUNTID}${Index}
            ${SecondValue}=    Get Text    ${UNI_LIKES_COUNTID}${NextIndex}
            ${Result}=         Evaluate    ${FirstValue}<=${SecondValue}
            Run Keyword If  '${Result}'=='${FALSE}'  Fail
     END

SPH/SEC_TC_Verify Sorting By Views Descending Order
    [Documentation]  To verify sorting by Views. It should be sortred in Descending order of their Views Count.

    # Select Views under Sort By dropdown
    Select From List By Index  ${UNI_SORT_BY_DD}  2

    # Click on Descending
    Click Element  ${UNI_DESCENDING_BTN}

    # Checks if the first value of views count is greater than or equal to the second value
    ${TotalViewsCountElement}=  Get Element Count  ${UNI_MULTIPLE_VIEWS_COUNT}
     FOR    ${Index}  IN RANGE    0        ${TotalViewsCountElement}-1
            ${NextIndex}=      Evaluate    ${Index}+1
            ${FirstValue}=     Get Text    ${UNI_VIEWS_COUNT_ID}${Index}
            ${SecondValue}=    Get Text    ${UNI_VIEWS_COUNT_ID}${NextIndex}
            ${Result}=         Evaluate    ${FirstValue}>=${SecondValue}
            Run Keyword If  '${Result}'=='${FALSE}'  Fail
     END

SPH/SEC_TC_Verify Sorting By Published Descending Order
    [Documentation]  To verify sorting by Published Date. It should be sortred in Descending order of their Published Date.

    # Creates a list to store actual values
    @{ActualSort}=  Create List

    # Select Published Date under Sort By dropdown
    Select From List By Index  ${UNI_SORT_BY_DD}  0

    # Click on Descending
    Click Element  ${UNI_DESCENDING_BTN}

    # Stores all the Published Date values in ActualSort List in the same order as displayed
    ${TotalPublishedDateElement}=  Get Element Count  ${UNI_MULTIPLE_PUBLISHED_DATE}
    FOR    ${Index}    IN RANGE    0    ${TotalPublishedDateElement}
           ${Value}=   Get Text    ${UNI_PUBLISHED_DATE_ID}${Index}
           Insert Into List        ${ActualSort}  ${Index}  ${Value}
    END
    # Create a duplicate List to compare
    ${ExpectedSort}=  Copy List   ${ActualSort}

    # Sort the duplicate List in descending order
    sort_dates_descending  ${ExpectedSort}

    # Validates if both the Lists are equal
    Lists Should Be Equal  ${ExpectedSort}  ${ActualSort}