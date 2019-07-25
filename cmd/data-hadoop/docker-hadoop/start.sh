#! /bin/bash

source /root/.bashrc
service ssh start


sed -i "s#\${JAVA_HOME}#/usr/lib/jvm/java-7-openjdk-amd64#g" /root/hadoop/hadoop-2.8.3/etc/hadoop/hadoop-env.sh



HOST=$(hostname)
echo $HOST
echo $HADOOP_CONFIG_HOME/slaves


if [ "$HOST" == "master" ]
then
	FIND_SLAVE=`grep "slave1" $HADOOP_CONFIG_HOME/slaves`
	if [ "$FIND_SLAVE" == "slave1" ]
	then
		echo "slave1 has exist"
	else
		echo "slave1" >> $HADOOP_CONFIG_HOME/slaves
		echo "\"slave1\" >> $HADOOP_CONFIG_HOME/slaves"
	fi

	FIND_SLAVE=`grep "slave2" $HADOOP_CONFIG_HOME/slaves`
	if [ "$FIND_SLAVE" == "slave2" ]
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
echo -e "172.17.0.2\\tmaster\\n172.17.0.3\\tslave1\\n172.17.0.4\\tslave2" > /etc/hosts


# FIND_HADOOP=`ps -ef|grep java | grep -v grep | awk '{print $2}'`
# echo "FIND_HADOOP:$FIND_HADOOP"
# if [ "$FIND_HADOOP" == "" ];then
# bash /root/hadoop/hadoop-2.8.3/sbin/start-all.sh
# fi


FIND_SUPER=`ps -ef|grep supervisord | grep -v grep | awk '{print $2}'`
if [ "$FIND_SUPER" == "" ];then
/usr/bin/supervisord -n -c /etc/supervisord.conf
fi

