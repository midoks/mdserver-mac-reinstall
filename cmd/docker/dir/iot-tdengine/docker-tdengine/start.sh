#! /bin/bash

source /root/.bashrc



taosd -c /root/TDengine-master/build/test/cfg &


FIND_SUPER=`ps -ef|grep supervisord | grep -v grep | awk '{print $2}'`
if [ "$FIND_SUPER" == "" ];then
/usr/bin/supervisord -n -c /etc/supervisord.conf
fi
