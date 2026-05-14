# Written by vmunix. If something goes wrong, yell at me.

KERNEL=./386linux
# Where the kernel is located

ROOT=../root
# Where the rootfs for the i386 system is located

CROSS=../cross
# Where the tools for cross compiling to the i386 system is located

MUSL_CROSS=cross

# C flags for compiling musl
CFLAGS=-m32 -march=i386 -mtune=i386 -fcf-protection=none -fno-stack-protector -fomit-frame-pointer -mno-mmx -mno-sse -fno-pic -Os

# C compiler for compiling musl
CC=cc

# Number of cpu cores
Jflag=-j2

# ar
AR=ar

# ranlib
RANLIB=ranlib

help:
	@echo "You should probably read the wiki."
	@echo "FIXME"

kernel-env:
	cd $(KERNEL) && make headers_install ARCH=i386 INSTALL_HDR_PATH=$(CROSS)

musl:
	cd musl-1.2.5 && CC=$(CC) CFLAGS='$(CFLAGS) -I../cross/include' ./configure --target=i386 --prefix='../cross'
	cd musl-1.2.5 && AR=$(AR) RANLIB=$(RANLIB) make $(Jflag)
	@echo "If it just failed to build, then you might have to copy the system ar to i386-ar, and the same with ranlib."
	cd musl-1.2.5 && make install

busybox:
	cd busybox-1.38.0 && make $(Jflag)
