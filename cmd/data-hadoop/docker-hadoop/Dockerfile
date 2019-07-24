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


RUN mkdir -p /root/hadoop
#RUN cd /root/hadoop && wget http://archive.apache.org/dist/hadoop/common/hadoop-2.8.3/hadoop-2.8.3.tar.gz

RUN ADD /Applications/mdserver/source/hadoop/hadoop-2.8.3.tar.gz /root/hadoop/
RUN cd /root/hadoop && tar -xvzf hadoop-2.8.3.tar.gz






RUN apt-get -y install supervisor
ADD supervisord.conf /etc/supervisord.conf
EXPOSE 22
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
