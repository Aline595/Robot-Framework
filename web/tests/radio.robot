*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra Browser

*** Variables ***
${check-thor}       id:thor
${check-ironman}    css:input[value='iron-man']
${check-panther}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Selecionando por id
    Go To                           ${url}/radios
    Select Radio Button             movies          cap
    Radio Button Should Be Set To   movies          cap

Selecionando por value
    Go To                           ${url}/radios
    Select Radio Button             movies          guardians
    Radio Button Should Be Set To   movies          guardians
