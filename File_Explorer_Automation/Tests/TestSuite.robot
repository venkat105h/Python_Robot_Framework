#------------------------------------------------------------------
#   Description       :      TestSuite for UniSecure File Explorer, from where all the test cases are executed.
#   Project           :      UniSecure File Explorer
#   Author            :      Dinesh Kumar
#    © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation   Necessary Libraries and Resources file are mentioned below

Library      BuiltIn
Library      OperatingSystem
Library      String
Variables    ../Variables/${TESTENV}_Variable.py
Library      SeleniumLibrary    timeout=${Selenium_Timeout}    run_on_failure=Nothing
Resource     ../Keywords/Generic_Keywords.robot
Resource     ../Keywords/File_Explorer_Keywords.robot
Resource     ../Locators/File_Explorer_Locators.robot


Suite Setup      Run Keywords  COMMON_Open Browser And Enter URL   ${URL}
                 ...  AND  COMMON_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRoleIndex}
Suite Teardown  Close All Browsers
Test Teardown     Run Keyword    Run Keyword If Test Failed    Capture Page Screenshot


*** Variables ***
${URL}  https://dd-systech-qa2.systechcloud.net/Systech360/#/login


*** Test Cases ***
Pre-condition: Delete all Documents in File explorer
	Set Selenium Speed  0.35s
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    Wait Until Element Is Visible  ${SEC/S360_UPLOAD_FILE_BTN}  timeout=10

    @{Total_Items}=  Get WebElements  ${SEC/S360_UPLOADED_FILE_NAME}

    FOR    ${Item}    IN    @{Total_Items}
        ${Item_Name}=  Get Text  ${Item}
        run keyword and ignore error  SEC/S360_FE_Context Click On File/Folder  ${Item_Name}  ${SEC/S360_DELETE_MENU}
        Sleep  3s
    END

    [Teardown]  Click Element  ${SEC/S360_CLOSE_FMM_BTN}


TC_01 Verify UI of Browse Folder Page
    [Documentation]      Verifies it has four folders and four button on top of the modal
    SEC/S360_FE_Navigate to Browse Folder
    Element Should be Visible  ${SEC/S360_UPLOAD_FILE_BTN}
    Element Should be Visible  ${SEC/S360_DOWNLOAD_FILE_BTN}
    Element Should be Visible  ${SEC/S360_EDIT_FILE_BTN}
    Element Should be Visible  ${SEC/S360_CLOSE_FMM_BTN}

    ${Secure_URL}=  Run Keyword And Return Status  Should Contain  ${URL}  Secure

    ${TotalFoldersCount}=  Set Variable If  '${Secure_URL}'=='${TRUE}'  ${4}  ${3}
    ${TotalFolders}=  Get Element Count  ${SEC/S360_FOLDERS_LIST}
    Should be Equal  ${TotalFolders}   ${TotalFoldersCount}


TC_02 Verify Uploading Files to Document Folder
    [Documentation]  Verifies documents could be uploaded

    # Uploads a file and click on upload button
    SEC/S360_Click on Upload Button and Drop Files  ${File_Name}
    ${Resource_Files_Path}=  Normalize Path  ${CURDIR}/../Resources
    Choose File    ${SEC/S360_CHOOSE_FILE_BUTTON}  ${Resource_Files_Path}${/}${File_Name1}
    SEC/S360_Click On Upload Button and Wait Until Successful Upload

    # Close the upload window
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_UPLOADED_FILE_NAME} [1]

    ${FoundStatus}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    Run Keyword If  '${FoundStatus}'=='${FALSE}'  Fail


TC_03 Verify Removing a File After Dropping into Dialog
    [Documentation]  Verifies the working of remove file button

    SEC/S360_Click on Upload Button and Drop Files  ${File_Name}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_REMOVE_FILE_BTN} [1]
    Element Should Not Be Visible  ${SEC/S360_REMOVE_FILE_BTN} [1]

    [Teardown]  Click Element  ${SEC/S360_CLOSE_FMM_BTN}


TC_04 Verify Adding Tags While Uploading
    [Documentation]  Verifies Tags added while Uploading are displayed
	Set Selenium Speed  0s
    SEC/S360_Click on Upload Button and Drop Files  ${File_Name3}
    wait until keyword succeeds  8x  2s  Input Text  ${SEC/S360_TAGS_TEXTBOX}  ${Tag_Name4}
    SEC/S360_Click On Upload Button and Wait Until Successful Upload

    # Close the upload window
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_UPLOADED_FILE_NAME} [1]
    Page Should Contain Element  ${SEC/S360_REFINE_TAGS}${Tag_Name4}_input
    Element Should Be Visible  ${SEC/S360_REFINE_TAGS}${Tag_Name4}_input


TC_05 Verify Creating A Folder and uploading files
    [Documentation]  Verifies creating new folder and uploading files in it

    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    SEC/S360_FE_Create Folder In Selected Folder  ${Folder_Name}
    SEC/S360_FE_Click On Created Folder  ${Folder_Name}

    SEC/S360_Click on Upload Button and Drop Files  ${File_Name}
    SEC/S360_Click On Upload Button and Wait Until Successful Upload

    # Close the upload window
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_UPLOADED_FILE_NAME} [1]

    ${FoundStatus}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    Run Keyword If  '${FoundStatus}'=='${FALSE}'  Fail
	Set Selenium Speed  0.35s


TC_06 Verify Creating A Folder With the Same Name
    [Documentation]  Verifies creating a folder with duplicate name

    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    SEC/S360_FE_Create Folder In Selected Folder  ${Folder_Name}
    ${Lowecase_Name}=  Convert To Lowercase  ${Folder_Name}
    ${DuplicateStatus}=  SEC/S360_FE_Check For Duplicate File/Folder  ${Lowecase_Name}

    Run Keyword If  '${DuplicateStatus}'=='${TRUE}'  Fail


TC_07 Verify Working of Clear All button
    [Documentation]  Verifies when clear all button is clicked, it clears all the selected files for upload.

    SEC/S360_Click on Upload Button and Drop Files  ${File_Name}
    SEC/S360_FE_Drop Multiple Files in Upload Dialog  ${3}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLEAR_ALL_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_REMOVE_FILE_BTN} [1]
    Element Should Not Be Visible  ${SEC/S360_REMOVE_FILE_BTN} [1]

    [Teardown]  wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}


TC_08 Verify Adding a File as Favorites
    [Documentation]  Verifies if a file is added as favorite, it will be displayed in favourites folder
    
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
	Run Keyword And Ignore Error  SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    SEC/S360_FE_Context Click On File/Folder  ${File_Name}  ${SEC/S360_FAVOURITE_MENU}
	Run Keyword And Ignore Error  SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    Wait Until Element Is Visible  ${SEC/S360_FAV_ICON}
    SEC/S360_FE_Check For Favourites Icon  ${File_Name}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_FAV_FOLDERS}
    SEC/S360_FE_Click On Created Folder  Documents
    ${FoundStatus}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    Run Keyword If  '${FoundStatus}'=='${FALSE}'  Fail


TC_09 Verify Removing a File as Favorites
    [Documentation]  Verifies if a removed as favorite, it will not be displayed in favourites folder
    
    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    SEC/S360_FE_Context Click On File/Folder  ${File_Name}  ${SEC/S360_FAVOURITE_MENU}
    SEC/S360_FE_Wait Until Loading Icon Is Not Visible
    SEC/S360_FE_Check For Favourites Icon  ${File_Name}  ${FALSE}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_FAV_FOLDERS}
    ${FoundStatus}=  SEC/S360_FE_Check for the File Existance  Documents
    Run Keyword If  '${FoundStatus}'=='${TRUE}'  Fail


TC_10 Verify Adding Tags to File and Refine By Tags
    [Documentation]

    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}

    SEC/S360_FE_Click On Created Folder  ${File_Name}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_EDIT_FILE_BTN}
    Wait Until Element Is Visible  ${SEC/S360_TAGS_TEXTBOX}
    SEC/S360_Add Tags To Files  ${Tag_Name1},${Tag_Name2}

    Element Should Be Visible  ${SEC/S360_REFINE_TAGS}${Tag_Name1}_input
    Element Should Be Visible  ${SEC/S360_REFINE_TAGS}${Tag_Name2}_input


TC_11 Verify Refine By Tags
    [Documentation]  Verifies refine by Tags

    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}

    SEC/S360_FE_Click On Created Folder  ${File_Name1}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_EDIT_FILE_BTN}
    Wait Until Element Is Visible  ${SEC/S360_TAGS_TEXTBOX}
    SEC/S360_Add Tags To Files  ${Tag_Name1},${Tag_Name3}

    Select Checkbox  ${SEC/S360_REFINE_TAGS}${Tag_Name1}_input

    ${Tag1File1Status}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    ${Tag1File2Status}=  SEC/S360_FE_Check for the File Existance  ${File_Name1}

    Unselect Checkbox  ${SEC/S360_REFINE_TAGS}${Tag_Name1}_input
    Select Checkbox  ${SEC/S360_REFINE_TAGS}${Tag_Name2}_input

    ${Tag2File1Status}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    ${Tag2File2Status}=  SEC/S360_FE_Check for the File Existance  ${File_Name1}

    Unselect Checkbox  ${SEC/S360_REFINE_TAGS}${Tag_Name2}_input
    Select Checkbox  ${SEC/S360_REFINE_TAGS}${Tag_Name3}_input

    ${Tag3File1Status}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    ${Tag3File2Status}=  SEC/S360_FE_Check for the File Existance  ${File_Name1}

    Run Keyword If  '${Tag1File1Status}'=='${TRUE}' and '${Tag1File2Status}'=='${TRUE}' and '${Tag2File1Status}'=='${TRUE}' and '${Tag2File2Status}'=='${FALSE}' and '${Tag3File1Status}'=='${FALSE}' and '${Tag3File2Status}'=='${TRUE}'  Log  Pass
    ...  ELSE  Fail


TC_12 Verify Sharing a File to a User
    [Documentation]  Verifies Sharing a file to a user and check in the shared users folder
    [Tags]    demo
    sleep    10
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    SEC/S360_FE_Context Click On File/Folder  ${File_Name}  ${SEC/S360_EDIT_MENU}
    SEC/S360_Add Shared Username To File  ${Share_To_User1}
    SEC/S360_Add Shared Username To File  ${Share_To_User2}
    SEC/S360_Save/Cancel Changes in Edit Menu  ${SEC/S360_SAVE_BTN}
    
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_FILE_EXPLORER_MENU}
    COMMON_Common Logout from Application

    COMMON_Enter Credentials and Login To Solution  ${SharedUsername1}  ${Password}  ${AdminRoleIndex}
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_EXPAND_ALL_BTN}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_SWM_DOC_FOLDER}

    ${FoundStatus}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    Run Keyword If  '${FoundStatus}'=='${FALSE}'  Fail
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_FILE_EXPLORER_MENU}
    COMMON_Common Logout from Application

    COMMON_Enter Credentials and Login To Solution  ${SharedUsername2}  ${Password}  ${AdminRoleIndex}
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_EXPAND_ALL_BTN}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_SWM_DOC_FOLDER}
    ${FoundStatus}=  SEC/S360_FE_Check for the File Existance  ${File_Name}
    Run Keyword If  '${FoundStatus}'=='${FALSE}'  Fail

    [Teardown]  Run Keywords  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    ...  AND  Wait Until Element Is Not Visible  ${SEC/S360_FILE_EXPLORER_MENU}
    ...  AND  COMMON_Common Logout from Application


TC_13 Verify Removing Shared File To User
    [Documentation]  Verifies when shared file to a user is removed, the shared user is not able to view the file

    [Setup]  Run Keywords  Go To  ${URL}
    ...  AND  COMMON_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRoleIndex}
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    SEC/S360_FE_Context Click On File/Folder  ${File_Name}  ${SEC/S360_EDIT_MENU}
    SEC/S360_Remove Share For User  ${Share_To_User1}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_SAVE_BTN}
    run keyword and ignore error  Click Element  ${SEC/S360_SAVE_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_SAVE_BTN}
    Wait Until Element Is Visible  ${SEC/S360_FAV_FOLDERS}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_FILE_EXPLORER_MENU}
    COMMON_Common Logout from Application

    COMMON_Enter Credentials and Login To Solution  ${SharedUsername1}  ${Password}  ${AdminRoleIndex}
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_EXPAND_ALL_BTN}
    ${Total_Tree_Items}=  Get Element Count  ${SEC/S360_SWM_TREE_ITEMS}
    Run Keyword If  ${Total_Tree_Items}>${2}  Fail

    [Teardown]  wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}


TC_14 Verify Uploading Multiple Files(120 Items)
    [Documentation]  Verifies uploading 120 files and verifying the uploaded files are displayed in Folder

    [Setup]    Run Keywords  COMMON_Common Logout from Application
    ...  AND  COMMON_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRoleIndex}
	Set Selenium Speed  0s
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_COLLAPSE_ALL_BTN}
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    Wait Until Element Is Visible  ${SEC/S360_UPLOAD_FILE_BTN}  timeout=10
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_UPLOAD_FILE_BTN}
    SEC/S360_FE_Drop Multiple Files in Upload Dialog  ${5}
    SEC/S360_Click On Upload Button and Wait Until Successful Upload
    Run Keyword And Ignore Error  Click Element  ${SEC/S360_CLOSE_FMM_BTN}
	
    [Teardown]  wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_CLOSE_FMM_BTN}


TC_15 Verify Deleting All Item From Documents
    [Documentation]  Verify Deleting all the Items from Documents
	Set Selenium Speed  0.35s
    SEC/S360_FE_Navigate to Browse Folder
    wait until keyword succeeds  8x  2s  Click Element  ${SEC/S360_DOC_FOLDERS}
    Wait Until Element Is Visible  ${SEC/S360_UPLOAD_FILE_BTN}  timeout=10

    ${Total_Items_Count}=   Get Element Count  ${SEC/S360_UPLOADED_FILE_NAME}

    FOR    ${Item}    IN RANGE    0    ${Total_Items_Count}
	    @{Total_Items}=  Get WebElements  ${SEC/S360_UPLOADED_FILE_NAME}
        ${Item_Name}=  Get Text  ${Total_Items}[0]
        SEC/S360_FE_Context Click On File/Folder  ${Item_Name}  ${SEC/S360_DELETE_MENU}
        Sleep  3s
    END
