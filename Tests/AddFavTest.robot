*** Settings ***
Suite Setup       Open CZC    ${url}    ${browser}
Test Setup        Search For    ${testProduct}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Variables ***
${addToFavTileButton}    xpath=//a[@title="Přidat k oblíbeným produktům"]

*** Test Cases ***
AddFavTest
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    Login CZC    ${loginName}    ${loginPass}
    Wait until Element is Visible    ${addToFavTileButton}
    click element    ${addToFavTileButton}
