pipeline {
	agent {label "new-node"}
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
				sh 'docker build -t asifkhazi/example-img:${BUILD_ID} ./dockerfile'
			}
		}
		stage ('Push image to artifactory') {
			steps {
				sh 'docker push asifkhazi/example-img:${BUILD_ID}'
				sh 'docker image prune -a'
				sh 'docker login -u ${Docker_Cred_USR} -p ${Docker_Cred_PSW}'
				sh 'docker push asifkhazi/example-img:${BUILD_ID}'
			}
		}
		stage ('Deploy') {
			steps {
				sh 'docker run -itd --name cont-${BUILD_ID} -p 8080:8080 asifkhazi/example-img:${BUILD_ID}'
			}
		}
		
	}
}
