#!/usr/bin/env python
# -*- coding: UTF-8 -*-

#------------------------------------------------------------------
#	Description			:		This file contains all the methods used to read from the input excel file 
#								and manipulate the data accordingly for successful uploading of Unicloud artifacts.
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
	01. read_each_row_data_from_info_center_worksheet(filePathAndFileName, worksheetName, rowNumber)
	02. verify_info_center_cell_array_and_update(combinedCellValueArray)
	03. clear_unicode_data(string_data)
"""

from UniCloud_Datamap import get_info_center_cell_data_when_others
from UniCloud_Datamap import get_info_center_cell_data_when_empty_or_spaces
from UniCloud_Datamap import get_type_based_on_worksheetName
from openpyxl import load_workbook
import re
import datetime

def read_each_row_data_from_info_center_worksheet(filePathAndFileName, worksheetName, rowNumber):
	combinedCellValue = "";  localRowNumber = 1;  columnNumber = 1
	wb = load_workbook(filePathAndFileName, data_only=True)
	ws = wb[worksheetName]
	for row in ws.rows:
		if localRowNumber == int(rowNumber):
			for cell in row:
				if columnNumber >= 14:
					break
				else:
					cell.value = clear_unicode_data(cell.value)
					if not cell.value:
						combinedCellValue += str(get_info_center_cell_data_when_empty_or_spaces(columnNumber)) + "@#"
					else:
						if isinstance(cell.value, datetime.date):
							combinedCellValue += str(cell.value) + "@#"
						else:
							if cell.value.isspace():
								combinedCellValue += str(get_info_center_cell_data_when_empty_or_spaces(columnNumber)) + "@#"
							else:
								combinedCellValue += cell.value + "@#"
				columnNumber += 1
				print (cell.value)
				print (columnNumber)
			break
		localRowNumber += 1
	combinedCellValueArray = str(combinedCellValue).split('@#')
	del combinedCellValueArray[-1]
	if 'replaceToWorksheetName' in combinedCellValueArray[3]:
		combinedCellValueArray[3] = get_type_based_on_worksheetName(str(worksheetName))
	newCombinedCellValueArray = verify_info_center_cell_array_and_update(combinedCellValueArray)
	return newCombinedCellValueArray

def verify_info_center_cell_array_and_update(combinedCellValueArray):
	if combinedCellValueArray[11]=='FileNotFound':
		combinedCellValueArray[4] = get_info_center_cell_data_when_others(combinedCellValueArray[11])
	else:
		folderpath = combinedCellValueArray[4][:len(combinedCellValueArray[4]) - len(combinedCellValueArray[11])]
		if folderpath[-1] == '/':
			combinedCellValueArray[4] = folderpath + combinedCellValueArray[11]
		else:
			combinedCellValueArray[4] = folderpath + '/' + combinedCellValueArray[11]
	if not combinedCellValueArray[9]:
		if not combinedCellValueArray[10]:
			combinedCellValueArray[6] = ""
		else:
			combinedCellValueArray[6] = combinedCellValueArray[10]
	else:
		if not combinedCellValueArray[10]:
			combinedCellValueArray[6] = combinedCellValueArray[9]
		else:
			combinedCellValueArray[6] = combinedCellValueArray[9] +", " +combinedCellValueArray[10]
	combinedCellValueArray[7] = convert_date_string_to_date(combinedCellValueArray[7])
	return combinedCellValueArray
	
def clear_unicode_data(string_data):
	if not string_data:
		return ""
	if isinstance(string_data, str):
		string_data = str(string_data)
	else:
		if isinstance(string_data, datetime.date):
			return string_data
		else:
			string_data = string_data
	regex_to_remove_ctrl_chars = re.compile(r'[^\x20-\x7e]')
	return regex_to_remove_ctrl_chars.sub('', string_data)
	
def convert_date_string_to_date(string_data):
	if not string_data:
		return ""
	if not isinstance(string_data, datetime.date):
		return datetime.datetime.strptime(string_data, '%Y-%m-%d %M:%H:%S').date().strftime("%Y-%m-%d")