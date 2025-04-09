pipeline {
    agent any
    stages {
        stage ('Checkout From Git') {
            steps {
                git branch: 'prod', url: 'https://github.com/bkrrajmali/newspring-pet-clininc.git'
            }
        }
        stage('Build') {
            steps {
                echo "This is Build stage"
            }
        }
        stage('Test') {
            steps {
                echo "This is Test Stage"
            }
        }
        stage('Deploy') {
            steps {
               echo "This is Deploy Stage"
            }
        }
    }
}