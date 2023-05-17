#------------------------------------------------------------------
#	Description			:		This locator file contains all the element references that are made from Resources and the test scripts
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
Documentation     A resource file with locators.

*** Variables ***
#######################SolutionLandingPage######################################################

${SOL_ABOUTLINK_XPATH}                                     //a[@id='about-link']
${SOL_SYSTECHONELINK_XPATH}                                //a[@id='systech-one-link']/img[1]
${SYSTECHONEMENUXPATH}                                     //*[@id="menu-item-2887"]
${UNISPHERELINK}                                           //*[@id="unisphere-link"]
${UNISECURELINK}                                           //*[@id="unisecure-link"]
${UNITRACELINK}                                            //*[@id="unitrace-link"]
${UNISERIESLINK}                                           uniseries-link
${UNISPHEREIMG}                                            //*[@id="unisphere-image"]
${UNISECUREIMG}                                            //*[@id="unisecure-image"]
${UNITRACEIMG}                                             //*[@id="unitrace-image"]
${UNISERIESIMG}                                           uniseries-link
${SOL_TWITTER_LINK}                                             twitter-link
${GOBACKBUTTONID}                                          cancel-external-btn
${CONTINUEBUTTONID}                                        continue-external-btn
${SOL_LINKEDIN_LINK}                                            linkedin-link
${SOL_CONTACTUS_LINK}                                           contact-us-link
${SOL_LOGO_LINK}                                               logo-link
${SOL_FACEBOOK_LINK}                                            facebook-link
${MARKETCIRCLEID}                                          //*[@class = "ball"]
${MARKETVIDEOID}                                           play-icon
${UNISERIES_TOOLTIP}                                       //*[@id="uniseries-image"]@title
${UNISPHERE_ABOUT_IMG}                                     //*[@id="main-content"]//img[1]
${UNISPHERE_ABOUT_VERSION_LABEL}                           //*[@id="main-content"]//p[1]
${UNISPHERE_ABOUT_BUILD_LABEL}                             //*[@id="main-content"]//p[2]
${UNISPHERE_ABOUT_COPYRIGHTS}                              //*[@id="main-content"]//p[3]
${UNISPHERE_ABOUT_CLOSE}                                   close-btn
${UNISPHERE_ABOUT_VERSION_NO}                              //*[@id="about-form"]/div[1]/label[2]
${UNISPHERE_ABOUT_BUILD_NO}                                //*[@id="about-form"]/div[2]/label[2]
${SOL_MAINTANANCE_XPATH}                                       //*[@id="maintenance"]/div/div[2]/p[3]/a
${SOL_MAINTANANCE_ICON}                                        //*[@id="maintenance"]/div/header/img
${SOL_MAINTANANCESYSUNAVAILABLE_TXT}                              //*[@id="maintenance"]/div/header/p
${SOL_MAINTANANCEINCONVINIENCE_MSG}                            //*[@id="maintenance"]/div/div[2]/p[1]
${SOL_MAINTANANCETHANKU_MSG}                                   //*[@id="maintenance"]/div/div[2]/p[2]
${SOL_MAINTANANCECONTSUP_MSG}                                  //*[@id="maintenance"]/div/div[2]/p[3]
${SOL_MAINTANANCEHERE_LINK}                                    //*[@id="maintenance"]/div/div[2]/p[3]/a
${UNISECURE_DATASTATUS}                                    //*[@id="unisecure-image"]@data-status
${UNISPHERE_DATASTATUS}                                    //*[@id="unisphere-image"]@data-status
${UNITRACE_DATASTATUS}                                     //*[@id="unitrace-image"]@data-status
${UNICLOUD_ENVIRONMENTRECORD}                              //datatable-body-cell[2]/div/div
${UNICLOUD_DISACCOUNT_CHKBOX}                              //*[@id="customerAttributes"]/div/div[2]/form/div[2]/div[2]/input[@id="disableAccount"]
${UNICLOUD_ADDCUS_ROW}                                     //*[@id="pagebody-table"]/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper
${UNICLOUD_CUSTOMER_ROW}                                   //datatable-row-wrapper
${UNICLOUD_ENABLEDISABLE}                                  /datatable-body-row/div[2]/datatable-body-cell[2]/div/div/div
${UNICLOUD_FEATURE}                                        /datatable-body-row/div[2]/datatable-body-cell[4]/div/div/div
${UNICLOUD_ADDFEATURE}                                     //*[@id="pagebody-add"]
${UNICLOUD_ADDCUS_PRODUCTNAME_ROW}                         (//DATATABLE-BODY-CELL[@tabindex='-1'])
${UNICLOUD_ADDCUS_COMMONEDITBTN}                           common-edit-
${UNICLOUD_ADDCUS_COMMONSAVEBTN}                           common-save-
${UNICLOUD_ADDCUS_DELETEBTN}                              //*[@id="remove-0"]
${UNISECUREUSERNAMEID}                                     userName
${UNISECUREPASSWORDID}                                     password
${UNISECURELOGINBTNID}                                     loginBtn
${UNISECURE_ROLEDROPDOWN}                                  roleList
${UNITRACEUSERNAMEID}                                      id_auth-username
${UNITRACEPASSWORDID}                                      id_auth-password
${UNITRACEUSERNAMETEXT}                                    auth-username
${UNITRACEPASSWORDTEXT}                                    auth-password
${UNITRACELOGINTEXT}                                       Login
${UNITRACELOGINBTNID}                                      id_wizard_goto_next
${BROWSERWIDTH}                                            1440
${BROWSERHEIGHT}                                           1080
${UNI_LOADINGICON}											id=iconLoading
##################################################################################################

######################UNITRACE####################################################################
${UNITRACEUSERNAMEID}                                      id_auth-username
${UNITRACE_SEARCHUSERSID}                                  searchbar
${UNITRACE_USERSEARCHSUBMIT}                               //*[@id="changelist-search"]/div/input[2]
${UNITRACE_SUPERUSERPERMISSIONS_ID}                        id_is_superuser
${UNITRACE_STAFFSTATUSPERMISSIONS_ID}                      id_is_staff
##################################################################################################

######################UNISPEHERE##################################################################
${UNISPHEREUSERNAMEID}                                     userName
${UNISPHEREABOUTID}                                        navBtn_about
${UNISPHERE_WELCOME_ID}                                    navBtn_welcome
${UNISPHERE_USERS_GROUP_ID}                                preferenceCardName_0
${COM_GEN_CARDPATH}			                               (//*[contains(@id,'preferenceCardName_')])
${UNISPHERE_DESIGNER_ID}
${UNISPHERE_USERSEARCH_ID}                                 filterTextBox
${UNISPHERE_SEARCHUSERID}                                  user_0
${UNISPHERE_USERALLGROUPS}                                 //*[@id="addUser"]/div[2]/div[4]/div/table/tbody/tr[1]/th[1]/input
${UNISPHERE_ADDUSERID}                                     newUser
${UNISPHERE_ADDGROUP}                                      newGroup
${UNISPHERE_USERSAVE}                                      btnSave
${UNISPHERE_USEREDITBUTTONMOUSEHOVER}                      btnOptions
${UNISPHERE_SAVEMESSAGE}                                   message-message
${UNISPHERE_UNITRACETOPLINK}                               navBtn_UniTrace
${UNISPHERE_UNISECURETOPLINK}                              dropdownMenuUniSecure
${UNISPHERE_DESIGNER_UNISECURETOPLINK}                     //a[@id='tobnavbtn_home']/div[1 and @class='dropdown']/a[1 and @class='dropdown-toggle']
${UNISPHERE_UNISECURETOPLINK_ADMINISTRATOR}                navBtn_GotoAdministrator
${UNISPHERE_UNISECURETOPLINK_DESIGNER}                     navBtn_GotoDesigner
${UNISPHERE_UNISECURETOPLINK_OPERATOR}                     navBtn_GotoOperator
${UNISPHERE_UNISECURETOPLINK_BUSINESSOWNER}                navBtn_GotoBusiness
${UNISPHERE_DESIGNER_SCENE}                                Scene-item
${UNISPHERE_OPERATOR_Scene}                                Scene-item
########################################################################################################

######################UNISECURE#########################################################################
${UNISECURE_WELCOME_ID}                                    navBtn_welcome
${UNISECURE_USERS_GROUP_ID}                                preferenceCardName_1
${UNISECURE_USERSEARCH_ID}                                 filterTextBox
${UNISECURE_SEARCHUSERID}                                  user_0
${UNISECURE_USERALLGROUPS}                                 //*[@id="addUser"]/div[2]/div[4]/div/table/tbody/tr[1]/th[1]/input
${UNISECURE_USERSAVE}                                      btnSave
${UNISECURE_USEREDITBUTTONMOUSEHOVER}                      btnOptions
${UNISECURE_SAVEMESSAGE}                                   message-message
${UNISECURE_ADDUSERID}                                     newUser
${UNISECURE_UNITRACETOPLINK}                               navBtn_UniTrace
${UNISECURE_UNISPHERETOPLINK}                              dropdownMenuUniSecure
${UNISECURE_UNISPHERETOPLINK_ADMINISTRATOR}                navBtn_GotoAdministrator
${UNISECURE_UNISPHERETOPLINK_DESIGNER}                     navBtn_GotoDesigner
${UNISECURE_UNISPHERETOPLINK_OPERATOR}                     navBtn_GotoOperator
${UNISECURE_UNISPHERETOPLINK_BUSINESSOWNER}                navBtn_GotoBusiness
${UNISECURE_DESIGNER_FAMILYICON}                           Family-icon
${UNISECURE_OPERATOR_ACTION}                               Action-icon
${UNISECURE_FAILEDLOGINERRORMSG}                           //*[@id="loginErrorMsg"]
${UNISECURE_ADMINROLE_DROPDOWN}                            Administrator
#########################################################################################################

########################UNICLOUD###########################################################################
${UNICLOUD_ENVIRONMENT_CUSTOMERID}          0200000002
${UNICLOUD_USERNAME_TXTBOX}					id=userId
${UNICLOUD_PASSWORD_TXTBOX}					id=password
${UNICLOUD_LOGIN_BUTTON}					id=loginbtn-submit
${UNICLOUD_USERDISPLAY_DROPDOWN}			id=dropdownMenu1
${UNICLOUD_LOGOUT_DROPDOWN}					id=dropdownlist-last
${UNICLOUD_PAGETITLE}						Systech UniCloud
${welcomeLinkElementID}						id=topnavbtn-welcome
${topPageHeaderButtonElementID}				id=pageheadermenu-top
${infoCenterCardElementID}					xpath://div/h4[contains(text(),'Info Center')]
${UNICLOUD_CUSTOMER_CARD}                    (//*[@id="preferencecard-name"])[6]
${UNICLOUD_ADDCUSTOMER_BUTTON}				id=pagebody-add
${UNICLOUD_ADDCUSTOMER_FLOATBUTTON}          //*[@id="editfloatbtn-top"]
${UNICLOUD_ADDCUSTOMER_SAVEBUTTON}          //*[@id="floatBtn_TXT_Save"]
${addInfoCenterElementID}  					id=newFileAttribute
${InfoCenterDescAndTagsEditBoxElementID} 	//div[@class='unitable-text']//input[@class='text-input']
${InfoCenterDescEditBoxElementID}			//datatable-body-cell[8]//input
${InfoCenterTagsEditBoxElementID}			//datatable-body-cell[9]//input
#${DragOrClickElementID}  					xpath=//span[contains(text(),'Drag or click to add a file')]
${DragOrClickElementID}  					xpath=//span[contains(text(),'Click to add a file')]
${DragOrClickFileUploadElementID}			xpath=//input[@type='file']
${LoadingProgressElementID}					xpath=//a[@id='pagebody-loading']
${LoadingProgressTrainingCenterElementID}	xpath=//*[@id="main-content"]/unicloud-training-center/unicloud-center/div[3]/div[3]/a
${LoadingProgressInfoCenterElementID}		xpath=//*[@id="main-content"]/ng-component/unicloud-center/div[3]/div[3]/a
${WebTableRowElementID}						xpath://div[@class='custom-dropdown']/select
${saveElementID}							xpath://button[@title='Save changes']
${AlwaysApproveStatus}						${TRUE}
${editNewRowDataIntableElementID}			//button[@title='Edit item']
${approveSwitchInWebTableElementID}			//div[@class='toggle-switch']
${VideosTitleEditBoxElementID}				//datatable-body-cell[6]//input
${VideosDescEditBoxElementID}				//datatable-body-cell[7]//input
${VideosTagsEditBoxElementID}				//datatable-body-cell[8]//input
${legalDocumentsCardElementID}				xpath://div/h4[contains(text(),'Legal Documents')]
${addLegalDocumentsElementID}  				id=pagebody-add
${sdkCardElementID}							xpath://div/h4[contains(text(),'SDK')]
${addSDKElementID}  						id=pagebody-add
${videosCardElementID}						xpath://div/h4[contains(text(),'Videos')]
${addVideosElementID}  						id=pagebody-add
${incortaDashboardsCardElementID}			xpath://div/h4[contains(text(),'Incorta')]
${addIncortaDashboardsElementID}  			id=pagebody-add
${deleteButtonElementID}					xpath://button[@title='Delete item']
${deleteButtonOnPopupElementID}				xpath://div[@class='modal-footer']/button[text()='Delete']
${labelElementID}							xpath://datatable-row-wrapper[1]//div/label
${WebTableElementID}						xpath://*[@id="pagebody-table"]/div
${trainingCenterCardElementID}				xpath://div/h4[contains(text(),'Training Center')]
${addTrainingCenterElementID}				id=newFileAttribute
${TrainingCenterDescEditBoxElementID}		//datatable-body-cell[8]//input
${TrainingCenterTagsEditBoxElementID}		//datatable-body-cell[9]//input
