pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
              sh '''
                docker build -t tomvd123/abschlussprojekt-frontend:jenkins-${GITHUB_RUN_ID} .
              '''
            }
        }
        stage('Release') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'abschlussprojekt', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) { 
                sh '''
                docker login -u $USERNAME -p $PASSWORD
                docker push tomvd123/abschlussprojekt-frontend:jenkins-${GITHUB_RUN_ID}
                '''
              }
            }
        }
        stage('deploy') {
            steps {
                sh '''
                docker stop abschlussprojekt-frontend || true
                docker rm -f abschlussprojekt-frontend || true
                docker run -p3000:80 -d --name abschlussprojekt-frontend tomvd123/abschlussprojekt-frontend:jenkins-${GITHUB_RUN_ID}
                '''
            }
        }
    }
}
