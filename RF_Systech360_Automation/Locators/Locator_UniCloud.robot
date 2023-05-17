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
${UNICLOUD_DISACCOUNT_CHKBOX}               //*[@id="customerAttributes"]/div/div[2]/form/div[2]/div[2]/input[@id="disableAccount"]
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
${UNICLOUD_CUSTOMER_CARD}                     (//*[@id="preferencecard-name"])[6]
${UNICLOUD_ADDCUSTOMER_BUTTON}				id=pagebody-add
${UNICLOUD_ADDCUSTOMER_FLOATBUTTON}          //*[@id="editfloatbtn-top"]
${UNICLOUD_ADDCUSTOMER_SAVEBUTTON}          //*[@id="floatBtn_TXT_Save"]
${UNICLOUD_LOGONMSG_CHKBOX}                 //*[@id="logonMessage"]
${UNICLOUD_ONPREM_CHKBOX}                   //*[@id="onPremOnly"]
${UNICLOUD_SINGLE_ID}                       Single-1
${UNICLOUD_MULTI_ID}                       Multi-1
${UNICLOUD_PARENTBREADCRUMB_LINK}           //*[@id="pageheadermenu-crumbs-1"]
${UNICLOUD_EXPIRYDATE_DATE}                 //*[@id="login-message-date"]
${UNICLOUD_LOGON_TEXTAREA}                  //*[@id="customerAttributes"]/div/div[2]/form/div[3]/textarea
${UNICLOUD_SAVEMSG_MSGBOX}                  message-message
########################################################################################################################