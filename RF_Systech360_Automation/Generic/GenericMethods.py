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

from datetime import datetime, timedelta
import time
import re
import json
import mysql.connector
from mysql.connector import Error
import requests
import boto3 as boto3
import uuid
import jsonschema



def Get_DB_Data(res):
    try:
        connection = mysql.connector.connect(host='tmpsvtlatest.cxsostzg7ag9.us-east-1.rds.amazonaws.com',
                                             port='3306',
                                             user='root',
                                             password='C1Tad3l!',
                                             )

        # connection = mysql.connector.connect(host='dd-systech-eng-svt-automation.cxsostzg7ag9.us-east-1.rds.amazonaws.com',
        #                                      port='3306',
        #                                      user='root',
        #                                      password='C1Tad3l!',
        #                                      )
        if connection.is_connected():
            db_Info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_Info)
            cursor = connection.cursor()
            cursor.execute("select database();")
            record = cursor.fetchone()
            print("You're connected to database: ", record)
            mycursor = connection.cursor()
            mycursor.execute(
                "SELECT b.actionName Event, a.auditDate Date, a.userName user_name, a.systemOfOrigin account, a.solution, ad.valueBefore, ad.valueAfter FROM eng_svt_systech360.auditLog a left join eng_svt_systech360.actionTypes b on a.actionTypeId=b.actionTypeId LEFT JOIN eng_svt_systech360.auditLogDetails ad ON ad.auditLogId  = a.pkid order by a.pkid desc Limit 10")
            myresult = mycursor.fetchall()
            tuple_result = myresult[0]
            result = list(tuple_result)
            val_before_str = result[5]
            val_after_str = result[6]
            result[1] = result[1].strftime('%Y-%m-%d %H:%M')

            cursor = connection.cursor()
            cursor.execute(
                "SELECT auditlogid AS 'Primary Key', COUNT( auditlogid) AS 'Primary Key Count' FROM  eng_svt_systech360.auditLogDetails GROUP BY auditlogid HAVING COUNT(auditlogid) > 1;")
            check = cursor.fetchall()
            check = list(check)

            try:
                val_before = json.loads(val_before_str)
            except:
                val_before = val_before_str

            try:
                val_after = json.loads(val_after_str)
            except:
                val_after = val_after_str
            result[5] = val_before
            result[6] = val_after

    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

        if res == 'check_unique':
            return check
        else:
            return result


def CatString(arg):
    arg = arg[:16]
    return arg,


def item_per_page(a, b, c):
    if b == c:
        return int(a / b)
    else:
        return int((a / b) + 1)


def sort_descending(array_values):
    array_values.sort(key=int, reverse=True)
    return array_values


def compare_two_lists(a, b):
    if a == b:
        return True
    else:
        return False


def sort_ascending(array_values):
    array_values = sorted(array_values)
    return array_values


def sort_dates_descending(array_values):
    dates = [datetime.strptime(ts, "%Y-%m-%d %H:%M:%S") for ts in array_values]
    dates.sort(reverse=True)
    sorted_dates = [datetime.strftime(ts, "%Y-%m-%d %H:%M:%S") for ts in dates]
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


def compare_string(string1, string2):
    if string1 > string2:
        return True
    else:
        return False


def compare_Value(value1, value2):
    if value1 > value2:
        return True
    else:
        return False


def get_date_now():
    return time.strftime(' %m/%d/%Y ', ).replace(' 0', ' ')


def get_date_now_with_format():
    return time.strftime('%d/%m/%Y')


def get_time_now():
    return time.strftime("%I:%M:%S %p").replace('0', ' ', )


def contain(l1, value):
    for i in l1:
        if i == value:
            return 1


def getfromtuple(l1):
    result = l1[1]
    return result


def Dict_Conains(arglist, argdict):
    return (bool(set(arglist).intersection(argdict)))


def Append_list_to_list(l1, l2):
    l1.append(l2)


def empty_string(l1):
    l1.clear


def Conver_date(date):
    date = date[:16]
    date = datetime.strptime(date, '%Y-%m-%d %H:%M')
    date += timedelta(hours=4)
    date = date.strftime('%Y-%m-%d %H:%M')
    return date


def Remove_duplicates(input_list):
    output_list = []
    for raw in input_list:
        if output_list:
            if raw[4] != output_list[-1][4]:
                output_list.append(raw)
        else:
            output_list.append(raw)
    return output_list


def get_AWS_Token():
    client = boto3.client('cognito-idp', region_name='us-east-1')
    response = client.initiate_auth(
        AuthFlow='USER_PASSWORD_AUTH',
        AuthParameters={
            "USERNAME": 'systechadmindev',
            "PASSWORD": 'CognitoUser123###',
        },
        ClientId='m7hqc1m5shhkb1kkq4ocfrpc4',
    )
    token = response['AuthenticationResult']['IdToken']
    print(token)
    return token


def generate_uuid():
    id = uuid.uuid4()
    return str(id)


def create_JSON_Object(component, node, event, condition, tenant):
    data = {}
    data['type'] = 'event'
    obj = {}
    obj['eventId'] = generate_uuid()
    obj["event"] = event
    obj["component"] = component
    obj["node"] = node
    obj["source"] = "heartbeat"
    obj["condition"] = condition
    obj["tenant"] = tenant
    obj["timestamp"] = "1658467700"
    data["data"] = obj

    print(data)
    return json.dumps(data)


def create_Header(token, contentType):
    headers = {}
    headers["Authorization"] = token
    headers["content-type"] = contentType

    print(headers)
    return headers


def make_API_Call(requestType, url, headers, requestBody):
    response = requests.request(requestType, url, data=requestBody, headers=headers)
    return response


def make_API_Call_For_Admin_Login(requestType, url, headers):
    response = requests.request(requestType, url, headers=headers)
    return response


def create_Header_For_Admin_Login(autonrization, xAcceptEUSA):
    headers = {}
    headers["Authorization"] = autonrization
    headers["X-Accept-EUSA"] = 'true'

    print(headers)
    return headers


def create_Header_For_Operator_API(token, contentType):
    headers = {}
    headers["Token"] = token
    headers["content-type"] = contentType

    print(headers)
    return headers
def create_Header_Without_ContentTye(token):
    headers = {}
    headers["Token"] = token

    print(headers)
    return headers

def validate_json_schema(input_json_response, reference_schema_path):
    try:
        reference_schema = __get_reference_json(reference_schema_path)
        jsonschema.validate(instance=input_json_response, schema=reference_schema)
    except jsonschema.SchemaError as schema_err:
        raise jsonschema.SchemaError(
            f'Your schema on path {reference_schema_path} is not really a json schema ! Error: {schema_err}')
    except jsonschema.ValidationError as val_err:
        raise jsonschema.ValidationError(f'The validation went wrong ! Error: {val_err}')
    except Exception as ex:
        raise Exception(f'Something went wrong" ! Error : {ex}')

def __get_reference_json(reference_schema_path):
    try:
        with open(reference_schema_path) as json_file:
            data = json.load(json_file)
        return data
    except json.decoder.JSONDecodeError as json_err:
        raise json.decoder.JSONDecodeError(
            f'I could not make json out of file "{reference_schema_path}" ! Error: {json_err}')
    except FileNotFoundError as file_err:
        raise FileNotFoundError(f'I was not able to open file in path "{reference_schema_path}" ! Error : {file_err}')
    except Exception as ex:
        raise Exception(f'Something went wrong" ! Error : {ex}')


def make_API_Call_With_Parameters(requestType, url, headers, requestBody,parm):
    response = requests.request(requestType, url, data=requestBody, headers=headers, params=parm)
    print(response)
    return response
