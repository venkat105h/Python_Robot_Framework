#------------------------------------------------------------------
#   Description       :      Common methods which can be called in any test case
#   Project           :      UniSecure File Explorer
#   Author            :      Dinesh Kumar
#   © 2019   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation     Common method used accross Test Suite

Variables         ../Variables/${TESTENV}_Variable.py
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           SeleniumLibrary  timeout=60.0
Resource          ../Locators/Generic_Locators.robot
Resource          ../Locators/File_Explorer_Locators.robot
Library           ../Generic/GenericMethods.py


*** Keywords ***

SEC/S360_FE_Navigate to Browse Folder
    [Documentation]  Launched browser, Navigates to specified URL

    Sleep  2S
    Wait Until Element Is Visible  ${UNI_HAMBURGER_MENU}
    Click Element   ${UNI_HAMBURGER_MENU}
	Mouse Over		${UNI_BROWSE_HAM}
	Click Element   ${UNI_FOLDERS_HAM}
	SEC/S360_FE_Wait Until Loading Icon Is Not Visible
	Wait Until Element Is Visible  ${SEC/S360_UPLOAD_FILE_BTN}  timeout=60


SEC/S360_FE_Create Folder In Selected Folder
    [Documentation]  Create a folder in the folder which is selected
    [Arguments]  ${NameOfFolder}

    wait until keyword succeeds  8x  2s  Click Element   ${SEC/S360_ADD_FOLDER_BTN}
	Wait Until Page Contains Element  ${SEC/S360_FOLDER_NAME_TEXTBOX}  timeout=40
	Wait Until Element is Visible  ${SEC/S360_FOLDER_NAME_TEXTBOX}  timeout=40
	Wait Until Element Is Enabled  ${SEC/S360_FOLDER_NAME_TEXTBOX}  timeout=40
	Click Element  ${SEC/S360_FOLDER_NAME_TEXTBOX}
	COMMON_Clear Text Field  ${SEC/S360_FOLDER_NAME_TEXTBOX}
    wait until keyword succeeds  5x  2s  Press Keys  ${SEC/S360_FOLDER_NAME_TEXTBOX}  ${NameOfFolder}
    wait until keyword succeeds  5x  2s  Click Element   ${SEC/S360_BROWSE_PATH_FIELD}


SEC/S360_FE_Drop Multiple Files in Upload Dialog
    [Documentation]  Drops multiple file in the upload dialog
    [Arguments]  ${NumOfFiles}
    ${Resource_Files_Path}=  Normalize Path  ${CURDIR}/../Resources
    ${TotalFiles}=  Count Files In Directory  ${Resource_Files_Path}
    @{FilesNames}=  List Files In Directory   ${Resource_Files_Path}

    ${TotalFiles}=  Set Variable If  ${NumOfFiles}<${TotalFiles}  ${NumOfFiles}  ${TotalFiles}

    FOR  ${FileIndex}  IN RANGE  0  ${TotalFiles}
        Choose File    ${SEC/S360_CHOOSE_FILE_BUTTON}  ${Resource_Files_Path}${/}${FilesNames}[${FileIndex}]
    END


SEC/S360_FE_Check for the File Existance
    [Documentation]  Verifies the required file is present in the folder or not
    [Arguments]  ${RequiredFile}

    ${FoundStatus}=  Set Variable  ${FALSE}
    ${TotalFiles}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}
    FOR  ${Index}  IN RANGE  1  ${TotalFiles}+1
        ${FileNameText}=  Get Text  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]
        ${FoundStatus}=  Run Keyword And Return Status  Should Be Equal  '${FileNameText}'  '${RequiredFile}'
        ${FoundStatus}=  Set Variable If  '${FoundStatus}'=='${TRUE}'   ${TRUE}  ${FALSE}
        Run Keyword If  '${FoundStatus}'=='${TRUE}'  Exit For Loop
    END

    [Return]  ${FoundStatus}


SEC/S360_FE_Click On Created Folder
    [Documentation]  Verifies the required file is present in the folder or not
    [Arguments]  ${NameOfFolder}

    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    ${FoundStatus}=  Set Variable  ${FALSE}
    ${TotalFiles}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}
    FOR    ${Index}  IN RANGE  1  ${TotalFiles}+1
        ${FileNameText}=  Get Text  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]
        ${FoundStatus}=  Run Keyword And Return Status  Should Be Equal  '${FileNameText}'  '${NameOfFolder}'
        ${FoundStatus}=  Set Variable If  '${FoundStatus}'=='${TRUE}'   ${TRUE}  ${FALSE}
        Run Keyword If  '${FoundStatus}'=='${TRUE}'  Run Keywords  Double Click Element  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]
        ...  AND  Exit For Loop
    END

    [Return]  ${FoundStatus}


SEC/S360_FE_Context Click On File/Folder
    [Documentation]  Opens the context menu for the requires file/folder
    [Arguments]  ${NameOfFolder}  ${ActionButton}

    ${FoundStatus}=  Set Variable  ${FALSE}
    ${TotalFiles}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}
    FOR    ${Index}  IN RANGE  1  ${TotalFiles}+1
        ${FileNameText}=  Get Text  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]
        ${FoundStatus}=  Run Keyword And Return Status  Should Be Equal  '${FileNameText}'  '${NameOfFolder}'
        ${FoundStatus}=  Set Variable If  '${FoundStatus}'=='${TRUE}'   ${TRUE}  ${FALSE}
        Run Keyword If  '${FoundStatus}'=='${TRUE}'  Run Keywords  Open Context Menu  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]
        ...  AND  Click Element  ${ActionButton}
        ...  AND  SEC/S360_FE_Wait Until Loading Icon Is Not Visible
        ...  AND  Exit For Loop
    END


SEC/S360_FE_Check For Favourites Icon
    [Documentation]  Opens the context menu for the requires file/folder
    [Arguments]  ${NameOfFile}  ${Visible_Status}=${TRUE}

    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    ${FoundStatus}=  Set Variable  ${FALSE}
    ${TotalFiles}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}
    FOR    ${Index}  IN RANGE  1  ${TotalFiles}+1
        ${FileNameText}=  Get Text  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]
        ${FoundStatus}=  Run Keyword And Return Status  Should Be Equal  '${FileNameText}'  '${NameOfFile}'
        Run Keyword If  '${FoundStatus}'=='${TRUE}' and ${Visible_Status}=='${TRUE}'  Run Keywords  Element Should Be Visible  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]/../i/span/i[1]
        ...  AND  Exit For Loop
        ...  ELSE IF  '${FoundStatus}'=='${TRUE}' and ${Visible_Status}=='${FALSE}'  Run Keywords  Element Should NOT Be Visible  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]/../i/span/i[1]
        ...  AND  Exit For Loop
    END


SEC/S360_FE_Check For Duplicate File/Folder
    [Documentation]  Verifies the required file is present in the folder or not
    [Arguments]  ${NameOfFile/Folder}

    ${FoundStatus}=  Set Variable  ${FALSE}
    ${DuplicateStatus}=  Set Variable  ${FALSE}
    ${NamesList}=  Create List
    ${TotalFiles}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}
    FOR    ${Index}  IN RANGE  1  ${TotalFiles}+1
        ${FileNameText}=  Get Text  ${SEC/S360_UPLOADED_FILE_NAME} [${Index}]
        ${FoundStatus}=  Run Keyword And Return Status  Should Be Equal  '${FileNameText}'  '${NameOfFile/Folder}'  case_insensitive=True
        ${FoundStatus}=  Set Variable If  '${FoundStatus}'=='${TRUE}'   ${TRUE}  ${FALSE}
        Run Keyword If  '${FoundStatus}'=='${TRUE}'  Append To List  ${NamesList}  ${FileNameText}
    END

    @{MatchingList}=  Get Matches  ${NamesList}  ${NameOfFile/Folder}
    ${LenghtOfMatchingList}=  Get Length  ${MatchingList}
    ${DuplicateStatus}=  Set Variable If  ${LenghtOfMatchingList}>=${2}  ${TRUE}  ${FALSE}

    [Return]  ${DuplicateStatus}


SEC/S360_Click on Upload Button and Drop Files
    [Documentation]  Clicks on upload button and drops the file in the dialog
    [Arguments]  ${NameOfFile}

    Wait Until Element Is Visible  ${SEC/S360_UPLOAD_FILE_BTN}  timeout=10
    Sleep  1S
    ${Resource_Files_Path}=  Normalize Path  ${CURDIR}/../Resources
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_UPLOAD_FILE_BTN}

    Choose File    ${SEC/S360_CHOOSE_FILE_BUTTON}  ${Resource_Files_Path}${/}${NameOfFile}
    Wait Until Element Is Visible  ${SEC/S360_REMOVE_FILE_BTN}  timeout=20


SEC/S360_Add Shared Username To File
    [Documentation]  Adds the user to be shared to and saves the changes
    [Arguments]  ${SharedUsername}

    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_TAGS_TEXTBOX}
    wait until keyword succeeds  8x  2s  Input Text  ${SEC/S360_SHARE_USER_TEXT_FIELD}  ${SharedUsername}
    Sleep  1S
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_ADD_USER_BTN}
    Wait Until Element Is Visible  ${SEC/S360_SHARED_USER_TEXT} [1]


SEC/S360_Save/Cancel Changes in Edit Menu
    [Documentation]  Click on Save/Cancel button after updating fields
    [Arguments]  ${Button}

    wait until keyword succeeds  15x  2s  Click Element  ${Button}
    run keyword and ignore error  Click Element  ${Button}
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_FAV_FOLDERS}


SEC/S360_Add Tags To Files
    [Documentation]  Adds the user to be shared to and saves the changes
    [Arguments]  ${Tags}

    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_TAGS_TEXTBOX}
    wait until keyword succeeds  8x  2s  Input Text  ${SEC/S360_TAGS_TEXTBOX}  ${Tags}
    Sleep  1S
    SEC/S360_Save/Cancel Changes in Edit Menu  ${SEC/S360_SAVE_BTN}
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible


SEC/S360_Expand And Click Folder
    [Documentation]  Expands and clicks on the required folder
    [Arguments]  ${Tree_Item}  ${Folder_Name}

    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_EXPAND_ALL_BTN}
    ${Total_Tree_Items}=  Get Element Count  ${Tree_Item}

    FOR    ${Index}  IN RANGE  1  ${Total_Tree_Items}+1
        ${Text}=  Get Text  ${Tree_Item} [${Index}]
        Run Keyword If  '${Text}'=='${Folder_Name}'  Run Keywords  Click Element  ${Tree_Item} [${Index}]
        ...  AND  Exit For Loop
    END


SEC/S360_Remove Share For User
    [Documentation]  Removes the user in the shared List
    [Arguments]  ${Shared_User}

    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_SHARED_USER_TEXT} [1]
    ${Total_Users}=  Get Element Count  ${SEC/S360_SHARED_USER_TEXT}

    FOR    ${Index}  IN RANGE  1  ${Total_Users}+1
        ${UserName}=  Get Text  ${SEC/S360_SHARED_USER_TEXT} [${Index}]
        Run Keyword If  '${UserName}'=='${Shared_User}'  Run Keywords  Click Element  ${SEC/S360_REMOVE_SHARED_USER_BTN} [${Index}]
        ...  AND  Exit For Loop
    END


SEC/S360_Click On Upload Button and Wait Until Successful Upload
    [Documentation]  Clicks on upload file button and waits until progress bar reached 100
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_UPLOAD_BTN}

    ${Progress_Status}=  Get Element Attribute  ${SEC/S360_UPLOAD_BAR_STATUS}  aria-valuenow
    ${ProgressBar_Visibility}=  Set Variable  ${TRUE}

    FOR    ${Count}  IN RANGE  0  240
        ${ProgressBar_Visibility}=  Run Keyword And Return Status  Element Should Be Visible  ${SEC/S360_UPLOAD_BAR_STATUS}
        Exit For Loop If  '${ProgressBar_Visibility}'=='${FALSE}'
        ${Progress_Status}  wait until keyword succeeds    5x    1s    Get Element Attribute  ${SEC/S360_UPLOAD_BAR_STATUS}  aria-valuenow
        Run Keyword If  '${Progress_Status}'!='100'  Sleep  2S
        Exit For Loop If  '${Progress_Status}'=='100'
    END

    wait until keyword succeeds  15x  2s  Wait Until Element Is Not Visible  ${SEC/S360_REMOVE_FILE_BTN} [1]  timeout=120
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible


SEC/S360_Download File And Verify
    [Documentation]  Downloads the file and verifies the file is downloaded
    [Arguments]  ${NameOfFile}

    SEC/S360_FE_Click On Created Folder  ${NameOfFile}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOWNLOAD_FILE_BTN}
    Sleep  10S


SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    [Documentation]  Waits until loading icon is not visible
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${SEC/S360_LOADING_ICON}  timeout=5
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_LOADING_ICON}  timeout=60

