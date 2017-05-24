#/bin/bash

NAME=glibc-2.25

tar xvf $SOURCES/$NAME.tar.xz -C $BUILD

cd $BUILD/$NAME

mkdir -v build

cd build

../configure \
    --prefix=$TOOLS \
    --host=$LFS_TGT \
    --build=$(../scripts/config.guess) \
    --enable-kernel=2.6.32 \
    --with-headers=$TOOLS/include \
    libc_cv_forced_unwind=yes \
    libc_cv_c_cleanup=yes

make -j4

make install


