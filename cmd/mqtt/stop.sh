#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_mqtt_start.log
echo "stop!" > $LOG_FILE

ps -ef | grep mosquitto | grep -v grep | awk -F ' ' '{print $2}' | xargs kill


echo "ok!"