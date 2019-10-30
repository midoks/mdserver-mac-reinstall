#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

echo "start"

export MYSQL_DEBUG=d:t:O,/tmp/client.trace


/usr/bin/supervisord -n -c /etc/supervisord.conf
