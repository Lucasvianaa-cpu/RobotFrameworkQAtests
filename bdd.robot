*** Settings ***
Library      SeleniumLibrary

*** Variables ***
#Dados do teste
${NomedaMusica}    Linkin Park Numb

#Variavéis de configuração
${URL}            https://www.youtube.com.br
${Browser}        chrome

#Elementos
${input_Pesquisa}         xpath=//input[@id="search"]
${button_Pesquisa}        xpath=//button[@id="search-icon-legacy"]
${Primeiro}               xpath=(//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${Prova}                  xpath=//a[@class='yt-simple-endpoint style-scope yt-formatted-string' and text()='Linkin Park']



*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser    ${URL}    ${Browser}
Quando digito o nome da música
    Input Text    ${input_Pesquisa}    ${NomedaMusica}
E clico no botão buscar
    Click Element    ${button_Pesquisa}
E clico na primeira opção da lista
    Wait Until Element Is Visible   ${Primeiro}   10
    Click Element    ${Primeiro} 
Então o vídeo é executado
    Wait Until Element Is Visible   ${Prova}  10
    Element Should Be Visible    ${Prova} 
    Sleep    1s
    Close Browser

*** Test Cases ***
Cenário 1: Executar vídeo no site do youtube
    Dado que eu acesso o site do youtube
    Quando digito o nome da música
    E clico no botão buscar
    E clico na primeira opção da lista
    Então o vídeo é executado