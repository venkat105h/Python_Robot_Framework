#-----------------------------------------------------------------------------------------------------------------------
#   Description       :      Test Cases for UniCloud Integeration with Solution Landing page, Product Enable/Disablement
#   Project           :      UniSphere
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue:
#   - UniCloud user must be created.
#   - Environment(SVT) must be created.
#
#   Epilogue:
#   - Verify the Functionality of Maintanance Page by Deactivating the account.
#   - Verify the Product Enablement Disablement functionality
#   - Verify the Logon Message with Expiry Date
#-----------------------------------------------------------------------------------------------------------------------

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

*** Test Cases ***
TC_01 To Verify if user is able to setup the Enable the products(UniSecure,UniSphere and UniTrace)in the UniCloud Environment.
    [Documentation]   This Test case is to Setup the products enablement in the UniCloud Environment.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    UNICLOUD_Delete the products
    UNICLOUD_Add Products in the Customer Summary   UniSecure
    UNICLOUD_Add Products in the Customer Summary   Systech360
    UNICLOUD_Add Products in the Customer Summary   UniTrace
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session
    [Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_02 To verify if user is able to select the Disable Account checkbox in Edit Customer and Save the details.
    [Documentation]   This Test case is to To verify if user is able to select the
    ...               Disable Account checkbox in Edit Customer and Save the details.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    UNICLOUD_Select the Account Disable Checkbox
	UNICLOUD_Click on Save button
	UNICLOUD_Logout of UniCloud session
    [Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_03 To verify if user is able to view the maintanance page after disabling the account.
    [Documentation]  This test cases is to verify the Maintanance page is displayed
    ...              to the user after disabling the account in UniCloud
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Maintanance page
    SOL_Check the UI of the Maintanance page


TC_04 To verify if user is able to navigate to systech contact page by clicking on "here" link in Maintanance page
    [Documentation]  This test cases is to verify if user is able to navigate
    ...              to systech contact page by clicking on "here" link in Maintanance page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Maintanance page
    SOL_Click on Contact Support link
    ${ContactUsURLActual} =  Get Location
    Should be equal   ${SYSTECH_CONTACTUS_LINK}    ${ContactUsURLActual}


TC_05 To verify if user is able to login to UniSphere product after disabling the account.
    [Documentation]  This test cases is to verify wheather user is able to login to
    ...              UniSphere product after disabling the account.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product    ${UNISPHERE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}   ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the Solution not enabled error message


TC_06 To verify if user is able to login to UniSecure product after disabling the account.
    [Documentation]  This test cases is to verify wheather user is able to login to
    ...              UniSecure product after disabling the account.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product    ${UNISECURE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}   ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the Solution not enabled error message


TC_07 To verify if user is able to login to UniTrace product after disabling the account.
    [Documentation]  This test cases is to verify wheather user is able to login to
    ...              UniTrace product after disabling the account.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNITRACE URL}
    SOL_Check the Maintanance page


TC_08 To verify the UniTrace Non Web UI feature after deactivating the account
    [Documentation]  This test case is to verify the System should not allow user to post jobs in
    ...              UniTrace Non Web UI feature after deactivating the account
    ${JOBRECIEPT}=  TRC_Posting the UniTrace System Inbox job
    run keyword if  ${JOBRECIEPT}== 403  pass execution  "Non Web UI feature is deactivated in UniTrace"
    ...           ELSE   Fail   "Non Web UI feature is activated in UniTrace"


TC_09 To verify if user is able to unselect the Disable Account checkbox in Edit Customer and Save the details.
    [Documentation]  This test cases is to verify if user is able to
    ...              unselect the Disable Account checkbox in Edit Customer and Save the details.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    UNICLOUD_UnSelect the Account Disable Checkbox
	COMMON_Scroll to top of the page
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session
    [Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_10 To verify if user is able to view the Solution landing page after disabling the account.
    [Documentation]  This test cases is to verify if user is able to
    ...              view the Solution landing page after enabling the account.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Solution Landing page


TC_11 To verify if user is able to disable the UniSecure product in UniCloud.
	[Documentation]  This test cases is to verify if user is able to disable the UniSecure product in UniCloud.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters  ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    COMMON_Scroll to bottom of the page
    UNICLOUD_Disable the product   UniSecure
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session
    [Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_12 To verify if UniSecure product is inactive in the Solution Landing page.
    [Documentation]  This test cases is to verify if UniSecure product is inactive in the Solution Landing page.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Product(UniSecure/UniSphere/UniTrace/UniSeries)data status
    ...   inactive  ${SOL_UNISECURE_LINK}  ${SOL_UNISECURE_IMG}  ${SOL_UNISECURE_DATASTATUS}  data-status


TC_13 To verify if user is able to login to UniSecure product after disabling the product.
    [Documentation]  This test case is to verify if user is able to login to UniSecure product after disabling the product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISECURE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}   ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the Solution not enabled error message


TC_14 To veriy if user is able to click on UniSecure link in the UniSphere product after disabling the UniSecure product.
    [Documentation]  This test case is to verify if user is able to click on UniSecure link in the
     ...             UniSphere product after disabling the UniSecure product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISPHERE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}   ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the disabled anchor link in Top banner   ${UNISPHERE_UNISECUREDISABLED_LINK}


TC_15 To verify the Non Web UI feature of UniScan login after disabling the UniSecure product
    ${LoginUniScanAPI}=  Requests_Library.GET   url=${LOGIN URL}/fingerprint/api/testverification/?format=json    username=${UNISCAN_INSPECTOR_USERNAME}@eng_svt  password=${UNISCAN_INSPECTOR_PASSWORD}
    #Set Request Header   User-Agent   UniScan 2.0
    log to console   ${LoginUniScanAPI.text}
    log to console   ${LoginUniScanAPI.status_code}
    ${LOGINUNISCANRESPONSECODE}=  Set Variable   ${LoginUniScanAPI.status_code}
    run keyword if  ${LOGINUNISCANRESPONSECODE}== 403  pass execution  "Non Web UI feature is deactivated in UniScan"
    ...           ELSE   Fail   "Non Web UI feature is activated in UniScan"


TC_16 To verify if user is able to click on the disabled UniSecure product in the Solution Landing page
    [Documentation]  This test cases is to verify if user is able to click on the
     ...             disabled UniSecure product in the Solution Landing page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product      ${LOGIN URL}
    SOL_Click on UniSecure product


TC_17 To verify if user is able to disable the UniSphere product in UniCloud.
    [Documentation]  This test cases is to verify if user is able to disable the UniSphere product in UniCloud.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    COMMON_Scroll to bottom of the page
    UNICLOUD_Disable the product   Systech360
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session


TC_18 To verify if UniSphere product is inactive in the Solution Landing page.
    [Documentation]  This test cases is to verify if UniSphere product is inactive in the Solution Landing page.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product      ${LOGIN URL}
    SOL_Check the Product(UniSecure/UniSphere/UniTrace/UniSeries)data status
    ...   inactive  ${SOL_UNISPHERE_LINK}  ${SOL_UNISPHERE_IMG}  ${SOL_UNISPHERE_DATASTATUS}  data-status


TC_19 To verify if user is able to login to UniSphere product after disabling the product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISPHERE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the Solution not enabled error message


TC_20 To verify if user is able to click on the disabled UniSphere product in the Solution Landing page
    [Documentation]  This test cases is to verify if user is able to click on the
    ...              disabled UniSphere product in the Solution Landing page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Click on UniSphere product


TC_21 To verify if user is able to disable the UniTrace product in UniCloud.
    [Documentation]  This test cases is to verify if user is able to disable the UniTrace product in UniCloud.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    COMMON_Scroll to bottom of the page
    UNICLOUD_Disable the product   UniTrace
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session
    [Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_22 To verify if UniTrace product is inactive in the Solution Landing page.
    [Documentation]  This test cases is to verify if UniTrace product is inactive in the Solution Landing page.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Product(UniSecure/UniSphere/UniTrace/UniSeries)data status
    ...   inactive  ${SOL_UNITRACE_LINK}  ${SOL_UNITRACE_IMG}  ${SOL_UNITRACE_DATASTATUS}  data-status


TC_23 To verify if user is able to login to UniTrace product after disabling the product.
    [Documentation]  This test case is to verify System should not allow user to login to
    ...              UniTrace product after disabling the product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNITRACE URL}
    TRC_Check the Solution not enabled error message


TC_24 To verify if user is able to click on the disabled UniTrace product in the Solution Landing page
    [Documentation]  This test cases is to verify if user is able to click on the
    ...              disabled UniTrace product in the Solution Landing page
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Click on UniTrace product


TC_25 To verify the UniTrace Non Web UI feature after deactivating the Product
    [Documentation]  This test case is to verify system should not allow user to process the
    ...              UniTrace Non Web UI feature after deactivating the Product
    ${JOBRECIEPT}=  TRC_Posting the UniTrace System Inbox job
    run keyword if  ${JOBRECIEPT}== 403  pass execution  "Non Web UI feature is deactivated in UniTrace"
    ...           ELSE   Fail   "Non Web UI feature is activated in UniTrace"


TC_26 To verify if user is able to Enable the UniSecure product in UniCloud.
	[Documentation]  This test cases is to verify if user is able to Enable the UniSecure product in UniCloud.
	UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_Disable the product   UniSecure
	UNICLOUD_Click on Save button
	UNICLOUD_Logout of UniCloud session
	[Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_27 To verify if UniSecure product is active in the Solution Landing page.
    [Documentation]  This test cases is to verify if UniSecure product is active in the Solution Landing page.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Product(UniSecure/UniSphere/UniTrace/UniSeries)data status
    ...  active  ${SOL_UNISECURE_LINK}  ${SOL_UNISECURE_IMG}  ${SOL_UNISECURE_DATASTATUS}  data-status


TC_28 To verify if user is able to click on UniSphere link in the UniSecure product When UniSphere product is in disabling mode.
    [Documentation]  This test case is to verify if user is able to click on
     ...             UniSphere link in the UniSecure product after disabling the UniSphere product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISECURE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}   ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the disabled anchor link in Top banner   ${UNISPHERE_UNISECUREDISABLED_LINK}


TC_29 To verify if user is able to click on UniTrace link in the UniSecure product When UniTrace product is in disabling mode.
    [Documentation]  This test case is to verify if user is able to click on
     ...             UniTrace link in the UniSecure product When UniTrace product is in disabling mode.
     SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
     SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISECURE URL}
     SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
      ...   ${UNISECURE_ADMINISTRATOR_USERNAME}   ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
     SPH/SEC_Check the disabled anchor link in Top banner   ${UNISPHERE_UNITRACEDISABLED_LINK}


TC_30 To verify if user is able to enable the UniSphere product in UniCloud.
	[Documentation]  This test cases is to verify if user is able to enable the UniSphere product in UniCloud.
	UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters  ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_Disable the product   Systech360
	UNICLOUD_Click on Save button
	UNICLOUD_Logout of UniCloud session
	[Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_31 To verify if UniSphere product is active in the Solution Landing page.
    [Documentation]  This test cases is to verify if UniSphere product is active in the Solution Landing page.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Product(UniSecure/UniSphere/UniTrace/UniSeries)data status
    ...   active  ${SOL_UNISPHERE_LINK}  ${SOL_UNISPHERE_IMG}  ${SOL_UNISPHERE_DATASTATUS}  data-status


TC_32 To verify if user is able to enable the UniTrace product in UniCloud.
	[Documentation]  This test cases is to verify if user is able to enable the UniTrace product in UniCloud.
	UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters  ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record    ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_Disable the product   UniTrace
	UNICLOUD_Click on Save button
	UNICLOUD_Logout of UniCloud session
	[Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_33 To verify if UniTrace product is active in the Solution Landing page.
    [Documentation]  This test cases is to verify if UniTrace product is active in the Solution Landing page.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Check the Product(UniSecure/UniSphere/UniTrace/UniSeries)data status
    ...  active  ${SOL_UNITRACE_LINK}  ${SOL_UNITRACE_IMG}  ${SOL_UNITRACE_DATASTATUS}  data-status


TC_34 To verify the UniTrace Non Web UI feature after activating the account or Product
    [Documentation]  This test case is to verify System should allow user to post the jobs
    ...          through the UniTrace Non Web UI feature after activating the account or Product
    ${JOBRECIEPT}=  TRC_Posting the UniTrace System Inbox job and get the Job Receipt
    ${RESPONSECODE}=  TRC_Get request of Inbox API with the job Receipt  ${JOBRECIEPT}
    run keyword if  ${RESPONSECODE}== 200  pass execution  "Non Web UI feature is activated in UniTrace"
    ...          ELSE  Fail   "Non Web UI feature is deactivated in UniTrace"


TC_35 To verify the Non Web UI feature of UniScan login after activating the UniSecure product
    ${LoginUniScanAPI}=  Requests_Library.GET   url=${LOGIN URL}/fingerprint/api/testverification/?format=json    username=${UNISCAN_INSPECTOR_USERNAME}@eng_svt  password=${UNISCAN_INSPECTOR_PASSWORD}
    #Set Request Header   User-Agent   UniScan 2.0
    log to console   ${LoginUniScanAPI.text}
    log to console   ${LoginUniScanAPI.status_code}
    ${LOGINUNISCANRESPONSECODE}=  Set Variable   ${LoginUniScanAPI.status_code}
    run keyword if  ${LOGINUNISCANRESPONSECODE}== 200  pass execution  "Non Web UI feature is activated in UniScan"
    ...           ELSE   Fail   "Non Web UI feature is deactivated in UniScan"


TC_36 To verify if user is able to enable the logon message in UniCloud with past date
    [Documentation]  This test case is to verify if user is able to enable the logon message with past date.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters  ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_Select the logon message checkbox
	UNICLOUD_Check the Current date
	UNICLOUD_Enter the Date  -1 days
	UNICLOUD_Enter logon message for all products
	run keyword and ignore error    UNICLOUD_Click on Save button    # todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50
	run keyword and ignore error   UNICLOUD_Check the Error message for entering the past date    #todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50


TC_37 To verify if user is able to enable the logon message in UniCloud with future date.
    [Documentation]  This test case is to verify if user is able to enable the logon message in UniCloud .
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters  ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_Select the logon message checkbox
	UNICLOUD_Check the Current date
	UNICLOUD_Enter the Date  7 days
	UNICLOUD_Enter logon message for all products
	run keyword and ignore error    UNICLOUD_Click on Save button    # todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50
	UNICLOUD_Logout of UniCloud session
	[Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_38 To verify if user is able to view the logon message in UniSecure product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISECURE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    Sleep  3s
    run keyword and ignore error    SPH/SEC_Check the logon Message    # todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50
    run keyword and ignore error    SPH/SEC_Close the logon Message     # todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50


TC_39 To verify if user is able to view the logon message in UniSphere product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISPHERE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...   ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    Sleep  3s
    run keyword and ignore error    SPH/SEC_Check the logon Message    # todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50
    run keyword and ignore error    SPH/SEC_Close the logon Message     # todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50

#To verify if user is able to select the OnPrem Checkbox for the Environment in UniCloud.
#    [Documentation]  This test case is to verify if user is able to
#    ...              select the OnPrem Checkbox for the Environment in UniCloud.
#    UNICLOUD_Navigate to UniCloud page
#    UNICLOUD_Login to UniCloud using URL and Username and Password parameters  ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
#    UNICLOUD_Systech UniCloud Should Be Open
#   UNICLOUD_Navigation to Add Customer Page From Welcome Page
#	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
#	UNICLOUD_Select the OnPrem Only checkbox
#	UNICLOUD_Click on Save button
#    UNICLOUD_Click on Customer in Breadcrumb
#    UNICLOUD_Check the OnPrem Single/Multi
#	UNICLOUD_Logout of UniCloud session
#	[Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_40 To verify if user is able to disable the logon message in UniCloud.
    [Documentation]  This test case is to verify if user is able to disable the logon message in UniCloud.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters  ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record    ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_UnSelect the logon message checkbox
	run keyword and ignore error    UNICLOUD_Click on Save button    # todo remove ignore error when bug is fixed    http://engjira:8080/browse/CLOUD-50
	UNICLOUD_Logout of UniCloud session
	[Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page


TC_41 To verify if user is not able to view the logon message in UniSecure product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product    ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product    ${UNISECURE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the logon popup after disabling the logon message in Unicloud


TC_42 To verify if user is not able to view the logon message in UniSphere product.
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${LOGIN URL}
    SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISPHERE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}
    SPH/SEC_Check the logon popup after disabling the logon message in Unicloud


TC_43 To verify if user is able to login to Systech360 when UniSecure product is disabled.
	[Documentation]  This test cases is to verify if user is able to Enable the UniSecure product in UniCloud.
	UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_Disable the product   UniSecure
	UNICLOUD_Click on Save button
	UNICLOUD_Logout of UniCloud session

	SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISPHERE URL}
	SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...    ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}

	COM_Navigate_To_Any_Card  ${COM_GEN_CARDPATH}  Users/Groups
    #wait until keyword succeeds  10x  2s  Click Element  ${UNISPHERE_USERGROUP_CARD}

    Wait Until Element Is Visible  ${UNISECURE_SEARCHUSER_XPATH}  timeout=15

	[Teardown]  Run Keywords  UNICLOUD_Navigate to UniCloud page
    ...  AND  UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    ...  AND  UNICLOUD_Systech UniCloud Should Be Open
    ...  AND  UNICLOUD_Navigation to Add Customer Page From Welcome Page
	...  AND  UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	...  AND  COMMON_Scroll to bottom of the page
	...  AND  UNICLOUD_Disable the product   UniSecure
	...  AND  UNICLOUD_Click on Save button
	...  AND  UNICLOUD_Logout of UniCloud session


TC_44 To verify if user is able to login to UniSecure when Systech360 product is disabled.
	[Documentation]  This test cases is to verify if user is able to Enable the UniSecure product in UniCloud.
	UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
	UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	COMMON_Scroll to bottom of the page
	UNICLOUD_Disable the product   Systech360
	UNICLOUD_Click on Save button
	UNICLOUD_Logout of UniCloud session

	SOL_Navigate to Solution Landing Page, UniSecure/UniSphere/UniTrace product     ${UNISECURE URL}
    SPH/SEC_Login with valid Credentials for UniSecure/UniSphere
    ...     ${UNISECURE_ADMINISTRATOR_USERNAME}    ${UNISECURE_ADMINISTRATOR_PASSWORD}   ${UNISECURE_ADMINROLE_DROPDOWN}

    COM_Navigate_To_Any_Card  ${COM_GEN_CARDPATH}  Users/Groups
    #wait until keyword succeeds  10x  2s  Click Element  ${UNISPHERE_USERGROUP_CARD}

    Wait Until Element Is Visible  ${UNISECURE_SEARCHUSER_XPATH}  timeout=15

	[Teardown]  Run Keywords  UNICLOUD_Navigate to UniCloud page
    ...  AND  UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    ...  AND  UNICLOUD_Systech UniCloud Should Be Open
    ...  AND  UNICLOUD_Navigation to Add Customer Page From Welcome Page
	...  AND  UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
	...  AND  COMMON_Scroll to bottom of the page
	...  AND  UNICLOUD_Disable the product   Systech360
	...  AND  UNICLOUD_Click on Save button
	...  AND  UNICLOUD_Logout of UniCloud session


TC_45 To Enable the products feature in the UniCloud Environment.
    UNICLOUD_Navigate to UniCloud page
    UNICLOUD_Login to UniCloud using URL and Username and Password parameters   ${UNICLOUD_USER}	${UNICLOUD_PASSWORD}
    UNICLOUD_Systech UniCloud Should Be Open
    UNICLOUD_Navigation to Add Customer Page From Welcome Page
    UNICLOUD_Click on Environment Record   ${UNICLOUD_MASTERACCOUNTID_MAID}
    UNICLOUD_Add Products feature in the Customer Summary   Systech360  ${UNICLOUD_FEATUREOPERATION_OPT}   ${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}
    UNICLOUD_Add Products feature in the Customer Summary   Systech360  ${UNICLOUD_FEATURESTORAGEALL_OPT}  ${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}  50
    UNICLOUD_Add Products feature in the Customer Summary   Systech360  ${UNICLOUD_FEATURECHANGEMGMT_OPT}  ${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}  999999
    UNICLOUD_Add Products feature in the Customer Summary   Systech360  ${UNICLOUD_FEATUREDATAPOOL_OPT}    ${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}
    UNICLOUD_Add Products feature in the Customer Summary   Systech360  ${UNICLOUD_FEATUREIODL_OPT}        ${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}
    UNICLOUD_Add Products feature in the Customer Summary   Systech360  ${UNICLOUD_FEATUREENTNOT_OPT}      ${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}
    UNICLOUD_Add Products feature in the Customer Summary   UniSecure   ${UNICLOUD_DIVERSION_OPT}          ${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}
    UNICLOUD_Click on Save button
    UNICLOUD_Logout of UniCloud session
