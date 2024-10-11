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
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Casa"
    Verificar se aparece a frase "Tudo em Casa e Decoração"
    Verificar se o título da página fica "Produtos para Casa | Amazon.com.br"
    Verificar se aparece a categoria "Aspiradores"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, se está listando o produto "Console Xbox Series S"
