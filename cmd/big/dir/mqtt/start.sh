#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_mqtt_start.log
echo $LOG_FILE
echo "start!" > $LOG_FILE


MOSQ_DIR=`brew info mosquitto | grep /usr/local/Cellar/mosquitto | cut -d \  -f 1 | awk 'END {print}'`

echo "$MOSQ_DIR/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf"
$MOSQ_DIR/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf &


echo "ok!"