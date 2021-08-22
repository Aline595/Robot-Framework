*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra Browser

*** Test Cases ***
Login com sucesso
    Go To                     ${url}/login
    Login with                stark           jarvis!

    Should see Logged user    Tony Stark

Senha Invalida
    [tags]                        login_error
    Go To                         ${url}/login
    Login with                    stark               abd123

    Should Contain Login Alert    Senha é invalida!  

Usuario não existe
    [tags]                       login_user404
    Go To                        ${url}/login
    Login with                   papito             123456

    Should Contain Login Alert   O usuário informado não está cadastrado!

*** Keywords ***
Login with 
    [Arguments]     ${uname}                    ${pass}
    Input Text      css:input[name=username]    ${uname} 
    Input Text      css:input[name=password]    ${pass}
    Click Element   class:btn-login

Should Contain Login Alert
    [Arguments]     ${expect_message}
    ${message}      Get WebElement      id:flash
    Should Contain  ${message.text}     ${expect_message}  

Should see Logged user
    [Arguments]            ${full_name}

    Page Should Contain    Olá, ${full_name}. Você acessou a área logada! 