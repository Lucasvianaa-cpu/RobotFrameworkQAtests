*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}             chrome
${URL}                 https://www.amazon.com.br
${MENU_CASA}           //a[contains(.,'Casa')]
${HEADER_CASA}         //b[contains(.,'Tudo em Casa e Decoração')]
${TEXTO_HEADER_CASA}   Tudo em Casa e Decoração
${CAMPO_PESQUISA}      //input[contains(@type,'text')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER} 
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_CASA}
Entrar no menu "Casa"
    Click Element    locator=${MENU_CASA}

# dessa forma busca o titulo entre "" que estará vindo deste teste do arquivo amazon_testes.robot

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE} 
    Wait Until Element Is Visible    locator=${HEADER_CASA}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_PESQUISA}   text=${PRODUTO}
Clicar no botão de pesquisa
    Click Element    locator=//input[contains(@value,'Ir')]
Verificar o resultado da pesquisa, se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=((//span[contains(.,'${PRODUTO}')]))[3]