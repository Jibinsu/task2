pipeline {
    agent any
    environment{
        SONARQUBE_HOST = 'http://18.132.63.189:9000/'
    }

    stages{
        stage('sonarqube analysis'){
            steps{
                script{
                    withCredentials ([string(credentialsId: '9ab04454-0542-4171-ae3a-0429d5026e81', variable: 'SONAR_TOKEN')]){
                        sh"""
                        docker run --rm --network sonar \
                        -e SONAR_HOST_URL=\${SONARQUBE_HOST} \
                        -e SONAR_LOGIN=\${SONAT_TOKEN} \
                        -v \${WORKSPACE}:/usr/src \
                        sonarsource/sonar-scanner-cli \
                        Dsonar.projectKey=myapp \
                        Dsonar.sources=. \
                        Dsonar.host.url=\${SONARQUBE_HOST} \
                        Dsonar.login=\${SONAR_TOKEN} \
                        """
                    }
                }
            }
        }
    }
}
