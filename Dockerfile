# Tomcat7
# Pull Latest Java
FROM adoptopenjdk/openjdk8:x86_64-ubuntu-jdk8u202-b08


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
