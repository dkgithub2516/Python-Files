pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'python:3.8'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/dkgithub2516/Python-Files.git'
            }
        }

        stage('Lint') {
            steps {
                script {
                    // Install dependencies
                    sh 'pip install -r requirements.txt'
                    // Run linting
                    sh 'pylint sort.py'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run unit tests
                    sh 'python -m unittest discover'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build('sort-app', '-f Dockerfile .')
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Run Docker container
                    docker.image('sort-app').run('--name sort-container -d -p 5000:5000')
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Application is deployed.'
        }
        failure {
            echo 'Pipeline failed! Deployment unsuccessful.'
        }
    }
}
