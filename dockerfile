FROM asifkhazi/tomcat-run:latest
WORKDIR /opt/tomcat/webapps/
COPY works-with-heroku-1.0.war .
