pipeline{
    agent any
    stages{
        stage("Git Check out"){
            steps{
                git branch: 'devops', url: 'https://github.com/anuragjos/devops-automation.git'
            }
        }
        stage("Maven Build"){
            steps{
                sh 'mvn clean install'
            }
        }
        stage("Build Docker Image"){
            steps{
                
                sh ' docker build -t anuragjoshi01/kuberntes .'
            }
        }
    }
}

    