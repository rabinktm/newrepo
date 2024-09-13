pipeline {
    agent any
    environment {
        registry = 'rabinktm/newrepo:latest'
        registryCredential ='dockerhub_id'
        dockerImage = ''
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rabinktm/newrepo.git']])
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build(registry) 
                }
            }
        }
        stage ('Uploading Image'){
            steps {
                script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        }
                }
            }
        }
    }
    
}

