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
                        docker cp /var/jenkins_home/workspace/metre/target/*.war payara:/opt/payara41/glassfish/domains/domain1/autodeploy/
                        docker exec payara /opt/payara41/bin/asadmin deploy --force --contextroot /app /opt/payara41/glassfish/domains/domain1/autodeploy/*.war
                    '''
                }
            }
        }
    }
}
