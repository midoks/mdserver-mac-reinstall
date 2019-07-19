#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

PHP_M_VER=$1

USER=$(who | sed -n "1,1p" |awk '{print $1}')
# echo `who`
echo 'unload:'$USER

# echo /Users/$USER/.bash_profile
sed -i '_bak' "/#mdserver-mac loadenv/d"  /Users/$USER/.bash_profile
# sed -i '_bak' '/^$/N;/^\n$/D' /Users/$USER/.bash_profile

source /Users/$USER/.bash_profile