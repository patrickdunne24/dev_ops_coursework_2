
// Jenkinsfile (Declarative Pipeline)

pipeline {
	agent any
	environment { 
		DOCKERHUB_CREDS = CREDENTIALS('Docker') 
	}
	
	stages{
		stage('Docker Image Build') {
			steps {
				echo 'Building Docker Image...'
				sh 'docker build --tag patrickdunne24/cw2-server:1.0 .'
				echo 'Docker Image built succesfully!'
			}	
		}
		
		stages(Test Docker Image') {
			steps {
				echo 'Testing Docker Image...'
				sh '''
					docker image inspect patrickdunne24/cw2-server:1.0
					docker run --name test-container -p 8081:8080 -d patrickdunne24/cw2-server:1.0
					docker ps
					docker stop test-container
					docker rm test-container

				'''			
			}

		}

		stage('DockerHub Login') {
			steps {	
				sh 'echo $DOCKERHUB_CREDS_PSW | DOCKER LOGIN -U $DOCKERHUB_CREDS_USR --password-stdin'
		
			}
		}

		stage('DockerHub Image Push') {
			steps {
				sh 'docker push patrickdunne24/cw2-server:1.0'
			}
		}
		
		stage('Deploy') {
			steps {
				sshagent(['my-ssh-key']) {
					 sh 'scp  deploy-and-expose-dockerhub.yml ubuntu@ec2-54-144-65-211.compute-1.amazonaws.com:/home/ubuntu'
				}
			}
		}
	}
}		
