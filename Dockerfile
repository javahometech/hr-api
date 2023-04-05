FROM openjdk:17-alpine
WORKDIR /opt/
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz .
RUN tar xf apache-tomcat-9.0.73.tar.gz
RUN mv apache-tomcat-9.0.73 tomcat9
EXPOSE 8080
COPY target/hr-api*.war /opt/tomcat9/webapps/hr-api.war
CMD ["/opt/tomcat9/bin/catalina.sh","run"]
