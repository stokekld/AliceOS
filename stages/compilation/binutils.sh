#/bin/bash

NAME=binutils-2.27

tar xjvf $SOURCES/$NAME.tar.bz2 -C $BUILD

cd $BUILD/$NAME

mkdir build
cd build

../configure --prefix=$TOOLS \
    --with-sysroot=$LFS \
    --with-lib-path=$TOOLS/lib \
    --target=$LFS_TGT \
    --disable-nls \
    --disable-werror

make

make install
