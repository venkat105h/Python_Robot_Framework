*** Settings ***
Documentation   Locators for each element used in TestSuite

*** Variables ***
${FILE_NAME_INPUT_FIELD}                   id=file_name
${STATE_DROPDOWN}                          id=states
${FILE_ENABLED_DROPDOWN}                   id=enable_states
${FIXED_FROM_RADIO_BUTTON}                 id=fixedFromDateRadio
#${FIXED_TO_RADIO_BUTTON}                   id=fixedEndDateRadio
#changes by Akash - changed locator to get field clicked
${FIXED_TO_RADIO_BUTTON}                   xpath=(//*[@id="new"]//app-search-template-dates//label/input)[4]
${FIXED_FROM_INPUT_FIELD}                  id=from-date
${FIXED_TO_INPUT_FIELD}                    (//*[@id="new"]//app-search-template-dates//p-calendar/span/input)[2]
${CHOOSE_FILTER_STATE_DROPDOWN}            id=states
${CHOOSE_APPROVED_FILTER_STATE}            xpath=//span[contains(text(),'Approved')]
${CHOOSE_DRAFT_FILTER_STATE}               xpath=//span[contains(text(),'Draft')]
${CHOOSE_VALIDATED_FILTER_STATE}           xpath=//span[contains(text(),'Validated')]
${FILE_ENABLED_DROPDOWN}                   id=enable_states
${CHOOSE_FILE_ENABLED_OPTION}              xpath=//span[contains(text(),'Enabled')]
${CHOOSE_FILE_DISABLED_OPTION}             xpath=//span[contains(text(),'Disabled')]
${COMPARIZON_TYPE_DROPDOWN}                id=file_pattern
${COMPARIZON_TYPE_CHOOSE_ONE}              xpath=//span[contains(text(),'Choose one')]
${COMPARIZON_TYPE_EQUAL}                   xpath=//span[contains(text(),'Equals')]
${COMPARIZON_TYPE_BEGINS_WITH}             xpath=//span[contains(text(),'Begins with')]
${COMPARIZON_TYPE_DOES_NOT_EQUAL}          xpath=//span[contains(text(),'Does not equal')]
${COMPARIZON_TYPE_DOES_NOT_BEGIN_WITH}     xpath=//span[contains(text(),'Does not begin with')]
${COMPARIZON_TYPE_ENDS_WITH}               xpath=//span[contains(text(),'Ends with')]
${COMPARIZON_TYPE_DOES_NOT_END_WITH}       xpath=//span[contains(text(),'Does not end with')]
${COMPARIZON_TYPE_CONTAINS}                xpath=//span[contains(text(),'Contains')]
${COMPARIZON_TYPE_DOES_NOT_CONTAIN}        xpath=//span[contains(text(),'Does not contain')]
${TOPIC_VAULT-UC-1}                        xpath=//div[contains(text(),'Vault-UC-1')]
${TOPIC_RIGHT_BUTTON}                      xpath=//p-picklist[@id='filter-sites']//button[1]
${LIST_OF_ELEMENTS}                        xpath=//p-dataview[@id='files-list']//div[contains(@class, 'list-item')]
${FILTER_APPLY_VERIFICATION}               xpath=//p-paginator[@class='ng-star-inserted']
${VAULT_FILE_NAME}                         xpath=//p[contains(text(),'a.txt')]
${NO_RECORD_FOUND_TEXT}                    xpath=//div[contains(text(),'No records found')]
${REMOVE_FILTER}                           xpath=//app-filter-bookmark[@id='filter_2']//span[@id='remove_filter']
