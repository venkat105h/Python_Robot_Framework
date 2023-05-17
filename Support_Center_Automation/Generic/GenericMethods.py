# ------------------------------------------------------------------
#   Description       :      Common python code used for functions
#   Project           :      UniSphere Support Center Automation
#   Author            :      Dinesh Kumar
#    2018   Systech International.  All rights reserved
# ------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

import datetime
import re
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as ec
from selenium.webdriver.common.by import By

def select1():
    drivers = webdriver.Chrome()
    drivers.get(' https://eng-svt.systechcloud.net/Systech360/#/centers/support-center/software-patch')
    wait = WebDriverWait(drivers, 20)
    inputElement = wait.until(ec.visibility_of_element_located((By.ID, "searchBox")))
    inputElement = drivers.find_element_by_id("searchBox")
    inputElement.send_keys('patch')
    select = Select(drivers.find_element_by_xpath('(//select)[5]'))


    # select by visible text
    select.select_by_visible_text('bcmeb')

    # select by value
    select.select_by_value('1')





def sort_descending(array_values):
    array_values.sort(key=int, reverse=True)
    return array_values


def sort_ascending(array_values):
    array_values.sort(key=int)
    return array_values


def sort_dates_descending(array_values):
    dates = [datetime.datetime.strptime(ts, "%m/%d/%Y") for ts in array_values]
    dates.sort(reverse=True)
    sorted_dates = [datetime.datetime.strftime(ts, "%m/%d/%Y") for ts in dates]
    return sorted_dates


def fetch_number(string):
    extracted_string = re.findall('\(\d+\)', string)
    number = re.findall('\d+', extracted_string[0])
    return int(number[0])


def compare_string(string1, string2):
    if string1>string2: return True
    else: return False