#!/usr/bin/env bash
export CROSS=$PWD/i486-linux-musl-cross
export TARGET=i486-linux-musl

export PATH="$CROSS/bin:$PATH"

export CC="$TARGET-gcc"
export CXX="$TARGET-g++"
export AR="$TARGET-ar"
export RANLIB="$TARGET-ranlib"
export STRIP="$TARGET-strip"

export SYSROOT=$PWD/root
export MUSLROOT=$PWD/cross

export CFLAGS="-march=i386 -mtune=i386 -static -I$MUSLROOT/include"

export LDFLAGS="-L$MUSLROOT/lib"
