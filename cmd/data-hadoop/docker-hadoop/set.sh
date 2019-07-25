#! /bin/bash

source /root/.bashrc

if [ $(hostname) == "master" ]
then
	if [ `grep "slave1" $HADOOP_CONFIG_HOME/slaves` ]
	then
		echo "slave1 has exist"
	else
		echo "slave1" >> $HADOOP_CONFIG_HOME/slaves
		echo "\"slave1\" >> $HADOOP_CONFIG_HOME/slaves"
	fi

	if [ `grep "slave2" $HADOOP_CONFIG_HOME/slaves` ]
	then
		echo "slave2 has exist"

	else	
		echo "slave2" >> $HADOOP_CONFIG_HOME/slaves
		echo "\"slave2\" >> $HADOOP_CONFIG_HOME/slaves"
	fi
fi


cp /etc/hosts /etc/hosts.tmp
sed -i '$d' /etc/hosts.tmp
cat /etc/hosts.tmp > /etc/hosts
rm /etc/hosts.tmp

#这里的ip地址用你自己的，用ifconfig查看
echo "172.17.0.2\\tmaster\\n172.17.0.3\\tslave1\\n172.17.0.4\\tslave2" > /etc/hosts
