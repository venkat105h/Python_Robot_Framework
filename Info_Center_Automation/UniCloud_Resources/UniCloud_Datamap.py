#------------------------------------------------------------------
#	Description			:		This file contains all the mapping of data when there are spaces or empty or needs a replacement
#								string which are inturn used to fill while uploading Unicloud artifacts.
#	Project				:		UniCloud
#	Author				:		Vikram Nagesh
#	C 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable

"""
List of Methods available:
	01. get_info_center_cell_data_when_empty_or_spaces(argument)
	02. get_info_center_cell_data_when_others(argument)
	03. get_type_based_on_worksheetName(argument)
"""
	
def get_info_center_cell_data_when_empty_or_spaces(argument):
	datamap = {
		1: "General",
		2: "General",
		3: "English",
		4: "replaceToWorksheetName",
		5: "FilePathNotAvailable",
		6: "",
		7: "",
		8: "",
		9: "",
		10: "",
		11: "",
		12: "FileNotFound",
		13: ""
	}
	return datamap.get(argument, "Dummy Text")

def get_info_center_cell_data_when_others(argument):
	datamap = {
		"productGeneral": "UniSphere",
		"versionGeneral": "1.0.0",
		"FileNotFound": "FilePathNotAvailable"
	}
	newArgument = datamap.get(argument, argument)
	newArgument = newArgument.replace('product', '')
	newArgument = newArgument.replace('version', '')
	return newArgument

def get_type_based_on_worksheetName(argument):
	datamap = {
		"BestPractices": "Best Practices",
		"Blogs": "Blogs",
		"E-Books": "e-Books",
		"Regulatory": "Regulatory",
		"Videos": "Videos",
		"Webinars": "Webinars",
		"WhitePapers": "White Papers",
		"Drivers": "Device Drivers",
		"Hardware": "Hardware",
		"OperationsManual": "Operations Manuals",
		"SetupManual": "Setup Manuals",
		"SolutionSummary": "Solution Summary",
		"TechnicalGuides": "Technical Guides",
		"VisionTools": "Vision Tools",
		"RTM": "RTM",
		"URS": "URS",
		"VQ": "VQ",
		"a": "Best Practices",
		"b": "Vision Tools",
		"c": "Webinars",
		"d": "Best Practices",
		"EULA": "EULA",
		"LegalDisclaimer": "Legal Disclaimer",
		"PrivacyPolicy": "Privacy Policy",
		"TrainingCalendar":"Calendar",
		"Videos":"Unrestricted Videos"
	}
	return datamap.get(argument, "Best Practices")