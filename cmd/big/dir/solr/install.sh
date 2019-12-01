#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


VERSION=8.3.0
mkdir -p $MDIR/source/solr
SOLR_DIR=$MDIR/source/solr


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_solr_install.log
echo "-----------" > $LOG_FILE
echo 'install solr start'

if [ ! -f $SOLR_DIR/solr-${VERSION}.tgz ]; then
	wget -O $SOLR_DIR/solr-${VERSION}.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/lucene/solr/${VERSION}/solr-${VERSION}.tgz
fi


if [ ! -d $SOLR_DIR/solr-${VERSION} ];then
	cd $SOLR_DIR && tar -zxvf solr-${VERSION}.tgz
fi

cd $SOLR_DIR/solr-${VERSION}

echo 'install solr end'
echo "-----------" >> $LOG_FILE