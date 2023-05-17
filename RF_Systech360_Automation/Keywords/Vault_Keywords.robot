*** Settings ***
Documentation     Common method used accross Test Suite

Variables         ../Variables/Variable.py
Library           String
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=150.0
Library           ../Generic/GenericMethods.py
Library           DiffLibrary
#Library           headless_download
Resource          ../Locators/Vault_Locators.robot


*** Variables ***
${WORKSPACE1} =  aaa
${Local_Path_1}                                 C:/Users/edgar.tumanyan/Documents/UniSphereQA/RF_Systech360_Automation/Files
${GENERIC_PATH_FOR_JENKINS} =                   /home/vnc_user/Jenkins/workspace/Automation/Systech360/3.0/SVT/WebUI/Vault/Automation/RF_Systech360_Automation/Files
#changed by Akash - added new variable for test case
${FILE_PATH_TEST} =                             /Users/akashmalik/Downloads/Systech360_Automation_Master_Sajan_Fork/Systech360_Automation_Sajan/RF_Systech360_Automation
#${FILE_PATH_TEST} = 							${WORKSPACE1}/Vault_Artifacts/Vault_Files
#${FILE_PATH_Generic_1} =                        ${WORKSPACE1}/Vault_Artifacts/Vault_Files
#changes by Akash - changed file path
${FILE_PATH_Generic_1} =                        /Users/akashmalik/Downloads/Systech360_Automation_Master_Sajan_Fork/Systech360_Automation_Sajan/RF_Systech360_Automation/Files
#${FILE_PATH_Generic_1} =                         C:/Users/vazgen.basentsyan/Vault_Artifacts/Vault_Files
${FILE_PATH_Generic} =                          ${WORKSPACE}/Automation/RF_Systech360_Automation/Files/
#${GENEREIC_PATH_FOR_ARTIFACTS} =                /home/vnc_user/Jenkins/workspace/Automation/Systech360/3.0/SVT/WebUI/Vault/Vault_Artifacts/Vault_Generated_Files
#changes by Akash - changed file path
${GENEREIC_PATH_FOR_ARTIFACTS} =                /Users/akashmalik/Downloads/Systech360_Automation_Master_Sajan_Fork/Systech360_Automation_Sajan/RF_Systech360_Automation/Files
#${GENEREIC_PATH_FOR_ARTIFACTS} =                C:/Users/vazgen.basentsyan/Vault_Artifacts/Vault_Generated_Files
${INPUT_FILTER_NAME} =                          new1
${DESCRIPTION} =                                Description
${INPUT_FILE_DESCRIPTION_TEXT_TC_1} =           TC_01 Upload files test
${INPUT_FILE_DESCREPTION_TEXT_TC_2} =           Thisis the new main description 12345--管理单ABCD67890
${INPUT_FILE_DESCREPTION_TEXT_TC_3} =           First batch of 100 files
${INPUT_FILE_DESCREPTION_TEXT_TC_4} =           This is version 2 of Series 1 and Series 2
${INPUT_FILE_DESCREPTION_TEXT_TC_5} =           This is version 3 of Series 1 and Series 2
${INPUT_FILE_DESCREPTION_TEXT_TC_15} =          aaaaaaaaaaaa你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好
${INPUT_FILE_DESCREPTION_TEXT_TC_15_2} =        好你好你好你好你好你好你好你好你好你好你好你好你好你
${TOPIC_TC_1} =                                 TC_01
${TOPIC_TC_2} =                                 TC_06
${TOPIC_TC_3} =                                 SERIES-100
${TOPIC_TC_4} =                                 SERIES-300
${TOPIC_TC_5} =                                 SERIES-400
${TOPIC_TC_15} =
${TOPIC_TC_15_2} =
${Change_CONTROL_ID_TEXT_TC_1} =                12345--管理单ABCD67890
${Change_CONTROL_ID_TEXT_TC_2} =
${Change_CONTROL_ID_TEXT_TC_4} =                300-03030303
${Change_CONTROL_ID_TEXT_TC_5} =                400-04040404
${Change_CONTROL_ID_TEXT_TC_15} =               aaaaaaaaaaaa你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好
${Change_CONTROL_ID_TEXT_TC_15_2} =             你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你
${CHANGE_DESCRIPTION_TEXT_TC_1} =               TC_01 Upload 12345--管理单ABCD67890 Chg Desc
${CHANGE_DESCRIPTION_TEXT_TC_2} =
${CHANGE_DESCRIPTION_TEXT_TC_4} =               This sapplies to the second version of all 501 files
${CHANGE_DESCRIPTION_TEXT_TC_5} =               This sapplies to the third version of all 501 files
${CHANGE_DESCRIPTION_TEXT_TC_15} =              aaaaaaaaaaaa你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好
${CHANGE_DESCRIPTION_TEXT_TC_15_2} =            aaaaaaaaaaaa你好你好你好你好你好
${FILE_1_NAME} =                                abcdefghijklmn-管理单-opqrstuvwxyz.txt
${FILE_3_NAME} =                                zyxwvutsrqpo-管理单-nmlkjihgfedcba.txt
${FILE_4_NAME} =                                管理单-zyxwvutsrqponmlkjihgfedcba--管理单.txt
${FILE_5_NAME} =                                a.txt
${FILE_6_NAME} =                                utf8_sequence_0-0x10ffff_assigned_including-unprintable-asis_unseparated.txt
${FILE_7_NAME} =                                zip.txt
${FILE_8_NAME} =                                c.txt
${FILE_9_NAME} =                                d.txt
${FILE_10_NAME} =                               e.txt

#${FILE_11_NAME} =                               AllVaultSet10K-0000.txt
#${FILE_12_NAME} =                               AllVaultSet10K-0250.txt
#${FILE_13_NAME} =                               AllVaultSet10K-0500.txt
# changes by Akash- changed file to qa2
${FILE_11_NAME} =                               a.txt
${FILE_12_NAME} =                               c.txt
${FILE_13_NAME} =                               e.txt
${FILE_15_NAME} =                               e.txt
#${DOWNLOAD_PATH} =                              C:/Users/edgar.tumanyan/Downloads/
# changes by Akash- changed location to qa2
${DOWNLOAD_PATH} =                              /Users/akashmalik/Downloads/
#using env variable for jenkins job
${FILE_6_DOWNLOAD_PATH} =                       ${DOWNLOAD_PATH}utf8_sequence_0-0x10ffff_assigned_including-unprintable-asis_unseparated.txt
#${FILE_11_DOWNLOAD_PATH} =                      ${DOWNLOAD_PATH}AllVaultSet10K-0000.txt
#${FILE_12_DOWNLOAD_PATH} =                      ${DOWNLOAD_PATH}AllVaultSet10K-0250.txt
#${FILE_13_DOWNLOAD_PATH} =                      ${DOWNLOAD_PATH}AllVaultSet10K-0500.txt
# changes by Akash- changed file to qa2
${FILE_11_DOWNLOAD_PATH} =                      ${DOWNLOAD_PATH}a.txt
${FILE_12_DOWNLOAD_PATH} =                      ${DOWNLOAD_PATH}c.txt
${FILE_13_DOWNLOAD_PATH} =                      ${DOWNLOAD_PATH}e.txt
${Timout} =                                     5s
${ERROR} =                                      None
${FILE_PATH_F15} =                               ${FILE_PATH_Generic_1}/cdefghijklmn-管理单-opqrstuvwxyz.txt
#${FILE_PATH_F1_Fake} =                          u'/home/jenkins_user/Jenkins/workspace/Automation/Systech360/3.0/SVT/WebUI/Vault/Automation/RF_Systech360_Automation/Files/abcdefghijklmn-和-opqrstuvwxyz.txt
${FILE_PATH_F16} =                               ${FILE_PATH_Generic_1}/xwvutsrqpo-管理单-nmlkjihgfedcba.txt
${FILE_PATH_F17} =                               ${FILE_PATH_Generic_1}/管理单-utsrqponmlkjihgfedcba--管理单.txt
${FILE_PATH_F18} =                               ${FILE_PATH_Generic_1}/aa.txt
${FILE_PATH_F1} =                               ${FILE_PATH_Generic_1}/abcdefghijklmn-管理单-opqrstuvwxyz.txt
#${FILE_PATH_F1_Fake} =                          u'/home/jenkins_user/Jenkins/workspace/Automation/Systech360/3.0/SVT/WebUI/Vault/Automation/RF_Systech360_Automation/Files/abcdefghijklmn-和-opqrstuvwxyz.txt
${FILE_PATH_F3} =                               ${FILE_PATH_Generic_1}/zyxwvutsrqpo-管理单-nmlkjihgfedcba.txt
${FILE_PATH_F4} =                               ${FILE_PATH_Generic_1}/管理单-zyxwvutsrqponmlkjihgfedcba--管理单.txt
${FILE_PATH_F5} =                               ${FILE_PATH_Generic_1}/a.txt
${FILE_PATH_F6} =                               ${FILE_PATH_Generic_1}/utf8_sequence_0-0x10ffff_assigned_including-unprintable-asis_unseparated.txt
${FILE_PATH_F7} =                               ${FILE_PATH_Generic_1}/zip.txt
${FILE_PATH_F8} =                               ${FILE_PATH_Generic_1}/c.txt
${FILE_PATH_F9} =                               ${FILE_PATH_TEST}/d.txt
${FILE_PATH_F10} =                              ${FILE_PATH_Generic_1}/e.txt
#${FILE_PATH_F11} =                              ${GENEREIC_PATH_FOR_ARTIFACTS}/AllVaultSet10K-0000.txt
#${FILE_PATH_F12} =                              ${GENEREIC_PATH_FOR_ARTIFACTS}/AllVaultSet10K-0250.txt
#${FILE_PATH_F13} =                              ${GENEREIC_PATH_FOR_ARTIFACTS}/AllVaultSet10K-0500.txt
#changes by Akash - changed file for qa2
${FILE_PATH_F11} =                              ${GENEREIC_PATH_FOR_ARTIFACTS}/a.txt
${FILE_PATH_F12} =                              ${GENEREIC_PATH_FOR_ARTIFACTS}/c.txt
${FILE_PATH_F13} =                              ${GENEREIC_PATH_FOR_ARTIFACTS}/e.txt
${FILE_PATH_F14} =                              ${FILE_PATH_Generic_1}/1.8gb.zip
${DRAFT_STATE} =                                Draft
${VALIDATED_STATE} =                            Validated
${TYPE} =                                       txt
${TYPE_ZIP} =                                   ZIP
${TYPE_RAR} =                                   RAR
#${ADDED_BY} =                                   AdminUser1
#changes by Akash - changed added by
#${ADDED_BY} =                                   RuleUser
${ADDED_BY} =                                   OprUser1
#${ADDED_BY} =                                   Akash_TK
${DESCRIPTION_TC_1} =                           TC_01 Upload files test
${DESCRIPTION_TC_2} =                           12345--管理单ABCD67890
${DESCRIPTION_TC_3} =                           First batch of 100 files
${DESCRIPTION_TC_4} =                           This is version 2 of Series 1 and Series 2
${DESCRIPTION_TC_5} =                           This is version 3 of Series 1 and Series 2
${DESCRIPTION_NULL} =
${Change_CONTROL_ID_NULL} =                     aaaa
${CHANGE_DESCRIPTION_NULL} =                    das
&{VAULT_FILE_METADATA_TC_1} =                   Extention Type=${FILE_TYPE}   Description=${INPUT_FILE_DESCRIPTION_TEXT_TC_1}  Topic=${TOPIC_TC_1}  State=${STATE_DRAFT}  CCID=${Change_CONTROL_ID_TEXT_TC_1}  Change Description=${CHANGE_DESCRIPTION_TEXT_TC_1}  Enable/Disable Switch=${ENABLE/DISABLE_SWITCH}
&{VAULT_FILE_METADATA_TC_2} =                   Extention Type=${EXTENTION_TYPE_RAR}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_2}  Topic=${TOPIC_TC_2}  State=${STATE_VALIDATED}  CCID=${Change_CONTROL_ID_TEXT_TC_2}  Change Description=${CHANGE_DESCRIPTION_TEXT_TC_2}  Enable/Disable Switch=${ENABLE/DISABLE_SWITCH}
&{VAULT_FILE_METADATA_TC_3} =                   Extention Type=${FILE_TYPE}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_3}  Topic=${TOPIC_TC_3}  State=${STATE_DRAFT}  CCID=${Change_CONTROL_ID_TEXT_TC_2}  Change Description=${CHANGE_DESCRIPTION_TEXT_TC_2}  Enable/Disable Switch=${ENABLE/DISABLE_SWITCH}
&{VAULT_FILE_METADATA_TC_4} =                   Extention Type=${FILE_TYPE}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_4}  Topic=${TOPIC_TC_4}  State=${STATE_DRAFT}  CCID=${Change_CONTROL_ID_TEXT_TC_4}  Change Description=${CHANGE_DESCRIPTION_TEXT_TC_4}  Enable/Disable Switch=${ENABLE/DISABLE_SWITCH}
&{VAULT_FILE_METADATA_TC_5} =                   Extention Type=${FILE_TYPE}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_5}  Topic=${TOPIC_TC_5}  State=${STATE_DRAFT}  CCID=${Change_CONTROL_ID_TEXT_TC_5}  Change Description=${CHANGE_DESCRIPTION_TEXT_TC_5}  Enable/Disable Switch=${ENABLE/DISABLE_SWITCH}
&{VAULT_FILE_METADATA_TC_15} =                  Extention Type=${EXTENTION_TYPE_RAR}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_15}  Topic=${TOPIC_TC_15}  State=${STATE_DRAFT}  CCID=${Change_CONTROL_ID_TEXT_TC_15}  Change Description=${CHANGE_DESCRIPTION_TEXT_TC_15}  Enable/Disable Switch=${ENABLE/DISABLE_SWITCH}
&{VAULT_FILE_METADATA_TC_15_2} =                Extention Type=${EXTENTION_TYPE_RAR}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_15_2}  Topic=${TOPIC_TC_15_2}  State=${STATE_DRAFT}  CCID=${Change_CONTROL_ID_TEXT_TC_15_2}  Change Description=${CHANGE_DESCRIPTION_TEXT_TC_15_2}  Enable/Disable Switch=${SWITHCH_ENABLE}
&{VAULT_FILE_METADATA_FILE_1_TC_2} =            File name=${FILE_1_NAME}  State=${VALIDATED_STATE}  Type=${TYPE_RAR}  Added by=${ADDED_BY}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_2}
&{VAULT_FILE_METADATA_FILE_1} =                 File name=${FILE_1_NAME}  State=${DRAFT_STATE}  Type=${TYPE}  Added by=${ADDED_BY}  Description=${DESCRIPTION_TC_1}
&{VAULT_FILE_METADATA_FILE_3} =                 File name=${FILE_3_NAME}  State=${DRAFT_STATE}  Type=${TYPE}  Added by=${ADDED_BY}  Description=${DESCRIPTION_TC_1}
&{VAULT_FILE_METADATA_FILE_4} =                 File name=${FILE_4_NAME}  State=${DRAFT_STATE}  Type=${TYPE}  Added by=${ADDED_BY}  Description=${DESCRIPTION_TC_1}
&{VAULT_FILE_METADATA_FILE_5} =                 File name=${FILE_5_NAME}  State=${DRAFT_STATE}  Type=${TYPE}  Added by=${ADDED_BY}  Description=${DESCRIPTION_TC_1}
&{VAULT_FILE_METADATA_FILE_7} =                 File name=${FILE_7_NAME}  State=${DRAFT_STATE}  Type=${TYPE_ZIP}  Added by=${ADDED_BY}  Description=${DESCRIPTION_NULL}
&{VAULT_FILE_METADATA_FILE_TC_3} =              State=${DRAFT_STATE}  Type=${TYPE}  Added by=${ADDED_BY}  Description=${DESCRIPTION_TC_3}  Version=${VERSION_LOCATOR_1}
&{VAULT_FILE_METADATA_FILE_TC_4} =              State=${DRAFT_STATE}  Type=${TYPE}  Added by=${ADDED_BY}  Description=${DESCRIPTION_TC_4}  Version=${VERSION_LOCATOR_2}
&{VAULT_FILE_METADATA_FILE_TC_5} =              State=${DRAFT_STATE}  Type=${TYPE}  Added by=${ADDED_BY}  Description=${DESCRIPTION_TC_5}  Version=${VERSION_LOCATOR_3}
&{VAULT_FILE_METADATA_TC_FILE_15_2} =           File name=${FILE_15_NAME}  State=${DRAFT_STATE}  Type=${TYPE_RAR}  Added by=${ADDED_BY}  Description=${INPUT_FILE_DESCREPTION_TEXT_TC_15_2}
@{Vault_Card_Metadata} =                        &{VAULT_FILE_METADATA_FILE_1}  &{VAULT_FILE_METADATA_FILE_3}  &{VAULT_FILE_METADATA_FILE_4}  &{VAULT_FILE_METADATA_FILE_5}
@{FILES} =                                      ${FILE_PATH_F15}  ${FILE_PATH_F3}  ${FILE_PATH_F4}  ${FILE_PATH_F1}
@{ADD_ANYWAY_LIST_TC_1} =                       ${ADD_ANYWAY_BUTTON_F1}  ${ADD_ANYWAY_BUTTON_F3}  ${ADD_ANYWAY_BUTTON_F4}  ${ADD_ANYWAY_BUTTON_F5}
${_500} =                                       ${GENEREIC_PATH_FOR_ARTIFACTS}/AllVaultSet10K-0500.txt
${File_Name_500} =                              AllVaultSet10K-0500.txt
@{File_Name} =                                  ${FILE_1_NAME}  ${FILE_3_NAME}  ${FILE_4_NAME}  ${FILE_5_NAME}

*** Keywords ***

Verify That Vault Page loaded
    wait until page contains element  ${VAULT_ELEMENT_FOR_VERIFICATION}

Open Vault Page
    wait until page contains element  ${VAULT_ELEMENT}
    click element  ${VAULT_ELEMENT}
    Verify That Vault Page loaded

Click On Import button
    wait until element is visible  ${IMPORT_BUTTON}  timeout=59s
    wait until element is enabled  ${IMPORT_BUTTON}  timeout=59s
    wait until keyword succeeds  2s   1s  click element  ${IMPORT_BUTTON}

Choose Vault File for Upload
    [Documentation]  Choosing Files on Upload Dialogue
    [Arguments]  ${FILE_PATH}
    wait until page contains element  ${CHOOSE_BUTTON}
    choose file  ${CHOOSE_BUTTON}  ${FILE_PATH}


Check Add Anyway
    FOR    ${a}  IN RANGE  1  4
        ${Locator} =  Catenate  id=replace_existing_file_${a}
        wait until element is visible  ${Locator}
    END

Click On Upload Button
    wait until element is visible  ${UPLOAD_BUTTON}
    wait until element is enabled  ${UPLOAD_BUTTON}
    click element  ${UPLOAD_BUTTON}

Wait Until Upload Add Anyway Or Upload Check Mark To Appear
    [Arguments]  ${ADD_ANYWAY}
    FOR    ${add_anyway}  IN  @{ADD_ANYWAY_LIST_TC_1}
        ${Result} =  Run Keyword And Return Status  wait until element is visible  ${ADD_ANYWAY}
        run keyword if  ${Result}  Check Add Anyway
    END

Wait until Add Anyway Or Upload Check Mark To Appear For Single
    ${Result} =  Run Keyword And Return Status  wait until element is visible  ${ADD_ANYWAY_BUTTON_F1}    340s
    #changes by Akash - added time in add anyway button ,
    run keyword if  ${Result}  wait until element is visible  ${ADD_ANYWAY_BUTTON_F1}   340s    ELSE  wait until element is visible  ${UPLOAD_CHECKMARK_1}     340s

Click On Upload Button for 500 files
    wait until element is visible  ${UPLOAD_BUTTON}
    click element  ${UPLOAD_BUTTON}
    ${Result} =  Run Keyword And Return Status  wait until element is visible  ${UPLOAD_CHECKMARK_1}
    run keyword if  ${Result}  Check Upload Checkmark

Check Upload Checkmark
    #FOR    ${a}  IN RANGE  0  501
    #changes by Akash - changed 501 to 15
    FOR    ${a}  IN RANGE  0  15
        ${Checkmark_Locator_local} =  Catenate  id=file_upload_success_${a}
        wait until element is visible  ${Checkmark_Locator_local}  timeout=240s
    END

Click on new filter button
    wait until element is visible  ${NEW_FILTER_BUTTON}  timeout=20s
    click element  ${NEW_FILTER_BUTTON}
    wait until page contains element  ${FILTER_DETAILS_BUTTON}  timeout=10s

Create new filter and Apply
    Click on new filter button
    wait until element is visible  ${FILTER_NAME_INPUT_FIELD}
    input text  ${FILTER_NAME_INPUT_FIELD}  ${INPUT_FILTER_NAME}
    wait until element is visible  ${FILTER_APPLY_BUTTON}
    click element  ${FILTER_APPLY_BUTTON}

Verify That Vault Card Exist
    wait until element is visible  ${VAULT_CARD_ELEMENT}
    page should contain element  ${VAULT_CARD_ELEMENT}

Select Extention Type In Upload Popup
    click element  ${EXTENTION_TYPE_EXCEL}

Add Anyway (function)
    [Arguments]  ${ADD_ANYWAY}
    wait until element is visible  ${ADD_ANYWAY}
    click element  ${ADD_ANYWAY}

Remove
    mouse over  ${Filter_NEW1}
    click element  ${REMOVE_FILTER}

Check Uplaod Checkmark
    FOR    ${a}  IN RANGE  0  3
        ${Locator} =  Catenate  id=file_upload_success_${a}
        #changes by Akash- changed timeout value from 10 to 30 sec
        wait until element is visible  ${Locator}  timeout=70s
    END

Click on Add Anyway
    [Arguments]  ${ADD_ANYWAY}
    #changes by Akash- added timeout value to 70 sec
    ${Result} =  Run Keyword And Return Status  wait until element is visible  ${ADD_ANYWAY}    timeout=70s
    run keyword if  ${Result}  Add Anyway (function)  ${ADD_ANYWAY}
    wait until element is visible  ${UPLOAD_CHECKMARK_1}  timeout=240s

Remove NEW1 Filter or contionue
    ${Result1} =  Run Keyword And Return Status  wait until element is enabled  ${Filter_NEW1}
    run keyword if  ${Result1}  Remove

Choose Excel Type
    click element  ${EXTENTION_TYPE_EXCEL}

Set Vault File State
    [Arguments]  ${STATE}
    wait until element is visible  ${STATE}
    click element  ${STATE}

Vault Approved State During Upload
    click element  ${STATE_APPROVED}

Vault Validated State During Upload
    click element  ${STATE_VALIDATED}

Click on File Disable/Enable Switch
    [Arguments]  ${ENABLE/DISABLE_SWITCH}
    wait until element is visible  ${ENABLE/DISABLE_SWITCH}
    click element  ${ENABLE/DISABLE_SWITCH}

Input File Description
    [Arguments]  ${FILE_DESCRIPTION_TEXT}
    wait until element is visible  ${DESCRIPTION_ELEMENT}
    input text  ${DESCRIPTION_ELEMENT}  ${FILE_DESCRIPTION_TEXT}

Input File Topic
    [Arguments]  ${TOPIC}
    wait until page contains element  ${TOPIC_ELEMENT}
    input text  ${TOPIC_ELEMENT}  ${TOPIC}

Input File Change Control ID
    [Arguments]  ${CHANGE_CONTROL_ID_TEXT}
    wait until element is visible  ${CHANGE_CONTROL_ID}
    input text  ${CHANGE_CONTROL_ID}  ${CHANGE_CONTROL_ID_TEXT}

Input File Change Description
    [Arguments]  ${CHANGE_DESCRIPTION_TEXT}
    wait until element is visible  ${CHANGE_DESCRIPTION}
    input text  ${CHANGE_DESCRIPTION}  ${CHANGE_DESCRIPTION_TEXT}

Close Upload dialogue
    wait until element is visible  ${UPLOAD_DIALOGUE_CLOSE_BUTTON}  timeout=10s
    wait until element is enabled  ${UPLOAD_DIALOGUE_CLOSE_BUTTON}  timeout=10s
    click element  ${UPLOAD_DIALOGUE_CLOSE_BUTTON}
    sleep  1s  #sometimes click element doesn't work properly, need to use sleep

Clear Upload Popup Top Button
    click element  ${CLEAR_UPLOAD_POPUP_TOP_BUTTON}

Search In filter
    wait until element is visible  ${INPUT_FIELD_IN_SEARCH}
    input text  ${INPUT_FIELD_IN_SEARCH}  ${FILE_1_NAME}

Ignore Upload Second Time
    wait until element is visible  ${IGNORE_UPLOAD_SECOND_TIME}
    click element  ${IGNORE_UPLOAD_SECOND_TIME}

Check Vault Card Name
    wait until page contains  AllVaultSet10K.txt
    wait until page contains  Approved
    wait until page contains  Excel
    wait until page contains  Edgar
    wait until page contains  Description

Click on NEW1 Filter
    click element  ${Filter_NEW1}

Log Out
    click element  ${LOG_OUT_BUTTON}

Click on User button
    wait until page contains element  ${USER_BUTTON}
    click element  ${USER_BUTTON}

Search By Vault File and Verify Metadata
    [Documentation]  Searching by file metadata
    [Arguments]  ${VAULT_FILE_METADATA_FILE}
    Fill Filter Search Input field and Click Apply  ${VAULT_FILE_METADATA_FILE}[File name]
    Vault File Name Verification  ${VAULT_FILE_METADATA_FILE}[File name]
    Vault File State Verification  ${VAULT_FILE_METADATA_FILE}[State]
    Vault File Type Verification  ${VAULT_FILE_METADATA_FILE}[Type]
    Vault File Added by Verification  ${VAULT_FILE_METADATA_FILE}[Added by]
    Vault File Description Verification  ${VAULT_FILE_METADATA_FILE}[Description]

Vault File Name Verification
    [Documentation]
    [Arguments]  ${FILE_NAME}
    wait until element is visible  ${FILE_NAME_ELEMENT}  timeout=20s
    wait until element contains  ${FILE_NAME_ELEMENT}  ${FILE_NAME}  timeout=20s

Vault File State Verification
    [Arguments]  ${STATE}
    wait until element is visible  ${FILE_STATE_ELEMNET}
    wait until element is enabled  ${FILE_STATE_ELEMNET}
    wait until element contains  ${FILE_STATE_ELEMNET}  ${STATE}

Vault File Type Verification
    [Arguments]  ${TYPE}
    wait until element is visible  ${FILE_TYPE_ELEMENT}
    wait until element contains  ${FILE_TYPE_ELEMENT}  ${TYPE}

Vault File Added by Verification
    [Arguments]  ${ADDED_BY_USER}
    wait until element is visible  ${FILE_ADDED_BY_ELEMENT}
    wait until element contains  ${FILE_ADDED_BY_ELEMENT}  ${ADDED_BY_USER}

Vault File Description Verification
    [Arguments]  ${DESCRIPTION_TC_1}
    wait until page contains element  ${FILE_DESCRIPTION_ELEMENT}
    wait until element contains  ${FILE_DESCRIPTION_ELEMENT}  ${DESCRIPTION_TC_1}

Vault File Version Verification
    [Arguments]  ${Version}
    wait until element is visible  ${Version}

Fill Filter Search Input field and Click Apply
    [Arguments]  ${INPUT_FILTER_SEARCH_TEXT}
    set selenium speed  0.1s
    wait until element is visible  ${FILTER_SEARCH_INPUT_FIELD}  timeout=20s
    wait until element is enabled  ${FILTER_SEARCH_INPUT_FIELD}  timeout=20s
    input text  ${FILTER_SEARCH_INPUT_FIELD}  ${INPUT_FILTER_SEARCH_TEXT}
    wait until element is visible  ${SEARCH_FILTER_BUTTON}  timeout=20s
    click element  ${SEARCH_FILTER_BUTTON}

Click on Commands Tab
    wait until element is visible  ${COMMANDS_BUTTON}  timeout=20s
    wait until element is enabled  ${COMMANDS_BUTTON}  timeout=200s
    sleep  1s  #not able to click on commands tab
    click element  ${COMMANDS_BUTTON}

Click on Delete
    wait until element is visible  ${DELETE_VAULT_CARD_BUTTON}
    click element  ${DELETE_VAULT_CARD_BUTTON}

Click on Vault File
    wait until element is visible  ${VAULT_CARD_ELEMENT}
    click element  ${VAULT_CARD_ELEMENT}

Click on Delete From Popup
    wait until element is visible  ${DELETE_BUTTON_FROM_DELETE_POPUP}
    click element  ${DELETE_BUTTON_FROM_DELETE_POPUP}

Verify That Vault Card Doesn't Exist
    Wait Until Page Does Not Contain Element  ${VAULT_CARD_ELEMENT}  ${Timout}  ${ERROR}

Select File Type
    [Arguments]  ${TYPE}
    wait until element is visible  ${FILE_TYPE}
    wait until element is enabled  ${FILE_TYPE}
    click element  ${FILE_TYPE}
    wait until element is visible  ${TYPE}
    wait until element is enabled  ${TYPE}
    click element  ${TYPE}

Fill in Upload Dialoge
    [Arguments]  ${VAULT_FILE_METADATA}
    Select File Type  ${VAULT_FILE_METADATA}[Extention Type]
    Input File Description  ${VAULT_FILE_METADATA}[Description]
    Input File Topic  ${VAULT_FILE_METADATA}[Topic]
    Set Vault File State  ${VAULT_FILE_METADATA}[State]
    Input File Change Control ID  ${VAULT_FILE_METADATA}[CCID]
    Input File Change Description  ${VAULT_FILE_METADATA}[Change Description]
    Click on File Disable/Enable Switch  ${VAULT_FILE_METADATA}[Enable/Disable Switch]

Choose Files for Upload
    [Arguments]  ${filePaths}
    FOR    ${filePath}  IN  @{filePaths}
        Choose Vault File for Upload    ${filePath}
    END

Choose File_1 File_3 File_4 File_5 for Upload
    [Arguments]  ${FILE_PATH_1}  ${FILE_PATH_2}  ${FILE_PATH_3}  ${FILE_PATH_4}
    Choose Vault File for Upload  ${FILE_PATH_1}
    Choose Vault File for Upload  ${FILE_PATH_2}
    Choose Vault File for Upload  ${FILE_PATH_3}
    Choose Vault File for Upload  ${FILE_PATH_4}

Remove Vault File
    Remove NEW1 Filter or contionue
    Click on new filter button
    Create new filter and Apply
    Fill Filter Search Input field and Click Apply  ${FILE_1_NAME}
    Verify That Vault Card Exist
    Click on Vault File
    Click on commands tab
    Click on Delete
    Click on Delete From Popup

Come back to initial page
    [Documentation]  This is the place from where import button is clickable
    Reload Page

Open Import Popup
    Click On Import button

Remove Existing filter/Create new filter and apply it
    [Documentation]  If we already have filter 'NEW1' oru test will remove it and create again
    Remove NEW1 Filter or contionue
    Click on new filter button
    Create new filter and Apply

Enter File Metadata and Upload Files
    [Arguments]  ${Vault_File_Metadata}  ${Add_Anyway_List}
    [Documentation]  Entering File Parameters/Metadata, (For example description, CCID ...) after it Uploading files
    Fill in Upload Dialoge  ${Vault_File_Metadata}
    Click On Upload Button
    Wait Until Upload Add Anyway Or Upload Check Mark To Appear  ${Add_Anyway_List}
    Adding anyway  ${Add_Anyway_List}
    Close Upload dialogue

Enter File Metadata and Upload single File
    [Arguments]  ${Vault_File_Metadata}  ${Add_Anyway_button_locator}
    [Documentation]  Entering File Parameters/Metadata, (For example description, CCID ...) after it Uploading files
    Fill in Upload Dialoge  ${Vault_File_Metadata}
    Click On Upload Button
    Wait until Add Anyway Or Upload Check Mark To Appear For Single
    Click on Add Anyway  ${Add_Anyway_button_locator}
    Close Upload dialogue

Adding anyway
    [Arguments]  ${add_anyway}
    FOR    ${add_anyway}  IN  @{ADD_ANYWAY_LIST_TC_1}
        Click on Add Anyway    ${add_anyway}
    END
    Check Uplaod Checkmark

Search by Vault File Metadata
    [Arguments]  ${metadata}
    FOR    ${metadata}  IN  @{Vault_Card_Metadata}
        Search By Vault File and Verify Metadata  ${metadata}
    END
Choose 500 Vault Files for Upload
    ${files}=  list files in directory  ${GENEREIC_PATH_FOR_ARTIFACTS}
    FOR    ${file}  IN  @{files}
         ${fullPath} =  Catenate  ${GENEREIC_PATH_FOR_ARTIFACTS}/${file}
         Choose Vault File for Upload  ${fullPath}
         Exit For Loop If    "${fullPath}" == "${_500}"
    END
Add Anyway 500 files
    #FOR    ${a}  IN RANGE  0  501
    #changed by Akash - changed 501 to 15
    FOR    ${a}  IN RANGE  0  15
        ${Add_Anyway_Locator_Local} =  Catenate  id=replace_existing_file_${a}
        ${Checkmark_Locator_local} =  Catenate  id=file_upload_success_${a}
        Click on Add Anyway  ${Add_Anyway_Locator_Local}
        wait until element is visible  ${Checkmark_Locator_local}  timeout=59s
        wait until element is enabled  ${Checkmark_Locator_local}  timeout=59s
    END
Search By Vault File name
    [Arguments]  ${VAULT_FILE_METADATA}  ${file_name}
#    ${files}=  list files in directory  ${GENEREIC_PATH_FOR_ARTIFACTS}
#    :FOR  ${file}  IN  @{files}
    Fill Filter Search Input field and Click Apply  ${file_name}
    Vault File Name Verification  ${file_name}
    Vault File State Verification  ${VAULT_FILE_METADATA}[State]
    Vault File Type Verification  ${VAULT_FILE_METADATA}[Type]
    Vault File Added by Verification  ${VAULT_FILE_METADATA}[Added by]
    Vault File Description Verification  ${VAULT_FILE_METADATA}[Description]
    Vault File Version Verification  ${VAULT_FILE_METADATA}[Version]
#    Exit For Loop If    "${file}" == "${File_Name_500}"

All Add Anyway exist
#    FOR    ${a}  IN RANGE  0  501
#changes by Akash- as files folder has 15 files only.
    FOR    ${a}  IN RANGE  0  15
        ${Locator} =  Catenate  id=replace_existing_file_${a}
        wait until element is visible  ${Locator}  timeout=159s
        wait until element is enabled  ${Locator}  timeout=159s
    END
#changes by Akash - commented End to remove it
    #END

Download File
    wait until element is visible  ${DOWNLOAD_BUTTON}  timeout=10s
    wait until element is enabled  ${DOWNLOAD_BUTTON}  timeout=10s
    click element  ${DOWNLOAD_BUTTON}

Click On upload when enabled
    click element  ${UPLOAD_BUTTON}

Add anyway 500 file if
    [Arguments]  ${ADD_ANYWAY}
    ${Result} =  Run Keyword And Return Status  wait until element is visible  ${ADD_ANYWAY}  timeout=100s
    run keyword if  ${Result}  All Add Anyway exist
    run keyword if  ${Result}  Add Anyway 500 files

Upload 500 Files
    [Arguments]  ${VAULT_FILE_METADATA}
    Choose 500 Vault Files for Upload
    Fill in Upload Dialoge  ${VAULT_FILE_METADATA}
    Click On Upload Button for 500 files
    Add anyway 500 file if  ${ADD_ANYWAY_LOCATOR}
    Close Upload dialogue

Click on Filter
    Set Selenium Speed  0.1s
    wait until element is visible  ${NEW1_FILTER_LOCATOR}  timeout=10s
    wait until element is enabled  ${NEW1_FILTER_LOCATOR}  timeout=10s
    click element  ${NEW1_FILTER_LOCATOR}

Click on 'new1' Filter or Create New Filter
    ${Result} =  Run Keyword And Return Status  wait until element is visible  ${NEW1_FILTER_LOCATOR}  timeout=10s
    run keyword if  ${Result}  Click on Filter  ELSE  Create new filter and Apply

Clear Upload Page
    wait until element is visible  ${CLEAR_BUTTON}
    click element  ${CLEAR_BUTTON}

Select zip for upload
    wait until element is visible  ${EXTENTION_TYPE_ZIP}
    click element  ${EXTENTION_TYPE_ZIP}

Download file and compare
    [Arguments]  ${File_name}  ${FILE_PATH}  ${FILE_DOWNLOAD_PATH}
    Click on 'new1' Filter or Create New Filter
    Fill Filter Search Input field and Click Apply   ${File_name}
    wait until keyword succeeds    10x    1s    Click on Commands Tab
    Download File
    Wait Until Created  ${FILE_DOWNLOAD_PATH}  timeout=30s
    #changes by Akash - uncommented it to do file comparison
    wait until keyword succeeds  4s  2s  Diff Files  ${FILE_PATH}  ${FILE_DOWNLOAD_PATH}
    Remove File  ${FILE_DOWNLOAD_PATH}
    Wait Until Removed  ${FILE_DOWNLOAD_PATH}

Upload Single File
    [Arguments]  ${File_Path}  ${Add_Anyway_button}
    capture page screenshot
    Choose Vault File for Upload   ${File_Path}
    capture page screenshot
    click on upload button
    capture page screenshot
    Wait until Add Anyway Or Upload Check Mark To Appear For Single
    capture page screenshot
    Click on Add Anyway  ${Add_Anyway_button}
    capture page screenshot
    Close Upload dialogue

Verify .txt extention
    [Arguments]  ${File_path}  ${File_Name}
    Fill Filter Search Input field and Click Apply  ${File_Name}
    wait until keyword succeeds    10x    1s    Click on Commands Tab
#    ${S2L}           get library instance    SeleniumLibrary
##    ${webdriver}    Call Method             ${S2L}    _current_browser
#    ${Sessionid}    Call Method             ${S2L}    get_session_id

#    ${lib} =     Get Library Instance    SeleniumLibrary
#    ${dr1} =    Set Variable   ${lib.driver}
#    log to console  ${dr1}
#    ${ss1} =  set variable  ${dr1.session_id}
#    log to console  ${ss1}

#    Enable Download In Headless Chrome  ${dr1}  ${FILE_6_DOWNLOAD_PATH}  ${ss1}
    Download File
    wait until keyword succeeds  4s  2s  Wait Until Created  ${FILE_6_DOWNLOAD_PATH}
    Remove File  ${FILE_6_DOWNLOAD_PATH}
    Wait Until Removed  ${FILE_6_DOWNLOAD_PATH}

Check CCID And CD
    [Arguments]  ${CCID_TEXT}  ${CD_TEXT}
    click element  ${VERSION_BUTTON}
    wait until element contains  ${FILE_CCID}  ${CCID_TEXT}
    wait until element contains  ${FILE_CHANGE_DESCRIPTION}   ${CD_TEXT}

Fill Upload Field With Max Length And Enter Unicode Chars
    [Arguments]  ${FIlE_PATH}  ${VAULT_FILE_METADATA_1}  ${VAULT_FILE_METADATA_2}
    Choose Vault File for Upload  ${FIlE_PATH}
    Fill in Upload Dialoge  ${VAULT_FILE_METADATA_1}
    wait until page contains  Max length 512 characters
    Fill in Upload Dialoge  ${VAULT_FILE_METADATA_2}
    Click On Upload Button
    Click on Add Anyway  ${ADD_ANYWAY_BUTTON_F1}
    Close Upload dialogue

Check File Version
    [Arguments]  ${FILE_NAME}  ${VERSION_LOCATOR}
    Fill Filter Search Input field and Click Apply  ${FILE_NAME}
    wait until element is visible  ${VERSION_LOCATOR}  timeout=10s
    wait until element is visible  ${VERSION_BUTTON}   timeout=10s
    #changed by Akash - time from 1s to 6s
    sleep  6s  #sometimes not able to have UI loaded, need to use sleep for build stability
    click element  ${VERSION_BUTTON}
    wait until element contains  ${VERSION_LABLE_LOCATOR}  1

Upload File With Different Name
    [Arguments]  ${FILE_PATH}
    Open Import Popup
    Choose Vault File for Upload  ${FILE_PATH}
    Click On Upload Button
    wait until page contains  The content of this file matches the content of file
    Click on Add Anyway  ${ADD_ANYWAY_BUTTON_F1}
    Close Upload dialogue
