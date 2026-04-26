pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        DB_CREDS = credentials('database-id')
        db_name = 'pms'
        db_username = "${DB_CREDS_USR}"
        db_password = "${DB_CREDS_PSW}"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-id')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker build and push') {
            steps {
                sh 'echo ${DB_CREDS_USR}'

                sh 'docker-compose build'

                sh '''
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login \
                  -u $DOCKERHUB_CREDENTIALS_USR \
                  --password-stdin
                '''

                sh 'docker compose push'
            }
        }
    }

    post {
        always {
            // cleanup workspace
            cleanWs()
        }
    }
}
