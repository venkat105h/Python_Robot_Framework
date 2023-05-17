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
Documentation     A resource file with Solution landing page locators.

*** Variables ***

###########################################  SolutionLandingPage  ######################################################
########################################################################################################################
${SOL_ABOUT_LINK}                             //a[@id='about-link']
${SOL_SYSTECHONE_LINK}                        //a[@id='systech-one-link']/img[1]
${SOL_UNISPHERE_LINK}                         //*[@id="systech360-link"]
${SOL_UNISECURE_LINK}                         //*[@id="unisecure-link"]
${SOL_UNITRACE_LINK}                          //*[@id="unitrace-link"]
${SOL_UNISERIES_LINK}                         //*[@id="uniseries-link"]
${SOL_UNISPHERE_IMG}                          //*[@id="systech360-image"]
${SOL_UNISECURE_IMG}                          //*[@id="unisecure-image"]
${SOL_UNITRACE_IMG}                           //*[@id="unitrace-image"]
${SOL_UNISERIES_IMG}                          //*[@id="uniseries-image"]
${SOL_TWITTER_LINK}                           //*[@id="twitter-link"]
${SOL_GOBACK_BUTTON}                          //*[@id="cancel-external-btn"]
${SOL_CONTINUE_BUTTON}                        //*[@id="continue-external-btn"]
${SOL_LINKEDIN_LINK}                          //*[@id="linkedin-link"]
${SOL_CONTACTUS_LINK}                         //*[@id="contact-us-link"]
${SOL_LOGO_LINK}                              //*[@id="logo-link"]
${SOL_FACEBOOK_LINK}                          //*[@id="facebook-link"]
${SOL_MARKETCIRCLE_SLIDER}                    (//*[contains(@class,'bx-pager-link')])
${SOL_MARKETVIDEO_ICON}                       play-icon
${SOL_UNISERIES_TITLE}                        ${SOL_UNISERIES_IMG}@title
${SOL_MAINTANANCEHERE_LINK}                   //*[@id="maintenance"]/div/div[2]/p[3]/a
${SOL_MAINTANANCE_ICON}                       //*[@id="maintenance"]/div/header/img
${SOL_MAINTANANCESYSUNAVAILABLE_TXT}          //*[@id="maintenance"]/div/header/p
${SOL_MAINTANANCEINCONVINIENCE_MSG}           //*[@id="maintenance"]/div/div[2]/p[1]
${SOL_MAINTANANCETHANKU_MSG}                  //*[@id="maintenance"]/div/div[2]/p[2]
${SOL_MAINTANANCECONTSUP_MSG}                 //*[@id="maintenance"]/div/div[2]/p[3]
${SOL_MAINTANANCEHERE_LINK}                   //*[@id="maintenance"]/div/div[2]/p[3]/a
${SOL_UNISECURE_DATASTATUS}                   //*[@id="unisecure-image"]
${SOL_UNISPHERE_DATASTATUS}                   //*[@id="systech360-image"]
${SOL_UNITRACE_DATASTATUS}                    //*[@id="unitrace-image"]
${SOL_UNISERIES_DATASTATUS}                   //*[@id="uniseries-image"]
${SOL_SYSTECHONELOGO_LINK}                    //*[@id="desktop-header"]/div[1]/div/div[1]/a
${SOL_HAMBUGER_ICON}                          //*[@id="hamburger"]
${SOL_ABOUT_XPATH}                            //*[@id="navbar-menu"]/a[2]
${SOL_UNISPHEREXPATH_TXT}                     //div[@data-translate="systech360-text"]
${SOL_UNITRACEXPATH_TXT}                      //div[@data-translate="unitrace-text"]
${SOL_UNISECUREXPATH_TXT}                     //div[@data-translate="unisecure-text"]
${SOL_UNISERIESXPATH_TXT}                     //div[@data-translate="uniseries-text"]
${SOL_FOLLOWUSXPATH_TXT}                      //*[@id="footer-links"]/div/div/div[1]/p
${SOL_CONTACTUSXPATH_TXT}                     //*[@id="footer-links"]/div/div/div[2]/p
${SOL_NEEDHELPXPATH_TXT}                      //*[@id="contact-us-link"]
########################################################################################################################
