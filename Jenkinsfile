pipeline {
	agent {label "new-node"}
	environment {
		Docker_Cred=credentials('Docker_Cred')
	}
	stages {
		stage ('SCM checkout') {
			steps {
				git branch:'main', url:'https://github.com/asifkhazi/java-example-war.git'
			}
		}
		stage ('Build and Create docker image') {
			steps {
				sh 'docker build -t ${Docker_Cred_USR}/tomcat:${BUILD_ID} -f Dockerfile1 .'
			}
		}
		stage ('Push image to artifactory') {
			steps {
				sh 'docker login -u ${Docker_Cred_USR} -p ${Docker_Cred_PSW}'
				sh 'docker push ${Docker_Cred_USR}/tomcat:${BUILD_ID}'
			}
		}
		stage ('Deploy') {
			steps {
				sh 'docker run -itd --name cont-${BUILD_ID} -p 8080:8080 ${Docker_Cred_USR}/tomcat:${BUILD_ID}'
			}
		}
		
	}
}
