#------------------------------------------------------------------
#   Description       :      This file includes all the elements that are used in File Explorer Automation
#   Project           :      UniSecure File Explorer
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
Documentation   Locators for each element used in TestSuite

*** Variables ***
${SEC/S360_UPLOAD_FILE_BTN}         id=btnUploadFile
${SEC/S360_DOWNLOAD_FILE_BTN}       id=btnDownloadFile
${SEC/S360_EDIT_FILE_BTN}           id=btnShareFile
${SEC/S360_ADD_FOLDER_BTN}          id=btnAddNewFolder
${SEC/S360_CLOSE_FMM_BTN}           id=btnCloseFMM
${SEC/S360_FOLDER_NAME_TEXTBOX}     id=newFolderNameInput
${SEC/S360_FOLDER_NAME_TEXT}        id=newFolderNameLbl
${SEC/S360_LOADING_ICON}            id=overlayLoading


${SEC/S360_FOLDERS_LIST}            xpath=(//span[contains(@class, 'ui-treenode-label')]/span)
${SEC/S360_FAV_FOLDERS}             xpath=(//*[@id='favoritesTreeId']//span[contains(text(),'Favorites')])
${SEC/S360_DOC_FOLDERS}             xpath=(//*[@id='userFileTreeId']//span[contains(text(),'Documents')])
${SEC/S360_EXIM_FOLDERS}            xpath=(//span[contains(@class, 'ui-treenode-label')]/span)[3]
${SEC/S360_SWM_FOLDERS}             xpath=(//*[@id='sharedTreeId']//span[contains(text(),'Shared with me')])
${SEC/S360_TAGS_TEXTBOX}            id=tagsInputId
${SEC/S360_DEST_TEXTBOX}            id=destinationInputId
${SEC/S360_REMOVE_FILE_BTN}         xpath=(//div[contains(@class,'ui-fileupload-row')]//button)
${SEC/S360_UPLOAD_BTN}              xpath=(//div[contains(@class,'ui-fileupload-buttonbar')]//button)[1]
${SEC/S360_CLEAR_ALL_BTN}           xpath=(//div[contains(@class,'ui-fileupload-buttonbar')]//button)[2]
${SEC/S360_UPLOADED_FILE_NAME}      xpath=(//*[@id='newFolderNameLbl'])
${SEC/S360_UPLOAD_BAR_STATUS}       xpath=(//*[@role='progressbar'])

${SEC/S360_SHARE_USER_TEXT_FIELD}   id=txtUserName
${SEC/S360_ADD_USER_BTN}            id=btnAddUser
${SEC/S360_SHARED_USER_TEXT}        xpath=(//label[contains(@id, 'userName_')])
${SEC/S360_REMOVE_SHARED_USER_BTN}  xpath=(//a[@id='btnRemoveUser'])
${SEC/S360_SAVE_BTN}                id=btnDone
${SEC/S360_CANCEL_BTN}              id=btnGoBack

${SEC/S360_FAVOURITE_MENU}          id=favoriteActionId
${SEC/S360_DELETE_MENU}             id=deleteActionId
${SEC/S360_EDIT_MENU}               id=shareActionId
${SEC/S360_RENAME_MENU}             id=renameActionId

${SEC/S360_EXPAND_ALL_BTN}          id=btnExpand
${SEC/S360_COLLAPSE_ALL_BTN}        id=btnCollapse
${SEC/S360_BROWSE_PATH_FIELD}       id=browsePath_0
${SEC/S360_FAV_ICON}                xpath=(//*[contains(@class,'favorite-file-icon-back')])

${SEC/S360_CHOOSE_FILE_BUTTON}      xpath=//input[@type='file']
${SEC/S360_OK_BTN}                  id=btnGoBack
${SEC/S360_REFINE_TAGS}             id=refine_FileTopicsTxt_
${SEC/S360_FILE_EXPLORER_MENU}      id=btnCloseContextMenu
${SEC/S360_SWM_TREE_ITEMS}          xpath=(//*[@id='sharedTreeId']//span[contains(text(),'Shared with me')]/../../..//*[contains(text(),' Shared with me ')])

${SEC/S360_SWM_DOC_FOLDER}          xpath=//*[@id='sharedTreeId']//*[contains(text(),'${Username}')]/../../../..//*[contains(text(),'Documents')]
