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
                    withCredentials([usernamePassword(credentialsId: 'payara_credentials', usernameVariable: 'PAYARA_USERNAME', passwordVariable: 'PAYARA_PASSWORD')]) {
                    docker.image('payara').inside {
                        sh "docker login -u $PAYARA_USERNAME -p $PAYARA_PASSWORD"
                        sh '/opt/payara41/bin/asadmin deploy --force --contextroot /app **/*.war'
                    }
                  }
                }
            }
        }
    }
}
