pipeline{
    agent any
    stages("git checkout"){
        stage{
            steps{
                git branch: 'devops', url: 'https://github.com/anuragjos/devops-automation.git'
            }
        }
    }
}