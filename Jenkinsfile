
pipeline{
    agent any
    environment{
       DOCKERHUB_CREDENTIALS = credentials('dockerhub-ID')
    }
    
    stages{
        stage('checkscm'){
          steps{
            checkout([$class: 'GitSCM', branches:[[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubtoken', url: 'https://github.com/sanjusanjay23/capstone-project-.git']]])
          }
    
        }
        
        stage('build'){
          steps{
              
              echo "building the application"
              sh "chmod +x build.sh" 
              sh('./build.sh')
              sh 'npx browserslist@latest --update-db'  // Add this line to update caniuse-lite
          }
       }
    
       stage('push'){
         steps{
             script{
                 echo "pushing the application"
                 sh "chmod +x deploy.sh"
                 sh('./deploy.sh')       
             } 
         } 
                    
       } 
       stage('deploy'){
          steps{
             script {
                   def dockerCmd = 'docker run -itd --name my-reactapp -p 80:80 sanjusanjay23/dev:latest'
                   sshagent(['sshkey']) {
                      sh "ssh -i serverlogin.pem ubuntu@ec2-35-86-174-110.us-west-2.compute.amazonaws.com ${dockerCmd}"
                   }
             }
         }    
       }
    }
    post{
        success{

             emailext body: '  successfully completed my capstone project', subject: 'successfully build', to: 'sanjay23gokul@gmail.com'   

        }
    }   
    
}
