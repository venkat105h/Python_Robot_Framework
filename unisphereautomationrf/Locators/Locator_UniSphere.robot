#-----------------------------------------------------------------------------------------------------------------------
#	Description			:		This locator file contains all the element in the UniSphere product
#	Project				:		UniSphere
#	Author				:		Satya R
#	© 2018 Systech International. All rights reserved
#-----------------------------------------------------------------------------------------------------------------------
#
#	Prologue:
#	- Not Applicable
#
#	Epilogue:
#	- Not Applicable
#-----------------------------------------------------------------------------------------------------------------------
*** Settings ***
Documentation     A resource file with locators.
#-----------------------------------------------------------------------------------------------------------------------
*** Variables ***
#-----------------------------------------------------------------------------------------------------------------------
########################################  UNISPEHERE   #################################################################
#-----------------------------------------------------------------------------------------------------------------------
${UNISPHERE_USERNAME_TXTBOX}              userName
${UNISPHERE_ABOUT_IMG}                    //*[@id="systech-about"]//img[1]
${UNISPHERE_ABOUT_VERSION_LABEL}          //*[@id="systech-about"]//p[1]/span[1]
${UNISPHERE_ABOUT_BUILD_LABEL}            //*[@id="systech-about"]//p[1]/span[2]
${UNISPHERE_ABOUTCOPYRIGHTS_LABEL}        //*[@id="systech-about"]//p[2]
${UNISPHERE_ABOUTCLOSE_BTN}               //*[@class="fa fa-lg fa-times close-icon"]
${UNISPHERE_ABOUT_VERSION_NO}             //*[@id="about-form"]/div[1]/label[2]
${UNISPHERE_ABOUT_BUILD_NO}               //*[@id="about-form"]/div[2]/label[2]
${UNISPHERE_USERALLGROUPS}                //*[@id="addUser"]/div[2]/div[4]/div/table/tbody/tr[1]/th[1]/input
${UNISPHERE_USERGROUP_CARD}               preferenceCardName_0
${UNISPHERE_SECURITYPOLICIES_CARD}        preferenceCardName_1
${UNISPHERE_PRODUCTCARD_ID}               preferenceCardName_1
${UNISPHERE_ADMINROLE_DRPDWN}            Administrator
${UNISPHERE_DESIGNERROLE_DRPDWN}         Designer
${UNISPHERE_OPERATORROLE_DRPDWN}         Operator
${UNISPHERE_BOROLE_DRPDWN}               Business Owner
${UNI_ACCEPT_BTN}                       id=eusa-accept
${UNI_CANCEL_BTN}                       id=eusa-reject
#-----------------------------------------------------------------------------------------------------------------------
#######################################  NAVIGATOR    ##################################################################
#-----------------------------------------------------------------------------------------------------------------------
${UNISPHERE_TOGGLE_PIN}                   //*[@id="leftmenuinner "]/div/div/a/span
${UNISPHERE_TOGGLED_PINLEFT}              //span[@class='fa fa-chevron-left']
${TOGGLEDPINNORMAL}                       //*[@id="pinNavigator"]/span
${UNISPHERE_TRASH_ICON}                   iconTrashCan
${UNISPHERE_LEFTMENUINNER_XPATH}          //*[@id="leftmenuinner "]/div/ul/li/navigation-assets
${UNISPHERE_LEFTMENUINNERFIRST_XPATH}     //*[@id="leftmenuinner "]/div/ul/li[1]/navigation-assets/div
${UNISPHERE_NAVIGATOR_ID}                 Scene_list
${UNISPHERE_EXPANDCOLLAPSE_BTN}           (//*[@id="expandCollapse"])
${UNISPHERE_EXPANDCOLLAPSE_ROTATEDOWN}    (//li[@id='childItem_0'])
${UNISPHERE_EXPANDCOLLAPSE_CHILDITEMS}    //li[contains(@id, 'childItem_')]
${UNISPHERE_LEFTNAVIGATIONMENU_LINKS}     /navigation-assets[1]/div[@class='topItem' and 1]/a[@class='assetTypeLink' and 2]
${UNISPHERE_TOTALTEXTNAVIGATION_LINKS}    //label[@class='ng-star-inserted']
${UNISPHERE_ASSETTYPELINK_XPATH}          //*[@class='assetTypeLink']
${UNISPHERE_CARDS_XPATH}				  //h4[contains(@id,'_itemName_')]
${UNISPHERE_ADDNEWITEM_BTN}               newScene
${UNISPHERE_NAME_TEXTBOX}                 nameInput
${UNISPHERE_DESCRIPTION_TEXTBOX}          desciptionInput
${UNISPHERE_TRASHPAGE_ID}                 contentTrashCan
${UNISPHERE_TRASH_BREADCRUMB}             breadcrumb
${UNISPHERE_TRASHCAN_ICON}                trashcan-icon
${UNISPHERE_TRASH_DESCRIPTION}            trashcanDescription
${UNISPHERE_TRASHVIDEO_ICON}              iconVideo
${UNISPHERE_SEARCH_TEXTBOX}               searchBox
${UNISPHERE_SORTBY_LABEL}                 lblSortBy
${UNISPHERE_TRASHEMPTY_MESSAGE}           lblTrashCanEmpty
${UNISPHERE_ASCENDING_BUTTON}             btnAscd
${UNISPHERE_DESCENDING_BUTTON}            btnDescd
${UNISPHERE_SORTBY_LIST}                  listSortBy
${UNISPHERE_SELECTANDTOTAL_TEXT}          lblSelectAndTotal
${UNISPHERE_TABLETRASH_PAGE}              tableTrashCan
${UNISPHERE_TABLE_ROWS}                   //datatable-row-wrapper/datatable-body-row/div[2]/datatable-body-cell[2]/div/div
${UNISPHERE_RESTORE_BTN}                  btnRestore
${UNISPHERE_RESTORE_BTNXPATH}             //*[@id="${UNISPHERE_RESTORE_BTN}"]
${UNISPHERE_RESTORE_BTNDISABLED}          //*[@id="${UNISPHERE_RESTORE_BTN}" and @disabled]
${UNISPHERE_DELETE_BTN}                   btnPurge
${UNISPHERE_DELETE_BTNXPATH}              //*[@id="${UNISPHERE_DELETE_BTN}"]
${UNISPHERE_DELETE_BTNDISABLED}           //*[@id="${UNISPHERE_DELETE_BTN}" and @disabled]
${UNISPHERE_PAGINATION_SECTION}           //*[@id="pagination"]/ul//a
${UNISPHERE_ITEMSPERPAGE_LABEL}           lblItemsPerPage
${UNISPHERE_ITEMSPERPAGE_ID}              listItemsPerPage
${UNISPHERE_TRASHCANCOUNT_LINK}           trashCanCount
${UNISPHERE_ITEMSPERPAGE_OPTIONS}         //*[@id="listItemsPerPage"]/option
${UNISPHERE_TRASHTABLETOTAL_TEXT}         //div[@class="page-count ng-star-inserted"]
${UNISPHERE_TOTALTEXTCLASS_XPATH}         //div[@class="page-count ng-star-inserted"]
${UNISPHERE_TRASHTABLESELECTALL_CHKBX}    //*[@id="checkBoxSelectALL"]
${UNISPHERE_TRASHTABLEFIRST_CHKBX}        //*[@id="checkBox_0"]
${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}     (//div[contains(@id,'name_') and contains(@id, '-cell')]/label)[1]
${UNISPHERE_GROUPTABLEROW_XPATH}          //datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper
${UNISPHERE_GROUPTABLENEXTBTN_XPATH}      //i[@class="datatable-icon-right"]
${UNISPHERE_FIRSTROWNAME_SPAN}            ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}/span
${UNISPHERE_TRASHSEARCH_BTN}              //*[@id="searchBox"]
${UNISPHERE_SEARCH_BTN}                   //*[@id="searchBtn"]
${UNISPHERE_TRASHNAME_COLUMN}             datatable-body-cell[2]
${UNISPHERE_TRASHUPDATEDBY_COLUMN}        datatable-body-cell[5]
${UNISPHERE_TRASHUPDATEDON_COLUMN}        datatable-body-cell[6]
${UNISPHERE_TRASHPAGINATIONALL_LINKS}     //datatable-pager/ul/li
${UNISPHERE_ACTIVE_PAGE_LINK}			  //datatable-pager/ul/li[contains(@class,'active')]
${UNISPHERE_LAST_PAGE_BTN}				  //a[@aria-label='go to last page']
${UNISPHERE_FIRST_PAGE_BTN}				  //a[@aria-label='go to first page']
${UNISPHERE_PAGINATIONFIRST_LINK}         //a/i[@class='datatable-icon-prev']
${UNISPHERE_PAGINATIONPREV_LINK}          //a/i[@class='datatable-icon-left']
${UNISPHERE_PAGINATIONNEXT_LINK}          //a/i[@class='datatable-icon-right']
${UNISPHERE_PAGINATIONLAST_LINK}          //a/i[@class='datatable-icon-skip']
${UNISPHERE_PAGINATIONDISABLED_LINK}      [@class="disabled"]/a/i
${UNISPHERE_DELETECONFIRMATION_BTN}       buttn_DeleteTxt
${UNISPHERE_CARDVIEW_BTN}                 //*[contains(@id,"cardViewBtn")]
${UNISPHERE_TABLEVIEW_BTN}                //*[contains(@id,"listViewBtn")]
${UNISPHERE_CARDSSEARCH_BOX}              //*[@id="searchBox"]
${UNISPHERE_CARDSSEARCH_BTN}              //*[@id="searchBtn"]
${UNISPHERE_CARDS_LIST}                   //systech-asset-card[1]/div[1]
${UNISPHERE_TABLE_LIST}                   //div/asset-list/div[1]/table/tbody[2]/tr/td[2]
${UNISPHERE_CARDOPTIONS_MENU}             //*[@id="openMenuOnMouseEnter"]
${UNISPHERE_CARDOPTIONSMOUSEOVER_BTN}     //*[@id="openMenuOnMouseEnter"]/label/span
${UNISPHERE_CARDSDELETE_BTN}              //i[@id="delete-menu-icon"]
${UNISPHERE_CARDSEDIT_BTN}                //i[@id="edit-menu-icon"]
${UNISPHERE_CONFIRMATIONYES_BTN}          buttn_YesTxt
${UNISPHERE_USERALLGROUPS_CHKBX}          chkSelectAllGroups
${UNISPHERE_FLOATOPTIONS_BTN}             floatBtn_options
${UNISPHERE_ITESPERPAGE_ID}               //*[@id="cards_itemsPerPage"]
${UNISPHERE_HIGHLIGHTEDTEXTYELLOW_XPATH}   //div/div/div/h5/span[@class='highlightText']
${UNI_LOADINGICON}						   id=iconLoading
#-----------------------------------------------------------------------------------------------------------------------
####################################   TOP BANNER ######################################################################
#-----------------------------------------------------------------------------------------------------------------------
${UNISPHERE_TOPBANNER_ID}                 tonNavUniCard2
${UNISPHERE_SYSTECH_LOGO}                 //img[@id='img-product-name']
${UNISPHERE_PRODUCT_ICON}                 //img[@id='img-product-icon']
${UNISPHERE_TOPBANNERLOGIN_ID}            //div[@class='topnav-inner-2']
${UNISPHERE_ABOUT_ID}                     navBtn_about
${UNISPHERE_HAMBURGER_ICON}               //label[@class='fa fa-bars fa-lg']
${UNISPHERE_WELCOME_ID}                   navBtn_welcome
${UNISPHERE_UNNISERIESTOP_ID}             //*[@id="navBtnSolutions_0"]
${UNISPHERE_UNISERIESDISABLED_LINK}       //a[@id="navBtnSolutions_0"]
${UNISPHERE_UNISERIESANCHOR_LINK}         //a[@id="navBtnSolutions_0"]
${UNISPHERE_UNISECUREDISABLED_LINK}       //div[@id="navBtnSolutions_2"]
${UNISPHERE_UNITRACETOP_ID}               //*[@id="navBtnSolutions_1"]
${UNISPHERE_UNITRACEDISABLED_LINK}       //div[@id="navBtnSolutions_2"]
${UNISPHERE_TOPBANNERSEARCH_TEXTBOX}      navInput_Search
${UNISPHERE_SEARCHTOP_BUTTON}             navInput_SearchBtn
${UNISPHERE_VIDEOPLAYTOP_ICON}            video-play-icon
${UNISPHERE_HAMBURGERBROWSE_ID}           browseFolders
${UNISPHERE_HAMBURGERINFOCENTER_ID}       hb_infoCenter
${UNISPHERE_HAMBURGERSUPPORTCENTER_ID}    hb_supportCenter
${UNISPHERE_HAMBURGERTRAININGCENTER_ID}   hb_trainingCenter
${UNISPHERE_UNISECURE_TOPBANNER}          //*[@id="navBtnSolutions_2"]
${UNISPHERE_UNISECUREROLES_DRPDWN}        //*[@id="optionsGoto"]/li
${UNISPHERE_TOPBANNERADMIN_ID}            navBtn_GotoAdministrator
${UNISPHERE_TOPBANNERDESIGNER_ID}         navBtn_GotoDesigner
${UNISPHERE_TOPBANNEROPERATOR_ID}         navBtn_GotoOperator
${UNISPHERE_TOPBANNERBO_ID}               navBtn_GotoBusiness
${UNISPHERE_ABOUTADMIN_ID}                navBtn_administrator
${UNISPHERE_ABOUTDESIGNER_ID}             navBtn_designer
${UNISPHERE_ABOUTOPERATOR_ID}             navBtn_Operator
${UNISPHERE_ABOUTBO_ID}                   navBtn_businessOwner
${UNISPHERE_USERDISPLAY_DRPDWN}           dropdownMenu1
${UNISPHERE_PREFERENCESADMIN_ROLE}        goToAdministrator
${UNISPHERE_PREFERENCESDESIGNER_ROLE}     //*[@id="goToDesigner"]
${UNISPHERE_PREFERENCESOPERATOR_ROLE}     goToOperator
${UNISPHERE_PREFERENCESBO_ROLE}           goToBusiness Owner
${UNISPHERE_EMPTYGLOBALSEARCH_ID}         error_emptySearchValueLbl
${UNISPHERE_GLOBALSEARCH_LABEL}           globalSearchLbl
${UNISPHERE_GSHIGHLIGHTED_SPAN}           (//span[@class='highlightText'])
${UNISPHERE_TOPBANNERVIDEO_ICON}          //*[@id="video-play-iconTopnav"]
${UNISPHERE_VIDEO_ICON}                   iconVideo
${UNISPHERE_VIDEO_TITLE}                  pop-up-title
${UNISPHERE_VIDEOCATALOG_LIST}            //*[@id="list-group-item-title"]
${UNISPHERE_VIDEOCLOSE_BTN}               (//button[@aria-label='Dismiss']/span)[2]
${UNISPHERE_DESIGNERSCENE_ID}             Scene-item
${UNISPHERE_OPERATORSCENE_ID}             publishedSceneFilter-item
${UNISPHERE_ADMINSECURE_DISABLED}         //a[@id='navBtn_GotoAdministrator' and @class='disabledAnchor' ]
${UNISPHERE_DESIGNSECURE_DISABLED}        //a[@id='navBtn_GotoDesigner' and @class='disabledAnchor' ]
${UNISPHERE_OPERASECURE_DISABLED}         //a[@id='navBtn_GotoOperator' and @class='disabledAnchor' ]
${UNISPHERE_BOSECURE_DISABLED}            //a[@id='navBtn_GotoBusiness' and @class='disabledAnchor' ]
${UNISPHERE_GSSCENE_XPATH}                //*[@id="searchResultForScene"]
${UNISPHERE_GSORGAN_XPATH}                //*[@id="searchResultForOrganization"]
${UNISPHERE_GSSITE_XPATH}                 //*[@id="searchResultForSite"]
${UNISPHERE_GSENVIR_XPATH}                //*[@id="searchResultForEnvironment"]
${UNISPHERE_GSCLOUD_XPATH}                //*[@id="searchResultForCloud"]
${UNISPHERE_GSSITSERV_XPATH}              //*[@id="searchResultForGuardian"]
${UNISPHERE_GSCARDITEMSCENE_XPATH}        //*[@id="Scene_itemName_0"]
${UNISPHERE_GSCARDITEMORGAN_XPATH}        //*[@id="Organization_itemName_0"]
${UNISPHERE_GSCARDITEMSITE_XPATH}         //*[@id="Site_itemName_0"]
${UNISPHERE_GSCARDITEMENVIR_XPATH}        //*[@id="Environment_itemName_0"]
${UNISPHERE_GSCARDITEMCLOUD_XPATH}        //*[@id="Cloud_itemName_0"]
${UNISPHERE_GSCARDITEMSITESER_XPATH}      //*[@id="Guardian_itemName_0"]
${UNISPHERE_GSCARDITEMDESC_XPATH}         //*[@id="itemDescription"]/span
#-----------------------------------------------------------------------------------------------------------------------
###################################  UNISPHERE DESIGNER   ##############################################################
#-----------------------------------------------------------------------------------------------------------------------
${UNISPHERE_DESHOMESTART_ID}                 Start
${UNISPHERE_DESHOMEPUBLISH_ID}               Publish
${UNISPHERE_DESHOMEREQUIRED_ID}              required
${UNISPHERE_DESHOMEOPTIONAL_ID}              optional
${UNISPHERE_DESHOMEENVIRONMENT_ID}           //*[2]/*[@id='Environment' and 1]
${UNISPHERE_DESHOMESITE_ID}                  //*[3]/*[@id='Site' and 1]
${UNISPHERE_DESHOMEORGANIZATION_ID}          //*[4]/*[@id='Organization' and 1]
${UNISPHERE_DESHOMESCENE_ID}                 //*[5]/*[@id='Scene' and 1]
${UNISPHERE_DESHOMEDATASOURCE_ID}            //*[6]/*[@id='DataSource' and 1]
${UNISPHERE_DESHOMECLOUDS_ID}                //*[@id='Clouds']
${UNISPHERE_DESHOMESITESERVER_ID}            //*[7]/*[@id='Guardian' and 1]
${UNISPHERE_EDITORICON_ID}                   -icon
${UNISPHERE_EDITORITEM_ID}                   -item
${UNISPHERE_NEW_GRAPH_ICON}                  xpath=(//*[@id='New'])
${UNISPHERE_DESSITESERVER_ICON}              Guardian-icon
${UNISPHERE_DATASOURCES_ICON}				 DataSource-icon
${UNISPHERE_DATASOURCES_ID}					 DataSource-item
${UNISPHERE_DESSITESERVER_ID}                Guardian-item
${UNISPHERE_DESENVIRONMENT_ICON}             Environment-icon
${UNISPHERE_DESENVIRONMENT_ID}               Environment-item
${UNISPHERE_DESSITE_ICON}                    Site-icon
${UNISPHERE_DESSITE_ID}                      //*[@id="Site-item"]
${UNISPHERE_DESORGANIZATION_ICON}            Organization-icon
${UNISPHERE_DESORGANIZATION_ID}              Organization-item
${UNISPHERE_DESSCENE_ICON}                   Scene-icon
${UNISPHERE_DESSCENE_ID}                     Scene-item
${UNISPHERE_CARDFIRSTITEMDESCRIP_XPATH}      //*[@id="itemDescription"]
${UNISPHERE_DESCLOUD_ICON}                   Cloud-icon
${UNISPHERE_DESCLOUD_ID}                     Cloud-item
${UNISPHERE_DESDATASOURCE_ICON}              DataSource-icon
${UNISPHERE_DESDATASOURCE_ID}                DataSource-item
${UNISPHERE_REQERROR_ID}                     requiredError
${UNISPHERE_TABLEHEADER_ID}                  //*[@id="selectAllHeader"]
${UNISPHERE_DESNEDITORUPLOADIMG_ID}          changeProductImageLbl
${UNISPHERE_FLOATBTNICON_ID}                 //*[@id="float-btn-icon"]
${UNISPHERE_PUBLISHBTN_ID}                   //*[@id="floatBtn_Publish"]
${UNISPHERE_SAVEBTN_ID}                      floatBtn_SaveTxt
${UNISPHERE_BREADCRUMBPARENT_ID}             parentName
${UNISPHERE_MANAGESCENE_CARD_ID}			 preferenceCardName_4
${UNISPHERE_MYVIEW_CARD_ID}			 		 preferenceCardName_3
${UNISPHERE_GRAPHICALTABDESIGNER_ID}         //label[@id="graphicTab"]
${UNISPHERE_GRAPHICALTABOPERATOR_ID}         //*[@id="graphicalTab"]
${UNISPHERE_GRAPHICALELEMENTS_ID}            //*[@class='node']
${UNISPHERE_GRAPHICALIMAGE_ID}				 //*[name()="svg"]/*[name()="g"]/*[name()="g"]/*[name()="g"]
${UNISPHERE_GRAPHICALPATHLINK_ID}            /*[name()="svg"]/*[name()="g"]/*[name()="path"]
${UNISPHERE_SHOWSUBORDINATE_ID}              parent_loadChildrenLbl
${UNISPHERE_SUBORDINATESEARCHBOX_ID}         filterTextBox
${UNISPHERE_SUBORDINATESEARCHBTN_XPATH}      //*[@id="childrenTab"]/div[2]/div[2]/div[1]/div[2]/i
${UNISPHERE_SEARCHEDSUBORDINATE_XPATH}       //*[@id="childrenTab"]/div[2]/div[2]/div[2]/div[1]
${UNISPHERE_INCLUDESECTION_XPATH}            //*[@id="childrenTab"]/div[1]/div[2]
${UNISPHERE_CHILDTITLE_CLASS}                //*[@class="childImageTitle"]
${UNISPHERE_AVAILABLE_TITLE_CLASS}           (//*[contains(@class,"ui-picklist-listwrapper")][1]//div[contains(@id,"pick_item_")])
${UNISPHERE_INCLUDED_TITLE_CLASS}            (//*[contains(@class,"ui-picklist-listwrapper")][2]//div[contains(@id,"pick_item_")])
${UNISPHERE_CHILDCARD_XPATH}                 //*[@id="childrenTab"]/div[2]/div[2]/div[2]/div
${UNISPHERE_PUBLISHEDICON_ID}                PublishedScene-icon
${UNISPHERE_PUBLISHEDITEM_ID}                PublishedScene-item
${UNISPHERE_PUBLISHEDFAMIL_ID}               publishedFamilyHead
${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCH}   //input[1][@id='searchBox' and @class='form-control ng-untouched ng-pristine ng-valid']
${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHBTN}  //*[@id="searchBtn"]
${UNISPHERE_OPERATORPUBLISHEDSCENE_SEARCHED}   //div[1]/label[1]
${UNISPHERE_PUBLISHEDSCENEITEMNAME_ID}       PublishedScene_itemName
${UNISPHERE_PUBAPPROVEDSCENEITEMNAME_ID}     //*[@id="ApprovedScene_itemName_0"]
${UNISPHERE_APPROVE_BTN}                     //*[@id="approveBtn"]
${UNISPHERE_REJECT_BTN}                     //*[@id="rejectBtn"]
${UNISPHERE_MESSAGECENTERCLOSE_BTN}         //*[@id="close-all-button"]
${UNISPHERE_EDITORASSETIMAGE_ID}            assetImage
${UNISPHERE_EDITORCLOSE_BTN}                form_closeBtn
${UNISPHERE_EDITORCOMMENTS_ID}              //*[@id="openComments"]
${UNISPHERE_EDITORINCLUDEDSUBORDINATE_LBL}   //*[contains(@class,'ui-picklist-caption ui-widget')]
${UNISPHERE_EDITORINTO_ID}                   assetIntro
${UNISPHERE_EDITORNAME_LBL}                  nameLbl
${UNISPHERE_EDITORDESCRIPTION_LBL}           desciptionLbl
${UNISPHERE_EDITORIMAGEPRODUCT_ID}           product_image
${UNISPHERE_EDITORSUBORDINATECLOSE_BTN}      family_closeProdBtn
${UNISPHERE_EDITORCANCEL_BTN}                floatBtn_CancelTxt
${UNISPHERE_EDITORBREADCRUMB_ID}             breadcrumb
${UNISPHERE_EDITORDESIGNERBREADCRUMB_ID}     Designer
${UNISPHERE_EDITORUNISPHEREBREADCRUMB_ID}    UniSphere
${UNISPHERE_VIDEOONLINESECTION_ID}           (//div[@id='video-section'])[2]
${UNISPHERE_VIDEO_SECTION}                    //*[@id="list-group-item-title"]
${UNISPHERE_OBJECTNAME_ID}                   //*[@id="objectName"]
${UNISPHERE_EDITORDIRTYFLAG_ID}             //*[@id="dirtyFlag"]
${UNISPHERE_VIDEOPOPUPCLOSE_BTN}            //bs-modal[4]/div/div/bs-modal-header/div/button
${UNISPHERE_DELETCONFIRMPOPUP_ID}           (//*[@id="divPopModalMessage"])[2]
${UNISPHERE_DELETEYESBTN_ID}                //*[@id="buttn_YesTxt"]
${UNISPHERE_POPUPSAVEBTN_ID}                id=buttn_SaveTxt
${UNISPHERE_OPERATORDELETEYES_BTN}         //bs-modal[@class='fade modal in']//button[@id='buttn_YesTxt' and @class='uni-button ng-star-inserted' and 2]
${UNISPHERE_DELETENOBTN_ID}                 //*[@id="buttn_NoTxt"]
${UNISPHERE_DELETECONFPOPUP_ID}            //button[@class='close ng-star-inserted']/span[1]
${UNISPHERE_COMMENTSCONTENT_ID}            comments_content
${UNISPHERE_COMMENTSINPUT_XPATH}           //textarea[@id='${UNISPHERE_COMMENTSCONTENT_ID}']
${UNISPHERE_COMMENTSLABEL_ID}              commentsLbl
${UNISPHERE_NEWCOMMENTLABEL_ID}            NewCommentLbl
${UNISPHERE_COMMENTSADDBTN_ID}             comments_addBtn
${UNISPHERE_COMMENTSOKBTN_ID}              comments_okBtn
${UNISPHERE_COMMENTSCANCELBTN_ID}          comments_cancelBtn
${UNISPHERE_EDITORCOMMENTSSEARCHBOX_XPATH}   //input[@id='comments_searchBox']
${UNISPHERE_COMMENTSSEARCHDESC_XPATH}       //*[@id="description_0"]/span
${UNISPHERE_UPLOADIMAGE_ID}                 changePicInput
${UNISPHERE_TABLEDESCRIPTIONCELL_XPATH}    //datatable-body-row/div[2]/datatable-body-cell[3]/div/div/label
${UNISPHERE_CHILDSUBORDINATEREMOVE_ID}     //*[@id="removeChild_0"]
${UNISPHERE_CARDSPERPAGELIST_ID}           cards_itemsPerPageList
${UNISPHERE_TABLEITEMSPERPAGELIST_XPATH}   //select[@name='item']
${UNISPHERE_DEFAULTASSETIMAGE_XPATH}       //*[@id="itemImage"]
${UNISPHERE_FIRSTITEMTABLE_XPATH}          ${UNISPHERE_TRASHTABLEFIRSTNAME_TEXT}/label
${UNISPHERE_DEFFLOATBTN_ID}                //*[@id="menu_options"]
${UNISPHERE_DEFEDITFLOATBTN_ID}             //*[@id="edit-menu-item"]
${UNISPHERE_DEFCOPYFLOATBTN_ID}             //*[@id="copy-menu-item"]
${UNISPHERE_DEFDELETEFLOATBTN_ID}           //*[@id="delete-menu-item"]
${UNISPHERE_TABLEFIRSTNAMECELL_XPATH}       //*[@id="name_0-cell"]
${UNISPHERE_TABLEFIRSTNAMECELL__XPATH}        //*[@id="name_0-Lbl"]
${UNISPHERE_TABLEFIRSTDESCELL_XPATH}        //*[@id="description_0-Lbl"]
${UNISPHERE_OPERATORVIEW_ICON}              //*[@id="publishedSceneFilter-icon"]
${UNISPHERE_OPERATORPUBLISCENE_ICON}              //*[@id="PublishedScene-icon"]
${UNISPHERE_OPERATORVIEW_ITEM}              //*[@id="publishedSceneFilter-item"]
${UNISPHERE_OPERATORPUBLISCENE_ITEM}              //*[@id="PublishedScene-item"]
${UNISPHERE_GSVIEW_XPATH}                   //*[@id="searchResultForpublishedSceneFilter"]
${UNISPHERE_GSPUBSCENE_XPATH}               //*[@id="searchResultForPublishedScene"]
${UNISPHERE_GSCARDITEMVIEW_XPATH}           //*[@id="publishedSceneFilter_itemName_0"]
${UNISPHERE_CARDNAMEOPERATORPUBSCENE_XPATH}      //*[@id="PublishedScene_itemName_0"]
${UNISPHERE_CARDDESCOPERATORPUBSCENE_XPATH}      //*[@id="itemDescription"]
${UNISPHERE_NOTFOUND_ID}                     cards_noItemFound
${UNISPHERE_OPERAPUBSCENESEARCH_XPATH}    //*[@id="newPublishedSceneSorting"]/search-sort-orderby-view/div/div/div/input
${UNISPHERE_OPERAPUBSEARCHINPUT_XPATH}     //*[@id="approvedSceneSorting"]/search-sort-orderby-view/div/div/div/input
${UNISPHERE_OPERAPUBSCENESEARCHBTN_XPATH}  //div[@id='approvedSceneSorting']//*[@id="searchBtn"]
${UNISPHERE_OPERATORNODESTAB_ID}           //label[@id='nodesTab']
${UNISPHERE_OPERATORNODESTATUS_ID}         //*[@id="squareNoteInsideNodeStatus"]
${UNISPHERE_OPERATORREFINENODEDATASOURCES_ID}     //*[@id="refine_Node_Data_Sources"]
${UNISPHERE_HEARTBEATITEMTABDETAILS_ID}     //*[@id="itemTabDetails"]
${UNISPHERE_COMMENTSSEARCHBOX_ID}           //*[@id="comments_searchBox"]
${UNISPHERE_CONCURRENTODALPOUP_ID}          (//*[@id="divPopModalMessage"])[2]
${UNISPHERE_DELETEPOUP_ID}                  //*[@id="divPopModalMessage"]
${UNISPHERE_CONCURRENTNO_BTN}                (//*[@id="buttn_CancelTxt"])
${UNISPHERE_POPUPCANCELBTN_BTN}              id=buttn_CancelTxt
${UNISPHERE_CONCURRENTYES_BTN}               (//*[@id="buttn_ReplaceTxt"])
${UNISPHERE_CARD_IMAGE_XPATH}                 xpath=(//*[@id='itemImage'])[1]
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
${UNISPHERE_AVAI_ITEM_SEARCHBOX}                                 xpath=(//input[contains(@class,'ui-picklist-filter ')])[1]
${UNISPHERE_SEL_ITEM_SEARCHBOX}                                  xpath=(//input[contains(@class,'ui-picklist-filter ')])[2]
${UNISPHERE_AVAI_ITEM_SERACH_BTN}                                xpath=(//span[contains(@class,'ui-picklist-filter-')])[1]
${UNISPHERE_SEL_ITEM_SERACH_BTN}                                 xpath=(//span[contains(@class,'ui-picklist-filter-')])[2]

${UNISPHERE_SELECT_SINGLE_ITEM_BTN}                              xpath=(//*[@id='childrenTab']//button)[1]
${UNISPHERE_SELECT_ALL_ITEM_BTN}                                 xpath=(//*[@id='childrenTab']//button)[2]
${UNISPHERE_REMOVE_SINGLE_ITEM_BTN}                              xpath=(//*[@id='childrenTab']//button)[3]
${UNISPHERE_REMOVE_ALL_ITEM_BTN}                                 xpath=(//*[@id=childrenTab']//button)[4]
${UNISPHERE_AVAI_ITEM_LISTS}                                     xpath=(//*[@id='childrenTab']//*[contains(@class,'picklist-source')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
${UNISPHERE_SELECTED_ITEM_LISTS}                                 xpath=(//*[@id='childrenTab']//*[contains(@class,'picklist-target')]//li[contains(@class,'ui-picklist-item') and contains(@style,'block')])
#-----------------------------------------------------------------------------------------------------------------------
