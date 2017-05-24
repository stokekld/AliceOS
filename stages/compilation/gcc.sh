#/bin/bash

NAME=gcc-6.3.0

tar xjvf $SOURCES/$NAME.tar.bz2 -C $BUILD

tar xvf $SOURCES/mpfr-3.1.5.tar.xz -C $BUILD/$NAME
tar xvf $SOURCES/gmp-6.1.2.tar.xz -C $BUILD/$NAME
tar xvf $SOURCES/mpc-1.0.3.tar.gz -C $BUILD/$NAME

mv $BUILD/$NAME/mpfr-3.1.5 $BUILD/$NAME/mpfr
mv $BUILD/$NAME/gmp-6.1.2 $BUILD/$NAME/gmp
mv $BUILD/$NAME/mpc-1.0.3 $BUILD/$NAME/mpc

cd $BUILD/$NAME

for file in gcc/config/{linux,i386/linux{,64}}.h
do
    cp -uv $file{,.orig}
    sed -e "s@/lib\(64\)\?\(32\)\?/ld@$TOOLS&@g" \
	-e "s@/usr@$TOOLS@g" $file.orig > $file
    echo "
    #undef STANDARD_STARTFILE_PREFIX_1
    #undef STANDARD_STARTFILE_PREFIX_2
    #define STANDARD_STARTFILE_PREFIX_1 \"$TOOLS/lib/\"
    #define STANDARD_STARTFILE_PREFIX_2 \"\"" >> $file
    touch $file.orig
done

case $(uname -m) in
    x86_64)
	sed -e '/m64=/s/lib64/lib/' \
	    -i.orig gcc/config/i386/t-linux64
    ;;
esac

mkdir -v build
cd build

../configure \
    --target=$LFS_TGT \
    --prefix=$TOOLS \
    --with-glibc-version=2.11 \
    --with-sysroot=$LFS \
    --with-newlib \
    --without-headers \
    --with-local-prefix=$TOOLS \
    --with-native-system-header-dir=$TOOLS/include \
    --disable-nls \
    --disable-shared \
    --disable-multilib \
    --disable-decimal-float \
    --disable-threads \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libmpx \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-libstdcxx \
    --enable-languages=c,c++

make -j4

make install

#ln -s $TOOLS/lib/crt*.o $TOOLS/lib/gcc/x86_64-lfs-linux-gnu/6.3.0/
