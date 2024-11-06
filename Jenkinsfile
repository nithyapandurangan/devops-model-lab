pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'nithyapandurangan/devops-model-lab'
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/nithyapandurangan/devops-model-lab.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${env.BRANCH_NAME}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'staging') {
                        sh "docker run -d -p 8081:80 ${DOCKER_IMAGE}:${env.BRANCH_NAME}"
                    } else if (env.BRANCH_NAME == 'main') {
                        sh "docker run -d -p 8080:80 ${DOCKER_IMAGE}:${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }
}


