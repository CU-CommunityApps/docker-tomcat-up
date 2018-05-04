# Tomcat7

# Pull base image.
FROM 078742956215.dkr.ecr.us-east-1.amazonaws.com/kuali/java8-kfs

# File Author / Maintainer
MAINTAINER Chad Bower

COPY lib/ /usr/share/tomcat7/lib
ADD appdynamics.tar /usr/share

RUN \
  apt-get update && \
  apt-get install -y tomcat7 && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R tomcat7:tomcat7 /usr/share/appdynamics

EXPOSE 8080
