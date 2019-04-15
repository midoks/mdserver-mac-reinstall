#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")


# redis start #
#cd $DIR/cmd/redis && sh install.sh
# redis start #

# mongodb start #
cd $DIR/cmd/mongodb && sh install.sh
# mongodb start #


# mysql start #
cd $DIR/cmd/mysql && sh install.sh
# mysql start #


# openresty start #
cd $DIR/cmd/openresty && sh install.sh
# openresty start #


# memcached start #
cd $DIR/cmd/memcached && sh install.sh
# memcached start #

# php start #
sh install_all_php.sh
# php end #

