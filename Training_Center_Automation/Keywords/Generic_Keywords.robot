#------------------------------------------------------------------
#   Description       :      Common methods which can be called in any test case
#   Project           :      Systech360 Training Center Automation
#   Author            :      Dinesh Kumar
#   © 2019   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Preconditions / Pre-requisites:
#   - NA
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation     Common method used accross Test Suite

Library     BuiltIn
Library     SeleniumLibrary
Library		DateTime
Library     ../Generic/GenericMethods.py
Resource    ../Locators/Generic_Locators.robot
Resource    ../Locators/Training_Center_Locators.robot
Variables   ../Variables/${TESTENV}_Variable.py

*** Keywords ***
UNI_Open Browser And Enter URL
    [Documentation]  Launched browser, Navigates to specified URL and Logs in to the solution by entering username and password

    wait until keyword succeeds  10x  2s  Open Browser            ${URL}  ${Browser_type}
    Set Window Size         ${WINDOW_WIDTH}          ${WINDOW_HEIGHT}

UNI_Enter Credentials and Login to Application
    [Documentation]  Enters credentials and logins to the open application

    Input Text              ${UNI_USERNAME_TXT_BOX}  ${SEC_Username}
    Input Text              ${UNI_PASSWORD_TXT_BOX}  ${SEC_Password}
    Click Element           ${UNI_LOGIN_BUTTON}
    UNI_Accept End User License Agreement
    UNI_Wait For Element    ${UNI_WELCOME_LINK}

UNI_Accept End User License Agreement
    ${Status}=  Run Keyword and Return status   Wait Until Element Is Visible  ${UNI_ACCEPT_BTN}
    Run Keyword If  '${Status}'=='${True}'  Run Keywords  UNI_Scroll To Element  ${UNI_ACCEPT_BTN}}
    ...  AND   click Element  ${UNI_ACCEPT_BTN}
    ...  AND   UNI_Scroll Page To Location  0  0
UNI_Scroll To Element
    [Documentation]  Scrolls till element is visible

     [Arguments]  ${ElementLocator}

    FOR  ${Index}   IN RANGE  0  5
       ${Visibility}=  Run Keyword And Return Status  Element Should Not Be Visible  ${ElementLocator}
       Exit For Loop If  '${Visibility}'=='${FALSE}'
       Execute JavaScript    window.scrollTo(0, 2000)
       ${ElementAddress}=   RUN KEYWORD AND IGNORE ERROR  Get Webelement   ${ElementLocator}
       ${Status}=           Run Keyword And Return Status  Should Not Contain  ${ElementAddress}  FAIL
       Exit For Loop If  '${Status}'=='${TRUE}'
    END
UNI_Scroll Page To Location
    [Documentation]  Scrolls to the location mentioned

	[Arguments]    ${x_location}    ${y_location}
	Execute JavaScript    window.scrollTo(${x_location}, ${y_location})

UNI_If Multiple Pages Found
    [Documentation]  Navigates to multiple pages if more than ten artifacts are present in a single page.
    ...  Takes Total number of pages to navigate and the Files present in first page
    ...  Returns the total numbers of files found after navigating to all the pages

    [Arguments]  ${TotalNumberOfPages}  ${FileCount}

    FOR    ${Page}    IN RANGE    1    ${TotalNumberOfPages}
       sleep  2s
	 	Execute JavaScript    window.scrollTo(0, 3000)
       Click Element  ${UNI_NEXT_BTN}
       sleep  2s
       ${FileCountPerPage}=  Get Element Count  ${UNI_MULTIPLE_ITEM_NAME}
       ${FileCount} =  Evaluate  ${FileCountPerPage}+${FileCount}
    END
    [Return]  ${FileCount}

UNI_Verify Refine By Section
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
    ${FileCount}=           Get Element Count       ${UNI_MULTIPLE_ITEM_NAME}
    ${PagesToNavigate}=     Get Element Count       ${UNI_TOTAL_PAGES_LINK}
    ${TotalNumberOfPages}=  Evaluate                ${PagesToNavigate}-2
    ${MultiplePages}=       Evaluate                ${TotalNumberOfPages}>0
	Sleep  3s

    ${FileCount}=  Run Keyword If  '${MultiplePages}'=='${TRUE}'  UNI_If Multiple Pages Found  ${TotalNumberOfPages}  ${FileCount}

    # Unselects the checkbox
    Execute JavaScript  document.getElementById('${AttributeID}${AttributeName}_input').click()

    # Validates the total number of artifacts present
    Should Be Equal  ${FileCount}  ${ExpectedCount}
    UNI_Scroll Page To Location  0  0

UNI_Wait For Element
    [Documentation]  Waits till the page contains the required element
    ...  Takes Element address as an argument

    [Arguments]  ${Element}

    FOR    ${WaitCount}    IN RANGE    1    60
          ${Status}=  Run Keyword And Return Status  Page Should Contain Element  ${Element}
           Log  ${Status}
           Exit For Loop If  '${Status}'=='${TRUE}'
           Sleep  1S
    END
     Sleep  2S


UNI_Get_Custom_Page_Screenshot
	[Documentation]  Page screen shot taken by suffixing the sent filename value with the timestamp
	[Arguments]  ${Filename_Value}
	Sleep  2s
	${date}=  Get Current Date  result_format=%m%d%Y
	${time}=  Get Current Date  result_format=%H%M%S
	Capture Page Screenshot  filename=${Filename_Value}_${date}_${time}.png
