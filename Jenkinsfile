pipeline {
    agent any
    tools {
        maven 'maven' // Maven installation name in Jenkins
    }
    stages {
        stage ('Checkout From Git') {
            steps {
                git branch: 'prod', url: 'https://github.com/bkrrajmali/newspring-pet-clininc.git'
            }
        }

         stage ('Maven Compile') {
            steps {
                echo "This is Maven Compile Stage"
                sh 'mvn compile'
            }
        }
        stage ('Maven Test') {
            steps {
                echo "This is Maven Test Stage"
                sh 'mvn test'
            }
        }
        stage('File System Scan By Trivy') {
            steps {
                echo "Trivy Scan Started"
                sh 'trivy fs --format table --output trivy-report.txt --severity HIGH,CRITICAL .'
            }
        }
        stage('Check SonarScanner Path') {
            steps {
                 sh  'which sonar-scanner'
                 sh  'sonar-scanner --version'
                 }

            }
        
        // stage('Sonar Analysis') {
        //     steps {
        //          withSonarQubeEnv('sonarserver'){
        //             sh  '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=SpringBootPet -Dsonar.projectKey=bkrrajmali_springbootpet -Dsonar.sources=. '''
        //          }

        //     }
        // }
        // stage('Deploy') {
        //     steps {
        //        echo "This is Deploy Stage"
        //     }
        //  }
    }
}
