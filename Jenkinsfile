@Library('jhc') _
pipeline {
    agent any

    stages {
      
        stage('Git Checkout') {
             when{
                expression{
                    params.branchName == "develop"
                }
            }
            steps {
                git branch: "${params.branchName}", credentialsId: 'github-tokens', url: 'https://github.com/javahometech/hr-api'
            }
        }
        stage('Maven Build') {
             when{
                expression{
                    params.branchName == "develop"
                }
            }
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Tomcat Deploy - Dev') {
            steps {
                tomcatDeploy("ec2-user","172.31.82.238","tomcat-dev")
            }
        }
    }
    post {
      always {
        cleanWs()
      }
    }
}
