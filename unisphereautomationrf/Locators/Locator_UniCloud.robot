#------------------------------------------------------------------
#	Description			:		This locator file contains all the elements in the UniCloud
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
########################################################################################################################
##########################################  UNICLOUD   #################################################################

${UNICLOUD_USERNAME_TXTBOX}					id=userId
${UNICLOUD_PASSWORD_TXTBOX}					id=password
${UNICLOUD_LOGIN_BUTTON}					id=loginbtn-submit
${UNICLOUD_USERDISPLAY_DROPDOWN}			id=dropdownMenu1
${UNICLOUD_LOGOUT_DROPDOWN}					id=dropdownlist-last
${UNICLOUD_PAGE_TITLE}						Systech UniCloud
${UNICLOUD_ENVIRONMENTRECORDS_ENABLE}       //datatable-body-cell[2]/div/div
${UNICLOUD_DISACCOUNT_CHKBOX}               //*[@id="customerAttributes"]//*[contains(@class,"toggle-container") and contains(@class,"approved")][1]
${UNICLOUD_DISACCOUNT_CHKBOX_DISABLED}      //*[@id="customerAttributes"]//*[contains(@class,"toggle-container")][1]
${UNICLOUD_ADDCUS_ROW}                      //*[@id="pagebody-table"]/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper
${UNICLOUD_CUSTOMER_ROW}                    //datatable-row-wrapper
${UNICLOUD_ENABLEDISABLE_SLIDER}            //datatable-body-row/div[2]/datatable-body-cell[2]/div/div/div
${UNICLOUD_FEATURE_DRPDWN}                  //datatable-body-row/div[2]/datatable-body-cell[4]/div/div/div
${UNICLOUD_ADDFEATURE_BTN}                  //*[@id="pagebody-add"]
${UNICLOUD_ADDCUSPRODUCTNAME_ROW}           (//DATATABLE-BODY-CELL[@tabindex='-1'])
${UNICLOUD_MAID_ID}                         //*[@id="customerId"]
${UNICLOUD_SOLUTIONCOL_DRPDWN}              UniSeries-
${UNICLOUD_FEATUREUNISECURESCAN_DRPDWN}     Scans-
${UNICLOUD_FEATUREUNISPHEREASST_DRPDWN}     Asset Management-
${UNICLOUD_FEATUREUNITRACEMANAGED_DRPDWN}   Managed Numbers-
${UNICLOUD_FEATUREACCESS_OPT}               Access
${UNICLOUD_SYSTEMRESPONSE_OPT}              Reject
${UNICLOUD_SYSTEMRESPONSE_DRPDWN}           None-
${UNICLOUD_ADDCUS_COMMONEDITBTN}            common-edit-
${UNICLOUD_ADDCUS_COMMONSAVEBTN}            common-save-
${UNICLOUD_ADDCUS_DELETEBTN}                //*[@id="remove-0"]
${UNICLOUD_WELCOME_BTN}						id=topnavbtn-welcome
${UNICLOUD_TOPHEADER_BTN}				    id=pageheadermenu-top
#${UNICLOUD_CUSTOMER_CARD}                   //*[@id ="prefrenceCard_6"]/div/div/div/div/h4
${UNICLOUD_CUSTOMER_CARD}                   (//*[@id="preferencecard-name"])[6]
${UNICLOUD_ADDCUSTOMER_BUTTON}				id=pagebody-add
${UNICLOUD_ADDCUSTOMER_FLOATBUTTON}          //*[@id="editfloatbtn-top"]
${UNICLOUD_ADDCUSTOMER_SAVEBUTTON}          //*[@id="floatBtn_TXT_Save"]
${UNICLOUD_MESSAGE_ICON}                    id=common-comment-0
${UNICLOUD_MESSAGE_OK_BUTTON}               id=messageUpdateButton
${UNICLOUD_LOGONMSG_CHKBOX}                 //*[@id="logonMessage"]
${UNICLOUD_ONPREM_CHKBOX}                   //*[@id="onPremOnly"]
${UNICLOUD_SINGLE_ID}                       Single-1
${UNICLOUD_MULTI_ID}                       Multi-1
${UNICLOUD_PARENTBREADCRUMB_LINK}           //*[@id="pageheadermenu-crumbs-1"]
${UNICLOUD_EXPIRYDATE_DATE}                 //*[@id="login-message-date"]
${UNICLOUD_LOGON_TEXTAREA}                  //textarea[contains(@formcontrolname,"logonMessageText")]
${UNICLOUD_SAVEMSG_MSGBOX}                  message-message
${UNICLOUD_CLOSE_MSG_CENTER}               xpath=//button[@id='close-center']
${UNICLOUD_FEATUREOPERATION_OPT}            Operations
${UNICLOUD_FEATURESTORAGEALL_OPT}           StorageAllocation
${UNICLOUD_FEATURECHANGEMGMT_OPT}           ChangeManagement
${UNICLOUD_FEATUREDATAPOOL_OPT}             DataPool
${UNICLOUD_FEATUREIODL_OPT}                 IOD
${UNICLOUD_FEATUREENTNOT_OPT}               EnterpriseNotification
${UNICLOUD_DIVERSION_OPT}                   Diversion
${UNICLOUD_FEATURE_VALUE}                   //*[@id="pagebody-table"]//datatable-body-cell[5]//input
${UNICLOUD_SYSTEMRESPONSE_NONE_OPT}         None
${SEC/S360_NAME_TXT}                        id=nameInput
${S360_PICKLIST_ITEM}                       id=pick_item_0
########################################################################################################################
