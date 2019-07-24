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
RUN apt-get -y install ssh
RUN service ssh start

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_dsa
RUN cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys


RUN echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> /root/.bashrc
RUN echo "export HADOOP_HOME=/root/hadoop/hadoop-2.8.3" >> /root/.bashrc
RUN echo "export HADOOP_CONFIG_HOME=\$HADOOP_HOME/etc/hadoop" >> /root/.bashrc
RUN echo "export PATH=\$PATH:\$HADOOP_HOME/bin" >>/root/.bashrc
RUN echo "export PATH=\$PATH:\$HADOOP_HOME/sbin" >> /root/.bashrc

# file
RUN cd /root/hadoop/hadoop-2.8.3 && mkdir tmp
RUN cd /root/hadoop/hadoop-2.8.3 && mkdir namenode
RUN cd /root/hadoop/hadoop-2.8.3 && mkdir datanode

# configure file
ADD conf/core-site.xml /root/hadoop/hadoop-2.8.3/etc/hadoop
ADD conf/hdfs-site.xml /root/hadoop/hadoop-2.8.3/etc/hadoop
ADD conf/mapred-site.xml /root/hadoop/hadoop-2.8.3/etc/hadoop


# format file
#RUN echo $JAVA_HOME
#RUN /root/hadoop/hadoop-2.8.3/bin/hadoop namenode -format


ADD supervisord.conf /etc/supervisord.conf
EXPOSE 22
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
