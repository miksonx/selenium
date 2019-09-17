FROM openjdk:8-jdk-alpine
#FROM tomcat:8.0.30-jre8
#RUN rm -rf /usr/local/tomcat/webapps/*
#COPY target/myassistant-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
#COPY docker/docker-tomcat-context.xml /usr/local/tomcat/conf/context.xml
#COPY src/main/webapp/WEB-INF/web.xml /usr/local/tomcat/conf/web.xml


ADD target/myassistant-0.0.1-SNAPSHOT.war /app/myassistant-0.0.1-SNAPSHOT.war
CMD java -jar /app/myassistant-0.0.1-SNAPSHOT.war
EXPOSE 8080