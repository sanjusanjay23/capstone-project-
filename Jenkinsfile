pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('Build') {
            steps {
                checkout scmGit(branches: [[name: '*/Dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'Github', url: 'https://github.com/sanjusanjay23/Capstone-Project-.git']])
                sh 'npm install'
                // sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                // sh 'npm run test'
                echo "Test"
            }
        }
       stage('Build Image') {
            steps { 
                sh 'docker build -t react-image .'
                sh 'docker tag react-image:latest sanjusanjay23/dev:latest'
            }    
       }
       stage('Docker login') {
            steps { 
                withCredentials([usernamePassword(credentialsId: 'Dockercred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                sh "echo $PASS | docker login -u $USER --password-stdin"
                sh 'docker push sanjusanjay23/dev:latest'
                }
            }
       }
       stage('Deploy') {
            steps {  
                script {
                   def dockerCmd = 'docker run -itd --name My-first-container -p 80:5000 sanjusanjay23/dev:latest'
                   sshagent(['sshkeypair']) {
                   sh "ssh -i serverlogin.pem ubuntu@ec2-52-36-35-221.us-west-2.compute.amazonaws.com ${dockerCmd}"
                   }
                }
            }
       }
    }
}
