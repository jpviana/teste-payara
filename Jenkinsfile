pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy to Payara') {
            steps {
                script {
                    docker.image('payara').inside {
                        sh '/opt/payara41/bin/asadmin --user admin --passwordfile /opt/payara41/bin/glassfish/domain/domain1/config/local-password deploy --force --contextroot /app **/*.war'
                    }
                }
            }
        }
    }
}
