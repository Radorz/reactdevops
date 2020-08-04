pipeline {
    agent {
        docker {
            image 'node:10-alpine'
            args '-p 4040:4040'
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
               sh 'chmod 0777 ./jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh 'set -x npm run build set +x set -x npm start & sleep 1 echo $! > .pidfile set +x'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh 'chmod +x ./jenkins/scripts/kill.sh'
            }
        }
    }
}
