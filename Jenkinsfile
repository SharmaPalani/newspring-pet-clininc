pipeline {
    agent any
    tools{
        maven 'maven'
    }
    environment{
        IMAGE_NAME = "jenkins_project"
        IMAGE_TAG = "${BUILD_NUMBER}"
        TENANT_ID = "d4f49458-0372-446d-aac3-fa4bf14ff177"
        ACR_NAME = "azurejenkins"
        ACR_LOGIN_SERVER = "${ACR_NAME}.azurecr.io"
        FULL_IMAGE_NAME = "${ACR_LOGIN_SERVER}/${IMAGE_NAME}:${IMAGE_TAG}"
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
        stage('maven package'){
            steps {
                echo "This is maven package"
                sh 'mvn package'
            }
        }
        stage('Docker build'){
            steps{
                script{
                echo "this is docker build"
                docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
          stage('ACR login'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'acr_login', usernameVariable: 'AZURE_USERNAME', passwordVariable: 'AZURE_PASSWORD')]){
                    script{
                    sh '''
                        echo "login in to ACR"
                        az login --service-principal -u $AZURE_USERNAME -p $AZURE_PASSWORD --tenant $TENANT_ID
                        az acr login --name $ACR_NAME
                    '''
                    }
                }
            }

        }
        stage('push image to ACR'){
            steps{
                script{
                    sh '''
                        echo "pushing image to ACR"
                        docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${FULL_IMAGE_NAME}
                        docker push ${FULL_IMAGE_NAME}
                    '''
                }
            }
        }
    }
}