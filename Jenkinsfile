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
        stage('maven test'){
            steps {
                echo "This is maven test"
                sh 'mvn test'
            }

        }
        stage('file system scanning by trivy'){
            steps {
                echo "This is trivy scan"
                sh 'trivy fs --format table --output trivy-report.txt --severity HIGH,CRITICAL .'
            }

        }
        stage('Sonar analysis'){
            environment{
                SCANNER_HOME = tool 'Sonar-scanner'
            }
            steps {
                 withSonarQubeEnv('sonarserver') {
                    sh '''
                    $SCANNER_HOME/bin/sonar-scanner \
                    -Dsonar.organization=sharmapalani \
                    -Dsonar.projectName=jenkins_project \
                    -Dsonar.projectKey=sharmapalani_jenkins-project \
                    -Dsonar.java.binaries=. \
                '''
            }
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