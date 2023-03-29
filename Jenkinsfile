pipeline {
    
    agent any
    
    environment {
      TOMCAT_DEV = "172.31.49.161"
      TOMCAT_USER = "ec2-user"
    }
    parameters {
      string defaultValue: 'main', description: 'Chose branch to build and deploy', name: 'branchName'
    }

    stages {
        stage("Git Checkout"){
            when {
                expression{
                    params.branchName == "develop"
                }
            }
            steps{
                git branch: "${params.branchName}", credentialsId: 'github', url: 'https://github.com/javahometech/hr-api'
            }
        }
    
        stage('Maven Build') {
            when {
                expression{
                    params.branchName == "develop"
                }
            }
            steps {
                sh 'mvn clean package'
            
            }
        }
      
        stage("Dev Deploy"){
            when {
                expression{
                    params.branchName == "develop"
                }
            }
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
    post {
      success {
        echo "Job successed, sending success email"
      }
      failure {
        echo "Job failed, sending failure email"
      }
    }

}
