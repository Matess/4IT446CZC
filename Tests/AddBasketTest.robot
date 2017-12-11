*** Settings ***
Suite Setup       Open CZC    ${url}    ${browser}
Test Setup        Search For    ${testProduct}
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Test Cases ***
AddBasketTest
    Login CZC    ${loginName}    ${loginPass}
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    click element    ${addToBasketTileButton}
    wait until page contains element    ${inTheBasketInfo}
    wait until page contains element    ${inTheBasketProduct}[contains(text(),"${testProduct}")]
    click element    ${modalClose}
    [Teardown]    Throw product off the basket
