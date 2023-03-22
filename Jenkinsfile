pipeline{
    agent any
    stages{
        stage("Git Checkout"){
            steps{
                git branch: 'devops', url: 'https://github.com/anuragjos/devops-automation.git'
                sh 'mvn clean install'
            }
        }
        stage("Docker Build and Test"){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'docker_hub_password')]) {
                      sh 'docker build -t anuragjoshi01/kubernetes .'
                }
                
            }
        }
    }
}
        