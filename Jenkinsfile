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
                    def warFile = sh(returnStdout: true, script: 'ls /var/jenkins_home/workspace/Metre-SG/target/*.war').trim()
                    sh "docker cp $warFile payara:/opt/payara/deployments/"
                    sh "docker exec payara /opt/payara/appserver/bin/asadmin deploy --user admin --passwordfile /opt/payara/passwordFile --force --contextroot /app /opt/payara/deployments/${warFile.name}"
                }
            }
        }
    }
}
