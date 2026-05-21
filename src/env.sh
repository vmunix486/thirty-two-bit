#!/usr/bin/env bash
export CROSS=$PWD/i486-linux-musl-cross
# export TARGET=i486-linux-musl

export PATH="$CROSS/bin:$PATH"

export CC="i486-linux-musl-gcc"
export CXX="i486-linux-musl-g++"
export AR="i486-linux-musl-ar"
export RANLIB="i486-linux-musl-ranlib"
export STRIP="i486-linux-musl-strip"

export SYSROOT=$PWD/root
export MUSLROOT=$PWD/cross

export CFLAGS="-march=i386 -mtune=i386 -static -I$MUSLROOT/include"

export LDFLAGS="-L$MUSLROOT/lib"
