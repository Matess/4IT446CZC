*** Settings ***
Suite Setup       Open CZC    ${url}    ${browser}
Test Setup        Search For    ${testProduct}
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Test Cases ***
AddFavTest
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    Login CZC    ${loginName}    ${loginPass}
    wait until page contains element    //*[@id="product-detail"]/div[2]/div[3]/div[3]/a[2]    60
    click element    //*[@id="product-detail"]/div[2]/div[3]/div[3]/a[2]
