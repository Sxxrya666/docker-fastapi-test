pipeline { 
    agent any

    stages { 
        stage('build image') { 
            steps { 
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
        
        // stage('deploy') { 
        //     echo "Preparing to deploy...."
        // }
    }
}
