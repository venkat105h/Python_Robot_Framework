# ------------------------------------------------------------------
#   Description       :      Common python code used for API Automation
#   Project           :      Preferences Automation
#   Author            :      Akash
#    2022   Systech International.  All rights reserved
# ------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

import requests
import boto3 as boto3
import uuid
from robot.libraries.BuiltIn import BuiltIn
import json


def get_Authentication_Token():
    client = boto3.client('cognito-idp', region_name='us-east-1')
    username = BuiltIn().get_variable_value("${aws_username}")
    password = BuiltIn().get_variable_value("${aws_password}")
    clientid = BuiltIn().get_variable_value("${client_id}")
    print("username" + username)
    print("clientid" + clientid)
    response = client.initiate_auth(
        AuthFlow='USER_PASSWORD_AUTH',
        AuthParameters={
            "USERNAME": username,
            "PASSWORD": password,
        },
        ClientId=clientid,
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


def create_New_Rule_Request():
    tenant = BuiltIn().get_variable_value("${ApiRuleTenant}")
    userId = BuiltIn().get_variable_value("${ApiRuleUser}")
    data = {}
    data['userName'] = userId
    data['tenant'] = tenant
    data['ruleName'] = 'AlertAPITest-systech360-qa2'
    data['component'] = 'Systech360'
    data['nodes'] = 'UserAccountUpdate'
    data['event'] = 'UserAccountUpdate'
    data['condition'] = 'Enabled'
    data['delay'] = ''
    data['comment'] = 'API Test'
    data['role'] = 'Admin'
    print(data)
    return json.dumps(data)


def create_Edit_Rule_Request():
    tenant = BuiltIn().get_variable_value("${ApiRuleTenant}")
    userId = BuiltIn().get_variable_value("${ApiRuleUser}")
    data = {}
    data['userName'] = userId
    data['tenant'] = tenant
    data['condition'] = 'Disabled'
    data['delay'] = ''
    data['comment'] = 'API Test - Edited'
    data['role'] = 'Admin'
    print(data)
    return json.dumps(data)


def create_user_preferences_Request():
    tenant = BuiltIn().get_variable_value("${ApiRuleTenant}")
    userId = BuiltIn().get_variable_value("${ApiRuleUser}")
    data = {}
    data['userName'] = userId
    data['tenant'] = tenant
    data['type'] = 'PROFILE'
    data['userNumber'] = '+919654181685'
    data['userEmail'] = 'c-amalik@dovercorp.com'
    data['language'] = 'en'
    print(data)
    return json.dumps(data)


def create_api_url(additional_url, param):
    api_base_url = BuiltIn().get_variable_value("${API_BASE_URL}")
    update_url = BuiltIn().get_variable_value("${" + additional_url + "}")
    if param:
        update_url = update_url.format(param)

    url = api_base_url + update_url
    print("url" + url)
    return url


def create_tenant_userid_api_url(additional_url, userid, tenantid):
    api_base_url = BuiltIn().get_variable_value("${API_BASE_URL}")
    update_url = BuiltIn().get_variable_value("${" + additional_url + "}")
    update_url = update_url.format(tenantid, userid)

    url = api_base_url + update_url
    print("url" + url)
    return url


def create_admin_login_to_get_token_api_url(additional_url):
    api_base_url = BuiltIn().get_variable_value("${Operator_Api_Base_Url}")
    update_url = BuiltIn().get_variable_value("${" + additional_url + "}")
    url = api_base_url + update_url
    print("url" + url)
    return url


def create_get_productionlot_by_filteridlotid_api_url(additional_url, pathparam):
    api_base_url = BuiltIn().get_variable_value("${Operator_Api_Base_Url}")
    update_url = BuiltIn().get_variable_value("${" + additional_url + "}")
    if pathparam == 'None':
        url = api_base_url + update_url
    else:
        url = api_base_url + update_url + str(pathparam)
    print("url" + url)
    return url

def create_api_url_with_multiple_path_parameters(additional_url, pathparam1,pathparam2):
    api_base_url = BuiltIn().get_variable_value("${Operator_Api_Base_Url}")
    update_url = BuiltIn().get_variable_value("${" + additional_url + "}")
    update_url = str(update_url).replace('xxx', str(pathparam1))
    update_url = str(update_url).replace('yyy', str(pathparam2))
    url = api_base_url + update_url

    print("url" + url)
    return url
