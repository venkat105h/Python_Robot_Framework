#-----------------------------------------------------------------------------------------------------------------------
#   Description       :      Test suite for UniSphere Designer
#   Project           :      UniSphere
#   Author            :      Satya R
#   © 2018   Systech International.  All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation  Test Suite for UniSphere Designer
Resource   ../Resources/keyword.robot
Resource   ../Resources/Locator.robot
Resource   ../TestCases/UniSphere_Designer.robot
Library  BuiltIn
Library  Selenium2Library
Library  Collections
Library  String
Library  robot.libraries.DateTime
Library  OperatingSystem
#-----------------------------------------------------------------------------------------------------------------------
Suite Setup  Open Browser with Solution Landing page  ${ENVIRONMENT} 
Suite Teardown  Close Browser
#-----------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Verify if user is able to create a new Site Servers
   ${New_SiteServers_name} =    Return Unique NewScene
   set global variable  ${New_SiteServers_name}
   log to console   ${New_SiteServers_name}
   ${New_SiteServers_Description} =    Return unique Description
   set global variable  ${New_SiteServers_Description}
   log to console   ${New_SiteServers_Description}
  Open Browser with Solution Landing page   ${ENVIRONMENT}
  Maximize Browser Window
  Wait Until Page Contains Element   ${ABOUTLINK}
  Click Element   ${UNISPHERELINK}
  Wait Until Page Contains Element   ${UNISPHEREUSERNAMEID}
  Login with valid Credentials for UniSecure  ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}
  Wait Until Page Contains Element  ${UNISPHERE_USERS_GROUP_ID}
  Navigate to Designer
  Navigate to Organization
  Navigate to Add New Organization from Organization
  Create New Organization   ${New_Organization}  ${New_Org_Description}


Verify if user is able to create a new Organization
   ${New_Organization} =    Return Unique NewScene
   set global variable  ${New_Organization}
   log to console   ${New_Organization}
   ${New_Org_Description} =    Return unique Description
   set global variable  ${New_Org_Description}
   log to console   ${New_Org_Description}
  Open Browser with Solution Landing page   ${ENVIRONMENT}
  Maximize Browser Window
  Wait Until Page Contains Element   ${ABOUTLINK}
  Click Element   ${UNISPHERELINK}
  Wait Until Page Contains Element   ${UNISPHEREUSERNAMEID}
  Login with valid Credentials for UniSecure  ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}
  Wait Until Page Contains Element  ${UNISPHERE_USERS_GROUP_ID}
  Navigate to Designer
  Navigate to Organization
  Navigate to Add New Organization from Organization
  Create New Organization   ${New_Organization}  ${New_Org_Description}

Verify if user is able to create a new Scene
   ${New_Scene} =    Return Unique NewScene
   ${New_Scene} =    Return Unique NewScene
   set global variable  ${New_Scene}
   log to console   ${New_Scene}
   ${New_Description} =    Return unique Description
   set global variable  ${New_Description}
   log to console   ${New_Description}
  Open Browser with Solution Landing page   ${ENVIRONMENT}
  Maximize Browser Window
  Wait Until Page Contains Element   ${ABOUTLINK}
  Navigate to UniSphere product from Solution landing page
  Login with valid Credentials for UniSecure  ${UNISPHERE_ADMINISTRATOR_USERNAME}    ${UNISPHERE_ADMINISTRATOR_PASSWORD}
  Wait Until Page Contains Element  ${UNISPHERE_USERS_GROUP_ID}
  Navigate to Designer
  Navigate to Scene
  Navigate to Add New Scene from Scene
  Create New Scene   ${New_Scene}  ${New_Description}