pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/sakshimohinia/DeploymentDemo.git'
            }
        }

        stage('Build Project') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t springboot-app .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat 'docker stop springboot-container || exit 0'
                bat 'docker rm springboot-container || exit 0'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d --name springboot-container -p 8081:8080 springboot-app'
            }
        }
    }

    post {
        success {
            echo 'Build Successful! Application deployed successfully.'
        }

        failure {
            echo 'Build Failed! Please check Console Output.'
        }
    }
}