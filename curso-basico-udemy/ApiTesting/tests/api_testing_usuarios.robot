*** Settings ***
Resource  ../resources/api_testing_usuarios.resource


*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Conferir se o usuário foi cadastrado corretamente

#TESTE NA NEGATIVA, CENÁRIO 02, POIS TEM QUE DAR ERRO PARA O TESTE PASSAR. ( NO CASO NÃO DEVE PERMITIR O CADASTRO DO MESMO EMAIL, DEU ERRO, MAS O TESTE PASSOU, POIS A API RETORNOU O ERRO)
Cenário 02: Cadastrar um usuário já existente
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um novo usuário
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados
    
Cenário 04: Realizar Login
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Consultar os dados do novo usuário
    Realizar Login  ${EMAIL_TESTE}  1234


Cenário 05: Forçar Login com senha errada
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Consultar os dados do novo usuário
    Realizar Login com senha errada  ${EMAIL_TESTE}  256559
