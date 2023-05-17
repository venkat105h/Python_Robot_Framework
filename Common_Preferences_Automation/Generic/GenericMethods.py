# ------------------------------------------------------------------
#   Description       :      Common python code used for functions
#   Project           :      Preferences Automation
#   Author            :      Dinesh Kumar
#    2018   Systech International.  All rights reserved
# ------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

from datetime import datetime
import re


def sort_descending(array_values):
    array_values.sort(key=int, reverse=True)
    return array_values


def sort_ascending(array_values):
    array_values.sort(key=int)
    return array_values


def sort_dates_descending(array_values):
    dates = [datetime.strptime(ts, "%m/%d/%y, %I:%M %p") for ts in array_values]
    dates.sort(reverse=True)
    sorted_dates = [datetime.strftime(ts, "%m/%d/%y, %I:%M %p") for ts in dates]
    return sorted_dates


def sort_dates_ascending(array_values):
    dates = [datetime.strptime(ts, "%m/%d/%y, %I:%M %p") for ts in array_values]
    dates.sort(reverse=False)
    sorted_dates = [datetime.strftime(ts, "%m/%d/%y, %I:%M %p") for ts in dates]
    return sorted_dates


def fetch_number(string):
    extracted_string = re.findall('\(\d+\)', string)
    number = re.findall('\d+', extracted_string[0])
    return int(number[0])

