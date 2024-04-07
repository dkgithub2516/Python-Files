pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from GitHub repository
                git 'https://github.com/yourusername/yourrepository.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build('myapp')
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
                    docker.image('myapp').run('--name myapp-container -d')
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
