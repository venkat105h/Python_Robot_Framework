#------------------------------------------------------------------
#   Description       :      Locators of each element
#   Project           :      UniSphere Support Center Automation
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
Documentation    Element address for each element in Support Center

*** Variables ***
${SPH/SEC_INFO_CENTER_ON_HAM}       id=hb_infoCenter
${SPH/SEC_TRAINING_CENTER_ON_HAM}   id=shb_trainingCenter
${SPH/SEC_SUPPORT_CENTER_ON_HAM}    id=hb_supportCenter
${SPH/SEC_CUSTOMER_INBOX}           id=hb_customerInbox
${SPH/SEC_CASE_HISTORY}             id=hb_caseHistory
${SPH/SEC_RENEWAL_INFO}             id=hb_renewInfo
${SPH/SEC_SOFTWARE_PATCH}           id=hb_softwarePatch
#${SPH/SEC_LIVE_CHAT}                id=hb_liveChat
${SPH/SEC_CONTACT_SUPPORT}          id=hb_contactSupport

#Cards
${SPH/SEC_CASE_HISTORY_CARD}        id=preferenceCardName_0
${SPH/SEC_RENEWAL_INFO_CARD}        id=preferenceCardName_1
${SPH/SEC_SOFTWARE_CARD}            id=preferenceCardName_2
#${SPH/SEC_LIVE_CHAT_CARD}           id=preferenceCardName_3
${SPH/SEC_CONTACT_SUPPORT_CARD}     id=preferenceCardName_3

#Contact Support
${SPH/SEC_FIRST_NAME}               id=firstname
${SPH/SEC_LAST_NAME}                id=lastName
${SPH/SEC_EMAIL}                   	id=email
${SPH/SEC_PHONE_NUMBER}             id=phoneNumber
${SPH/SEC_COMPANY_NAME}             id=companyName
${SPH/SEC_JOB_TITLE}                id=jobTitle
${SPH/SEC_STREET_ADDRESS}           id=streetAddress
${SPH/SEC_ADD_ADDRESS}              id=addressAditional
${SPH/SEC_CITY}                    	id=city
${SPH/SEC_STATE}                   	id=state
${SPH/SEC_COUNTRY}                 	id=country
${SPH/SEC_TYPE_OF_REQUEST}          id=type
${SPH/SEC_SERIAL_NUMBER}            id=systechSerialNumber
${SPH/SEC_DESCRIPTION}             	id=description
${SPH/SEC_SUBMIT_BUTTON}            xpath=//button[@type='submit']

#Live Chat
${SPH/SEC_CHAT_HEADER}              class=chat-header
${SPH/SEC_LIVE_CHAT_FRAME}          xpath=//iframe[@id='frame']
${SPH/SEC_FIRST_NAME_TXT}      		xpath=//input[@data-automation-id='portal/field/firstName/input']
${SPH/SEC_LAST_NAME_TXT}       		xpath=//input[@data-automation-id='portal/field/lastName/input']
${SPH/SEC_EMAIL_TXT}          		xpath=//input[@data-automation-id='portal/field/email/input']
${SPH/SEC_CHAT_BUTTON}              xpath=//a[@data-automation-id='portal-form/chat-button']
${SPH/SEC_AGENT_JOIN_ICON}          agent-join-icon
${SPH/SEC_MESSAGE_INPUT}            class=message-input
${SPH/SEC_END_CHAT}                 class=end-chat-button
${SPH/SEC_CHAT_END_NOTIFICATION}	css=.notification-form.chat-ended
${SPH/SEC_YES_BUTTON}               css=.button.link.primary.medium
${SPH/SEC_NO_BUTTON}                css=.button.text.secondary.medium
${SPH/SEC_DOWNLOAD_CHAT_BOX}        class=download-chat-protocol-box
${SPH/SEC_RELEASE_NOTES}            xpath=(//i[@title='Release Notes'])
${SPH/SEC_NEW_WINDOW_ELEM}          id=plugin
${SPH/SEC_SOFT_ACK_POPUP}           xpath=(//h4[@id='pop-up-title'])[3]

#Case History
${SPH/SEC_ACCOUNT_NAME}            	id=account_name
${SPH/SEC_CURRENT_DATE}            	id=current_date
${SPH/SEC_SELECT_SITE}             	id=site_select
${SPH/SEC_TOTAL_SITES}             	id=num_sites
${SPH/SEC_GRAPHICAL_TAB}           	id=graphical_tab
${SPH/SEC_DETAILS_TAB}             	id=product_tab
${SPH/SEC_NUM_OF_CHARTS}           	xpath=//div[@class='panel-heading']
${SPH/SEC_DETAILS_TABLE_HEADER}    	xpath=//datatable-header//datatable-header-cell
${SPH/SEC_FIRST_CASE_ID}           	id=case_id_0_Txt

#Customer Details
${SPH/SEC_CUST_ACC_NAME}           	id=account_name_2
${SPH/SEC_CUST_ID}                 	id=account_number
${SPH/SEC_TOTAL_SITE}              	id=num_sites_2
${SPH/SEC_CASE_ID}                 	id=case_number
${SPH/SEC_SITE_NAME}               	id=case_site_name
${SPH/SEC_CASE_STATUS}             	id=case_status
${SPH/SEC_CASE_DESC}               	id=case_description
${SPH/SEC_CASE_PRIORITY}           	id=case_priority
${SPH/SEC_CASE_IN_PROD}            	id=case_in_production
${SPH/SEC_CASE_ORIGIN}             	id=case_source
${SPH/SEC_ROOT_CAUSE}              	id=case_category
${SPH/SEC_CASE_RESOLUTION}         	id=case_resolution
${SPH/SEC_CASE_OPEN_DATE}          	id=case_created_date
${SPH/SEC_CASE_CLOSE_DATE}         	id=case_closed_date
${SPH/SEC_CLOSE_BUTTON}            	xpath=(//button[@aria-label='Dismiss'])

${SPH/SEC_SELECT_SITE_DD}           xpath=(//select)[5]
${SPH/SEC_POPUP_OK_BTN}             id=ok_button
${SPH/SEC_POPUP_CANCEL_BTN}         id=cancel_button

# Renewal Info
${SPH/SEC_SITE_CHK_BOX}             xpath=(//div[contains(@class, 'node-checkbox')]/input)[2]
${SPH/SEC_SAAS_VALUE}               xpath=(//p[contains(@id, 'saas_')])
${SPH/SEC_MULTI_YEAR_VALUE}         xpath=(//p[contains(@id, 'multi_year_')])
${SPH/SEC_EXPIRED_VALUE}            xpath=(//i[contains(@id, 'expired_')])
${SPH/SEC_COV_YEAR_VALUE}           xpath=(//p[contains(@id, 'coverage_start_year_')])
${SPH/SEC_SITES}                    xpath=(//div[contains(@class, 'site-div')])
${SPH/SEC_REFINE_BY_SAAS}           refine_SaaS_
${SPH/SEC_REFINE_BY_MULTI_YEAR}     refine_Multi-year_
${SPH/SEC_REFINE_BY_COV_YEAR}       refine_Coverage_Year_
${SPH/SEC_REFINE_BY_EXPIRED}        refine_Expired_
