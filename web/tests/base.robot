*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://training-wheels-protocol.herokuapp.com

*** Keywords ***
Nova sessão
    Open Browser                    ${url}                      chrome

Encerra Browser
    Capture Page Screenshot
    Close Browser