*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
start the browser
    set selenium speed      2s
    set selenium timeout    2s

    log                 start the test cases!
    open browser        ${URL}      ${browser}
    wait until page contains    Customers Are Priority One!


End the browser
    sleep               3s
    close browser
