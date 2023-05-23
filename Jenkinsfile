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
                    withCredentials([usernamePassword(credentialsId: 'payara-credentials', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                        sh '''
                            docker cp /var/jenkins_home/workspace/Metre-SG/target/*.war payara:/opt/payara41/glassfish/domains/domain1/autodeploy/
                            docker exec payara /bin/bash -c 'echo "admin" > /opt/payara5/glassfish/domains/domain1/config/password.txt'
                            docker exec payara /opt/payara5/bin/asadmin deploy --user $USERNAME --passwordfile /opt/payara5/glassfish/domains/domain1/config/password.txt --force --contextroot /app /opt/payara5/glassfish/domains/domain1/autodeploy/*.war
                        '''
                    }
                }
            }
        }
    }
}
