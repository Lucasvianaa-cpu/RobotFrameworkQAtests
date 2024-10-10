*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${input_first_name}   id:firstName
${input_last_name}    id:lastName
${input_email}        id:userEmail
${input_phone}        id:userNumber
${input_dob}          id:dateOfBirthInput
${input_subjects}     id:subjectsInput  # Identificador do campo de matérias (Select2)
${checkbox_hobbies}   xpath=//label[@for='hobbies-checkbox-1']
${textarea_address}   id:currentAddress

${select_state_container}  xpath=//div[@id='state']  
${select_state_option}     xpath=//div[text()='NCR']  
${select_city_container}    xpath=//div[@id='city']
${select_city_option}       xpath=//div[text()='Delhi'] 

${button_submit}      id:submit  # ID do botão de submit

*** Keywords ***
# Abre o navegador e acessa a URL especificada
abrir navegador e acessar o site
    Open Browser    https://demoqa.com/automation-practice-form    chrome

# Preenche os campos do formulário
preencher campos
    Input Text        ${input_first_name}   Lucas
    Input Text        ${input_last_name}    Silva
    Input Text        ${input_email}        lucas1042@live.com
    Input Text        ${input_phone}        18996666724

    # Seleciona a data de nascimento
    Click Element      ${input_dob}
    Wait Until Element Is Visible   xpath=//div[contains(@class, 'react-datepicker')]  # Aguardar o calendário aparecer
    Click Element      xpath=//div[@class='react-datepicker__day react-datepicker__day--010 react-datepicker__day--selected react-datepicker__day--today']

    # Preenche o campo de matérias (Select2)
    Input Text         ${input_subjects}     Maths  # Digita o nome da matéria
    Sleep              1  # Espera um segundo para garantir que a lista de sugestões apareça
    Wait Until Element Is Visible   xpath=//div[contains(@class, 'subjects-auto-complete__option')]  # Aguarda a lista de opções
    Click Element      xpath=//div[contains(@class, 'subjects-auto-complete__option')][1]  # Clica na primeira opção da lista

    # Seleciona hobbies
    Scroll Element Into View   ${checkbox_hobbies}
    Wait Until Element Is Visible   ${checkbox_hobbies}
    Click Element      ${checkbox_hobbies}  # Clica no checkbox de hobbies

    # Preenche o endereço
    Input Text         ${textarea_address}     Rua XXX, Bairro XXX, Cidade XXXX

     # Clicar no container do campo de Estado
    Click Element      ${select_state_container}
    Sleep              1  # Dar um tempo para garantir que o dropdown está aberto
    # Agora, interage com o campo de entrada para selecionar o estado
    Click Element      ${select_state_option}

    # Repetir o mesmo processo para o campo de Cidade, se necessário
    Click Element      ${select_city_container}
    Sleep              1
     Click Element     ${select_city_option}   
clicar em submit
    Scroll Element Into View   ${button_submit}  # Rola para o botão de submit
    Wait Until Element Is Visible   ${button_submit}  # Aguarda o botão ficar visível
    Click Element      ${button_submit}  # Clica no botão de submit

fechar navegador
    Close Browser

*** Test Cases ***
Cenário 1: Preencher formulário
    abrir navegador e acessar o site
    preencher campos
    clicar em submit
    fechar navegador
