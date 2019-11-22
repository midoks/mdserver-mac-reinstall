#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_mqtt_install.log
echo "-----------" > $LOG_FILE

echo 'install mosquitto start'


if [ ! -d /usr/local/Cellar/mosquitto ];then
	brew install mosquitto
fi

echo 'install mosquitto end'