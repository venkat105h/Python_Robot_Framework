import datetime
import re


def remove_views(array_value):
    return [str(indValue[7:]) for indValue in array_value]


def remove_published(array_value):
    return [str(indValue[11:]) for indValue in array_value]


def sort_descending(array_values):
    array_values.sort(key=int, reverse=True)
    return array_values


def sort_ascending(array_values):
    array_values.sort(key=int)
    return array_values


def sort_dates_descending(array_values):
    dates = [datetime.datetime.strptime(ts, "%m/%d/%Y") for ts in array_values]
    dates.sort(reverse=True)
    sorteddates = [datetime.datetime.strftime(ts, "%m/%d/%Y") for ts in dates]
    return sorteddates


def fetch_number(string):
    extracted_string = re.findall('\(\d+\)', string)
    number = re.findall('\d+', extracted_string[0])
    return int(number[0])

