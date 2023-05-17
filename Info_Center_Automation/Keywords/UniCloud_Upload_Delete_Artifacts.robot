#------------------------------------------------------------------
#	Description			:		This case logs in to UniCloud and performs Add content to Info Center using xlsx file 
#	Project				:		UniCloud
#	Author				:		Vikram Nagesh
#	© 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- The Info Center xlsx file should be present at the folder path mentioned on the ManifestFilePathAndFileName
#	- The folder and the files to which the xlsx describes should be accessible from the local system
#
#	Epilogue:
#	- Not Applicable


*** Settings ***
Documentation		This is the case to login to UniCloud and add Info Center Data
Resource			../Keywords/UniCloud_Keywords.robot
Resource			../Locators/UniCloud_Locators.robot
Variables           ../Variables/${TESTENV}_Variable.py
Library				../UniCloud_Resources/Generic_Methods.py  WITH NAME  generic_methods

*** Keywords ***

CLD_Add Info Center Data
	[Documentation]  This test case adds info center data from navigating to Info Center
	...		and adds based on the no. of data to be inserted
	CLD_Navigation to Info Center Page From Welcome Page
	${TotalWorksheets}=  generic_methods.read_excel_file_and_return_worksheets_count  ${ManifestFilePathAndFileName}
	${ActualTotalWorksheets}=  evaluate   ${TotalWorksheets} - 1
	@{WorksheetNames}=  generic_methods.read_excel_file_and_return_worksheet_names  ${ManifestFilePathAndFileName}
	FOR  ${IndividualWorksheet}  IN RANGE  0  ${ActualTotalWorksheets}
		${TotalValidRows}=  generic_methods.total_rows_from_worksheet  ${ManifestFilePathAndFileName}
		...   ${WorksheetNames}[${IndividualWorksheet}]
		${ActualTotalValidRows}=  evaluate  ${TotalValidRows} + 1
		CLD_Read Each Row Data From Excel And Call Add Info Center records  ${ManifestFilePathAndFileName}
		...  ${ActualTotalValidRows}  ${WorksheetNames}[${IndividualWorksheet}]
    END


CLD_Delete Info Center Data
	[Documentation]  This test case deletes info center data from navigating to Info Center

	[Arguments]  ${Artifact_Desc}
	CLD_Navigation to Info Center Page From Welcome Page
    CLD_Delete Specific Records   ${Artifact_Desc}
	CLD_Move To Welcome Page


Logout of UniCloud session
	[Documentation]  This Test case is used to logout of an existing UniCloud session
	CLD_Logout of UniCloud session
	Wait Until Element Is Visible  ${CLD_USERNAME_ELEMENT_ID}

