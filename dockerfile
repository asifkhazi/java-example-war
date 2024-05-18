FROM ubuntu:latest
WORKDIR /workspace/
RUN mkdir /opt/tomcat && wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz && tar -xzvf apache-tomcat-9.0.89.tar.gz /opt/tomcat 
RUN rm -f /opt/tomcat/bin/apache-tomcat-9.0.89.tar.gz
COPY ./target/*.war /opt/tomcat/webapps
EXPOSE: 8080
ENTRYPOINT ["bash", "/opt/tomcat/bin/startup.sh"]
