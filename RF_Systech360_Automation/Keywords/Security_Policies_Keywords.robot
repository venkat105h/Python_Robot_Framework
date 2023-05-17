#------------------------------------------------------------------
#   Description       :      Keywords Related to Admin/User groups
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

Variables         ../Variables/${TESTENV}_Variable.py
Library           OperatingSystem
Library           BuiltIn
Library           Collections
Library           SeleniumLibrary  timeout=10.0
Library           ../Generic/GenericMethods.py
Resource          ../Locators/Generic_Locators.robot
Resource          ../Locators/Admin_Locators.robot
Resource          ../Keywords/Generic_Keywords.robot
Resource          ../Keywords/Admin_Keywords.robot
Resource          ../Locators/Security_Policies_Locators.robot


*** Keywords ***
SEC/S360_SP_Select/Unselect the Checkbox And Update the Value
    [Documentation]    Selects/Unselects the checkbox and updates the value from the dropdown list

    [Arguments]  ${Select/UnSelect}  ${CheckboxID}  ${DropdownID}=null  ${Value_Index}=null

    Run Keyword If  '${Select/UnSelect}'=='Select'  Run Keywords  Select Checkbox  ${CheckboxID}
    ...  AND  Select From List By Index  ${DropdownID}  ${Value_Index}
    ...  ELSE  Unselect Checkbox  ${CheckboxID}

SEC/S360_SP_Enter Answers To Security Questions
    [Documentation]    Enters random answers to security questions

    [Arguments]  ${Duplicates}=null  ${Len_Char}=10    ${Change_Que}=YES

#    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_SP_LOGIN_SEC_QUES_TXT}
    Wait Until Element Is Visible  //*[@id="msgSecurityQuestionSetup"]

    ${Total_Que_Count}=  Get Element Count  //*[@class="fa fa-pencil-square-o pencil-square-icon ng-star-inserted"]
    &{Ques_Ans_Dict}=  Create Dictionary
    
    FOR    ${Index}  IN RANGE  1  ${Total_Que_Count}+1
        ${Random_Text}=  SEC/S360_Generate Random Strings  ${Len_Char}
        ${Ques}=  Get Text  ${SEC/S360_SP_LOGIN_SEC_QUES_TXT} [${Index}]
        Input Text  ${SEC/S360_SP_LOGIN_SEC_ANS_TXTBOX} [${Index}]   ${Random_Text}
        Set To Dictionary   ${Ques_Ans_Dict}   ${Ques}   ${Random_Text}
    END
    
    Run Keyword If  '${Duplicates}'=='${TRUE}'  Input Text  ${SEC/S360_SP_LOGIN_SEC_ANS_TXTBOX} [1]  ${Random_Text}

    Click Element  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_SP_SEC_QUES_OK_BTN}

    [Return]    ${Ques_Ans_Dict}


SEC/S360_SP_Enter Unique Answers To Security Questions
    [Documentation]    Enters random answers to security questions

    [Arguments]  ${Duplicates}=null  ${Len_Char}=10    ${Change_Que}=YES

    Wait Until Element Is Visible  //*[@id="msgSecurityQuestionSetup"]
    ${Total_Que_Count}=  Get Element Count  //*[@class="fa fa-pencil-square-o pencil-square-icon ng-star-inserted"]
     FOR    ${Index}  IN RANGE  1  ${Total_Que_Count}+1
         Input Text  (//*[contains(@id,'txtAnswerSetup_')])[${Index}]   11111
     END

    wait until keyword succeeds    3x    2s    click element    //*[@id="btnOkSecurityQuestionSetup"]


SEC/S360_SP_Change Question And Answer Security Questions
    [Documentation]    Selects different questions and answers security question

    [Arguments]  ${Change_Que}=YES

    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_SP_CHANGE_SEC_QUES_TXT}
    ${Total_Que_Count}=  Get Element Count  ${SEC/S360_SP_CHANGE_SEC_QUES_TXT}
    Sleep  2S
    &{Ques_Ans_Dict}=  Create Dictionary
    
    FOR    ${Index}  IN RANGE  1  ${Total_Que_Count}+1
        Run Keyword If  '${Change_Que}'!='NO'  Run Keywords  Click Element  ${SEC/S360_SP_EDIT_SEC_QUE_BTN} [${Index}]
        ...  AND  Select From List By Index  ${SEC/S360_SP_UPDATE_SEC_QUE_DD} [1]  0
        ...  AND  Click Element  ${SEC/S360_SP_UPDATE_SEC_QUE_BTN} [1]
        ${Updated_Ques}=  Get Text  ${SEC/S360_SP_CHANGE_SEC_QUES_TXT} [${Index}]
        ${Random_Text}=  SEC/S360_Generate Random Strings
        Input Text  ${SEC/S360_SP_CHANGE_SEC_ANS_TXTBOX} [${Index}]   ${Random_Text}
        Set To Dictionary   ${Ques_Ans_Dict}   ${Updated_Ques}   ${Random_Text}
    END
    
    Click Element  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    SEC/S360_Save Changes

    [Return]    ${Ques_Ans_Dict}


SEC/S360_SP_Answer Unfiled Question And Answer Security Questions
    [Documentation]    Selects different questions and answers security question

    [Arguments]

    wait until element is visible    (//*[contains(@id,'txtAnswerSetup_')])
    ${Total_Que_Count}=  Get Element Count  (//*[contains(@id,'txtAnswerSetup_')])
    Sleep  2S

    FOR    ${Index}  IN RANGE  1  ${Total_Que_Count}+1

        ${Random_Text}=  SEC/S360_Generate Random Strings
        Input Text  (//*[contains(@id,'txtAnswerSetup_')])[${Index}]    ${Random_Text}

    END

    Click Element  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    SEC/S360_Save Changes



SEC/S360_SP_Set Question And Answer Security Questions
    [Documentation]    Selects different questions and answers security question

    [Arguments]  ${Change_Que}=YES

#    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_SP_CHANGE_SEC_QUES_TXT}
    ${Total_Que_Count}=  Get Element Count  ${SEC/S360_SP_UPDATE_BUTTON}
    Sleep  2S
    &{Ques_Ans_Dict}=  Create Dictionary

    FOR    ${Index}  IN RANGE  0  ${Total_Que_Count}
        WAIT UNTIL KEYWORD SUCCEEDS    2x    2s   click element    //*[@id="btnEditSecurityQuestion_${Index}"]
        WAIT UNTIL KEYWORD SUCCEEDS    2x    2s   click element    //*[@id="btnUpdateSecurityQuestion_${Index}"]
        wait until element is visible    //*[@id="txtAnswerSetup_${Index}"]
        ${Random_Text}=  SEC/S360_Generate Random Strings
        Input Text    //*[@id="txtAnswerSetup_${Index}"]     ${Random_Text}
    END

    Click Element  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    Wait Until Element Is Not Visible  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    SEC/S360_Save Changes

    [Return]    ${Ques_Ans_Dict}

Change Security Question
    [Documentation]    keyword to change security questions
    sleep    12s
    wait until keyword succeeds    2x    2s    click element    //*[@id="dropdownMenu1"]
    wait until keyword succeeds    2x    2s    click element    //*[@id="goToPreference"]
    sleep    5s
    wait until keyword succeeds    2x    2s    click element    //*[@id="preferenceCardHead_1"]
    wait until keyword succeeds    2x    2s    click element    //*[@id="changeSecQuestion"]



SEC/S369_SP_Wrong Answers To Corresponding Questions
    [Documentation]  updates the security questions with the corresponding answers

    [Arguments]    ${Incorrect_Ans}=null  ${Case_Sen}=null

    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}
    ${Total_Que_Count}=  Get Element Count  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}

    FOR    ${Index}  IN RANGE  1  ${Total_Que_Count}+1
        Input Text  ${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX} [${Index}]  1111
    END



SEC/S369_SP_Right Answers To Corresponding Questions
    [Documentation]  updates the security questions with the corresponding answers


    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}
    ${Total_Que_Count}=  Get Element Count  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}

    FOR    ${Index}  IN RANGE  1  ${Total_Que_Count}+1
        ${Que}=  Get Text  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT} [${Index}]
        Input Text  ${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX} [${Index}]  ${Que}
    END
    wait until keyword succeeds    2x    2s    click element    //*[@id="btnOkSecurityQuestionSetup"]




SEC/S369_SP_Right 50_CHAnswers To Corresponding Questions
    [Documentation]  updates the security questions with the corresponding answers
    [Arguments]    ${Que}


    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}
    ${Total_Que_Count}=  Get Element Count  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}


        FOR    ${Index}   IN RANGE  1  ${Total_Que_Count}+1

             ${keys}=  Get Text  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT} [${Index}]
             ${Ans}=  Get From Dictionary  ${Que}  ${keys}
             Input Text  ${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX} [${Index}]  ${Ans}
        END
    wait until keyword succeeds    2x    2s    click element    //*[@id="btnOkSecurityQuestionSetup"]






SEC/S369_SP_Update Answers To Corresponding Questions
    [Documentation]  updates the security questions with the corresponding answers

    [Arguments]  ${Ques_Ans_Dict}  ${Incorrect_Ans}=null  ${Case_Sen}=null

    wait until keyword succeeds  5x  2s  Wait Until Element Is Visible  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}
    ${Total_Que_Count}=  Get Element Count  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}
    
    FOR    ${Index}  IN RANGE  1  ${Total_Que_Count}+1
        ${Que}=  Get Text  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT} [${Index}]
        ${Ans}=  Get From Dictionary  ${Ques_Ans_Dict}  ${Que}
        Input Text  ${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX} [${Index}]  ${Ans}
    END

    ${Ans1}=  Get Value  ${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX} [1]
    ${Uppercase_Ans}=  Convert To Upper Case  ${Ans1}
    Run Keyword If  '${Case_Sen}'=='${TRUE}'  Input Text  ${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX} [1]  ${Uppercase_Ans}
    Run Keyword If  '${Incorrect_Ans}'=='${TRUE}'  Input Text  ${SEC/S360_SP_UNLOCK_SEC_ANS_TXT_BOX} [1]  ${Ans1}a

    Click Element  ${SEC/S360_SP_SEC_QUES_OK_BTN}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${SEC/S360_SP_UNLOCK_SEC_QUES_TXT}



SEC/S360_SP_Click Login Button
    [Documentation]    Clicks on login button single/multiple times

    [Arguments]    ${Click_Count}=1

    Wait Until Element Is Enabled  ${SEC/S360_LOGIN_BTN}  timeout=15
    Sleep  0.5S
    Click Element  ${SEC/S360_LOGIN_BTN}

    Run Keyword If  ${Click_Count}>1  Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}  timeout=15
    
    FOR    ${Click_Counter}  IN RANGE  2  ${Click_Count}+1
        Wait Until Element Is Enabled  ${SEC/S360_LOGIN_BTN}  timeout=15
        Wait Until Element Is Visible  ${SEC/S360_LOGIN_ERROR_MSG_ID}  timeout=15
        Sleep  0.5S
        Click Element  ${SEC/S360_LOGIN_BTN}
    END

SEC/S360_SP_Update Default Values In SP
    [Documentation]  Updates default values in security policies page

    SEC/S360_Navigate To Security Policies Page
    SEC/S360_SP_Select/Unselect the Checkbox And Update the Value  Select  ${SEC/S360_SP_SAME_PWD_CHKBOX}          ${SEC/S360_SP_SAME_PWD_DD}        11
    SEC/S360_SP_Select/Unselect the Checkbox And Update the Value  Select  ${SEC/S360_SP_DISABLE_ACC_CHKBOX}       ${SEC/S360_SP_DISABLE_ACC_DD}     2
    SEC/S360_SP_Select/Unselect the Checkbox And Update the Value  Select  ${SEC/S360_SP_REQ_SEC_QUES_CHKBOX}      ${SEC/S360_SP_REQ_SEC_QUES_DD}    2
    SEC/S360_SP_Select/Unselect the Checkbox And Update the Value  Select  ${SEC/S360_SP_FORCE_PWD_CHANGE_CHKBOX}  ${SEC/S360_SP_FORCE_PWD_CHANGE_DAYS_DD}  29
    SEC/S360_SP_Select/Unselect the Checkbox And Update the Value  Select  ${SEC/S360_SP_FORCE_PWD_CHANGE_CHKBOX}  ${SEC/S360_SP_FORCE_PWD_CHANGE_MONTH_DD}  1
    SEC/S360_Save Changes

SEC/S360_SP_Precondition for Security Policies
    [Documentation]  Precondition to delete and create users for testing

    ${Users_File_Content}=  Get File  ${EXECDIR}${/}RF_Systech360_Automation${/}Variables${/}User_Details.txt
    ${User_Details_List}=  Get Lines Containing String  ${Users_File_Content}  CreateUser
    @{Lines}=  Split String  ${User_Details_List}  \n
    ${Lines_Count}=  Get Length  ${Lines}
    
    FOR    ${Details}  IN  @{Lines}
        @{User_Details}=  Split String  ${Details}  \#
        Remove From List  ${User_Details}  0
        Remove From List  ${User_Details}  0
        Run Keyword And Ignore Error  SEC/S360_Delete Users  ${User_Details}[0]
        wait until element is visible   ${SEC/S360_APPROVE_SUCC_MSG}
        click element    ${SEC/S360_APPROVE_SUCC_MSG}
    END

    FOR    ${Details}  IN  @{Lines}
        @{User_Details}=  Split String  ${Details}  \#
        Remove From List  ${User_Details}  0
        Remove From List  ${User_Details}  0
        SEC/S360_Create New User  ${User_Details}  ${User_Details}[-1]
        SEC/S360_Navigate Back To Users Page Using Parent Tab
    END

SEC/S360_SP_Get User Details
    [Documentation]  Gets the user details of the required user

    [Arguments]  ${String_In_Line}

    #${Users_File_Content}=    Get File  ${EXECDIR}${/}RF_Systech360_Automation${/}Variables${/}User_Details.txt
    #path changed by Akash - to get file picked from variable folder
    ${Users_File_Content}=    Get File  ${EXECDIR}${/}..${/}Variables${/}User_Details.txt
    ${User_Details_List}=  Get Lines Containing String  ${Users_File_Content}  ${String_In_Line}
    @{User_Details}=  Split String  ${User_Details_List}  \#
    Remove From List  ${User_Details}  0
    Remove From List  ${User_Details}  0

    [Return]  ${User_Details}


SEC/S360_ENABLE/DISABLE Scope Policy
    [Documentation]  ENABLE/DISABLE Scope policy from Security Policy card
    [Arguments]    ${en/dis}
     wait until keyword succeeds    3x    3s    click element    ${SEC/S360_SECURITY_POLICY_CARD}
    wait until element is visible    ${SEC/S360_DISABLE_SCOPE_POLICY}
    run keyword if    ${en/dis}== 1     Unselect Checkbox    ${SEC/S360_DISABLE_SCOPE_POLICY}    ELSE    select checkbox    ${SEC/S360_DISABLE_SCOPE_POLICY}
    wait until keyword succeeds    3x    3s    click element    ${SEC/S360_SP_SAVE_BUTTON}
    wait until element is visible    ${SEC/S360_APPROVE_SUCC_MSG}
    wait until keyword succeeds    3x    3s    click element    ${SEC/S360_ADMIN_PAGE}