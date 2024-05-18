pipeline {
	agent any
	environment {
		Docker_Cred=credentials('Docker_cred')
	}
	stages {
		stage ('SCM checkout') [
			steps {
				git branch:'main', url:'https://github.com/asifkhazi/java-example-war.git'
			}
		}
		stage ('Build and Create docker image') {
			steps {
				sh 'mvn clean install'
				sh 'docker build -t asifkhazi/example-img:${BUILD_ID} ./Dockerfile'
			}
		}
		stage ('Push image to artifactory') {
			steps {
				sh 'docker push asifkhazi/example-img:${BUILD_ID}'
				sh 'docker images prune -a'
			}
		}
		stage ('Push image to artifactory') {
			steps {
				sh 'docker run -itd --name cont${BUILD_ID} -p 80:80 asifkhazi/example-img:${BUILD_ID}'
			}
		}
		
	}
}
