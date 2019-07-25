#! /bin/bash

service ssh start
source ~/.bashrc


sed -i "s#\${JAVA_HOME}#/usr/lib/jvm/java-7-openjdk-amd64#g" /root/hadoop/hadoop-2.8.3/etc/hadoop/hadoop-env.sh



if [ $(hostname) == "master" ]
then
	if [ `grep "slave1" $HADOOP_CONFIG_HOME/slaves` ]
	then
		echo "slave1 has exist"
	else
		echo "slave1" >> $HADOOP_CONFIG_HOME/slaves
	fi

	if [ `grep "slave2" $HADOOP_CONFIG_HOME/slaves` ]
	then
		echo "slave2 has exist"
	else	
		echo "slave2" >> $HADOOP_CONFIG_HOME/slaves
	fi
fi

cp /etc/hosts /etc/hosts.tmp
sed -i '$d' /etc/hosts.tmp
cat /etc/hosts.tmp > /etc/hosts
rm /etc/hosts.tmp

#这里的ip地址用你自己的，用ifconfig查看
echo -e "172.17.0.2\\tmaster\\n172.17.0.3\\tslave1\\n172.17.0.4\\tslave2" >> /etc/hosts


bash /root/hadoop/hadoop-2.8.3/sbin/start-all.sh
# bash /root/hadoop/hadoop-2.8.3/sbin/top-all.sh 

/usr/bin/supervisord -n -c /etc/supervisord.conf
