pipeline{
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages{
         stage('build'){
            steps{
                sh './docker.sh'
            }
        }    
        stage('push'){
            steps{
                sh "echo \$DOCKERHUB_CREDENTIALS_PSW | docker login -u \$DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker tag mysql tgg1818/mysql-db:latest"
                sh "docker tag flask-app tgg1818/flask-app:latest"
                sh "docker push tgg1818/mysql-db:latest"
                sh "docker push tgg1818/flask-app:latest"
            }
        }    
    }
}