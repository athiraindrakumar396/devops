pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/athiraindrakumar396/devops.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('static-website:latest')
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('static-website:latest').push()
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'deployment.yaml,service.yaml',
                    enableConfigSubstitution: true
                )
            }
        }
    }
}
