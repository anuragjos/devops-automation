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
               script{
                sh ' docker build -t anuragjoshi01/kuberntes .'
               } 
                
            }
        }
        stage("Push Docker image to Docker Hub"){
            steps{
                withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
                    sh "docker login -u anuragjoshi01 -p $docker_pass"
                    sh ' docker image push anuragjoshi01/kuberntes'
                    
    
               }
                
            }
        }
    }
}

    