pipeline {
    agent any
stages{
        stage("Git Checkout"){
            steps{
                git branch: 'devops', url: 'https://github.com/anuragjos/devops-automation.git'
                sh 'mvn clean install'
            }
        }
        stage("Docker Build Image"){
            steps{
                sh 'docker build -t anuragjoshi01/kubernetes .'
            }
        }
        
    }
}