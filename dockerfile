FROM asifkhazi/tomcat-run:latest
WORKDIR /opt/tomcat/webapps/
COPY ./*.war .
