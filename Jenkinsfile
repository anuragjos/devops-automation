pipeline{
    agent any 
    parameters{
        choice(name: 'action', choices: 'create/ndestroy/destroykubernetesserver', description: 'Create/Update or destroy the kubernetesserver')
    }
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
        stage("Docker push"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-hub-passord', variable: 'docker_hub_password')]) {
                        sh''' 
                        docker login -u anuragjoshi01 -p ${docker_hub_password}
                        docker push anuragjoshi01/kubernetes
                        '''

                    }

                }
            }
        }
        stage("Deploy to Kubernetes"){
            when {expression {params.action == 'create'}}
            steps{
                script{
                    def apply = false
                    try{
                        input message: 'please confirm to innitite the deployments', ok: 'Ready to apply the config'
                        apply = true
                }
                catch(err){
                    apply = false
                    CurrentBuild.result = 'UNSTABLE'
                }
                if (apply){
                    sh '''
                        kubectl apply -f .
                    '''
                }
            }
        }
    }
       
}
}