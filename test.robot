*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=          Welcome         Aline
    log To Console      ${result}
    Should Be Equal     ${result}      Olá Aline, Bem vindo ao Curso básico de Robot Framework!