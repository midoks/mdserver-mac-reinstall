#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM 		centos:centos7.1.1503
MAINTAINER  midoks <midoks@163.com>

ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo

RUN rpm --rebuilddb && yum install -y deltarpm && yum -y makecache fast

RUN rpm --rebuilddb && yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
    yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel


RUN rpm --rebuilddb && yum install -y --enablerepo=epel pwgen python-pip
RUN rpm --rebuilddb && pip install --upgrade pip


RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor


RUN wget -O /root/tdengine-master.zip https://github.com/taosdata/TDengine/archive/master.zip
RUN cd /root && unzip tdengine-master.zip
RUN cd /root/TDengine-master && mkdir build \
	&& cd build && cmake .. && cmake --build . && make install

RUN yum install -y lsof


ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 22
ENTRYPOINT ["/bin/bash", "-c" ,"/start.sh"]
