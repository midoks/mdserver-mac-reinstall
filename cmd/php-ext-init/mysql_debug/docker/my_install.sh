#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

cd /tmp/mysql

cmake . -DWITH_DEBUG=1 \
-DMYSQL_DATADIR=/usr/local/mysql56/data \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql56 \
-DSYSCONFDIR=/etc \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock

make && make install