# Tomcat7
# Pull Latest Java
FROM adoptopenjdk/openjdk8:latest


# File Author / Maintainer
MAINTAINER Chad Bower
RUN apt-get update 

COPY lib/ /usr/share/tomcat7/lib
RUN echo "\ndeb http://us.archive.ubuntu.com/ubuntu/ xenial main\ndeb http://us.archive.ubuntu.com/ubuntu/ xenial universe" >> /etc/apt/sources.list 

RUN \
  apt-get update && \
  apt-get install -y tomcat7 && \
  rm -rf /var/lib/apt/lists/* && 


EXPOSE 8080
