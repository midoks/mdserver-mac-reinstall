#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=gitlab
VERSION=1.0.0
DOCKER_CON_NAME=gitlab

echo '' > $MDIR/bin/logs/reinstall/cmd_docker-gitlab_start.log






echo "docker run -v docker run --detach \
--hostname gitlab.chain.cn \
--publish 8443:443 --publish 8080:80 --publish 2222:22 \
--name gitlab \
--restart always \
--volume $MDIR/source/docker-gitlab/config:/etc/gitlab \
--volume $MDIR/source/docker-gitlab/logs:/var/log/gitlab \
--volume $MDIR/source/docker-gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce"


docker run --detach \
--hostname gitlab.chain.cn \
--publish 8443:443 --publish 8080:80 --publish 2222:22 \
--name gitlab \
--restart always \
--volume $MDIR/source/docker-gitlab/config:/etc/gitlab \
--volume $MDIR/source/docker-gitlab/logs:/var/log/gitlab \
--volume $MDIR/source/docker-gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce

SIGN=`docker ps | grep ${DOCKER_CON_NAME} | awk '{print $1}'`

echo "\r\n"
echo "into master shell:"
echo "docker exec -it $SIGN /bin/bash\r\n"
# ------------------  master end -----------------------


echo "ok!"