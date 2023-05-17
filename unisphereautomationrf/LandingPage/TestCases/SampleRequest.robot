*** Settings ***
Documentation    Suite description
Library          ..${/}..${/}Resources${/}Requests_Library.py
Library          Collections
Library          HttpLibrary.HTTP
Library           String
Library           robot.libraries.DateTime
Library           BuiltIn
Library           SeleniumLibrary
Library           OperatingSystem

*** Test Cases ***
Check the UniTrace Non Web UI feature after activating the account or Product
    ${JOBRECIEPT}=  Posting the UniTrace System Inbox job and get the Job Receipt
    ${RESPONSECODE}=  Get request of Inbox API with the job Receipt  ${JOBRECIEPT}
    run keyword if  ${RESPONSECODE}== 200  pass execution  "Non Web UI feature is activated in UniTrace"
    ...          ELSE  Fail   "Non Web UI feature is deactivated in UniTrace"

Check the UniTrace Non Web UI feature after deactivating the account or Product
    ${JOBRECIEPT}=  Posting the UniTrace System Inbox job and get the Job Receipt
    ${RESPONSECODE}=  Get request of Inbox API with the job Receipt  ${JOBRECIEPT}
    run keyword if  ${RESPONSECODE}== 403  pass execution  "Non Web UI feature is deactivated in UniTrace"
    ...           ELSE   Fail   "Non Web UI feature is activated in UniTrace"

*** Keywords ***
Posting the UniTrace System Inbox job and get the Job Receipt
    ${ResponseUniTraceJob}=  Requests_Library.POST  url=https://eng-svt.systechcloud.net/jobs/api/inboundjob/?message-type=SystemInbox&format=json  data=TestSatya For Checking the UniTrace job
    ...   username=SystechSuperUser@eng_svt   password=yuda2030
    log to console   ${ResponseUniTraceJob.text}
    log to console   ${ResponseUniTraceJob.status_code}
    ${Postresp}=  Set Variable  ${ResponseUniTraceJob.text}
    ${json_value}  Get Json Value  ${Postresp}  /receipt
    log to console  ${json_value}
    [Return]    ${json_value}

Get request of Inbox API with the job Receipt
    [Arguments]  ${json_value}
    ${InboxUniTracejob}=  Requests_Library.GET   url=https://eng-svt.systechcloud.net/inbox/api/getmessages/${json_value}/?message-type=SystemInbox&format=json   username=SystechSuperUser@eng_svt   password=yuda2030
    log to console   ${InboxUniTracejob.status_code}
    [Return]   ${InboxUniTracejob.status_code}


