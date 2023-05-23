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
                        sh '''
                            docker cp /var/jenkins_home/workspace/Metre-SG/target/*.war payara:/opt/payara41/glassfish/domains/domain1/autodeploy/
                            echo 5B8480BD83D20AE044393C4CA6C894231CFC5735 | docker exec -i payara /opt/payara41/bin/asadmin deploy --user admin --passwordfile /dev/stdin --force --contextroot=/app /opt/payara41/glassfish/domains/domain1/autodeploy/*.war
                        '''
                    }
                }
            }
        }
    }
