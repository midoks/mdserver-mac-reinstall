#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		centos:centos7.1.1503
#FROM 		ansible/centos7-ansible
MAINTAINER  midoks <midoks@163.com>

ENV TZ "Asia/Shanghai"
#ENV LC_ALL "en_US.UTF-8"
ENV TERM xterm


ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo


RUN rpm --rebuilddb && yum install -y deltarpm && yum -y makecache fast

RUN rpm --rebuilddb && yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
    yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel


RUN rpm --rebuilddb && yum install -y --enablerepo=epel pwgen python-pip
RUN pip install --upgrade pip
RUN yum install -y strace


RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor

RUN yum install -y cmake
RUN mkdir -p /tmp/mysql
ADD ./ /tmp/mysql

ADD my_install.sh /
ADD start.sh /

EXPOSE 22

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
