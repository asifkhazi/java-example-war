FROM asifkhazi/tomcat-run:latest
WORKDIR /opt/tomcat/webapps/
COPY /home/ubuntu/workspace/assignment-pipeline/target/*.war .
