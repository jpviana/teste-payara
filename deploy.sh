#!/bin/bash

PAYARA_HOME="/opt/payara"
APPLICATION_FILE="${GITHUB_WORKSPACE}/target/*.war"

# Inicializa o servidor Payara
#$PAYARA_HOME/bin/asadmin start-domain

# Realiza o undeploy da aplicação (opcional)
#$PAYARA_HOME/bin/asadmin undeploy nome-da-aplicacao

# Realiza o deploy da nova versão da aplicação
$PAYARA_HOME/bin/asadmin deploy --contextroot /sg --force $APPLICATION_FILE

# Encerra a execução do script
exit 0
