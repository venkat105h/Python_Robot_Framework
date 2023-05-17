#------------------------------------------------------------------
#	Description		:	  This file contains Test cases of Data pool features
#	Project			:	  UniSecure Automation
#	Author			:	  Vikram Nagesh
#	Copyright 		:	  (c) 2019 - Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Pre-conditions / Pre-requisites:
#	- The application is stable and is available to test
#	- Valid Admin credentials that has access for both Systech360 and UniSecure
#

*** Settings ***
Documentation			Test Cases of Data Pool

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

*** Test Cases ***
TC_01_Verify_When_Data_Pool_Is_Disabled_And_Has_No_Access
	[Documentation]  This test cases verifies if the user has no access to Data pool when the feature is disabled
	Run Keyword And Continue on Failure  UNICLOUD_Login_And_Enable_Or_Disable_Data_Pool  Disable
	[Teardown]  run keyword if test failed    UNICLOUD_Navigate to UniCloud page
