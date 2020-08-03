pipeline {
    agent {
        docker {
            image 'node:10-alpine'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'make check || true' 
                junit allowEmptyResults: true, testResults: '**/test-results/*.xml'
            }
        }
        stage('Deliver') {
            steps {
                  when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                sh 'make publish'
            }
                input message: 'Finished using the web site? (Click "Proceed" to continue)?'
            }
        }
    }
}
