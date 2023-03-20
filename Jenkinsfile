pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
              sh '''
                docker build -t tomvd123/frontend-abschluss:jenkins-${GITHUB_RUN_ID} .
              '''
            }
        }
        stage('Release') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'abschluss-frontend', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) { 
                sh '''
                docker login -u $USERNAME -p $PASSWORD
                docker push tomvd123/frontend-abschluss:jenkins-${GITHUB_RUN_ID}
                '''
              }
            }
        }
        stage('deploy') {
            steps {
                sh '''
                docker stop frontend-abschluss || true
                docker rm -f frontend-abschluss || true
                docker run -p3000:80 -d --name frontend-abschluss tomvd123/frontend-abschluss:jenkins-${GITHUB_RUN_ID}
                '''
            }
        }
    }
}
