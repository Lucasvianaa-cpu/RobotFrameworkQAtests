** Instalação em Linux ** 

Baixar o ChomeDriver da versão do navegador
    https://developer.chrome.com/docs/chromedriver/downloads?hl=pt-br

Depois de instalar o chrome driver, rode o comando para verificar onde foi instalado:
    which chromedriver

Depois rode o comando de permissão com o caminho que mostrar
    sudo chmod +x /usr/local/bin/chromedriver


Instalação sem ser em um ambiente virtual:

    sudo apt install pipx

    pipx install selenium

    sudo apt update
    sudo apt install python3-selenium

    sudo -H pip install --upgrade selenium --break-system-packages

    sudo apt install --reinstall python3-pip


EXECUÇÃO:
    robot estrutura.robot (no caso o nome do arquivo desejado).


