pipeline {
    agent any
    tools{
        maven 'maven3'
        nodejs 'Nodejs'
        docker 'docker'
    }
    environment{
        REGISTRY = 'shaikh888/devopsrepo'
        //SCANNER_HOME =tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/Shaikh-Majid/swiggy-clone.git'
            }
            
        }   
        
        // stage('SonarQube Analysis') {
        //     steps {
        //         withSonarQubeEnv('SonarQube-Server') {
        //             // Run SonarQube Scanner
        //             sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectKey=myproject \
        //             -Dsonar.projectName=myproject'''
        //         }
        //     }
        // }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${REGISTRY}:v${BUILD_NUMBER} ."
                }
            }
        }
        // stage('Push Docker Image') {
        //     steps {
        //         script {
        //             withDockerRegistry(credentialsId:'DockerHub') {
        //                 sh "docker push ${REGISTRY}:v${BUILD_NUMBER}"
        //             }
        //         }
        //     }
        // }
        stage('Kubernetes deploy') {
            steps {
                script {
                   withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'Kubernetes', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                    sh "kubectl get pods"
                    sh "kubectl apply -f /var/lib/jenkins/jobs/demopipeline/workspace/Kubernetes/deployment.yml"
                    sh "kubectl apply -f /var/lib/jenkins/jobs/demopipeline/workspace/Kubernetes/service.yml"
                   }
                }
            }
        }
    }
}
