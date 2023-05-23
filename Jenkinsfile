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
                        def warFile = sh(returnStdout: true, script: 'ls /opt/payara/deployments/*.war').trim()
                        sh '''
                            docker cp /var/jenkins_home/workspace/Metre-SG/target/*.war payara:/opt/payara/deployments/
                            docker exec payara /opt/payara/appserver/bin/asadmin deploy --user admin --passwordfile /opt/payara/passwordFile --force --contextroot /app $warFile
                        '''
                    }
                }
            }
        }
    }
