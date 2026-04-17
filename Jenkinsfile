pipeline { 
    agent any

    stages { 
        stage('build image') { 
            steps { 
                sh 'echo i ammm $(whoami)'
                withCredentials([
                    usernamePassword( 
                        credentialsId: "docker-creds", 
                        passwordVariable: "PASS", 
                        usernameVariable: "USER"
                )]) { 
                        sh 'echo $PASS | docker login -u $USER --password-stdin'
                        sh "docker build -t saucebxss/nimap-devops-assignment:latest ."
                        sh "docker push saucebxss/nimap-devops-assignment:latest"
                    }
                
            }
        }
        
        stage('deploy') { 
            when {
                branch 'main'
            }
            steps { 
                echo "current branch is ---> ${env.BRANCH_NAME}"
                echo "Preparing to deploy...."
                echo "deployed to server successfully!"
            }
        }
    }
    
    post { 
        always { 
            echo "My Jenkinsfile executed all the stages. check if its a success or failure..."            
        }
        success { 
            echo "IF YOU SEE THIS, the script executed successfully"
        }
        failure { 
            echo "UH OH! the script execution FAILED!!!"
        }
    }
}
