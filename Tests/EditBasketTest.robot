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
EditBasketTest
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    Click Element    ${addToBasketTileButton}
    Wait Until Page Contains Element    ${inTheBasketInfo}
    Wait Until Page Contains Element    ${inTheBasketProduct}[contains(text(),"${testProduct}")]
    Click Element    //*[@id="popup-buy-mode"]/div/div[3]/a
    Input Text    //*[@id="frm-quantity"]    2
    Input Text    //*[@id="frm-quantity"]    0
    Press Key    //*[@id="frm-quantity"]    \\13
    Wait Until Page Contains Element    //*[@id="basket-visibility-container"]/div/div/h1
