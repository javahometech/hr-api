pipeline {
    agent any
    
    environment {
      TOMCAT_DEV = "172.31.49.161"
      TOMCAT_USER = "ec2-user"
    }

    stages {
    
        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage("Dev Deploy"){
            steps{
              sshagent(['tocat-dev']) {
                  // copy war file onto tomcat sever
                  sh "scp -o StrictHostKeyChecking=no target/*.war $TOMCAT_USER@$TOMCAT_DEV:/opt/tomcat9/webapps/"
                  sh "ssh $TOMCAT_USER@$TOMCAT_DEV /opt/tomcat9/bin/shutdown.sh"
                  sh "ssh $TOMCAT_USER@$TOMCAT_DEV /opt/tomcat9/bin/startup.sh"
              }
            }
        }
    }
}
