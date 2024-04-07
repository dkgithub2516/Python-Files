pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from GitHub repository
                git 'https://github.com/dkgithub2516/Python-Files.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build('sort')
                }
            }
        }

        stage('Test') {
            steps {
                // Execute test commands (if any)
                sh 'python -m unittest discover'
            }
        }

        stage('Deploy') {
            steps {
                // Run Docker container
                script {
                    docker.image('sort').run('--name sort-container -d')
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
