#! /bin/bash

service ssh start

echo "111"




/usr/bin/supervisord -n -c /etc/supervisord.conf
