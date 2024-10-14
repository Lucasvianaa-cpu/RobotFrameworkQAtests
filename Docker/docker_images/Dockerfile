# Passo 01: Instancio uma imagem de SO linux, no caso usei o FEDORA,
# mas pode ser o Ubuntu, Alpine, Debian, etc...
# Procure no Docker Hub a imagem que desejar! https://hub.docker.com
FROM fedora:29

# Passo 02: Vou mapear os volumes (diretórios do container) onde deixarei
# os testes (inputs) e os resultados (outputs).
VOLUME /opt/robotframework/results
VOLUME /opt/robotframework/tests

# Passo 03: Vou rodar os comandos que instalam tudo que preciso para rodar o robot
# nesse container linux. Como estou usando o FEDORA, os comandos aqui executados
# devem ser compatíveis com ele!!
RUN dnf upgrade -y && \
    dnf install -y python37 python3-pip gcc libffi-devel python3-devel openssl-devel && \
    dnf clean all

# Passo 04: Instalo o Robot e as libraries que precisarei. 
# Instale as bibliotecas necessárias para evitar erros com dependências
RUN pip3 install --upgrade pip setuptools && \
    pip3 install \
    robotframework \
    robotframework-faker \
    robotframework-requests==0.5.0 \
    robotframework-seleniumlibrary \
    robotframework-databaselibrary \
    robotframework-sshlibrary==3.2.1

# Configuração do CMD padrão (opcional)
CMD ["/bin/bash"]
