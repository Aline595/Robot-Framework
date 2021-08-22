*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://training-wheels-protocol.herokuapp.com
${check-thor}       id:thor
${check-ironman}    css:input[value='iron-man']
${check-panther}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando Opção com id
    Open Browser                    ${url}                       chrome
    Go To                           ${url}/checkboxes  
    Select Checkbox                 id:thor
    Checkbox Should Be Selected     id:thor
    Sleep                           5
    Close Browser


Marcando Opção com css Selector
    
    Open Browser                    ${url}                       chrome
    Go To                           ${url}/checkboxes  
    Select Checkbox                 ${check-ironman} 
    Checkbox Should Be Selected     ${check-ironman} 
    Sleep                           5
    Close Browser

Marcando Opção com Xpath
    [tags]      ironman
    Open Browser                    ${url}                       chrome
    Go To                           ${url}/checkboxes  
    Select Checkbox                 ${check-panther}
    Checkbox Should Be Selected     ${check-panther}
    Sleep                           5
    Close Browser
