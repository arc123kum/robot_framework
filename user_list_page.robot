*** Settings ***
Library     SeleniiumLibrary


*** Keywords ***
user list page Load
    wait until page contains    Our Happy Customers

click on add new customer
    click link  id=new-customer

check page loaded for adding user
    wait until page contains    Add Customer

Add new user
    input text  id=EmailAddress     test@test.com
    input text  id=FirstName        test
    input text  id=LastName         last
    input text  id=City             pune
    select from list by value       id=StateOrRegion    TX
    select radio button     gender      female
    select checkbox     name=promos-name

click on submit
    click button    Submit

user add confirmation
    wait until page contains    Success


