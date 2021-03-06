*** Settings ***
Test Setup        Open CZC    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Variables ***
${topMessage}     nesprávné přihlašovací jméno
${lowerMessage}    nesprávné heslo

*** Test Cases ***
LoginTest
    Login CZC    ${loginName}    ${loginPass}
    Verify Error Messages    ${topMessage}    ${lowerMessage}
