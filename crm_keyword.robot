*** Settings ***
Resource    ../Resources/PO/home_page.robot
Resource    ../Resources/PO/Login_page.robot
Resource    ../Resources/PO/user_list_page.robot


*** Keywords ***
SignIn to crm
    Click on Sign In
    Login page load
    Enter user name and password
    Click submit button
    user list page Load

Add new customer
    click on add new customer
    check page loaded for adding user

    Add new user
    click on submit
    user add confirmation
