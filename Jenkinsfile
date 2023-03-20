pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
              sh '''
                docker build -t TechstarterGmbH/abschlussprojekt-23-03-frontend:jenkins-${GITHUB_RUN_ID} .
              '''
            }
        }
        stage('Release') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'abschlussprojekt', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) { 
                sh '''
                docker login -u $USERNAME -p $PASSWORD
                docker push TechstarterGmbH/abschlussprojekt-23-03-frontend:jenkins-${GITHUB_RUN_ID}
                '''
              }
            }
        }
        stage('deploy') {
            steps {
                sh '''
                docker stop abschlussprojekt-23-03-frontend || true
                docker rm -f abschlussprojekt-23-03-frontend || true
                docker run -p3000:80 -d --name abschlussprojekt-23-03-frontend TechstarterGmbH/abschlussprojekt-23-03-frontend:jenkins-${GITHUB_RUN_ID}
                '''
            }
        }
    }
}
