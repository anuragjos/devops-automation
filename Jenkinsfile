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
        stage("Docker Push Image to Docker HUb"){
            steps{
                withCredentials([string(credentialsId: 'Docker-Hub', variable: 'docker_hub_password')]) {
                    sh "docker login -u anuragjoshi01 -p ${docker_hub_password}"
                    sh 'docker push anuragjoshi01/kubernetes'
                }
            }
        }
        stage("Deploy to Kubernetes"){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml', kubeconfigId: 'kubernetes-server') 
                }
            }
        }
        
    }
}