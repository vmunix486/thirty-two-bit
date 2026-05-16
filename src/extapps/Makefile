EXTCFLAGS=-O3 -flto -fno-pie
EXTLDFLAGS=-no-pie

all:
	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building coolmath..."
	@$(MAKE) bash > /dev/null 2>&1
	@echo "Done building coolmath"

	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building nixgames..."
	@$(MAKE) nixgames > /dev/null 2>&1
	@echo "Done building nixgames"

	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building 8086tiny..."
	@$(MAKE) 8086tiny > /dev/null 2>&1
	@echo "Done building 8086tiny"

	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building Bad Apple..."
	@$(MAKE) badapple > /dev/null 2>&1
	@echo "Done building Bad Apple"

	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building GNU Bash..."
	@echo "It might fail to build, but that's to be expected"
	@$(MAKE) bash > /dev/null 2>&1

bash:
	git clone git://git.sv.gnu.org/bash.git --depth=1
	cd bash && CFLAGS_FOR_BUILD="-std=gnu89" CC=$(CC) CFLAGS="$(CFLAGS) -std=gnu89 -fno-pie" LDFLAGS="$(LDFLAGS) -no-pie" AR=$(AR) RANLIB=$(RANLIB) STRIP=$(STRIP) ./configure --host=i486-linux-musl --build=x86_64-pc-linux-gnu --prefix=/usr --without-bash-malloc bash_cv_getcwd_malloc=yes bash_cv_func_sigsetjmp=present bash_cv_job_control_missing=no bash_cv_sys_named_pipes_present=yes bash_cv_func_strcoll_broken=no --disable-readline --disable-nls
	cd bash && $(MAKE)
	cd bash && make DESTDIR="$(SYSROOT)" install

coolmath:
	git clone https://github.com/vmunix486/coolmath --depth=1
	cd coolmath && $(CC) $(CFLAGS) $(EXTCFLAGS) even.c -o even $(LDFLAGS) $(EXTLDFLAGS)
	cd coolmath && $(CC) $(CFLAGS) $(EXTCFLAGS) factor.c -o factor $(LDFLAGS) $(EXTLDFLAGS)
	cd coolmath && $(CC) $(CFLAGS) $(EXTCFLAGS) fibbonachi.c -o fibbonachi $(LDFLAGS) $(EXTLDFLAGS)
	cd coolmath && $(CC) $(CFLAGS) $(EXTCFLAGS) odd.c -o odd $(LDFLAGS) $(EXTLDFLAGS)
	cd coolmath && $(CC) $(CFLAGS) $(EXTCFLAGS) pi.c -o pi $(LDFLAGS) $(EXTLDFLAGS)
	cd coolmath && $(CC) $(CFLAGS) $(EXTCFLAGS) prime.c -o prime $(LDFLAGS) $(EXTLDFLAGS)
	sudo mkdir -pv $(SYSROOT)/usr/games/ $(SYSROOT)/usr/games/bin
	#sudo cp -v coolmath/*.sh $(SYSROOT)/usr/games/bin
	sudo cp -v coolmath/even $(SYSROOT)/usr/games/bin
	sudo cp -v coolmath/factor $(SYSROOT)/usr/games/bin
	sudo cp -v coolmath/fibbonachi $(SYSROOT)/usr/games/bin
	sudo cp -v coolmath/odd $(SYSROOT)/usr/games/bin
	sudo cp -v coolmath/pi $(SYSROOT)/usr/games/bin
	sudo cp -v coolmath/prime $(SYSROOT)/usr/games/bin
	sudo chmod +x $(SYSROOT)/usr/games/bin/*

nixgames:
	git clone https://github.com/vmunix486/nixgames --depth=1
	mkdir -v nixgames/bin
	cd nixgames && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 src/fish.c -o bin/fish $(LDFLAGS) $(EXTLDFLAGS)
	cd nixgames && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 src/morse.c -o bin/morse $(LDFLAGS) $(EXTLDFLAGS)
	cd nixgames && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 src/number.c -o bin/number $(LDFLAGS) $(EXTLDFLAGS)
	cd nixgames && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 src/arithmetic.c -o bin/arithmetic $(LDFLAGS) $(EXTLDFLAGS)
	cd nixgames && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 src/ppt.c -o bin/ppt $(LDFLAGS) $(EXTLDFLAGS)
	cd nixgames && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 src/banner.c -o bin/banner $(LDFLAGS) $(EXTLDFLAGS)
	cd nixgames && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 src/bcd.c -o bin/bcd $(LDFLAGS) $(EXTLDFLAGS)
	sudo mkdir -pv $(SYSROOT)/usr/games/ $(SYSROOT)/usr/games/bin
	sudo cp -v nixgames/bin/* $(SYSROOT)/usr/games/bin
	sudo chmod +x $(SYSROOT)/usr/games/bin/*

8086tiny:
	git clone https://github.com/adriancable/8086tiny --depth=1
	cd 8086tiny && $(CC) $(CFLAGS) $(EXTCFLAGS) -fsigned-char -std=c99 -DNO_GRAPHICS 8086tiny.c -o 8086tiny $(LDFLAGS) $(EXTLDFLAGS)
	sudo mkdir -pv $(SYSROOT)/usr/8086tiny/
	sudo cp -v 8086tiny/8086tiny $(SYSROOT)/usr/8086tiny/
	sudo cp -v 8086tiny/fd.img $(SYSROOT)/usr/8086tiny/
	sudo cp -v 8086tiny/bios $(SYSROOT)/usr/8086tiny/
	sudo cp -v 8086tiny/runme $(SYSROOT)/usr/8086tiny/
	sudo chmod +x $(SYSROOT)/usr/8086tiny/8086tiny $(SYSROOT)/usr/8086tiny/runme

badapple:
	git clone https://github.com/vmunix486/ASCII_bad_apple_c89 --depth=1
	cd ASCII_bad_apple_c89 && $(CC) $(CFLAGS) $(EXTCFLAGS) -w -std=c89 run.c -o run $(LDFLAGS) $(EXTLDFLAGS)
	sudo mkdir -pv $(SYSROOT)/usr/badapple/
	sudo cp -v ASCII_bad_apple_c89/run $(SYSROOT)/usr/badapple/
	sudo cp -v ASCII_bad_apple_c89/play-80x25.txt $(SYSROOT)/usr/badapple/play.txt
	sudo chmod +x $(SYSROOT)/usr/badapple/run

clean:
	rm -rfv bash/ syslinux/ coolmath/ nixgames/ 8086tiny/ ASCII_bad_apple_c89/
