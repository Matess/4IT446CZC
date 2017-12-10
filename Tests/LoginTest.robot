*** Settings ***
Test Setup        Open CZC    ${url}    ${browser}
Library           Selenium2Library
Resource          ../Settings/Browser_Settings.txt
Resource          ../Keywords/Browser_Keywords.txt
Resource          ../Objects/Main_Page.txt

*** Test Cases ***
LoginTest
    Login CZC    ${loginName}    ${loginPass}
