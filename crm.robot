*** Settings ***
Documentation       This is some basic info about this suit
Resource    ../Resources/crm_keyword.robot
Resource    ../Resources/common.robot
Test Setup    start the browser
Test Teardown    End the browser

*** Variables ***
${URL}      https://automationplayground.com/crm
${browser}  chrome

*** Test Cases ***
Home page should load
    [Documentation]     This is basic info aboout the Test
    [Tags]              1001        Home        Smoke
    crm_keyword.SignIn to crm
    crm_keyword.Add new customer