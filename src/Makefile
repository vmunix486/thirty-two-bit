# Written by vmunix. If something goes wrong, yell at me.

# C flags for compiling musl
CFLAGS=-m32 -march=i386 -mtune=i386 -fcf-protection=none -fno-stack-protector -fomit-frame-pointer -mno-mmx -mno-sse -fno-pic -O3

# C compiler for compiling musl
CC=cc

# ar
AR=ar

# ranlib
RANLIB=ranlib

all:
	@echo " "
	@echo "========================="
	@echo " "      

	@echo "Getting the headers from the kernel..."
	@$(MAKE) kernel-env > /dev/null 2>&1
	@echo "Done getting headers"
	
	@echo " "
	@echo "========================="
	@echo " "	

	@echo "Compiling musl libc..."
	@$(MAKE) musl > /dev/null 2>&1
	@echo "Done compiling musl libc"
	
	@echo " "
	@echo "========================="
	@echo " "
	
	@echo "Untarring musl cross compiler..."
	@$(MAKE) musl-cross > /dev/null 2>&1
	@echo "Done untarring musl cross compiler"

	@echo " "
	@echo "========================="
	@echo " "

	@echo "Compiling busybox..."
	@$(MAKE) busybox > /dev/null 2>&1
	@echo "Done compiling busybox"

	@echo " "
	@echo "========================="
	@echo " "       

	@echo "Compiling kernel..."
	@$(MAKE) kernel > /dev/null 2>&1
	@echo "Done compiling kernel"

	@echo " "
	@echo "========================="
	@echo " "       

	@echo "Installing kernel to root..."
	@$(MAKE) inst-kernel > /dev/null 2>&1
	@echo "Done installing kernel"
	
	@echo " "
	@echo "========================="
	@echo " "

	@echo "Installing configuration files..."
	@$(MAKE) copy-etc > /dev/null 2>&1
	@echo "Done installing configuration files"

	@echo " "
	@echo "========================="
	@echo " "       

	@echo "Making directories..."
	@$(MAKE) mkdirs > /dev/null 2>&1
	@echo "Done making dirs"

	@echo " "
	@echo "========================"
	@echo " "

	@echo "Making nods..."
	@$(MAKE) mknod
	@echo "Done making nods"

	@echo " "
	@echo "========================"
	@echo " "

	@echo "Setting permissions..."
	@$(MAKE) perms > /dev/null 2>&1
	@echo "Done setting permissions"

	@echo " "
	@echo "======================="
	@echo " "
	

kernel-env:
	cd 386linux && $(MAKE) headers_install ARCH=i386 INSTALL_HDR_PATH=../cross

musl:	
	cd musl-1.2.5 && CC=$(CC) CFLAGS='$(CFLAGS) -I../cross/include' ./configure --target=i386 --prefix='../cross'
	cd musl-1.2.5 && AR=$(AR) RANLIB=$(RANLIB) $(MAKE)
	@echo "If it just failed to build, then you might have to copy the system ar to i386-ar, and the same with ranlib."
	cd musl-1.2.5 && $(MAKE) install

busybox:
	cd busybox-1.38.0 && $(MAKE)
	cd busybox-1.38.0 && $(MAKE) install

busybox-clean:
	cd busybox-1.38.0 && $(MAKE) clean

musl-cross:
	tar xvf tars/i486-linux-musl-cross.tar.xz

kernel:
	cd 386linux && $(MAKE) ARCH=i386 bzImage

inst-kernel:
	mkdir root/boot
	cp 386linux/arch/x86/boot/bzImage root/boot/bzImage

copy-etc:
	cp -rv ttb/* root/

mkdirs:
	mkdir -pv root/dev root/proc root/sys root/tmp root/home root/root

mknod:
	sudo mknod root/dev/console c 5 1
	sudo mknod root/dev/null c 1 3

perms:
	sudo chmod +x root/etc/inittab
	sudo chmod +x root/etc/init.d/rc
	sudo chmod +x root/usr/bin/slirp-netstart
	

clean:
	cd 386linux/ && $(MAKE) clean
	cd musl-1.2.5/ && $(MAKE) clean
	cd busybox-1.38.0/ && $(MAKE) clean
	sudo rm -rfv cross/ root/ i486-linux-musl-cross/ extapps/*
	
