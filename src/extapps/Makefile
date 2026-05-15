bash:
	git clone git://git.sv.gnu.org/bash.git --depth=1
	cd bash && CFLAGS_FOR_BUILD="-std=gnu89" CC=$(CC) CFLAGS="$(CFLAGS) -std=gnu89 -fno-pie" LDFLAGS="$(LDFLAGS) -no-pie" AR=$(AR) RANLIB=$(RANLIB) STRIP=$(STRIP) ./configure --host=i486-linux-musl --build=x86_64-pc-linux-gnu --prefix=/usr --without-bash-malloc bash_cv_getcwd_malloc=yes bash_cv_func_sigsetjmp=present bash_cv_job_control_missing=no bash_cv_sys_named_pipes_present=yes bash_cv_func_strcoll_broken=no --disable-readline --disable-nls
	cd bash && $(MAKE)
	cd bash && make DESTDIR="$(SYSROOT)" install

clean:
	rm -rfv bash/ syslinux/
