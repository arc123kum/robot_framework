*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Login page load
    wait until page contains    Login

Enter user name and password
    input text    id=email-id   test@test.com
    input password    id=password   test
    select checkbox     id=remember

Click submit button
    click button    id=submit-id

