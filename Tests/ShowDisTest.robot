*** Settings ***
Suite Setup       Open CZC    ${url}    ${browser}
Test Setup        Search For    ${testProduct}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Variables ***
${diskuze}        //*[@id="product-detail"]/div[3]/div/nav/ul/li[5]/a

*** Test Cases ***
ShowDisTest
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    Wait Until Page Contains Element    ${diskuze}
    Click Element    ${diskuze}
    Element Should Contain    //div[@class="infobox"]/h3    Máte otázky k danému produktu?
