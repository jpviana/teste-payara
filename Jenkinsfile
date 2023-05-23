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
                            echo $PASSWORD | docker exec -i payara /bin/bash -c 'cat > /tmp/passwordfile'
                            docker exec payara /opt/payara41/bin/asadmin deploy --user $USERNAME --passwordfile /opt/payara41/glassfish/domains/domain1/config/local-password --force --contextroot /app /opt/payara41/glassfish/domains/domain1/autodeploy/*.war
                        '''
                    }
                }
            }
        }
    }
}
