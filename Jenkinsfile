pipeline{
    agent any 
    stages{
        stage("Git Checkout from SCM"){
            steps{
                script{
                    git branch: 'devops', url: 'https://github.com/anuragjos/devops-automation.git'
                    sh 'mvn clean install'
                }
            }
        }
        stage("Docker Build and Test"){
            steps{
                script{
                    sh 'docker build -t anuragjoshi01/kubernetes .'
                }

            }
        }
    }
       
}