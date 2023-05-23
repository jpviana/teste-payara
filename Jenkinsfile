pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy to Payara') {
            withCredentials([usernamePassword(credentialsId: 'payara-credentials', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
            steps {
                script {
                    sh '''
                        docker cp /var/jenkins_home/workspace/Metre-SG/target/*.war payara:/opt/payara41/glassfish/domains/domain1/autodeploy/
                        echo $PASSWORD | docker exec -i payara /opt/payara41/bin/asadmin deploy --user=$USERNAME --passwordfile=/dev/stdin --force --contextroot=/app /opt/payara41/glassfish/domains/domain1/autodeploy/*.war
                    '''
                }
            }
          }
        }
    }
}
