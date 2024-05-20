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
				sh 'mvn clean install'
				sh 'docker login -u ${Docker_Cred_USR} -p ${Docker_Cred_PSW}'
				sh 'docker build -t asifkhazi/tomcat-run:${BUILD_ID} -f dockerfile .'
			}
		}
		stage ('Push image to artifactory') {
			steps {
				sh 'docker push asifkhazi/tomcat-run:${BUILD_ID}'
			}
		}
		stage ('Deploy') {
			steps {
				sh 'docker run -itd --name cont-${BUILD_ID} -p 8080:8080 asifkhazi/tomcat-run:${BUILD_ID}'
			}
		}
		
	}
}
