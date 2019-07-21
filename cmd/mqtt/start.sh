#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

MOSQ_DIR=`brew info mosquitto | grep /usr/local/Cellar/mosquitto | cut -d \  -f 1 | awk 'END {print}'`

echo "$MOSQ_DIR/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf"
$MOSQ_DIR/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf &