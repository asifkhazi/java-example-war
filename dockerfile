FROM fabric8/tomcat-9:latest
WORKDIR /opt/tomcat/webapps/
COPY ./*.war .
CMD ["systemctl", "start", "tomcat"]
