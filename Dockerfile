# Tomcat7

# Pull base image.
FROM dtr.cucloud.net/cs/java8

# File Author / Maintainer
MAINTAINER Shawn Bower

COPY lib/ /usr/share/tomcat7/lib
ADD appdynamics.tar /usr/share

RUN \
  apt-get update && \
  apt-get install -y tomcat7 && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R tomcat7:tomcat7 /usr/share/appdynamics

COPY tomcat7 /etc/default
RUN /bin/chown tomcat7:tomcat7 /etc/default/tomcat7 

EXPOSE 8080
