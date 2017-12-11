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
    Login CZC    czctestingtest    Testing123
    Verify Error Messages    ${topMessage}    ${lowerMessage}
    Search for    Niceboy VEGA+ Remote
    Verification of Search1    Niceboy VEGA+ Remote
    Search for    218429
    Verification of Search2    Niceboy Hive sport, černá
