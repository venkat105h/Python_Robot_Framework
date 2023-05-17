#------------------------------------------------------------------
#   Description       :      Locators of elements in Training Center
#   Project           :      UniSphere Training Center Automation
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
Documentation    Address of each element of Training Center

*** Variables ***

${SEC/SPH_TRAINING_SCHEDULE_ON_HAM}     id=hb_trainingCalendar
${SEC/SPH_UNRESTRICTED_VIDEOS_ON_HAM}   id=hb_videoUnrestricted
${SEC/SPH_VIDEO_SUBS_ON_HAM}            id=hb_videosSubscription
${SEC/SPH_CALENDERS}                    xpath=(//div[@class='calendar-container'])
${SEC/SPH_TRAINING_COURSES}             xpath=(//section[@class='linkAnnotation'])

${SEC/SPH_TRAINING_SCHEDULE_CARD}       id=preferenceCardName_0
${SEC/SPH_UNRESTRICTED_VIDEOS_CARD}     id=preferenceCardName_1
${SEC/SPH_VIDEO_SUBS_CARD}              id=preferenceCardName_2
${SEC/SPH_VIDEO_SUBS_CARD_SECTION}		xpath=//div[@id='preferenceCardSection_2']/div
${SEC/SPH_ITEM_NAME}                    id=downloadItem_0
${SEC/SPH_REFINE_BY_TOPIC}              id=refine_Topics_Tier_1_input
${SEC/SPH_UNRESTRICTEC_VIDEOS}          https://eng-svt.systechcloud.net/Systech360/#/centers/training-center/videos-unrestricted
