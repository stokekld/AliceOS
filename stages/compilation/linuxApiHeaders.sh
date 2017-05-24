#/bin/bash

NAME=linux-4.9.9

tar xvf $SOURCES/$NAME.tar.xz -C $BUILD

cd $BUILD/$NAME

make mrproper

make INSTALL_HDR_PATH=dest headers_install

cp -rv dest/include/* $TOOLS/include
