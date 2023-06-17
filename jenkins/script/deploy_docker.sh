#!/bin/bash

# Pindah ke direktori 
cd /home/ubuntu

# remove artifact
if [ -f "/home/ubuntu/hello.war" ]; then
    # Jika ada, hapus file webapp.war
    rm "/home/ubuntu/hello.war"
fi

# me-rename artifact
mv $(ls -t *.war | head -1) hello.war 

# Build image Docker dengan tag "tomcat:v1"
docker build -t tomcat:v1 .

# Berhenti dan hapus container Docker bernama "tomcat" jika sudah ada
docker stop hello_tomcat
docker rm hello_tomcat

# Jalankan container Docker dengan nama "hello_tomcat" pada port 8080
docker run -d --name hello_tomcat -p 8080:8080 tomcat:v1