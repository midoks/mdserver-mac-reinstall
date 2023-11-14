#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=mongo
LIBV=1.6.16

APPLE_SDK=/Library/Developer/CommandLineTools/SDKs
APP_SDK_DIR=`ls $APPLE_SDK | grep sdk | cut -d \  -f 1 | awk 'END {print}'`
ABS_PATH_SDK=${APPLE_SDK}/${APP_SDK_DIR}

# export PATH=$PATH:$ABS_PATH_SDK

export LDFLAGS="-L${ABS_PATH_SDK}/usr/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/binutils/include"

# export ARCHFLAGS="-arch arm"
export CFLAGS="-arch arm64"
export CPPFLAGS="-I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
# export CPPFLAGS="-I${ABS_PATH_SDK}/usr/include"
# echo 
# exit 0


# /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include

CONFIG_OPTION="--enable-mongo"

FIND="mongo.debug"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

