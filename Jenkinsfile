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
                bat '"C:\\Users\\Admin\\AppData\\Local\\Programs\\Python\\Python314\\python.exe" -m unittest discover -s tests'
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
                bat 'docker stop calculator-container || exit 0'
                bat 'docker rm calculator-container || exit 0'
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
