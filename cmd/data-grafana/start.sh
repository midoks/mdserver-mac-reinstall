#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_data-grafana_start.log
echo "start!" > $LOG_FILE

brew services start grafana

echo "\r\n"
echo "info:"
echo "user:admin"
echo "password:admin"

echo "ok!"