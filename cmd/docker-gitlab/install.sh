#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
PWD_DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


DOCKERNAME=gitlab
VERSION=1.0.0
DOCKER_CON_NAME=gitlab


echo '' > $MDIR/bin/logs/reinstall/cmd_docker-php_install.log
echo 'install gitlab start'
FIND_DOCKER=`which docker`

if [ "$FIND_DOCKER" == "" ]; then
	echo "please installed docker!"
	exit 0
fi

mkdir -p $MDIR/source


docker run --detach \
--hostname gitlab.chain.cn \
--publish 8443:443 --publish 8080:80 --publish 2222:22 \
--name gitlab \
--restart always \
--volume $MDIR/source/gitlab/config:/etc/gitlab \
--volume $MDIR/source/gitlab/logs:/var/log/gitlab \
--volume $MDIR/source/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce

echo 'install gitlab end'

