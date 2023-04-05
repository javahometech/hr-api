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
                tomcatDeploy()
            }
        }
    }
    post {
      always {
        cleanWs()
      }
    }
}
