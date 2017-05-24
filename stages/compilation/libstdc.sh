#/bin/bash


NAME=libstdc
PACKAGE=gcc-6.3.0

mkdir $BUILD/$NAME

tar xjvf $SOURCES/$PACKAGE.tar.bz2 -C $BUILD/$NAME

cd $BUILD/$NAME/$PACKAGE

mkdir -v build
cd build

../libstdc++-v3/configure \
    --host=$LFS_TGT \
    --prefix=$TOOLS \
    --disable-multilib \
    --disable-nls \
    --disable-libstdcxx-threads \
    --disable-libstdcxx-pch \
    --with-gxx-include-dir=$TOOLS/$LFS_TGT/include/c++/6.3.0

make -j4

make install
