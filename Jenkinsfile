pipeline {
    agent any
        environment {
            version = "${env.BUILD_ID}"
        }
    stages {

       stage('Git Checkout'){
            
            steps{
                
                script{
                    
                    git branch: 'main', url: 'https://github.com/mohamedrafi13/devopsintproject.git'
                }
            }
        }
    /*    stage('sonar quality check') {
            agent {
                docker {
                    image 'maven'
                }
            }
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'deekshithSN') {
                        'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('Quality gate Status') {
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'deekshithSN'
                }
            }
        } */
     stage('Docker Build & Push to Docker Repo') {
            steps{
                script{
                    withCredentials([string(credentialsId: 'nexuscredential', variable: 'nexuscredvar')]) {
                    sh '''
                    docker build -t 65.2.152.64:8083/springapp:${version} .
                    docker login -u admin -p $nexuscredvar 65.2.152.64:8083
                    docker push 65.2.152.64:8083/springapp:${version}
                    docker rmi 65.2.152.64:8083/springapp:${version}
                    '''
                    }
                    
                }
            }
        } 
    }
}