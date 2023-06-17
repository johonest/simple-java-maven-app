From tomcat:latest
LABEL maintainer="Budi Yohanes"
COPY  ./hello.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]