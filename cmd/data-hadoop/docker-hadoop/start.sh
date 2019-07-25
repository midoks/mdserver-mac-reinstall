#! /bin/bash

service ssh start
source ~/.bashrc


sed -i "s#\${JAVA_HOME}#/usr/lib/jvm/java-7-openjdk-amd64#g" /root/hadoop/hadoop-2.8.3/etc/hadoop/hadoop-env.sh



bash /root/hadoop/hadoop-2.8.3/sbin/start-all.sh
# bash /root/hadoop/hadoop-2.8.3/sbin/top-all.sh 

/usr/bin/supervisord -n -c /etc/supervisord.conf
