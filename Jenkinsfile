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
                        sh 'echo "admin\n8127A22EABB93FDC2B0D52BF6E8CAF98A57A06C6" > credentials.txt'
                        sh '/opt/payara41/bin/asadmin --user admin --passwordfile credentials.txt deploy --force --contextroot /app **/*.war''
                    }
                }
            }
        }
    }
}
