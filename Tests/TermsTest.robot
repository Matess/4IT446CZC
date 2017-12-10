*** Settings ***
Test Setup        Open CZC    ${url}    ${browser}
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Test Cases ***
TermsTest
    ${terms_url}    Get Element Attribute    ${termsLink} @href
    Go To    ${terms_url}
    Element Should Be Visible    ${termsContent}
