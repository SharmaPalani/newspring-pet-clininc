pipeline {
    agent any
    tools{
        maven 'maven'
    }
    stages {
        stage('Checkout from git'){
            steps {
                git branch: 'prod', url: 'https://github.com/SharmaPalani/newspring-pet-clininc.git'
            }

        }
        stage('maven compile'){
            steps {
                echo "This is maven compile"
                sh 'mvn compile'
            }

        }
        stage('Build') {
            steps {
                 echo "This is build"
            }
        }
        stage('Test') {
            steps {
              echo "This is test"
            }
        }
        stage('Deploy') {
            steps {
                 echo "This is deploy"
            }
        }
    }
}