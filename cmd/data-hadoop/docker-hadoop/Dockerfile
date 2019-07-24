#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM 		ubuntu:18.04
MAINTAINER  midoks <midoks@163.com>


ADD sources.list /etc/apt/sources.list
RUN apt-get update


RUN apt-get -y install net-tools
RUN apt-get -y install iputils-ping
RUN apt-get -y install vim
RUN apt-get -y install python
RUN apt-get -y install wget
RUN apt-get -y install supervisor

RUN mkdir -p /root/hadoop
ADD hadoop-2.8.3.tar.gz /root/hadoop/
#RUN cd /root/hadoop && tar -xvzf hadoop-2.8.3.tar.gz

RUN apt -y install default-jdk
#RUN apt install openjdk-8-jdk


RUN echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> /root/.bashrc
RUN echo "export HADOOP_HOME=/root/hadoop/hadoop-2.8.0" >> /root/.bashrc
RUN echo "export HADOOP_CONFIG_HOME=$HADOOP_HOME/etc/hadoop" >> /root/.bashrc
RUN echo "export PATH=$PATH:$HADOOP_HOME/bin" >>/root/.bashrc
RUN echo "export PATH=$PATH:$HADOOP_HOME/sbin" >> /root/.bashrc



ADD supervisord.conf /etc/supervisord.conf
EXPOSE 22
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
