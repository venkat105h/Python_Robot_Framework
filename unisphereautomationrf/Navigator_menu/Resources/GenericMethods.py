from datetime import datetime

def sort_descending(array_values):
    array_values.sort(key=unicode.lower, reverse=True)
    return array_values

def sort_ascending(array_values):
    array_values.sort(key=unicode.lower)
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
	
def compare_string(string1, string2):
    if string1>string2: return True
    else: return False