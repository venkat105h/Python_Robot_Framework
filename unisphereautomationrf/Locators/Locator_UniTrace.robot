#------------------------------------------------------------------
#	Description			:		This locator file contains all the element in the Solution Landing page
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
##########################################  UNITRACE  ##################################################################
${TRC_USERNAME_TXTBOX}                                      //*[@id="id_auth-username"]
${TRC_PASSWORD_TXTBOX}                                      //*[@id="id_auth-password"]
${TRC_LOGIN_BTN}                                            //*[@id="id_wizard_goto_next"]
${TRC_LOGOUT_DRPDWN}                                        //*[@id="row-menu"]/div/div/div[2]/ul[2]/li/a
${TRC_ADMIN_TXT}                                           Administration
${TRC_ADMINSITE_ID}                                        //h1[@id="site-name"]
${TRC_USERGRID_XPATH}                                       //a[@href='/admin/auth/user/']
${TRC_ADDUSER_XPATH}                                         //a[@href='/admin/auth/user/add/']
${TRC_FORM_ID}                                              user_form
${TRC_EDITUSERNAME_TXTBX}                                   //input[@id='id_username']
${TRC_EDITPASSWORD_TXTBX}                                   //input[@id='id_password1']
${TRC_EDITCNFPWD_TXTBX}                                     //input[@id='id_password2']
${TRC_EDITEMAIL_TXTBX}                                      //input[@id='id_email']
${TRC_EDITVALIDDAYS_TXTBX}                                  //input[@id='id_userpasswordmanagement-0-password_valid_days']
${TRC_EDITSAVE_BTN}                                       //input[@name='_save']
${TRC_USRSAVE_MSG}                                         //li[@class='success']
${TRC_SUCESSPART1_MSG}                                          The user
${TRC_SUCESSPART2_MSG}                                          was changed successfully.
${TRC_SUCESSPART3_MSG}                                          was added successfully. You may edit it again below
${TRC_STAFF_ROLE}                                          //input[@id='id_is_staff']
${TRC_ADMINISTRATOR_XPATH}                             //h1[@id="site-name"]
${TRC_LOGOUT_MENU}                                     css=ul.nav.navbar-nav.navbar-right.pull-right
${TRC_LOGOUT_LINK}                                     /logout/
${TRC_LOGGEDOUT_TEXT}                                  Logged Out
${TRC_SYSTECH_LOGO}                                    //img[@src='/media/systech_logo.png']
${TRC_USERLOGIN_TITLE}                                          Authentication Portal | Terms of Service
${TRC_EULAACCEPT_BTN}                                          id_accept_eusa
${TRC_DASHBOARD_ROW}                                   //*[@id="row-menu"]
${TRC_SEARCHUSERS_ID}                                  searchbar
${TRC_USERSEARCHSUBMIT_BTN}                               //*[@id="changelist-search"]/div/input[2]
${TRC_SEARCHEDUSERNAME_XPATH}                               //*[@id="result_list"]/tbody/tr/th/a
${TRC_STAFFSTATUSPERMISSIONS_ID}                      id_is_staff
${TRC_SUCCESS_MASSEGE}                                 //*[@id="container"]/ul/li
${TRC_SUPERUSERPERMISSIONS_ID}                        id_is_superuser
${TRC_SOLDISABLEDMSG_XPATH}                           //*[@id="div-layout-row"]/div/div/div

${UNITRACE_SEARCHUSERSID}                                   searchbar

${UNITRACE_USERGRID}                                       //a[@href='/admin/auth/user/']
${UNITRACELOGINBTNID}                                      id_wizard_goto_next
${UNITRACEADMINISTRATION}                                  Administration
${UNITRACEADDUSER}                                         //a[@href='/admin/auth/user/add/']



${UNITRACE_DISPLAYUSER}                                    css=ul.nav.navbar-nav.navbar-right.pull-right

${UNITRACE_USERDASHBOARD}                                  User Dashboard


${UNITRACE_FORM}                                           user_form
${UNITRACE_FAILEDLOGINMSG}                                 //*[@id="two-factor"]/tbody/tr[1]/td/ul


########################################################################################################################
