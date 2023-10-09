# This is one of the Automation project done by me
# This is the main Test case .robot file which we will run and this is saved in Tests directory

*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Back_office_keyword.robot
Suite Setup    Start the browser
Suite Teardown    End the browser

*** Variables ***
${Browser}      chrome
${URL}          https://automationplayground.com/back-office/pages/index.html

*** Test Cases ***
Smoke test case to navigate to tables page from home page
    [Tags]      1       Smoke
    Navigate to Home_page
    Navigate to Chart_page
    Navigate to Tables_page
    Navigate to Forms_page

=================================================================================================================================================================================
# Below is the keyword file which is stored in Resources directory

*** Settings ***
Resource    ../Resources/PO/Home_page.robot
Resource    ../Resources/PO/Chart_page.robot
Resource    ../Resources/PO/Tables_page.robot
Resource    ../Resources/PO/Forms_page.robot

*** Variables ***


*** Keywords ***
Navigate to Home_page
    home_page.validate home page

Navigate to Chart_page
    chart_page.validate flot chart

Navigate to Tables_page
    tables_page.Check Pagination for table

Navigate to Forms_page
    Forms_page.Fill the Form

=================================================================================================================================================================================
# Below are the page object in PO directory
1. Home page
================
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${home_page_header}         Dashboard
${buttone_line_1}           //*[@id="page-wrapper"]/div[3]/div[1]/div[1]/div[1]/div/div/button
${link_inside_action}       //*[@id="page-wrapper"]/div[3]/div[1]/div[1]/div[1]/div/div/ul/li[1]/a
${buttone_line_2}           //*[@id="page-wrapper"]/div[3]/div[1]/div[2]/div[1]/div/div/button
*** Keywords ***
Validate home page
    wait until page contains    ${home_page_header}
    click button    ${buttone_line_1}

    click link      ${Link_inside_action}
    click button    ${buttone_line_2}
    sleep       30s

2. Chart page
===================
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${main_chart_link}      //*[@id="side-menu"]/li[3]/a
${flot_chart_link}      //*[@id="side-menu"]/li[3]/ul/li[1]/a
${flot_chart_page_header}       Flot

*** Keywords ***
Validate flot chart
    click link      ${main_chart_link}
    click link      ${flot_chart_link}
    wait until page contains    ${flot_chart_page_header}
    

3. Tables page
====================
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${tables_page_header}       Tables
${table_page_link}          //*[@id="side-menu"]/li[4]/a
${pagination_2nd_page}     //*[@id="dataTables-example_paginate"]/ul/li[3]/a

*** Keywords ***
Check Pagination for table
    wait until page contains        ${tables_page_header}
    click link      ${table_page_link}
    click link      ${pagination_2nd_page}
    
4. Form page
======================
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${main_forms_page_link}     //*[@id="side-menu"]/li[5]/a
${forms_page_header}        Forms
${text_input}               //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/div[1]/input
${text_input_value}         text_archana
${text_input_with_placeholder}      //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/div[2]/input
${text_input_with_placeholder_value}      placeholder
${sleep_time_value}         30s
${file_input_xpath}         //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/div[4]/input
${file_location}            /home/deepak/Downloads/sample_file
${text_area_xpath}          //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/div[5]/textarea
${text_area_value}          open_text_area
${check_box2}               //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/div[7]/label[4]/input
${radio_button1}            optionsRadios
${radio_button2}            optionsRadiosInline
${drop_down1}               //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/div[10]/select
${drop_down2}               //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/div[11]/select
${submit_button}            //*[@id="page-wrapper"]/div[2]/div/div/div[2]/div/div[1]/form/button[1]

*** Keywords ***
Fill the Form
    click link    ${main_forms_page_link}
    wait until page contains    ${forms_page_header}
    input text    ${text_input}        ${text_input_value}
    input text    ${text_input_with_placeholder}        ${text_input_with_placeholder_value}
    sleep   ${sleep_time_value}
    Choose File    ${file_input_xpath}       ${file_location}
    input text    ${text_area_xpath}     ${text_area_value}
#    select checkbox    /html/body/div/div/div[2]/div/div/div[2]/div/div[1]/form/div[6]/div[2]/label
    select checkbox         ${check_box2}
    Select Radio Button     ${radio_button1}    option2
    select radio button     ${radio_button2}    option2
    select from list by label   ${drop_down1}   4
    select from list by label   ${drop_down2}     5
    click button                ${submit_button}
    capture page screenshot
