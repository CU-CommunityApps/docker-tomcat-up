# Tomcat7
# Pull Latest Java
FROM adoptopenjdk/openjdk8:latest


# File Author / Maintainer
MAINTAINER Chad Bower
RUN apt-get update 

COPY lib/ /usr/share/tomcat7/lib
RUN cp /etc/apt/sources.list  /etc/apt/sources.list-bak
RUN echo "\ndeb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ xenial universe\ndeb-src http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ xenial universe\ndeb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ xenial-updates universe\ndeb-src http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ xenial-updates universe\ndeb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse\ndeb-src http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse\ndeb http://security.ubuntu.com/ubuntu xenial-security universe\ndeb-src http://security.ubuntu.com/ubuntu xenial-security universe\n" >> /etc/apt/sources.list 

RUN \
mkdir -p /infra/work && \
mkdir -p /infra/conf/keystores && \
mkdir -p /infra/logs/tomcat && 


RUN \
  apt-get update && \
  apt-get install -y tomcat7 && \
  chown -R tomcat7:tcadm /infra && \
  chmod -R 755 /infra && \
  rm -rf /var/lib/apt/lists/* 

RUN rm /etc/apt/sources.list
RUN mv /etc/apt/sources.list-bak /etc/apt/sources.list

EXPOSE 8080
