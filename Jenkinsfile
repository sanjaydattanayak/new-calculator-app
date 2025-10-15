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
                bat '"C:\\Users\\Admin\\AppData\\Local\\Programs\\Python\\Python314\\python.exe" -m unittest test.py'
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
                echo 'Deploy to AWS Lambda (if configured)'
            }
        }
    }

    post {
        success {
            echo '✅ Build successful!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}