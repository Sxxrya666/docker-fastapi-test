pipeline { 
    agent any

    stages { 
        stage('build image') { 
            steps { 
                echo "[build-stage-log] STARTED BUILDING THE IMAGE....."
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
                echo "[build-stage-log] FINISHED BUILDING and PUSHED THE IMAGE SUCCESSFULLY!!"
            }
        }
        
        stage('deploy') { 
            when {
                branch 'main'
            }
            steps { 
                echo "current branch is ---> ${env.BRANCH_NAME}"
                echo "Preparing to deploy...."
                sh 'docker compose up -d'
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
