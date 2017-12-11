*** Settings ***
Suite Setup       Open CZC    ${url}    ${browser}
Test Setup        Search For    ${testProduct}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Variables ***
${rateButton}     //a[contains(text(),"Přidat vlastní hodnocení")]
${newReviewForm}    id=new-review-form

*** Test Cases ***
RatingTest
    ${product_url}    Get Element Attribute    //div[@id='product-list-container']//div[@class='tile-title']//a[@title='${testProduct}']@href
    Go To    ${product_url}
    Execute JavaScript    $(".btn.right.js-login").click()
    Wait Until Element Is Visible    ${usernameId}
    Input Text    ${usernameId}    ${loginName}
    Input Password    ${passwordId}    ${loginPass}
    Click Element    xpath=//button[@class="btn submit"]
    Wait Until Page Contains Element    ${newReviewForm}
    Execute JavaScript    $('#new-review-form input[type="radio"][value=4]').click()
