pipeline {
    agent any

    environment {
        DB_CREDS = credentials('database-id')
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-id-2')
        pms_db_host = '10.140.0.5'
        pms_db_name = 'pms'
        pms_db_username = "${DB_CREDS_USR}"
        pms_db_password = "${DB_CREDS_PSW}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Test') {
            agent {
                docker {
                    image 'maven:3.9-eclipse-temurin-21'
                    reuseNode true
                    args '-v $HOME/.m2:/root/.m2'
                }
            }

            steps {
                withEnv([
                    "pms_db_host=10.140.0.5",
                    "pms_db_name=${pms_db_name}",
                    "pms_db_username=${pms_db_username}",
                    "pms_db_password=${pms_db_password}"
                ]) {
                    sh '''
                        mvn -B -ntp clean test
                        mvn -B -ntp package -DskipTests
                    '''
                }
            }
        }

        stage('Building Git tag to Docker tag') {
            when{
                buildingTag()
            }
            steps{
                sh """ 
                    docker build -t mothmon14682/pms:latest -t mothmon14682/pms:${env.TAG_NAME} .

                    docker push mothmon14682/pms:${env.TAG_NAME}
                    docker push mothmon14682/pms:latest
                """
            }
        }

        stage('Docker build and push') {
            when {
                not {
                    buildingTag()
                }
            }
            steps {
                script {

                    def branch = (env.BRANCH_NAME ?: "unknown").replaceAll('/', '-')

                    if (branch == "main") {

                        sh """
                            docker build -t mothmon14682/pms:stable .

                            docker push mothmon14682/pms:stable
                        """

                    } else {
                        sh """
                            docker build -t mothmon14682/pms:${branch} .

                            docker push mothmon14682/pms:${branch}
                        """
                    }
                }
            }
        }

        stage('Chekout ansible repository') {
            steps {
                dir('ansible') {
                    git branch: 'main',
                        url: 'git@github.com:NT132-Q24-Group14/ansible.git',
                        credentialsId: 'ansible-ssh-key'
                }
            }
        }

        stage('Deploy applicaion with Ansible') {
            steps {
                dir('ansible') {
                    withCredentials([file(credentialsId: 'ansible-vault-id', variable: 'VAULT_PASS')]) {
                        sh '''
                        ansible-playbook playbooks/deploy-app.yml \
                        --vault-password-file ${VAULT_PASS} \
                        -e "pms_db_host=${pms_db_host}" \
                        -e "pms_db_name=${pms_db_name}" \
                        -e "pms_db_username=${pms_db_username}" \
                        -e "pms_db_password=${pms_db_password}"
                        '''
                    }
                }
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
