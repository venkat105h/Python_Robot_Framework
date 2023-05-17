#------------------------------------------------------------------
#   Description       :      Keywords Related to Video Assistance
#   Project           :      UniSecure/Systech360 Automation
#   Author            :      Dinesh Kumar
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation     Common method used accross Test Suite

Variables         ../Variables/Variable.py
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=60
Library           ../Generic/GenericMethods.py
Resource          ../Locators/Generic_Locators.robot
Resource          ../Locators/VA_Locators.robot
Resource          ../Keywords/Generic_Keywords.robot

*** Keywords ***
SEC/S360_VA_Verify_Videos
    [Documentation]  Verifies all the related videos lists are available
    
    [Arguments]  ${Videos_List}
    
    @{Expected_Videos_List}=  Split String  ${Videos_List}  \#
    ${Expected_Videos_Count}=  Get Length  ${Expected_Videos_List}
    Wait Until Element Is Visible  ${SEC/S360_VIDEOS_TITLE} [1]
    ${Actual_Videos_Count}=  Get Element Count  ${SEC/S360_VIDEOS_TITLE}

    Should Be Equal  ${Actual_Videos_Count}  ${Expected_Videos_Count}
    
    FOR    ${Index}  IN RANGE  1  ${Actual_Videos_Count}+1
        ${Video_Name}=  Get Text  ${SEC/S360_VIDEOS_TITLE} [${Index}]
        List Should Contain Value  ${Expected_Videos_List}  ${Video_Name}
    END

SEC/S360_VA_Verify Sort By Views
    [Documentation]  Verifies sort by views

    ${Views_Count}=  get element count  ${SEC_VA_VIDEOS_VIEWS}

    FOR    ${View_Index}  IN RANGE  1  ${Views_Count}
        ${First_View}=  get text  ${SEC_VA_VIDEOS_VIEWS} [${View_Index}]
        @{First_View_After_Split}=  split string  ${First_View}  :
        ${First_View}=  Convert To Integer  ${First_View_After_Split}[1]
        ${Next_View}=  get text  ${SEC_VA_VIDEOS_VIEWS} [${View_Index}+1]
        @{Next_View_After_Split}=  split string  ${Next_View}  :
        ${Next_View}=  Convert To Integer  ${Next_View_After_Split}[1]
        Run Keyword If  ${First_View}<${Next_View}  Fail
    END

SEC/S360_VA_Verify Sort By Name
    [Documentation]  verifies sort by Name
    
    ${Index}=  SEC/S360_Find Visible Element Among Miltiple Matching Elements  ${SEC_VA_SORT_BY_LIST}
    select from list by value  ${SEC_VA_SORT_BY_LIST} [${Index}]  name

    ${Titles_Count}=  get element count  ${SEC_VA_VIDEOS_TITLE}

    FOR    ${Title_Index}  IN RANGE  1  ${Titles_Count}
        ${First_Title}=  get text  ${SEC_VA_VIDEOS_TITLE} [${Title_Index}]
        ${Next_Title}=  get text  ${SEC_VA_VIDEOS_TITLE} [${Title_Index}+1]
        Run Keyword If  '${First_Title}'>'${Next_Title}'  Fail
    END

SEC/S360_VA_Verify Sort By PublishedDate
    [Documentation]  verifies sort by date
    
    ${Index}=  SEC/S360_Find Visible Element Among Miltiple Matching Elements  ${SEC_VA_SORT_BY_LIST}
    select from list by value  ${SEC_VA_SORT_BY_LIST} [${Index}]  Publish

    ${Publish_Count}=  get element count  ${SEC_VA_VIDEOS_PUBLISH}

    FOR    ${Publish_Index}  IN RANGE  1  ${Publish_Count}
        ${First_Pub_Value}=  Get Text    ${SEC_VA_VIDEOS_PUBLISH} [${Publish_Index}]
        @{First_Date}=  Split String  ${First_Pub_Value}  :  max_split=1
        ${Next_Pub_Value}=  Get Text    ${SEC_VA_VIDEOS_PUBLISH} [${Publish_Index}+1]
        @{Next_Date}=  Split String  ${Next_Pub_Value}  :  max_split=1
        ${First_Formatted_Date}=  Convert Date  ${First_Date}[1]  result_format=%m/%d/%y, %I:%M %p  date_format= %m/%d/%Y, %I:%M:%S %p
        ${Next_Formatted_Date}=  Convert Date  ${Next_Date}[1]  result_format=%m/%d/%y, %I:%M %p  date_format= %m/%d/%Y, %I:%M:%S %p
        ${result}=  Subtract Date From Date  ${First_Formatted_Date}  ${Next_Formatted_Date}  date1_format=%m/%d/%y, %I:%M %p  date2_format=%m/%d/%y, %I:%M %p
        Run Keyword If  ${result}>0   fail
    END

SEC/S360_VA_Add Comment To Video
    [Documentation]  Adds comment to a video
    
    [Arguments]  ${Comment}
    # Clicks on first video
    click element  ${SEC_VA_VIDEOS_TITLE} [1]

    wait until element is visible  ${SEC_VA_OPEN_COMMENT_BTN}
    click element  ${SEC_VA_OPEN_COMMENT_BTN}
    ${Index}=  SEC/S360_Find Visible Element Among Miltiple Matching Elements  ${SEC_VA_COMMENT_TXT_FLD}
    wait until element is visible  ${SEC_VA_COMMENT_TXT_FLD} [${Index}]
    input text  ${SEC_VA_COMMENT_TXT_FLD} [${Index}]  ${Comment}
    ${Index1}=  SEC/S360_Find Visible Element Among Miltiple Matching Elements  ${SEC_VA_ADD_COMMENT_BTN}
    click element  ${SEC_VA_ADD_COMMENT_BTN} [${Index1}]

SEC/S360_VA_Like Video
    [Documentation]

    ${Before_Like_Count}  get text  ${SEC_VA_VIDEO_LIKES}
    ${Likes_Before}=   Convert To Integer  ${Before_Like_Count}

    click element  ${SEC_VA_LIKE_VIDEO}
    sleep  8S

    ${After_Like_Count}  get text  ${SEC_VA_VIDEO_LIKES}
    ${Likes_After}=   Convert To Integer  ${After_Like_Count}

    ${result}=  Evaluate  ${Likes_After}-${Likes_Before}
    should be equal  '${result}'  '1'

SEC/S360_VA_Verify Videos Assistance Feature
    [Documentation]  Verifies all the feature in a video player
    
    [Arguments]  ${Videos_List}  ${Comment_For_Video}

    Run Keyword And Continue On Failure  SEC/S360_VA_Verify Videos   ${Videos_List}
    SEC/S360_VA_Verify Sort By Views
    SEC/S360_VA_Verify Sort By Name
    SEC/S360_VA_Verify Sort By PublishedDate
    SEC/S360_VA_Add Comment To Video  ${Comment_For_Video}
    Run Keyword And Continue On Failure  SEC/S360_VA_Like Video
    ${Index}=  SEC/S360_Find Visible Element Among Miltiple Matching Elements  ${SEC_VA_CLOSE_VA_POPUP}
    Click Element  ${SEC_VA_CLOSE_VA_POPUP} [${Index}]
    wait until element is not visible  ${SEC_VA_CLOSE_VA_POPUP} [${Index}]
