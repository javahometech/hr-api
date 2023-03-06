pipeline {
    agent any

    stages {
        stage('Maven Build') {
          when {
            branch 'develop'
          }
            steps {
                echo 'Maven Build'
            }
        }
      
      stage('Dev Deploy') {
         when {
            branch 'develop'
         }
            steps {
                echo 'Dev Deploy'
            }
      }
      stage('Test Deploy') {
         when {
            branch 'test'
          }
            steps {
                echo 'Test Deploy'
            }
      }
      stage('UAT Deploy') {
         when {
            branch 'uat'
          }
            steps {
                echo 'UAT Deploy'
            }
      }
    }
}
