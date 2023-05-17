*** Settings ***
Documentation     Verify UniCloud Integeration Test cases
Resource          ..${/}Resources${/}resource.robot
Resource          ..${/}Resources${/}Locator.robot
Library           Collections
Library           String
Library           robot.libraries.DateTime
Library           BuiltIn
Library           SeleniumLibrary
Library           OperatingSystem
Library          ..${/}..${/}Resources${/}Requests_Library.py
Suite Setup       SOL_Open Browser with Solution Landing page
Suite Teardown    Close Browser
#-----------------------------------------------------------------------------------------------------------------------
*** Variables ***
${UNICLOUD_ENABLEDISABLE_SLIDER}         (//*[@id="pagebody-table"]//ngx-datatable//datatable-body-cell[2]/div/div/div)
${UNICLOUD_FEATURE}         (//*[@id="pagebody-table"]//ngx-datatable//datatable-body-cell[4]/div/div)
${UNICLOUD_Edit_FEATURE}    (//*[@id="pagebody-table"]//ngx-datatable//datatable-body-cell[1]/div/div/div/button[1])
${UNICLOUD_Save_FEATURE}    (//*[@id="pagebody-table"]//ngx-datatable//datatable-body-cell[1]/div/div/div/button[2])

*** Keywords ***

UNICLOUD_Enable/Disable the Slider in Table for Feature
    [Documentation]  This keyword is used to click on the slider for enabling and disabling the feature
    ...              ${Enable/Disable} is used to Enable/disable feature
    ...              ${FeatureName} is used to provide the index of that.
    [Arguments]      ${Feature_Name}  ${Enable/Disable}
    ${Index}=  UNICLOUD_Veirfy Index of Feature in table   ${Feature_Name}
    ${Enable/Disable}  Convert To Upper Case  ${Enable/Disable}
    ${Enable/Disable_Status}  Get Element Attribute  ${UNICLOUD_ENABLEDISABLE_SLIDER} [${Index}]  title
    ${Enable/Disable_Status}  Convert To Upper Case  ${Enable/Disable_Status}
    Run Keyword If  '${Enable/Disable_Status}'!='${Enable/Disable}'  Run Keywords  Click Element  ${UNICLOUD_Edit_FEATURE} [${Index}]
    ...  AND  Click Element  ${UNICLOUD_ENABLEDISABLE_SLIDER} [${Index}]
    ...  AND  Click Element  ${UNICLOUD_Save_FEATURE} [${Index}]


UNICLOUD_Veirfy Index of Feature in table
     [Documentation]
     [Arguments]    ${Feature_Name}
     ${Total_Element}  Get Element Count  ${UNICLOUD_FEATURE}
     : FOR  ${Index}  IN RANGE  1  ${Total_Element}+1
     \  ${ActualFeature_Name}  Get Text  ${UNICLOUD_FEATURE} [${Index}]
     \  Run Keyword IF  '${ActualFeature_Name}'=='${Feature_Name}'  Exit for Loop
     [Return]  ${Index}

*** Test Cases ***
To Disable the products feature in the UniCloud Environment.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    Set Selenium Speed  .3s
    UNICLOUD_Enable/Disable the Slider in Table for Feature  IOD  Disabled
    UNICLOUD_Enable/Disable the Slider in Table for Feature  DataPool  Disabled
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session

To Enable the products feature in the UniCloud Environment.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    UNICLOUD_Enable/Disable the Slider in Table for Feature  IOD  Enabled
    UNICLOUD_Enable/Disable the Slider in Table for Feature  DataPool  Enabled
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session
