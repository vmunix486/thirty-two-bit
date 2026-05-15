bash:
	git clone git://git.sv.gnu.org/bash.git --depth=1
	cd bash && CFLAGS_FOR_BUILD="-std=gnu89" CC=$(CC) CFLAGS="$(CFLAGS) -std=gnu89 -fno-pie" LDFLAGS="$(LDFLAGS) -no-pie" AR=$(AR) RANLIB=$(RANLIB) STRIP=$(STRIP) ./configure --host=i486-linux-musl --build=x86_64-pc-linux-gnu --prefix=/usr --without-bash-malloc bash_cv_getcwd_malloc=yes bash_cv_func_sigsetjmp=present bash_cv_job_control_missing=no bash_cv_sys_named_pipes_present=yes bash_cv_func_strcoll_broken=no --disable-readline --disable-nls
	cd bash && $(MAKE)
	make DESTDIR="$(SYSROOT)" install

#bash-inst:
#	cp -v neofetch-c/neofetch ../root/usr/bin/neofetch-c
#	sudo chmod +x ../root/usr/bin/neofetcih-c

clean:
	rm -rfv bash/ syslinux/

#clean-inst:
#	sudo rm -f ../root/usr/bin/neofetch-c
