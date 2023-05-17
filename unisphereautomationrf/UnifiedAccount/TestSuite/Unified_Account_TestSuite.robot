#------------------------------------------------------------------
#   Description       :      Test Suite for Unified Account
#   Project           :      Unified Account
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA

*** Settings ***
Documentation  TestSuite for Unified Account
Library           BuiltIn
Library           String
Library           robot.libraries.DateTime
Library           Selenium2Library
Library           OperatingSystem
Resource   ../Resources/resource.robot
Resource   ../Resources/Locator.robot
Resource   ../TestCases/Unified_Account_TestCases.robot

Suite Setup  Open Browser with Solution Landing page   ${ENVIRONMENT}
Suite Teardown  Close Browser

*** Test Cases ***

Create UniTrace New User
    [Documentation]      This is to Verify UniTrace Administrator is able to create a new user
    [Tags]  UniTrace
    log  Create UniTrace New User
    Create UniTrace New User