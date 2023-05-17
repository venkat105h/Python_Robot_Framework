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
Resource          ../Generic/GenericMethods.py

*** Variables ***
${Some_Comment} =    some text
${Some_text} =  some text
${Some_url} =   some_url

*** Keywords ***
Command Tab UI Verification
    wait until element is visible  ${DELETE_VAULT_CARD_BUTTON}
    wait until element is visible  ${DOWNLOAD_BUTTON}
    wait until element is visible  ${UPDATE_STATE}

Add Comment
    [Arguments]  ${Comment}
    input text  ${NEW_COMMENT_INPUT_FIELD}  ${Comment}
    click element  ${ADD_COMMENT_BUTTON}
    input text  ${SEARCH_COMMENT_INPUT_FIELD}  ${Comment}
    wait until element is visible  ${COMMENT_SEARCH_BUTTON}
    click element  ${COMMENT_SEARCH_BUTTON}

Input metadata of update state dialogue
    [Arguments]  ${STATE_DROPDOWN_ELEMENT}  ${STATE_AFTER_SUBMITING}
    wait until element is visible  ${UPDATE_STATE}
    click element  ${UPDATE_STATE}
    wait until element is visible  ${NEW_STATE_DROPDOWN}
    click element  ${NEW_STATE_DROPDOWN}
    wait until element is visible  ${STATE_DROPDOWN_ELEMENT}
    click element  ${STATE_DROPDOWN_ELEMENT}

Update State
    [Arguments]  ${STATE_DROPDOWN_ELEMENT}  ${STATE_AFTER_SUBMITING}
    Input metadata of update state dialogue  ${STATE_DROPDOWN_ELEMENT}  ${STATE_AFTER_SUBMITING}
    wait until element is visible  ${UPDATE_FILE_STATE_DIALOGUE_OK_BUTTON}
    click element  ${UPDATE_FILE_STATE_DIALOGUE_OK_BUTTON}

Update state and click on cancel
    [Arguments]  ${STATE_DROPDOWN_ELEMENT}  ${STATE_AFTER_SUBMITING}
    Input metadata of update state dialogue  ${STATE_DROPDOWN_ELEMENT}  ${STATE_AFTER_SUBMITING}
    wait until element is visible  ${UPDATE_FILE_STATE_DIALOGUE_CANCEL_BUTTON}
    click element  ${UPDATE_FILE_STATE_DIALOGUE_CANCEL_BUTTON}

Verify that comment exist
    [Arguments]  ${comment}
    wait until element is visible  ${NOTE_TAB_COMMENT}  timeout=10s
    wait until element contains  ${NOTE_TAB_COMMENT}  ${comment}  timeout=10s

Verify state
    [Arguments]  ${STATE_AFTER_SUBMITING}
    sleep  1s  #need this for detecting locator
    wait until element is visible  ${STATE_AFTER_SUBMITING}  timeout=10s

Go to Reference Tab and add some url reference
    [Arguments]  ${url}  ${text}
    wait until element is visible  ${REFERENCES_TAB}
    click element  ${REFERENCES_TAB}
    wait until element is visible  ${ADD_REFERENCE_BUTTON}
    click element  ${ADD_REFERENCE_BUTTON}
    wait until element is visible  ${URL_REFERENCE_RADIO_BUTTON}
    click element  ${URL_REFERENCE_RADIO_BUTTON}
    wait until element is visible  ${INPUT_URL_REFERENCE_TAB}
    input text  ${INPUT_URL_REFERENCE_TAB}   ${url}
    wait until element is visible  ${INPUT_DESCRIPTION_REFERENCE_TAB}
    input text  ${INPUT_DESCRIPTION_REFERENCE_TAB}  ${text}
    Capture Page Screenshot
    wait until element is visible  ${SAVE_BUTTON_REFERENCE_TAB}
    click element  ${SAVE_BUTTON_REFERENCE_TAB}

Verify that reference created and have correct url and description
    [Arguments]  ${link}
    wait until element is visible  ${link}
    wait until element is visible  ${Reference_tab_description_locator}
    wait until element is visible  ${CONFIRMATION_DIALOGUE_MESSAGE}
    wait until element is visible  ${Reference_tab_numer_count}

Navigate to url and check if it's correct
    [Arguments]  ${link}
    Click Link  ${link}
    ${href}=    Get Location
    log to console  ${href}
    run keyword if  '${href}' == '${url_reference}'  Go Back

Go to refernce tab
    click on 'new1' filter or create new filter
    wait until element is visible  ${REFERENCES_TAB}
    click element  ${REFERENCES_TAB}

Remove reference and check if it's removed
    wait until element is visible  ${CLEAR_REFERENCE_BUTTON}
    click element  ${CLEAR_REFERENCE_BUTTON}
    wait until element is not visible  ${CLEAR_REFERENCE_BUTTON}

Go to notes tab
    wait until element is visible  ${NOTES_TAB}  timeout=10s
    click element  ${NOTES_TAB}

Go to administrator page
    wait until element is visible  ${USER_DROPDOWN}
    click element  ${USER_DROPDOWN}
    wait until element is visible  ${ADMINISTRATOR_USER}
    click element  ${ADMINISTRATOR_USER}

Open file storage utilization
    wait until element is visible  ${FILE_STORAGE_UTILIZATION}
    click element  ${FILE_STORAGE_UTILIZATION}
    wait until element is visible  ${STORAGE_USAGE}

Get usage value from storage utilization page
    wait until element is visible  ${USAGE}    timeout=250.0
    wait until element is enabled  ${USAGE}    timeout=250.0
    ${title_from administrator} =  Get Element Attribute  ${USAGE}  attribute=title
    Set Global Variable     ${title_from administrator}
    log to console  ${title_from administrator}

Get usage value from vault page
    wait until element is visible  ${USAGE}
    wait until element is enabled  ${USAGE}
    ${title} =  Get Element Attribute  ${USAGE}  attribute=title
    Set Global Variable     ${title}
    log to console  ${title}

Check if values are same
    pass execution if  '${title}' == '${title_from administrator}'  pass

Sort files and check files order
    [Arguments]  ${sort_order}  ${file_1_name}  ${file_2_name}  ${file_3_name}
    wait until element is visible  ${SORT_DROPDOWN}
    click element  ${SORT_DROPDOWN}
    wait until element is visible  ${sort_order}
    click element  ${sort_order}
    wait until element is visible  ${FILE_1_LOCATOR}
    Element Text Should Be  ${FILE_1_LOCATOR}  ${file_1_name}
    wait until element is visible  ${FILE_2_LOCATOR}
    Element Text Should Be  ${FILE_2_LOCATOR}  ${file_2_name}
    wait until element is visible  ${FILE_3_LOCATOR}
    Element Text Should Be  ${FILE_3_LOCATOR}  ${file_3_name}


Sort and check order by name
    [Arguments]  ${sort_order}
    wait until element is visible  ${SORT_DROPDOWN}
    wait until element is visible    //*[@id="sort_by"]/div/label
    ${names_2}    create list
    ${count}=    get element count    //*[@class="col-sm-3 icon_wrapper"]
    click element  ${SORT_DROPDOWN}
    wait until element is visible  ${sort_order}
    click element  ${sort_order}
    FOR    ${idx}    IN RANGE  0   ${count}
        wait until element is visible     //*[@id="file_name_${idx}"]
        ${name}=    get text    //*[@id="file_name_${idx}"]
        append to list     ${names_2}     ${name}
    END
    ${names_1}=   sort_ascending    ${names_2}
    log    ${names_2}
    should be equal    ${names_1}     ${names_2}


ort and check order by size
    [Arguments]  ${sort_order}
    wait until element is visible  ${SORT_DROPDOWN}
    wait until element is visible    //*[@id="sort_by"]/div/label
    ${count}=    get element count    //*[@class="col-sm-3 icon_wrapper"]
    click element  ${SORT_DROPDOWN}
    wait until element is visible  ${sort_order}
    click element  ${sort_order}
    FOR    ${idx}    IN RANGE  0   ${count}
        wait until element is visible     //*[@id="file_name_${idx}"]
        click element    //*[@id="file_name_${idx}"]
        wait until element is visible    //*[@id="owerview_row_5_value"]
        ${name}=    get text   //*[@id="owerview_row_5_value"]
        append to list     ${names_2}     ${name}
    END
    ${names_1}=   sort_ascending    ${names_2}
    log    ${names_2}
    should be equal    ${names_1}     ${names_2}

Verify files order
    [Arguments]  ${file_1_name}  ${file_2_name}  ${file_3_name}
    wait until element is visible  ${FILE_1_LOCATOR}
    Element Text Should Be  ${FILE_1_LOCATOR}  ${file_1_name}
    wait until element is visible  ${FILE_2_LOCATOR}
    Element Text Should Be  ${FILE_2_LOCATOR}  ${file_2_name}
    wait until element is visible  ${FILE_3_LOCATOR}
    Element Text Should Be  ${FILE_3_LOCATOR}  ${file_3_name}

Click on Descendig order button
    wait until element is visible  ${DESCENDING_ORDER}
    click element  ${DESCENDING_ORDER}

click on ascending order button
    wait until element is visible  ${ASCENDING_ORDER}
    click element  ${ASCENDING_ORDER}

Delete Vault Data
    wait until keyword succeeds    5x    2s    click element    (//*[@id="update-state"])[1]
    wait until keyword succeeds    5x    2s    click element   //*[@id="buttn_DeleteTxt"]
    wait until element is visible    //*[@id="Layer_1"]    timeout=20.0
    sleep    5s
    wait until keyword succeeds    5x    2s    click element    (//*[@id="update-state"])[1]
    wait until keyword succeeds    5x    2s    click element    //*[@id="buttn_DeleteTxt"]
    wait until element is visible    //*[@id="Layer_1"]    timeout=20.0
    sleep    5s
    wait until keyword succeeds    5x    2s    click element    (//*[@id="update-state"])[1]
    wait until keyword succeeds    5x    2s    click element    //*[@id="buttn_DeleteTxt"]
