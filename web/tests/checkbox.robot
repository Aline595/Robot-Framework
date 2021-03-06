*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra Browser

*** Variables ***
${check-thor}       id:thor
${check-ironman}    css:input[value='iron-man']
${check-panther}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando Opção com id
    Go To                           ${url}/checkboxes  
    Select Checkbox                 id:thor
    Checkbox Should Be Selected     id:thor
    
Marcando Opção com css Selector
    Go To                           ${url}/checkboxes  
    Select Checkbox                 ${check-ironman} 
    Checkbox Should Be Selected     ${check-ironman} 
    
Marcando Opção com Xpath
    [tags]      ironman
    Go To                           ${url}/checkboxes  
    Select Checkbox                 ${check-panther}
    Checkbox Should Be Selected     ${check-panther}
    