*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Casa"
    [Documentation]    Esse teste verifica o menu Casa do site da Amazon.com.br
    ...                e verifica a categoria Aspiradores
    [Tags]            menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Casa"
    Então o título da página deve ficar "Produtos para Casa | Amazon.com.br"
    E o texto "Tudo em Casa e Decoração" deve ser exibido na página
    E a categoria "Aspiradores" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
   
