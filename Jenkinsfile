pipeline {
    agent any
    tools{
        maven "M2_HOME"
    }
    environment {
        USER = credentials('mongodb-username')
        PWD = credentials('mongodb-pwd')
        DUSER = credentials('dockerhub_username')
        DPWD = credentials('dockerhub_pwd')
    }
    stages{
        stage('1. GIT Clone'){
            steps{
                git 'https://github.com/arunbalajii/EurekaServer.git'
            }
        }
        stage('2. Maven Clean'){
            steps{
                bat 'mvn clean install'
            }
        }
        stage('3. Build Docker Image'){
            steps{
                script{
                    bat 'docker build -f Dockerfile -t arunvig/jenkins_eureka_ser:latest .'
                    }
            }

        }
        stage('4. Push to Docker Hub'){
            steps{
                script{
                   bat 'docker login -u %duser% -p %dpwd%'
                }
                bat 'docker push arunvig/jenkins_eureka_ser:latest'
            }
        }
    }
}