pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/javahometech/hr-api'
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage("Dev Deploy"){
            steps{
              sshagent(['tocat-dev']) {
                  // copy war file onto tomcat sever
                  sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.49.161:/opt/tomcat9/webapps/"
                  sh "ssh ec2-user@172.31.49.161 /opt/tomcat9/bin/shutdown.sh"
                  sh "ssh ec2-user@172.31.49.161 /opt/tomcat9/bin/startup.sh"
              }
            }
        }
    }
}
