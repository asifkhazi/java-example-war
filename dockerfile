FROM ubuntu:latest
WORKDIR /home/ubuntu/
RUN apt update && apt install git -y
RUN git clone https://github.com/asifkhazi/tomcat-installation-ubuntu.git
RUN bash tomcat-installation-ubuntu/install-tomcat-ubuntu.sh 
COPY *.war /opt/tomcat/apache-tomcat-9.0.68/webapps/
ENTRYPOINT ["systemctl", "start", "tomcat"]
