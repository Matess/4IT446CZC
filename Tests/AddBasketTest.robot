*** Settings ***
Suite Setup       Open CZC    ${url}    ${browser}
Test Setup        Search For    ${testProduct}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Variables ***
${addToBasketTileButton}    css=button[title='Přidat zboží do košíku']
${inTheBasketInfo}    css=div#buy-mode-product-info
${inTheBasketProduct}    //div[h1[text()="Zboží jsme vložili do košíku"]]//div[@class="td product-name"]/a

*** Test Cases ***
AddBasketTest
    Login CZC    ${loginName}    ${loginPass}
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    click element    ${addToBasketTileButton}
    wait until page contains element    ${inTheBasketInfo}
    wait until page contains element    ${inTheBasketProduct}[contains(text(),"${testProduct}")]
    click element    ${modalClose}
    [Teardown]  Throw product off the basket
