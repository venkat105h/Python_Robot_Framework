#------------------------------------------------------------------
#   Description       :      User defined Keywords for Roles based scenarios
#   Project           :      Roles based Use cases
#   Author            :      Dinesh Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation  Necessary Libraries and Resources file are mentioned below
Library         BuiltIn
Library         Collections
Library         String
Library         SeleniumLibrary  timeout=10.0
Library         ../Generic/GenericMethods.py
Resource        ../Locators/Generic_Locators.robot
Resource        ../Keywords/Generic_Keywords.robot
Resource        ../Keywords/Admin_Keywords.robot
Resource        ../Locators/Admin_Locators.robot
Resource        ../Locators/Operator_Locators.robot
Resource        ../Locators/Designer_Locators.robot
Variables       ../Variables/${TESTENV}_Variable.py

*** Keywords ***
SEC/S360_Roles_Precondition_Create User And Groups
    [Documentation]  Creates a user and associates groups to the user

    @{User_Details}=  Split String  ${NewUser_Details_Roles}   ,
    Set Global Variable  ${User_Details}

    @{Roles_List}=  Create List  ${SEC/S360_ADMIN_ROLE}
    SEC/S360_Navigate to User/Groups Page
    SEC/S360_Create New Group  ${UniSecure_Group}  ${Group_Description}  @{Roles_List}
    SEC/S360_Wait For Success Message

    SEC/S360_Scroll Page To Location  0  0
    SEC/S360_Create New User  ${User_Details}  ${UniSecure_Group}

    SEC/S360_Switch Between UniSecure/Systech360   ${SEC/S360_NAV_GO_TO_ADMIN}  preferenceCardName_1
    SEC/S360_Navigate to User/Groups Page
    SEC/S360_Create New Group  ${Systech360_Group}  ${Group_Description}  @{Roles_List}
    SEC/S360_Wait For Success Message
    SEC/S360_Update Groups Assigned For User  ${User_Details}[0]  Select  ${Systech360_Group}

SEC/S360_Roles_Verify Roles From Login Page
    [Documentation]  Verifies accessing roles from login page

    [Arguments]  ${SEC/S360_URL}  ${User_Details}  ${Roles_List}

    ${Admin_Access}  ${Opr_Access}  ${Dsg_Access}   SEC/S360_Verify Roles List Values  ${Roles_List}

    GoTo  ${SEC/S360_URL}
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${AdminRole}
    Run Keyword If  '${Admin_Access}'=='${TRUE}'  SEC/S360_Verify For Element In Page  ${SEC/S360_URL}  Admin
    ...  ELSE  Run Keywords  Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}  timeout=10
    ...  AND  Element Should Be Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}

    GoTo  ${SEC/S360_URL}
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${OperatorRole}
    Run Keyword If  '${Opr_Access}'=='${TRUE}'  SEC/S360_Verify For Element In Page  ${SEC/S360_URL}  Operator
    ...  ELSE  Run Keywords  Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}  timeout=10
    ...  AND  Element Should Be Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}

    GoTo  ${SEC/S360_URL}
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${DesignerRole}
    Run Keyword If  '${Dsg_Access}'=='${TRUE}'  SEC/S360_Verify For Element In Page  ${SEC/S360_URL}  Designer
    ...  ELSE  Run Keywords  Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}  timeout=10
    ...  AND  Element Should Be Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}

SEC/S360_Roles_Verify Using Explicit URL
    [Documentation]  Verifies accessing different roles using explicit URL

    [Arguments]  ${User_Details}  ${UniSecure_Accessible_Roles}  ${Systech360_Accessible_Roles}

    ${Sec_Admin_Access}  ${Sec_Opr_Access}  ${Sec_Dsg_Access}   SEC/S360_Verify Roles List Values  ${UniSecure_Accessible_Roles}

    ${Valid_Role}=  Run Keyword If  '${Sec_Admin_Access}'=='${TRUE}'  Set Variable  ${AdminRole}
    ...  ELSE IF  '${Sec_Opr_Access}'=='${TRUE}'  Set Variable  ${OperatorRole}
    ...  ELSE IF  '${Sec_Dsg_Access}'=='${TRUE}'  Set Variable  ${DesignerRole}

    SEC/S360_Roles_Navigate To Explicit URL  ${User_Details}  ${SEC_SVT_URL}  ${Sec_Admin_Access}  ${Sec_Opr_Access}  ${Sec_Dsg_Access}  ${Valid_Role}

    ${S360_Admin_Access}  ${S360_Opr_Access}  ${S360_Dsg_Access}  SEC/S360_Verify Roles List Values  ${Systech360_Accessible_Roles}
    ${Valid_Role}=  Run Keyword If  '${S360_Admin_Access}'=='${TRUE}'  Set Variable  ${AdminRole}
    ...  ELSE IF  '${S360_Opr_Access}'=='${TRUE}'  Set Variable  ${OperatorRole}
    ...  ELSE IF  '${S360_Dsg_Access}'=='${TRUE}'  Set Variable  ${DesignerRole}

    SEC/S360_Roles_Navigate To Explicit URL  ${User_Details}  ${SPH_SVT_URL}  ${S360_Admin_Access}  ${S360_Opr_Access}  ${S360_Dsg_Access}  ${Valid_Role}

SEC/S360_Roles_Navigate To Explicit URL

    [Documentation]  Navigates to roles and verifies accessing roles

    [Arguments]  ${User_Details}  ${Explicit_URL}  ${Admin_Access}  ${Operator_Access}  ${Designer_Access}  ${Valid_Role}
    
    Sleep  2S
    GoTo  ${Explicit_URL}
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${Valid_Role}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
    
    Sleep  2S
    GoTo  ${Explicit_URL}\#/Administrator/
    Run Keyword If  '${Admin_Access}'=='${TRUE}'  SEC/S360_Verify For Element In Page  ${Explicit_URL}  Admin
    ...  ELSE  Run Keywords  Wait Until Element Is Not Visible  ${SEC/S360_SESSION_EXP_POPUP}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ...  AND  Element Should Be Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ...  AND  SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${Valid_Role}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10

    Sleep  2S
    GoTo  ${Explicit_URL}\#/Operator/
    Run Keyword If  '${Operator_Access}'=='${TRUE}'  SEC/S360_Verify For Element In Page  ${Explicit_URL}  Operator
    ...  ELSE  Run Keywords  Wait Until Element Is Not Visible  ${SEC/S360_SESSION_EXP_POPUP}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ...  AND  Element Should Be Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ...  AND  SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${Valid_Role}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
    
    Sleep  2S
    GoTo  ${Explicit_URL}\#/Designer/
    Run Keyword If  '${Designer_Access}'=='${TRUE}'  SEC/S360_Verify For Element In Page  ${Explicit_URL}  Designer
    ...  ELSE  Run Keywords  Wait Until Element Is Not Visible  ${SEC/S360_SESSION_EXP_POPUP}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ...  AND  Element Should Be Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}
    ...  AND  SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${Valid_Role}
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10

SEC/S360_Roles_Update Group with Roles
    [Documentation]  Updates the User Group in Systech360 and UniSecure with the required roles

    [Arguments]  ${SEC/S360_URL}  ${Group_Name}  ${Roles_List}

    GoTo  ${SEC/S360_URL}
    SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRole}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
    SEC/S360_Click On User_Groups/Security Policies Card  User_Groups

    @{Role_Value_List}=  Create List
    ${Admin_Access}  ${Opr_Access}  ${Dsg_Access}  SEC/S360_Verify Roles List Values  ${Roles_List}

    Run Keyword If  '${Admin_Access}'=='${TRUE}'  Append To List  ${Role_Value_List}  ${Admin_Role_Group}
    Run Keyword If  '${Opr_Access}'=='${TRUE}'    Append To List  ${Role_Value_List}  ${Operator_Role_Group}
    Run Keyword If  '${Dsg_Access}'=='${TRUE}'    Append To List  ${Role_Value_List}  ${Designer_Role_Group}
    SEC/S360_Update Roles In Group  ${Group_Name}  ${Role_Value_List}

SEC/S360_Verify Roles List Values
    [Documentation]  checks if the roles are present in the list or not

    [Arguments]  ${Roles_List_Values}

    ${Admin_Access}=  Run Keyword And Return Status  List Should Contain Value  ${Roles_List_Values}  admin     ignore_case=True
    ${Opr_Access}=    Run Keyword And Return Status  List Should Contain Value  ${Roles_List_Values}  operator  ignore_case=True
    ${Dsg_Access}=    Run Keyword And Return Status  List Should Contain Value  ${Roles_List_Values}  designer  ignore_case=True

    [Return]  ${Admin_Access}  ${Opr_Access}  ${Dsg_Access}

SEC/S360_Roles_Verify Navigation Using Top Banner
    [Documentation]  Verifies Navigation Using Top banner dropdown

    [Arguments]  ${User_Details}  ${UniSecure_Roles_List}  ${Systech360_Roles_List}

    ${Sec_Admin_Access}   ${Sec_Opr_Access}   ${Sec_Dsg_Access}   SEC/S360_Verify Roles List Values  ${UniSecure_Roles_List}
    ${S360_Admin_Access}  ${S360_Opr_Access}  ${S360_Dsg_Access}  SEC/S360_Verify Roles List Values  ${Systech360_Roles_List}

    ${Sec_Valid_Role}=  Run Keyword If  '${Sec_Admin_Access}'=='${TRUE}'  Set Variable  ${AdminRole}
    ...  ELSE IF  '${Sec_Opr_Access}'=='${TRUE}'  Set Variable  ${OperatorRole}
    ...  ELSE IF  '${Sec_Dsg_Access}'=='${TRUE}'  Set Variable  ${DesignerRole}

    ${S360_Valid_Role}=  Run Keyword If  '${S360_Admin_Access}'=='${TRUE}'  Set Variable  ${AdminRole}
    ...  ELSE IF  '${S360_Opr_Access}'=='${TRUE}'  Set Variable  ${OperatorRole}
    ...  ELSE IF  '${S360_Dsg_Access}'=='${TRUE}'  Set Variable  ${DesignerRole}

    SEC/S360_Roles_Navigate To Roles From Top Banner  ${SEC_SVT_URL}  ${User_Details}  ${S360_Admin_Access}  ${S360_Opr_Access}  ${S360_Dsg_Access}
    ...  ${Sec_Valid_Role}

    SEC/S360_Roles_Navigate To Roles From Top Banner  ${SPH_SVT_URL}  ${User_Details}  ${Sec_Admin_Access}  ${Sec_Opr_Access}  ${Sec_Dsg_Access}
    ...  ${S360_Valid_Role}

SEC/S360_Roles_Navigate To Roles From Top Banner
    [Documentation]  Verifies navigating to different roles form top banner

    [Arguments]  ${SEC/S360_URL}  ${User_Details}  ${Admin_Access}  ${Opr_Access}  ${Dsg_Access}  ${Valid_Role}

    GoTo  ${SEC/S360_URL}
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${Valid_Role}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
    ${Current_Url}=  Get Location

    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_TOP_BANNER_SOL_DD}
    Sleep  2S
    Run Keyword If  '${Admin_Access}'=='${TRUE}'  SEC/S360_Roles_Navigate from Top Banner  ${SEC/S360_NAV_GO_TO_ADMIN}   ${Current_Url}
    ...  ELSE  Element Should Not Be Visible  ${SEC/S360_NAV_GO_TO_ADMIN}
    Run Keyword If  '${Opr_Access}'=='${TRUE}'  SEC/S360_Roles_Navigate from Top Banner  ${SEC/S360_NAV_GO_TO_OPERATOR}  ${Current_Url}
    ...  ELSE  Element Should Not Be Visible  ${SEC/S360_NAV_GO_TO_OPERATOR}
    Run Keyword If  '${Dsg_Access}'=='${TRUE}'  SEC/S360_Roles_Navigate from Top Banner  ${SEC/S360_NAV_GO_TO_DESIGNER}  ${Current_Url}
    ...  ELSE  Element Should Not Be Visible  ${SEC/S360_NAV_GO_TO_DESIGNER}

SEC/S360_Roles_Navigate from Top Banner
    [Documentation]  Navigates to the role from the dropdown and comes back to the original page

    [Arguments]  ${Navigate_To_Roles}  ${Navigate_Back_Url}

    ${UniSecure_URL}=  Run Keyword And Return Status  Should Contain  ${Navigate_Back_Url}  UniSecure  ignore_case=true
    ${GoToURL}=  Set Variable If  '${UniSecure_URL}'=='${TRUE}'  Systech360  UniSecure
    
    ${DD_Status}  ${Message}  Run Keyword and Ignore Error  Wait Until Element Is Visible  ${Navigate_To_Roles}  timeout=10
    Run Keyword If  '${DD_Status}'=='FAIL'  Run Keywords  Click Element  ${SEC/S360_TOP_BANNER_SOL_DD}
    ...  AND  Wait Until Element Is Visible  ${Navigate_To_Roles}  timeout=10

    Element Should Be Visible  ${Navigate_To_Roles}
    Click Element  ${Navigate_To_Roles}
    SEC/S360_Verify For Element In Page  ${GoToURL}  ${Navigate_To_Roles}
    GoTo  ${Navigate_Back_Url}
    Sleep  2S
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=20

SEC/S360_Roles_Verify Navigation Using Dropdown Menu
    [Documentation]  Verifies navigating to different roles form dropdown menu

    [Arguments]  ${SEC/S360_URL}  ${User_Details}  ${Admin_Access}  ${Opr_Access}  ${Dsg_Access}  ${Valid_Role}

    GoTo  ${SEC/S360_URL}
    SEC/S360_Enter Credentials and Login To Solution  ${User_Details}[0]  ${User_Details}[1]  ${Valid_Role}
    Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
    ${Current_Url}=  Get Location

    wait until keyword succeeds  5x  2s  Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    Sleep  2S
    Run Keyword If  '${Admin_Access}'=='${TRUE}'  SEC/S360_Roles_Navigate from Dropdown Menu  ${SEC/S360_GO_TO_ADMIN}  ${Current_Url}
    ...  ELSE  Element Should Not Be Visible  ${SEC/S360_GO_TO_OPERATOR}
    Run Keyword If  '${Opr_Access}'=='${TRUE}'  SEC/S360_Roles_Navigate from Dropdown Menu  ${SEC/S360_GO_TO_OPERATOR}  ${Current_Url}
    ...  ELSE  Element Should Not Be Visible  ${SEC/S360_GO_TO_OPERATOR}
    Run Keyword If  '${Dsg_Access}'=='${TRUE}'  SEC/S360_Roles_Navigate from Dropdown Menu  ${SEC/S360_GO_TO_DESIGNER}  ${Current_Url}
    ...  ELSE  Element Should Not Be Visible  ${SEC/S360_GO_TO_DESIGNER}

SEC/S360_Roles_Navigate To Roles from Dropdown Menu
    [Documentation]  Navigates to the role from the dropdown

    [Arguments]  ${User_Details}  ${UniSecure_Roles_List}  ${Systech360_Roles_List}

    ${Sec_Admin_Access}   ${Sec_Opr_Access}   ${Sec_Dsg_Access}   SEC/S360_Verify Roles List Values  ${UniSecure_Roles_List}
    ${S360_Admin_Access}  ${S360_Opr_Access}  ${S360_Dsg_Access}  SEC/S360_Verify Roles List Values  ${Systech360_Roles_List}

    ${Sec_Valid_Role}=  Run Keyword If  '${Sec_Admin_Access}'=='${TRUE}'  Set Variable  ${AdminRole}
    ...  ELSE IF  '${Sec_Opr_Access}'=='${TRUE}'  Set Variable  ${OperatorRole}
    ...  ELSE IF  '${Sec_Dsg_Access}'=='${TRUE}'  Set Variable  ${DesignerRole}

    ${S360_Valid_Role}=  Run Keyword If  '${S360_Admin_Access}'=='${TRUE}'  Set Variable  ${AdminRole}
    ...  ELSE IF  '${S360_Opr_Access}'=='${TRUE}'  Set Variable  ${OperatorRole}
    ...  ELSE IF  '${S360_Dsg_Access}'=='${TRUE}'  Set Variable  ${DesignerRole}

    SEC/S360_Roles_Verify Navigation Using Dropdown Menu  ${SEC_SVT_URL}  ${User_Details}  ${Sec_Admin_Access}  ${Sec_Opr_Access}  ${Sec_Dsg_Access}
    ...  ${Sec_Valid_Role}

    SEC/S360_Roles_Verify Navigation Using Dropdown Menu  ${SPH_SVT_URL}  ${User_Details}  ${S360_Admin_Access}  ${S360_Opr_Access}  ${S360_Dsg_Access}
    ...  ${S360_Valid_Role}

SEC/S360_Roles_Navigate from Dropdown Menu
    [Documentation]  Navigates to the role from the dropdown and comes back to the original page

    [Arguments]  ${Navigate_To_Roles}  ${Navigate_Back_Url}

    Sleep  3S
    ${UniSecure_URL}=  Run Keyword And Return Status  Should Contain  ${Navigate_Back_Url}  UniSecure  ignore_case=true
    ${GoToURL}=  Set Variable If  '${UniSecure_URL}'=='${TRUE}'  UniSecure  Systech360
    
    ${Status}  ${ReturnVal}  Run Keyword And Ignore Error  SEC/S360_Verify For Element In Page  ${GoToURL}  ${Navigate_To_Roles}
    Run Keyword If  '${Status}'=='FAIL'  Run Keywords  Click Element  ${SEC/S360_CHANGE_ROLE_DD}
    ...  AND  Wait Until Element Is Visible  ${Navigate_To_Roles}  timeout=10
    ...  AND  Click Element  ${Navigate_To_Roles}
    ...  AND  SEC/S360_Verify For Element In Page  ${GoToURL}  ${Navigate_To_Roles}
    ...  AND  GoTo  ${Navigate_Back_Url}
    ...  AND  Sleep  2S
    ...  AND  Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=20

SEC/S360_Verify For Element In Page
    [Documentation]  Verifies for an unique element in pages
    
    [Arguments]  ${Base_URL}  ${Role}
    
    ${Secure_URL}=     Run Keyword And Return Status  Should Contain  ${Base_URL}  Secure      ignore_case=true
    ${Operator_Role}=  Run Keyword And Return Status  Should Contain  ${Role}      Operator    ignore_case=true
    ${Designer_Role}=  Run Keyword And Return Status  Should Contain  ${Role}      Designer    ignore_case=true
    ${Admin_Role}=     Run Keyword And Return Status  Should Contain  ${Role}      Admin       ignore_case=true
    
    Run Keyword If  '${Secure_URL}'=='${TRUE}' and '${Admin_Role}'=='${TRUE}'  Wait Until Element Is Visible  preferenceCardName_5  timeout=10
    ...  ELSE IF  '${Secure_URL}'=='${TRUE}' and '${Operator_Role}'=='${TRUE}'  Wait Until Element Is Visible  ${SEC_OP_NAV_ACTION_ITEM_ICON}  timeout=10
    ...  ELSE IF  '${Secure_URL}'=='${TRUE}' and '${Designer_Role}'=='${TRUE}'  Wait Until Element Is Visible  ${SEC_DSG_NAV_FAMILY_ICON}  timeout=10
    ...  ELSE IF  '${Secure_URL}'=='${FALSE}' and '${Admin_Role}'=='${TRUE}'  Wait Until Element Is Visible  preferenceCardName_1  timeout=10
    ...  ELSE IF  '${Secure_URL}'=='${FALSE}' and '${Operator_Role}'=='${TRUE}'  Wait Until Element Is Visible  ${S360_OP_NAV_DASHBOARD_BTN}  timeout=10
    ...  ELSE IF  '${Secure_URL}'=='${FALSE}' and '${Designer_Role}'=='${TRUE}'  Wait Until Element Is Visible  ${S360_SCENE_ICON}  timeout=10
    ...  ELSE  fail
    
SEC/S360_Verify All URL's In Solution
    [Documentation]  Verifies urls are not accessible when user is not logged in
    
    ${URL_File_Content}=    Get File  ${CURDIR}${/}..${/}Variables${/}Solution_URLs.txt
    ${URL_List}=  Get Lines Containing String  ${URL_File_Content}  https://
    @{Lines}=  Split To Lines  ${URL_List}
    ${Total_URLs}=  Get Length  ${Lines}
    
    FOR    ${Index}  IN RANGE  0  ${Total_URLs}
        GoTo  ${Lines}[${index}]
        Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_USERNAME_TXT}  timeout=2
        Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${SEC/S360_USERNAME_TXT}  timeout=5
	    Run Keyword And Continue On Failure  Element Should Be Visible  ${SEC/S360_USERNAME_TXT}
    END

SEC/S360_Roles_Verify Accessing Different Roles from Solutions
    [Documentation]  Verifies accessing different roles from Login page, explicit url and dropdown menu

    [Arguments]  ${Sec_Roles_List}  ${S360_Roles_List}
    
    SEC/S360_Roles_Update Group with Roles       ${SEC_SVT_URL}   ${UniSecure_Group}   ${Sec_Roles_List}
    SEC/S360_Roles_Update Group with Roles       ${SPH_SVT_URL}   ${Systech360_Group}  ${S360_Roles_List}
    SEC/S360_Roles_Verify Roles From Login Page  ${SEC_SVT_URL}   ${User_Details}      ${Sec_Roles_List}
    SEC/S360_Roles_Verify Roles From Login Page  ${SPH_SVT_URL}   ${User_Details}      ${S360_Roles_List}
    SEC/S360_Roles_Verify Using Explicit URL     ${User_Details}  ${Sec_Roles_List}    ${S360_Roles_List}
    SEC/S360_Roles_Navigate To Roles from Dropdown Menu   ${User_Details}  ${Sec_Roles_List}    ${S360_Roles_List}

    SEC/S360_Roles_Verify Navigation Using Top Banner  ${User_Details}  ${Sec_Roles_List}  ${S360_Roles_List}
    
SEC/S360_Roles_Delete Test Data
    [Documentation]  Deletes all the used test data
    
    GoTo  ${SEC_SVT_URL}
	SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRole}
	Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
	
	@{Users_List}=  Create List  ${User_Details}[0]
    SEC/S360_Navigate to User/Groups Page
    SEC/S360_Delete Users  @{Users_List}
    
    @{Sec_Groups_List}=  Create List  ${UniSecure_Group}
    SEC/S360_Delete User Groups  @{Sec_Groups_List}
    
    GoTo  ${SPH_SVT_URL}
	SEC/S360_Enter Credentials and Login To Solution  ${Username}  ${Password}  ${AdminRole}
	Wait Until Element Is Visible  ${SEC/S360_WELCOME_LINK}  timeout=10
	
	@{360_Groups_List}=  Create List  ${Systech360_Group}
    SEC/S360_Navigate to User/Groups Page    
    SEC/S360_Delete User Groups  @{360_Groups_List}
    