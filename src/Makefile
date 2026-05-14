# Written by vmunix. If something goes wrong, yell at me.

# C flags for compiling musl
CFLAGS=-m32 -march=i386 -mtune=i386 -fcf-protection=none -fno-stack-protector -fomit-frame-pointer -mno-mmx -mno-sse -fno-pic -Os

# C compiler for compiling musl
CC=cc

# ar
AR=ar

# ranlib
RANLIB=ranlib

all:
	@echo "Getting the headers from the kernel"
	@$(MAKE) kernel-env > /dev/null 2>&1
	@echo "Done getting the headers"
	
	@echo "Compiling musl libc"
	@$(MAKE) musl > /dev/null 2>&1
	@echo "Done compiling musl libc"
	
	@echo "Compiling busybox"
	@$(MAKE) busybox > /dev/null 2>&1
	@echo "Done compiling busybox"

kernel-env:
	cd 386linux && $(MAKE) headers_install ARCH=i386 INSTALL_HDR_PATH=../cross

musl:
	cd musl-1.2.5 && CC=$(CC) CFLAGS='$(CFLAGS) -I../cross/include' ./configure --target=i386 --prefix='../cross'
	cd musl-1.2.5 && AR=$(AR) RANLIB=$(RANLIB) $(MAKE)
	@echo "If it just failed to build, then you might have to copy the system ar to i386-ar, and the same with ranlib."
	cd musl-1.2.5 && $(MAKE) install

busybox:
	cd busybox-1.38.0 && $(MAKE)

clean:
	cd 386linux/ && $(MAKE) clean
	cd musl-1.2.5/ && $(MAKE) clean
	cd busybox-1.38.0/ && $(MAKE) clean
	rm -rv cross/ root/
