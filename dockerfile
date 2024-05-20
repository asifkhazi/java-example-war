FROM asifkhazi/tomcat-run:latest
WORKDIR /opt/tomcat/webapps/
COPY /home/ubuntu/workspace/assignment-pipeline/target/works-with-heroku-1.0.war .
