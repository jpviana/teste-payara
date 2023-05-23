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
                            docker cp /var/jenkins_home/workspace/Metre-SG/target/*.war payara:/opt/payara/appserver/glassfish/domains/domain1/autodeploy/
                            docker exec payara /opt/payara/appserver/bin/asadmin deploy --user admin --passwordfile /opt/payara/passwordFile --force --contextroot /app /opt/payara/appserver/glassfish/domains/domain1/autodeploy/Teste-Deploy-1.0-SNAPSHOT.war
                        '''
                    }
                }
            }
        }
    }
