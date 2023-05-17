#------------------------------------------------------------------
#	Description			:		This resource file is written to be reused by other Robot scrits.
#	Project				:		UniSphere
#	Author				:		Satya R
#	© 2018 Systech International. All rights reserved
#------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable

*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.

Library           String
Library           DateTime
Library           BuiltIn
Library           SeleniumLibrary
Library           OperatingSystem
Resource          SOL_RESOURCE.robot
Resource          SPHSEC_RESOURCE.robot
Resource          TRC_RESOURCE.robot
Resource          UNICLOUD_RESOURCE.robot
Resource          MessagePrefix.robot
Resource          ..${/}UniSphere_Designer${/}Resources${/}SPH_DESN.robot
Resource          ..${/}Navigator_menu${/}Resources${/}Navigator_Resources.robot
Resource          ..${/}LandingPage${/}Resources${/}ChineseEnglishVariable.robot
Resource          ..${/}Locators${/}Locator_Solution_Landing_Page.robot
Resource          ..${/}Locators${/}Locator_UniCloud.robot
Resource          ..${/}Locators${/}Locator_UniTrace.robot
Resource          ..${/}Locators${/}Locator_UniSecure.robot
Resource          ..${/}Locators${/}Locator_UniSphere.robot

*** Keywords ***

########################################################################################################################
################################################### COMMON #############################################################

COMMON_Focus on New Tab
    [Documentation]     This keyword is to focus on the new tab in the browser.
    @{windows} =  Get Window Handles
    ${numWindows} =   Get Length  ${windows}
    ${indexLast} =   Evaluate  ${numWindows}-1
    Should Be True  ${numWindows} > 1
    Switch Window   ${windows}[${indexLast}]

COMMON_Scroll Page To Location
    [Documentation]   This keyword is used to execute javascript to scroll the page.
    ...               ${x_location} is to provide the coordinate to scroll to, along the x-axis (horizontal), in pixels
    ...               ${y_location} is to provide the coordinate to scroll to, along the y-axis (vertical), in pixels
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

COMMON_Scroll to top of the page
    [Documentation]  This keyword is to scroll the page to the top
    COMMON_Scroll Page To Location  0   0

COMMON_Scroll to bottom of the page
    [Documentation]  This keyword is to scroll the page to the bottom
    COMMON_Scroll Page To Location  0  2000

COMMON_Scroll to right of the page
    [Documentation]  This keyword is to scroll the page to the bottom
    COMMON_Scroll Page To Location  2000  0

COMMON_Check the background color
    [Arguments]   ${locator}   ${Expectedbgcolor}
    [Documentation]  This keyword is to check the background color of the elements with the html id's.
    ...              ${locator}  is used to provide the locator of the element for getting the background color
    ...              ${Expectedbgcolor} is used to provide the expected background color
    #${bgcolor}    Execute Javascript    return   document.defaultView.getComputedStyle(document.getElementById("navBtn_about"),null)['background-color']
    ${elem}=    Execute Javascript    return document.getElementById('${locator}');
    log to console  ${elem}
    ${bg color}=    Call Method    ${elem}    value_of_css_property    background-color
    log to console   ${bg color}
    log to console   ${Expectedbgcolor}
    should be equal as strings  ${Expectedbgcolor}  ${bg color}

Check the background colorof navigator css
    [Arguments]   ${locator}
    [Documentation]  This keyword is to check the background color of the navigator css.
    ${element}=    Set Variable    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('background-color');
    Log to console  ${attribute_value}
########################################################################################################################
COMMON_Declare Random variables for UniTrace User
    [Documentation]   This keyword is used for create random variables for Unitrace user.
    ${UNITRACE_username} =    Return Unique Username
    set global variable   ${UNITRACE_username}
    log to console   ${UNITRACE_username}
    ${UNITRACE_password} =    Return unique password
    set global variable   ${UNITRACE_password}
    log to console   ${UNITRACE_password}
    ${UNITRACE_email}=    Return Unique Email Address
    set global variable  ${UNITRACE_email}
    log to console   ${UNITRACE_email}

COMMON_Declare Random variables for UniSecure Administrator
    [Documentation]   This keyword is used for create random variables for Administrator user.
    ${UNISECURE_username} =    Return Unique Username
    set global variable  ${UNISECURE_username}
    log to console   ${UNISECURE_username}
    ${UNISECURE_password} =    Return unique password
    set global variable  ${UNISECURE_password}
    log to console   ${UNISECURE_password}
    ${UNISECURE_email}=    Return Unique Email Address
    set global variable  ${UNISECURE_email}
    log to console   ${UNISECURE_email}

COMMON_Declare Random variables for UniSphere Administrator
    [Documentation]   This keyword is used for create random variables for Administrator user.
    ${UNISPHERE_username} =    Return Unique Username
    set global variable  ${UNISPHERE_username}
    log to console   ${UNISPHERE_username}
    ${UNISPHERE_password} =    Return unique password
    set global variable  ${UNISPHERE_password}
    log to console   ${UNISPHERE_password}
    ${UNISPHERE_email}=    Return Unique Email Address
    set global variable  ${UNISPHERE_email}
    log to console   ${UNISPHERE_email}

COMMON_Declare Random Variables for Username, Password and Email Address
    [Documentation]  This keyword is used to create the randome variables for Username, Password, Email Address
    [Arguments]  ${USERNAME}   ${PASSWORD}    ${EMAIL}
    ${USERNAME} =    Return Unique Username
    set global variable   ${USERNAME}
    log to console   ${USERNAME}
    ${PASSWORD} =    Return unique password
    set global variable   ${PASSWORD}
    log to console   ${PASSWORD}
    ${EMAIL}=    Return Unique Email Address
    set global variable  ${EMAIL}
    log to console   ${EMAIL}

COMMON_Declare Random variables for UniSphere Designer
    [Documentation]   This keyword is used for create random variables for Designer user and Group.
    ${UNISPHERE_Designer_username} =    Return Unique Username
    set global variable  ${UNISPHERE_Designer_username}
    log to console   ${UNISPHERE_Designer_username}
    ${UNISPHERE_Designer_password} =    Return unique password
    set global variable  ${UNISPHERE_Designer_password}
    log to console   ${UNISPHERE_Designer_password}
    ${UNISPHERE_Designer_email}=    Return Unique Email Address
    set global variable  ${UNISPHERE_Designer_email}
    log to console   ${UNISPHERE_Designer_email}
    ${Designer_GroupName}=  Return Unique Group Name
    set global variable  ${Designer_GroupName}
    log to console   ${Designer_GroupName}
    ${Designer_GroupDescription}=  Return Unique Group Description
    set global variable   ${Designer_GroupDescription}
    log to console   ${Designer_GroupDescription}

COMMON_Declare Random variables for UniSphere Operator
    [Documentation]   This keyword is used for create random variables for Operator user and Group.
    ${UNISPHERE_Operator_username} =    Return Unique Username
    set global variable  ${UNISPHERE_Operator_username}
    log to console   ${UNISPHERE_Operator_username}
    ${UNISPHERE_Operator_password} =    Return unique password
    set global variable  ${UNISPHERE_Operator_password}
    log to console   ${UNISPHERE_Operator_password}
    ${UNISPHERE_Operator_email}=    Return Unique Email Address
    set global variable  ${UNISPHERE_Operator_email}
    log to console   ${UNISPHERE_Operator_email}
    ${Operator_GroupName}=  Return Unique Group Name
    set global variable  ${Operator_GroupName}
    log to console   ${Operator_GroupName}
    ${Operator_GroupDescription}=  Return Unique Group Description
    set global variable   ${Operator_GroupDescription}
    log to console   ${Operator_GroupDescription}

COMMON_Declare Random variables for Business Owner
    [Documentation]   This keyword is used for create random variables for Business Owner user and Group.
    ${UNISECURE_BO_username} =    Return Unique Username
    set global variable  ${UNISECURE_BO_username}
    log to console   ${UNISECURE_BO_username}
    ${UNISECURE_BO_password} =    Return unique password
    set global variable  ${UNISECURE_BO_password}
    log to console   ${UNISECURE_BO_password}
    ${UNISECURE_BO_email}=    Return Unique Email Address
    set global variable  ${UNISECURE_BO_email}
    log to console   ${UNISECURE_BO_email}
    ${BO_GroupName}=  Return Unique Group Name
    set global variable  ${BO_GroupName}
    log to console   ${BO_GroupName}
    ${BO_GroupDescription}=  Return Unique Group Description
    set global variable   ${BO_GroupDescription}
    log to console   ${BO_GroupDescription}

COMMON_Declare Random variables for Editor Name and Description
    [Documentation]  This keyword is used to declare the random variables for Editor name and description
    ${Random_name} =    Return Unique Editor NameInput  8
    set global variable  ${Random_name}
    log to console   ${Random_name}
    ${Random_Description} =    Return Unique Editor DescriptionInput  15
    set global variable  ${Random_Description}
    log to console   ${Random_Description}

Return Unique Editor NameInput
    [Documentation]   Returns random name
    [Arguments]    ${NAMELENGTH}
    ${unique}=    generate random string    ${NAMELENGTH}    [LOWER]
    ${result}=    Set Variable    ${unique}
    [Return]    ${result}

Return Unique Editor DescriptionInput
    [Documentation]   Returns random Description
    [Arguments]   ${DESCRIPTIONLENGTH}
    ${unique}=    generate random string    ${DESCRIPTIONLENGTH}    [LOWER]
    ${result}=    Set Variable    ${unique}
    [Return]    ${result}


Return Unique Username
    [Documentation]   Returns unique username with Prefix and suffix
    [Arguments]    ${prefix}=Unified    ${suffix}=Account
    ${unique}=    generate random string    8    [LETTERS]
    ${result}=    Set Variable    ${prefix}${unique}${suffix}
    [Return]    ${result}

Return Unique Password
    [Documentation]   Create unique password with prefix arguments
    [Arguments]    ${prefix}=59*$
    ${unique}=    return unique username
    ${result}=    Set Variable    ${prefix}${unique}
    [Return]    ${result}

Return Unique Email Address
    [Documentation]   Returns a pseudo-unique email address. Optional arguments - prefix for the username, and domain
    [Arguments]    ${prefix}=Unified    ${domain}=test.com
    ${unique}=    Get Current Date    result_format=epoch
    ${unique}=    Convert To Integer   ${unique * 1000}
    ${unique}=    Convert To String    ${unique}
    ${result}=    Set Variable    ${prefix}${unique}@${domain}
    [Return]    ${result}

Return Unique Group Name
    [Documentation]   Return Unique Group Name
    [Arguments]    ${prefix}=UniGroup    ${suffix}=Group
    ${unique}=    generate random string    3    [LETTERS]
    ${result}=    Set Variable    ${prefix}${unique}${suffix}
    [Return]    ${result}

Return Unique Group Description
    [Documentation]   Return Unique Group Description
    [Arguments]    ${prefix}=UniGroup
    ${unique}=    generate random string    3    [LETTERS]
    ${result}=    Set Variable    ${prefix}${unique}
    [Return]    ${result}

COM_Verify loading object presence and absence
	[Documentation]  This keyword verifies the loading object presence and absence
	...  The keyword takes no arguments, but considers that the loading icon has a common object path  
	...  The keyword does not return any values
	...  This keyword can be used when a new page is loaded after the loading icon and to work on objects inside it
	...  If the page loading is very fast even though the Loading... icon appears and disappears very fast, this keyword should not be used 
	
	# This condition is used so this keyword can be used for both visible and not visible check
	Run Keyword and Ignore Error  Wait Until Element is Visible  ${UNI_LOADINGICON}  timeout=15
	Run Keyword and Ignore Error  Wait Until Element is Not Visible  ${UNI_LOADINGICON}  timeout=10

COM_Get_Custom_Page_Screenshot
	[Documentation]  Page screen shot taken by suffixing the sent filename value with the timestamp
	[Arguments]  ${Filename_Value}
	Sleep  2s
	${date}=  Get Current Date  result_format=%m%d%Y
	${time}=  Get Current Date  result_format=%H%M%S
	Capture Page Screenshot  filename=${Filename_Value}_${date}_${time}.png