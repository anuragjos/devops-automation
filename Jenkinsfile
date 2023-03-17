pipeline {
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage("Git Checkout"){
            steps{
                git branch: 'devops', url: 'https://github.com/anuragjos/devops-automation.git'
                sh 'mvn clean install'
            }
        }
        
    }
}