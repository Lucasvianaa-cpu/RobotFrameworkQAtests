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


#GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    #Uma keyword chamando outras já existentes
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Casa"
    Entrar no menu "Casa"
Então o título da página deve ficar "Produtos para Casa | Amazon.com.br"
    Verificar se o título da página fica "Produtos para Casa | Amazon.com.br"

E o texto "Tudo em Casa e Decoração" deve ser exibido na página
    Verificar se aparece a frase "Tudo em Casa e Decoração"

E a categoria "Aspiradores" deve ser exibida na página
    Verificar se aparece a categoria "Aspiradores"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto "Console Xbox Series S"