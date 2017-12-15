*** Settings ***
Suite Setup       Open CZC    ${url}    ${browser}
Test Setup        Search For    ${testProduct}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Test Cases ***
ShowDisTest
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    Wait Until Page Contains Element    //*[@id="pd-discussion-content"]/div[1]/a
    Click Element    //*[@id="pd-discussion-content"]/div[1]/a
    Login CZC    ${loginName}    ${loginPass}
    Wait Until Page Contains Element  //*[@id="logged-user"]
    Wait Until Page Contains Element  //*[@id="popup-new-discussion-thread"]/div
