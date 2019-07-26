#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# 简单的HTTP压测工具

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

echo '' > $MDIR/bin/logs/reinstall/cmd_wrk_install.log

echo 'install wrk start'

if [ ! -d /usr/local/Cellar/wrk ];then
	brew install wrk
fi

echo "url:"
echo "https://github.com/wg/wrk\r\n"
echo "exp:"
echo "wrk -t12 -c400 -d30s http://127.0.0.1:8080/index.html"

echo 'install wrk end'