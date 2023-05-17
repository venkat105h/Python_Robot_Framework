#------------------------------------------------------------------
#   Description       :      Locators of elements belonging to Video Assistance
#   Project           :      Systech360 Video Assistance
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
Documentation   Locators of Runtime Parameters feature elements

*** Variables ***
# ---------------------------------START OF Video Assistance ELEMENT ID'S-----------------------------------------

${SEC_VA_MAIN_VIDEO_PLAY_ICON}        xpath=(//span[@id='video-play-icon'])[1]
${SEC_VA_VIDEO_PLAY_ICON}             xpath=(//span[@id='video-play-icon'])[1]
${SEC_VA_TITLE_TXT}                   xpath=(//h4[@id='pop-up-title'])[2]

#   ONLINE VIDEO ASSISTANCE PAGE ELEMENTS
${SEC_VA_VIDEOS_TITLE}                xpath=(//p[@id='list-group-item-title'])
${SEC_VA_VIDEOS_DESCRIPTION}          xpath=(//p[@id='list-group-item-desc'])
${SEC_VA_VIDEOS_VIEWS}                xpath=(//p[@id='list-group-item-views'])
${SEC_VA_VIDEOS_PUBLISH}              xpath=(//p[@id='list-group-item-pub'])

# each video related
${SEC_VA_OPEN_COMMENT_BTN}            xpath=(//a[@id='open-comment'])
${SEC_VA_COMMENT_TXT_FLD}             xpath=(//textarea[@id='new-comment'])
${SEC_VA_ADD_COMMENT_BTN}             xpath=(//button[@id='add-btn'])
${SEC_VA_LIKE_VIDEO}                  xpath=(//a[@id='like-video'][1])
${SEC_VA_VIDEO_VIEWS}                 id=video-views
${SEC_VA_VIDEO_LIKES}                 xpath=(//p[@id='video-likes'])

${SEC_VA_SORT_BY_LIST}                xpath=(//select[@id='sort-by'])[3]
${SEC_VA_CLOSE_VA_POPUP}              xpath=(//button[@aria-label='Dismiss'])

${SEC_VA_ICON_VIDEO}                  xpath=(//span[@id='iconVideo'])




