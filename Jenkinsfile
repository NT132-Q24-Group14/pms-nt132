pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        DB_CREDS = credentials('database-id')
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-id')
        db_name = 'pms'
        db_username = "${DB_CREDS_USR}"
        db_password = "${DB_CREDS_PSW}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker build and push') {
            steps {
                sh '''
                export db_host=10.140.0.5:3306
                export db_name=$db_name
                export db_username=$db_username
                export db_password=$db_password

                docker-compose build
                '''

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
