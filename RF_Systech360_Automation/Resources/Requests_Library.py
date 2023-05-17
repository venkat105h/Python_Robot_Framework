import requests

__all__ = ['GET', 'POST']

def GET(url, username = None, password= None, headers = None):
    if username and password:
        auth = (username, password)
    else:
        auth = None

    response = requests.get(url=url, auth=auth, headers=headers)
    return response

def POST(url, data, username = None, password = None, headers = None):
    if username and password:
        auth = (username, password)
    else:
        auth = None
    print(data)
    response = requests.post(url=url, auth=auth, headers=headers, data=data.encode())
    return response