*** Settings ***
Library     SeleniumLibrary

*** Variables ***


*** Keywords ***
abrir site da google
    Open Browser  https://www.google.com.br  chrome

abrir site da globo
    Open Browser  https://www.globo.com   chrome

fechar navegador
    Close Browser

*** Test Cases ***
Cenário 1: Teste de abrir navegador
    abrir site da google
    fechar navegador

Cenário 2: Teste de abrir site globo
    abrir site da globo
    fechar navegador
