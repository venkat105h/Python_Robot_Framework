*** Settings ***
Documentation  Hre are written Doucumentation about DataPool

Library      BuiltIn
Variables    ../Variables/${TESTENV}_Variable.py
Library      SeleniumLibrary    timeout=${Selenium_Timeout}    run_on_failure=Nothing
Resource     ../Locators/Generic_Locators.robot
Resource     ../Locators/DataPool_Locators.robot
Resource     ../../unisphereautomationrf/Resources/UNICLOUD_RESOURCE.robot


*** Variables ***
${Browser}                        gc
${Systech360LogInURL}             https://eng-svt.systechcloud.net/Systech360/#/login
${UnisecureLogInURL}              https://eng-svt.systechcloud.net/UniSecure/#/login
${Systech360AdministratorRole}    0
${Enable/Disable}                 ENABLE
${DataPool_Feature}               (//*[@id='file_state'])
${DataPool_Button}                (//*[@id='file_state'])
${upper}                          ENABLE
${UNICLOUD_ENABLEMENT_TABLE}      (//datatable-body-row)
${UNICLOUD_ENABLEMENT_TEXT}       (//datatable-row-wrapper//datatable-body-cell[4]/div/div//label)

*** Keywords ***




Verify IOD Enabled/Disabled Status
    [Arguments]   ${Status}
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    Set Selenium Speed  .3s
    ${Index}=  UNICLOUD_Veirfy Index of Feature in table   IOD
    ${Enable/Disable_Status}  Get Element Attribute  ${UNICLOUD_ENABLEDISABLE_SLIDER} [${Index}]  title
    ${Enable/Disable_Status}  Convert To Upper Case  ${Enable/Disable_Status}
    should be equal as strings    ${Enable/Disable_Status}      ${Status}



Verify Data Pool Enable Date
    wait until keyword succeeds  5x  2s  Click Element    ${DPCardActivateNodeDataCollectionBtn}
    wait until element is visible    ${DATA_POOL_TIME_AND_DATE}
    ${Date} =    get text     ${DATA_POOL_TIME_AND_DATE}
    should contain     ${Date}    /


Come back to initial page
    [Documentation]  This is the place from where import button is clickable
    Reload Page

Log into Systech360 as Administrator
    [Documentation]  Log into Systech360 as Administrator
    Open browser  ${Systech360LogInURL}  ${Browser}
    Input text  ${UsernameTextField}  ${Username}
    Input text  ${PasswordTextField}  ${Password}
    Select From List By Index  ${RoleListElement}  ${Systech360AdministratorRole}
    Click Button  ${LogInButton}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10

Log into Unisecure as Administrator
    [Documentation]  Log into Systech360 as Administrator
    Open browser  ${UnisecureLogInURL}  ${Browser}
    Input text  ${UsernameTextField}  ${Username}
    Input text  ${PasswordTextField}  ${Password}
    Select From List By Index  ${RoleListElement}  ${Systech360AdministratorRole}
    Click Button  ${LogInButton}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10

Log into URL
    [Documentation]  Log into Systech360 as Administrator
    Open browser  ${LOGIN_URL}  ${Browser}
    Input text  ${UsernameTextField}  ${Username}
    Input text  ${PasswordTextField}  ${Password}
    Select From List By Index  ${RoleListElement}  ${Systech360AdministratorRole}
    Click Button  ${LogInButton}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10

Navigate to the Data Pool Console card
    [Documentation]  Open DataPool card in Admin main view
    wait until element is visible   ${DataPoolCategoriesCardButton}

    Click Element  ${DataPoolCategoriesCardButton}


Varification about enable Item
    [Documentation]  should contain any
    [Arguments]  ${locator}
    log  asd
    #TODO
    #wait until element is visible

Varification about desable Item
    [Documentation]  should contain any
    [Arguments]  ${locator}
    log  asd
    #TODO
    #wait until element is not visible  xpath==//...

Click in to Disable icon for activate
    [Documentation]  Click on the Disable icon
    [Arguments]  ${ButtonLocator}
    Sleep  2s
    Click Element  ${ButtonLocator}

Click in to Enable icon for deactivate
    [Documentation]  Click on the Enable icon
    [Arguments]  ${ButtonLocator}
    Sleep  2s
    Click Element  ${ButtonLocator}

Data Pool-UC-01 Manage Categories
    log  any log


Open Administrator -> InfoCenter -> DataPoll
    [Documentation]  Use the hamburger menu to navigate to the info center to Product to Data Pool
    wait until element is visible  ${HamburgerRoot}
    Click Element  ${HamburgerRoot}
    wait until element is visible  ${HamburgerInfoCenter}
    Click Element  ${HamburgerInfoCenter}
    wait until element is visible  ${HamburgerICProduct}
    Click Element  ${HamburgerICProduct}
    Sleep  2s
    wait until element is visible  ${HamburgerICPDataPoll}
    Click Element  ${HamburgerICPDataPoll}
    mouse over  ${SEC/S360_WELCOME_LINK}
    Sleep  1s

Element is published
    [Documentation]  "Data Pool data model overview" PDF file is published
    [Arguments]  ${FileName}  ${Data}
    wait until element is visible  ${FileName}
    wait until element is visible  ${Data}

Open Data Pool File
    [Documentation]  Select the "Data Pool" file and open it
    [Arguments]  ${FileName}
    Click Link  ${FileName}
    wait until element is visible  xpath=//embed[@id="plugin"]

Check File in DataPool then Open
    [Documentation]  Check File in the Admin->InformationCenter->DataPoll view then open File
    Element is published  ${DataPollDataModelOverviewFile}  ${DataPollDataModelOverviewFileVerification}
    Verify Viewing Data Pool files  ${DataPollDataModelOverviewFile}
    Element is published  ${DataPoolERDFile}  ${DataPoolERDFileVerification}
    Verify Viewing Data Pool files  ${DataPoolERDFile}

Verify Viewing Data Pool files
    [Documentation]  Clicks on Data Pool data model overview and verifies it opens in new tab
    [Arguments]  ${Data}
    Click Element  ${Data}
    # Get back to Main windows
    @{Windows_Names}=  Get Window Titles
    # Verifies total number of windows should not be <2
    ${NumOfWindows}=  Get Length  ${Windows_Names}
    Run Keyword If  ${NumOfWindows}<2  Fail
    Switch Window  NEW
    Close Window
    Switch Window  MAIN

Datapool card is not visible
    [Documentation]  There is NO Data Pool Catagories card
    current frame should not contain  Data Pool Categories

Verify IOD Enabled/Disabled Status
    [Arguments]   ${Status}
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    Set Selenium Speed  .3s
    ${Index}=  UNICLOUD_Veirfy Index of Feature in table   IOD
    ${Enable/Disable_Status}  Get Element Attribute  ${UNICLOUD_ENABLEDISABLE_SLIDER} [${Index}]  title
    ${Enable/Disable_Status}  Convert To Upper Case  ${Enable/Disable_Status}
    should be equal as strings    ${Enable/Disable_Status}      ${Status}

DataPool_Veirfy Index of Feature in table
     [Documentation]
     [Arguments]    ${Expected_Button_Text}
     ${Expected_Button_Text}  Convert To Upper Case  ${Expected_Button_Text}
     ${Total_Element}  Get Element Count  (//*[@id='category_name']/p)
     #log  Total Number of elements  ${Total_Element}
     FOR  ${Index}  IN RANGE  1  ${Total_Element}+1
       ${ActualFeature_Name}  Get Text  (//*[@id='category_name']/p) [${Index}]
       ${ActualFeature_Name}  Convert To Upper Case  ${ActualFeature_Name}
       Run Keyword IF  '${ActualFeature_Name}'=='${Expected_Button_Text}'  Exit for Loop
     END
     [Return]  ${Index}

UNICLOUD_Enable/Disable the Slider in Table for the Feature
    [Documentation]  This keyword is used to click on the slider for enabling and disabling the feature
    ...              ${Enable/Disable} is used to Enable/disable feature
    ...              ${FeatureName} is used to provide the index of that.
    [Arguments]      ${Feature_Name}  ${Enable/Disable}
    sleep  3s
    ${Index}=  UNICLOUD_Veirfy Index of Feature in table   ${Feature_Name}
    log    ${Index}
    ${header} =    get text    (//*[@class="panel-title"])[1]
    ${Enable/Disable}  Convert To Upper Case  ${Enable/Disable}
    ${Enable/Disable_Status}  Get Element Attribute  ${UNICLOUD_ENABLEDISABLE_SLIDER} [${Index}]  title
    ${Enable/Disable_Status}  Convert To Upper Case  ${Enable/Disable_Status}
    Run Keyword If  '${Enable/Disable_Status}'!='${Enable/Disable}'  Run Keywords  Click Element  ${UNICLOUD_Edit_FEATURE} [${Index}]
    ...  AND  Click Element  ${UNICLOUD_ENABLEDISABLE_SLIDER} [${Index}]
    ...  AND  Click Element  ${UNICLOUD_Save_FEATURE} [${Index}]

Verify Data Pool Enable Date
    wait until keyword succeeds  5x  2s  Click Element    ${DPCardActivateNodeDataCollectionBtn}
    wait until element is visible    ${DATA_POOL_TIME_AND_DATE}
    ${Date} =    get text     ${DATA_POOL_TIME_AND_DATE}
    should contain     ${Date}    /
