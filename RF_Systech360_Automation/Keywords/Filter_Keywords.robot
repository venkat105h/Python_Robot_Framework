*** Settings ***
Documentation     Common method used accross Test Suite

Variables         ../Variables/${TESTENV}_Variable.py
Library           String
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=10.0
Library           DiffLibrary
Resource          ../Locators/Vault_Locators.robot
Resource          ../Locators/Filter_Locators.robot

*** Variables ***
${Topic_for_prerequisite_files} =   Vault-UC-1
#changes by Akash - file path
#${FILE_PATH_Generic_Filter} =  /home/vnc_user/Jenkins/workspace/Automation/Systech360/3.0/SVT/WebUI/Vault/Vault_Artifacts/Vault_Files
${FILE_PATH_Generic_Filter} =   /Users/akashmalik/Downloads/Systech360_Automation_Master_Sajan_Fork/Systech360_Automation_Sajan/RF_Systech360_Automation/Files
#File Names
${File_1_Name_Filter} =             abcdefghijklmn-管理单-opqrstuvwxyz.txt
${File_2_Name_Filter} =             abcdefghijklmn-管理单-opqrstuvwxyz_File_2.txt
${File_3_Name_Filter} =             zyxwvutsrqpo-管理单-nmlkjihgfedcba.txt
${File_4_Name_Filter} =             管理单-zyxwvutsrqponmlkjihgfedcba--管理单.txt
${File_5_Name_Filter} =             a.txt
${File_6_Name_Filter} =             Fixed-date-06-10-2019-001.txt
${File_7_Name_Filter} =             Fixed-date-06-11-2019-002.txt
${File_8_Name_Filter} =             Fixed-date-06-12-2019-003.txt
${File_9_Name_Filter} =             Fixed-date-06-13-2019-004.txt
${File_10_Name_Filter} =            Fixed-date-06-14-2019-005.txt

#Test Case 1 Variables
${TC_1_FILTER_NAME} =               1-Equals
${TC_1_FROM} =                      1/1/2019
${TC_1_FILE_NAME} =                 a.txt
${FILE_COUNT_1} =                   1

#Test Case 2 Variables
${TC_2_FILTER_NAME_1} =             2-Does Not Equals
${TC_2_FILTER_NAME_2} =             3-Begins with
${TC_2_FROM} =                      1/1/2019
${TC_2_FILE_NAME_1} =               a.txt
${TC_2_FILE_NAME_2} =               ABC
${FILE_COUNT_1_TC_1} =              9
${FILE_COUNT_1_TC_2} =              2

#Test Case 3 Variables
${TC_3_FILTER_NAME_4} =             4 - Does not begin with
${TC_3_FILE_NAME_1} =               ABC
${FILE_COUNT_1_TC_3} =              8
${TC_3_FILTER_NAME_5} =             5 Ends with
${TC_3_FILE_NAME_2} =               cba.txt
${FILE_COUNT_2_TC_3} =              1

#Test Case 4 Variables
${TC_4_FILTER_NAME_6} =             6 Does not end with
${TC_4_FILE_NAME_1} =               cba.txt
${FILE_COUNT_1_TC_4} =              9
${TC_4_FILTER_NAME_7} =             7 Contains
${TC_4_FILE_NAME_2} =               lMn
${FILE_COUNT_2_TC_4} =              2

#Test Case 5 variables
${TC_5_FILTER_NAME_8} =             8  Does not contain
${TC_5_FILE_NAME_1} =               lMn
${FILE_COUNT_1_TC_5} =              8

#Test Case 9 variables
${TC_9_FILTER_NAME_9} =             1- Only Approved-Draft
${FILE_COUNT_1_TC_9} =              10

#Test Case 10 Variables
${TC_10_FILTER_NAME_10} =           1- Only Validated
${FILE_COUNT_1_TC_10} =

#Test Case 12 Variables
${TC_12_FILTER_NAME_11} =           1- Only disabled

#Test Case 13 Variables
${TC_13_FILTER_NAME_12} =           1- Only enabled
${FILE_COUNT_1_TC_13} =              10

#Test Case 14 Variables
${TC_14_FILTER_NAME_13} =           1- Topics
${FILE_COUNT_1_TC_14} =              10

#File paths
${FILE_1_PATH} =                    ${FILE_PATH_Generic_Filter}/abcdefghijklmn-管理单-opqrstuvwxyz.txt
${FILE_2_PATH} =                    ${FILE_PATH_Generic_Filter}/abcdefghijklmn-管理单-opqrstuvwxyz_File_2.txt
${FILE_3_PATH} =                    ${FILE_PATH_Generic_Filter}/zyxwvutsrqpo-管理单-nmlkjihgfedcba.txt
${FILE_4_PATH} =                    ${FILE_PATH_Generic_Filter}/管理单-zyxwvutsrqponmlkjihgfedcba--管理单.txt
${FILE_5_PATH} =                    ${FILE_PATH_Generic_Filter}/a.txt
${FILE_6_PATH} =                    ${FILE_PATH_Generic_Filter}/Fixed-date-06-10-2019-001.txt
${FILE_7_PATH} =                    ${FILE_PATH_Generic_Filter}/Fixed-date-06-11-2019-002.txt
${FILE_8_PATH} =                    ${FILE_PATH_Generic_Filter}/Fixed-date-06-12-2019-003.txt
${FILE_9_PATH} =                    ${FILE_PATH_Generic_Filter}/Fixed-date-06-13-2019-004.txt
${FILE_10_PATH} =                   ${FILE_PATH_Generic_Filter}/Fixed-date-06-14-2019-005.txt

#Lists
@{Files_for_UPLOAD} =               ${FILE_1_PATH}  ${FILE_2_PATH}  ${FILE_3_PATH}  ${FILE_4_PATH}  ${FILE_5_PATH}  ${FILE_6_PATH}  ${FILE_7_PATH}  ${FILE_8_PATH}  ${FILE_9_PATH}  ${FILE_10_PATH}
@{TC_2_FILE_NAMES_1_list} =         ${File_1_Name_Filter}  ${File_2_Name_Filter}  ${File_3_Name_Filter}  ${File_4_Name_Filter}  ${File_6_Name_Filter}  ${File_7_Name_Filter}  ${File_8_Name_Filter}  ${File_9_Name_Filter}  ${File_10_Name_Filter}
@{TC_2_FILE_NAMES_2_list} =         ${File_1_Name_Filter}  ${File_2_Name_Filter}
@{TC_1_FILE_NAME_list} =            ${File_5_Name_Filter}
@{TC_3_FILE_NAMES_1_list} =         ${File_3_Name_Filter}  ${File_4_Name_Filter}  ${File_5_Name_Filter}  ${File_6_Name_Filter}  ${File_7_Name_Filter}  ${File_8_Name_Filter}  ${File_9_Name_Filter}  ${File_10_Name_Filter}
@{TC_3_FILE_NAME_2_list} =          ${File_3_Name_Filter}
@{TC_4_FILE_NAMES_1_list} =         ${File_1_Name_Filter}  ${File_2_Name_Filter}  ${File_4_Name_Filter}  ${File_5_Name_Filter}  ${File_6_Name_Filter}  ${File_7_Name_Filter}  ${File_8_Name_Filter}  ${File_9_Name_Filter}  ${File_10_Name_Filter}
@{TC_4_FILE_NAMES_2_list} =         ${File_1_Name_Filter}  ${File_2_Name_Filter}
@{TC_5_FILE_NAMES_1_list} =         ${File_3_Name_Filter}  ${File_4_Name_Filter}  ${File_5_Name_Filter}  ${File_6_Name_Filter}  ${File_7_Name_Filter}  ${File_8_Name_Filter}  ${File_9_Name_Filter}  ${File_10_Name_Filter}
@{TC_9_FILE_NAMES_1_list} =         ${File_1_Name_Filter}  ${File_2_Name_Filter}  ${File_3_Name_Filter}  ${File_4_Name_Filter}  ${File_5_Name_Filter}  ${File_6_Name_Filter}  ${File_7_Name_Filter}  ${File_8_Name_Filter}  ${File_9_Name_Filter}  ${File_10_Name_Filter}
@{TC_13_FILE_NAMES_1_list} =         ${File_1_Name_Filter}  ${File_2_Name_Filter}  ${File_3_Name_Filter}  ${File_4_Name_Filter}  ${File_5_Name_Filter}  ${File_6_Name_Filter}  ${File_7_Name_Filter}  ${File_8_Name_Filter}  ${File_9_Name_Filter}  ${File_10_Name_Filter}
@{TC_14_FILE_NAMES_1_list} =         ${File_1_Name_Filter}  ${File_2_Name_Filter}  ${File_3_Name_Filter}  ${File_4_Name_Filter}  ${File_5_Name_Filter}  ${File_6_Name_Filter}  ${File_7_Name_Filter}  ${File_8_Name_Filter}  ${File_9_Name_Filter}  ${File_10_Name_Filter}


#Dictionaries
&{FILTER_1_METADATA_TC_1} =         Filter Name=${TC_1_FILTER_NAME}  Fixed From Date=${TC_1_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_EQUAL}  File_Name=${TC_1_FILE_NAME}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_2_METADATA_TC_2} =         Filter Name=${TC_2_FILTER_NAME_1}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_DOES_NOT_EQUAL}  File_Name=${TC_2_FILE_NAME_1}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_3_METADATA_TC_2} =         Filter Name=${TC_2_FILTER_NAME_2}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_BEGINS_WITH}  File_Name=${TC_2_FILE_NAME_2}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_4_METADATA_TC_3} =         Filter Name=${TC_3_FILTER_NAME_4}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_DOES_NOT_BEGIN_WITH}  File_Name=${TC_3_FILE_NAME_1}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_5_METADATA_TC_3} =         Filter Name=${TC_3_FILTER_NAME_5}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_ENDS_WITH}  File_Name=${TC_3_FILE_NAME_2}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_6_METADATA_TC_4} =         Filter Name=${TC_4_FILTER_NAME_6}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_DOES_NOT_END_WITH}  File_Name=${TC_4_FILE_NAME_1}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_7_METADATA_TC_4} =         Filter Name=${TC_4_FILTER_NAME_7}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_CONTAINS}  File_Name=${TC_4_FILE_NAME_2}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_8_METADATA_TC_5} =         Filter Name=${TC_5_FILTER_NAME_8}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_DOES_NOT_CONTAIN}  File_Name=${TC_5_FILE_NAME_1}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_9_METADATA_TC_9} =         Filter Name=${TC_9_FILTER_NAME_9}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_CHOOSE_ONE}  File_Name=${EMPTY}  State=${CHOOSE_APPROVED_FILTER_STATE}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_10_METADATA_TC_10} =         Filter Name=${TC_10_FILTER_NAME_10}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_CHOOSE_ONE}  File_Name=${EMPTY}  State=${CHOOSE_VALIDATED_FILTER_STATE}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_11_METADATA_TC_12} =         Filter Name=${TC_12_FILTER_NAME_11}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_CHOOSE_ONE}  File_Name=${EMPTY}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${CHOOSE_FILE_DISABLED_OPTION}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_12_METADATA_TC_13} =         Filter Name=${TC_13_FILTER_NAME_12}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_CHOOSE_ONE}  File_Name=${EMPTY}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${CHOOSE_FILE_ENABLED_OPTION}  Topic=${TOPIC_VAULT-UC-1}
&{FILTER_13_METADATA_TC_14} =         Filter Name=${TC_14_FILTER_NAME_13}  Fixed From Date=${TC_2_FROM}  Fixed To Date=${EMPTY}  Comparizon Type=${COMPARIZON_TYPE_CHOOSE_ONE}  File_Name=${EMPTY}  State=${CHOOSE_FILTER_STATE_DROPDOWN}  Enable/Disable=${FILE_ENABLED_DROPDOWN}  Topic=${TOPIC_VAULT-UC-1}


*** Keywords ***
Fill Filter Name
    [Arguments]  ${Filter_Name}
    wait until element is visible  ${FILTER_NAME_INPUT_FIELD}
    input text  ${FILTER_NAME_INPUT_FIELD}  ${Filter_Name}

Fill Fixed From Date
    [Arguments]  ${From_Date}
    wait until element is visible  ${FIXED_FROM_RADIO_BUTTON}
    click element  ${FIXED_FROM_RADIO_BUTTON}
#    wait until element is visible  ${FIXED_FROM_INPUT_FIELD}
#    input text  ${FIXED_FROM_INPUT_FIELD}  ${From_Date}

Fill Fixed To Date
    [Arguments]  ${To_Date}
    wait until element is visible  ${FIXED_TO_RADIO_BUTTON}
    click element  ${FIXED_TO_RADIO_BUTTON}
    wait until element is visible  ${FIXED_TO_INPUT_FIELD}
    input text  ${FIXED_TO_INPUT_FIELD}  ${To_Date}

Choose Comparison Type
    [Arguments]  ${Comparizon_Type}
    wait until element is visible  ${COMPARIZON_TYPE_DROPDOWN}
    click element  ${COMPARIZON_TYPE_DROPDOWN}
    wait until element is visible  ${COMPARIZON_TYPE}
    click element  ${COMPARIZON_TYPE}

Fill File Name
    [Arguments]  ${File_Name}
    wait until element is visible  ${FILE_NAME_INPUT_FIELD}
    input text  ${FILE_NAME_INPUT_FIELD}  ${File_Name}

Choose State
    [Arguments]  ${Choose_State}
    wait until element is visible  ${CHOOSE_FILTER_STATE_DROPDOWN}
    click element  ${CHOOSE_FILTER_STATE_DROPDOWN}
    wait until element is visible  ${Choose_State}
    click element  ${Choose_State}

Choose File Enabled
    [Arguments]  ${Choose_Enable/Disable}
    wait until element is visible  ${FILE_ENABLED_DROPDOWN}
    click element  ${FILE_ENABLED_DROPDOWN}
    wait until element is visible  ${Choose_Enable/Disable}
    click element  ${Choose_Enable/Disable}

Choose Topic
    [Arguments]  ${Topic}
    wait until element is visible  ${Topic}
    scroll element into view  ${Topic}
    click element  ${Topic}

Click on Topic Right Button
    wait until element is visible  ${TOPIC_RIGHT_BUTTON}
    click element  ${TOPIC_RIGHT_BUTTON}

Filter Apply
    wait until element is visible  ${FILTER_APPLY_BUTTON}
    click element  ${FILTER_APPLY_BUTTON}
    wait until element is visible  ${FILTER_APPLY_VERIFICATION}

Fill Filter Dialogue
    [Arguments]  ${Filter_File_Metadata}
    Fill Filter Name  ${Filter_File_Metadata}[Filter Name]
    Fill Fixed From Date  ${Filter_File_Metadata}[Fixed From Date]
    #changes by Akash - added sleep to identify element
    sleep       1s
    Fill Fixed To Date  ${Filter_File_Metadata}[Fixed To Date]
    Choose Comparison Type  ${Filter_File_Metadata}[Comparizon Type]
    Fill File Name  ${Filter_File_Metadata}[File_Name]
    Choose State  ${Filter_File_Metadata}[State]
    Choose File Enabled  ${Filter_File_Metadata}[Enable/Disable]
    Choose Topic  ${Filter_File_Metadata}[Topic]
    Click on Topic Right Button
    Filter Apply

Count Number of Files After Filter Apply
    [Arguments]  ${count}
    ${result} =  Get WebElements  ${LIST_OF_ELEMENTS}
    ${length} =  Get Length	 ${result}
    log to console  ${length}
    should be equal as numbers  ${count}  ${length}

Verify That Appears Correct File
    [Arguments]  ${file_name_list}
    FOR  ${file_name}  IN  @{file_name_list}
        wait until element is visible  xpath=//p[contains(text(),'${file_name}')]
    END

Check Upload Checkmark For Filter
    FOR  ${a}  IN RANGE  0  10
        ${Checkmark_Locator_local} =  Catenate  id=file_upload_success_${a}
        wait until element is visible  ${Checkmark_Locator_local}  timeout=30s
    END

Remove 13 Filters
    FOR  ${a}  IN RANGE  13
        ${Filter_Hover} =  Catenate  xpath=//*[@id="filter_0"]/span
        ${Remove_Filter} =  Catenate  xpath=//app-filter-bookmark[@id='filter_0']//span[@id='remove_filter']
        wait until element is visible  ${Filter_Hover}  timeout=10s
        sleep  1s  #not able to remove filters
        mouse over  ${Filter_Hover}
        wait until element is visible  ${Remove_Filter}  timeout=10s
        click element  ${Remove_Filter}
        sleep  1s  #not able to remove filters
    END