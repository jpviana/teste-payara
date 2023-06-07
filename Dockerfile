# Use a imagem base do Maven para compilação
FROM maven:3.8.4-openjdk-8-slim AS build

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o arquivo pom.xml para o diretório de trabalho
COPY pom.xml .

# Execute o comando para baixar as dependências do Maven
RUN mvn dependency:go-offline -B

# Copie o restante do código fonte para o diretório de trabalho
COPY src ./src

# Compile o projeto com o Maven
RUN mvn clean install

# Crie o arquivo glassfish-web.xml para configurar o contexto raiz
RUN echo "<glassfish-web-app><context-root>/app</context-root></glassfish-web-app>" > /app/target/Teste-Deploy-1.0-SNAPSHOT/WEB-INF/glassfish-web.xml

# Use a imagem base do Payara Micro para execução
FROM payara/micro:5-SNAPSHOT

# Copie o arquivo WAR gerado para o diretório de implantação do Payara Micro
COPY --from=build /app/target/Teste-Deploy-1.0-SNAPSHOT.war $DEPLOY_DIR

# Exponha a porta padrão do Payara Micro
EXPOSE 8080

# Comando padrão para executar o Payara Micro
ENTRYPOINT [ "java", "-jar", "payara-micro.jar", "--deploy", "/opt/payara/deployments/Teste-Deploy-1.0-SNAPSHOT.war"]
