*** Settings ***
Documentation  Here are documentation about Locatiors

*** Variables ***
${UsernameTextField}                                xpath=//*[@id="userName"]
${PasswordTextField}                                xpath=//*[@id="password"]
${LogInButton}                                      xpath=//*[@id="loginBtn"]
${RoleListElement}                                  xpath=//*[@id="roleList"]
${AdministratorRole}                                xpath=//*[@id="roleName_roleList.administratorRole"]
${OperatorRole}                                     xpath=//*[@id="roleName_roleList.operatorRole"]
${DataPoolCategoriesCardButton}                     xpath=//h4[@id="preferenceCardName_4"]
${HamburgerRoot}                                    xpath=//div[@class="hb-root"]
${HamburgerInfoCenter}                              xpath=//li[@id="hb_infoCenter"]
${HamburgerICProduct}                               xpath=//li[@id="hb_product"]
${HamburgerICPDataPoll}                             xpath=//li[@id="hb_dataPool"]
${DataPollDataModelOverviewFile}                    xpath=//a[@id="downloadItem_0"]
${DataPollDataModelOverviewFileVerification}        xpath=//a[@id="downloadItem_0"]
${DataPoolERDFile}                                  xpath=//a[@id="downloadItem_1"]
${DataPoolERDFileVerification}                      xpath=//a[@id="downloadItem_1"]
${DPCardActivateNodeDataCollectionBtn}              (//*[@id="file_state"]//img)[1]
${DPCardIncludeNodeSerialNumberDataCollectionBtn}   (//*[@id="file_state"]//img)[2]
${DATA_POOL_TIME_AND_DATE}                          //*[@id="categories-list"]/div/div[2]/div/div[1]/div/div/div[3]/p
