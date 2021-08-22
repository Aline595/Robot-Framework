*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra Browser

*** Test Cases ***
Login com sucesso
    Go To           ${url}/login
    Input Text      css:input[name=username]    stark
    Input Text      css:input[name=password]    jarvis!
    Click element   class:btn-login

    Page Should Contain     Olá, Tony Stark. Você acessou a área logada!

Senha Invalida

    [tags]                  login_error
    Go To                   ${url}/login
    Input Text              css:input[name=username]    stark
    Input Text              css:input[name=password]    abd123
    Click element           class:btn-login

    ${message}=             Get WebElement              id:flash
    Should Contain          ${message.text}             Senha é invalida!  
    Page Should Contain     Senha é invalida!


Usuario não existe
    [tags]                  login_user404
    Go To                   ${url}/login
    Input Text              css:input[name=username]    papito
    Input Text              css:input[name=password]    123456
    Click element           class:btn-login

    ${message}=             Get WebElement              id:flash
    Should Contain          ${message.text}             O usuário informado não está cadastrado!

