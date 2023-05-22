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
                        sh '/opt/payara41/bin/asadmin deploy **/*.war'
                    }
                }
            }
        }
    }
}
