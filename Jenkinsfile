pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sanjaydattanayak/new-calculator-app.git'
            }
        }

        stage('CI: Test') {
            steps {
                echo 'Running unit tests...'
                // Ensure we are in the workspace root and discover all Python test files
                bat 'cd %WORKSPACE% && "C:\\Users\\Admin\\AppData\\Local\\Programs\\Python\\Python314\\python.exe" -m unittest discover -s tests -p "*.py"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t calculator-app .'
            }
        }

        stage('CD: Deploy') {
            steps {
                echo 'Deploying Docker container...'
                // Stop and remove existing container if it exists
                bat 'docker stop calculator-container || exit 0'
                bat 'docker rm calculator-container || exit 0'
                // Run new container
                bat 'docker run -d --name calculator-container -p 5000:5000 calculator-app'
            }
        }
    }

    post {
        success {
            echo '✅ Build and Deployment successful!'
        }
        failure {
            echo '❌ Build or Deployment failed!'
        }
    }
}
