*** Settings ***
Test Setup        Open CZC    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Variables ***
${termsLink}      css=#footer-links > div.footer-links-container > div.links-block-container > div:nth-child(2) > ul > li:nth-child(1) > a
${termsContent}    css=#docs-internal-guid-e40922b1-e43e-f867-b22a-0e2a2f35977e

*** Test Cases ***
TermsTest
    ${terms_url}    Get Element Attribute    ${termsLink} @href
    Go To    ${terms_url}
    Element Should Be Visible    ${termsContent}
