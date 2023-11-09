#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_grafana_start.log
echo "start!" > $LOG_FILE

brew services start grafana



echo "\r\n"
echo "http://127.0.0.1:3000\n"
echo "info:"
echo "user:admin"
echo "password:admin"

echo "ok!"