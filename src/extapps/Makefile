EXTCFLAGS=-O3 -flto -fno-pie
EXTLDFLAGS=-no-pie

all:
	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building coolmath..."
	@$(MAKE) coolmath > /dev/null 2>&1
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
	@$(MAKE) bash > /dev/null 2>&1
	@echo "Done building GNU Bash"
	
	@echo " "
	@echo "========================="
	@echo " "
	
	@echo "Building dropbear..."
	@$(MAKE) dropbear > /dev/null 2>&1
	@echo "Done building dropbear"

	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building GNU ncurses..."
	@$(MAKE) ncurses > /dev/null 2>&1
	@echo "Done building GNU ncurses"

	@echo " "
	@echo "========================="
	@echo " "

	@echo "Building links..."
	@$(MAKE) links > /dev/null 2>&1
	@echo "Done building links"

bash:
	git clone git://git.sv.gnu.org/bash.git --depth=1
	cd bash && CFLAGS_FOR_BUILD="-std=gnu89" CC=$(CC) CFLAGS="$(CFLAGS) -std=gnu89 -fno-pie" LDFLAGS="$(LDFLAGS) -no-pie" AR=$(AR) RANLIB=$(RANLIB) STRIP=$(STRIP) ./configure --host=i486-linux-musl --build=x86_64-pc-linux-gnu --prefix=/usr --without-bash-malloc bash_cv_getcwd_malloc=yes bash_cv_func_sigsetjmp=present bash_cv_job_control_missing=no bash_cv_sys_named_pipes_present=yes bash_cv_func_strcoll_broken=no --disable-readline --disable-nls --disable-docs
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

dropbear:
	git clone https://github.com/mkj/dropbear --depth=1
	cd dropbear && CC=$(CC) CFLAGS="$(CFLAGS) $(EXTCFLAGS)" LDFLAGS="$(LDFLAGS) $(EXTLDFLAGS)" ./configure --enable-static --enable-bundled-libtom --disable-syslog --disable-harden --disable-zlib --disable-shadow --disable-utmp --disable-utmpx --disable-wtmpx --disable-loginfunc --prefix="$(SYSROOT)/usr"
	cd dropbear && $(MAKE)
	cd dropbear && $(MAKE) install

ncurses:
	cd ../tars && wget https://ftp.gnu.org/gnu/ncurses/ncurses-6.6.tar.gz
	tar xzvf ../tars/ncurses-6.6.tar.gz
	cd ncurses-6.6 && CC=$(CC) CFLAGS="$(CFLAGS) $(EXTCFLAGS)" LDFLAGS="$(LDFLAGS) $(EXTLDFLAGS)" ./configure --prefix="$(MUSLROOT)" --host=i386-linux-musl --without-shared --with-normal --without-debug --without-ada
	cd ncurses-6.6 && $(MAKE)
	cd ncurses-6.6 && $(MAKE) install

links:
	cd ../tars && wget http://links.twibright.com/download/links-2.30.tar.gz
	tar xzvf ../tars/links-2.30.tar.gz
	cd links-2.30 && CC=$(CC) CFLAGS="$(CFLAGS) $(EXTCFLAGS)" LDFLAGS="$(LDFLAGS) $(EXTLDFLAGS)" ./configure --build=i386-linux-musl --without-ipv6 --without-gpm --without-x --without-directfb --with-fb -without-zlib --without-brotoli --without-zstd --without-lzip --without-openmp --without-svgalib --without-pmshell --without-athenos --without-haiku --without-grx --without-freetype --without-libjpeg --without-libtif --without-librsvg --without-libwebp --without-libavifi --prefix="$(SYSROOT)/usr"
	cd links-2.30 && $(MAKE)
	cd links-2.30 && $(MAKE) install

#rogue:
#	git clone https://github.com/Davidslv/rogue --depth=1
#	cd rogue && CC=$(CC) CFLAGS="$(CFLAGS) $(EXTCFLAGS) -I$(MUSLROOT)/include/ncursesw/ -std=c89" LDFLAGS="$(LDFLAGS) $(EXTLDFLAGS)" ./configure --with-ncurses --host=i386-linux-gnu --prefix=$(SYSROOT)/usr
#	cd rogue && $(MAKE)
#	cd rogue && $(MAKE) install

#gpm:
#	cd ../tars && wget https://www.nico.schottelius.org/software/gpm/archives/gpm-1.20.7.tar.lzma
#	tar xvf ../tars/gpm-1.20.7.tar.lzma
#	cd gpm-1.20.7 && ./autogen.sh
#	cd gpm-1.20.7 && CC=$(CC) CFLAGS="$(CFLAGS) $(EXTCFLAGS)" LDFLAGS="$(LDFLAGS) $(EXTLDFLAGS)" ./configure --prefix=$(SYSROOT)/usr --enable-static --with-gnu-ld --build=i386-linux-musl
#	cd gpm-1.20.7 && $(MAKE)
#	cd gpm-1.20.7 && $(MAKE) install

microwindows:
	git clone https://github.com/ghaerr/microwindows --depth=1
	cp -v ../conf/nxconfig microwindows/src/config
	cp -v ../conf/Makefile.rules microwindows/src/
	cd microwindows/src && $(MAKE)
	sudo mkdir -pv $(SYSROOT)/usr/microwindows $(SYSROOT)/usr/microwindows/bin
	sudo cp -v microwindows/src/bin/nano-X $(SYSROOT)/usr/microwindows/bin
	sudo cp -v microwindows/src/bin/nx* $(SYSROOT)/usr/microwindows/bin
	sudo cp -v microwindows/src/bin/demo* $(SYSROOT)/usr/microwindows/bin
	sudo cp -v microwindows/src/bin/screenshot-ppm $(SYSROOT)/usr/microwindows/bin
	sudo cp -v microwindows/src/bin/show-font $(SYSROOT)/usr/microwindows/bin
	sudo cp -v microwindows/src/bin/show-ppm $(SYSROOT)/usr/microwindows/bin
	sudo mkdir -pv $(MUSLROOT)/include/microwindows
	sudo cp -v microwindows/src/lib/* $(MUSLROOT)/lib
	sudo cp -v microwindows/src/include/*.h $(MUSLROOT)/include/microwindows

vim:
	git clone https://github.com/vim/vim --depth=1
	cd vim && CC=$(CC) CFLAGS="$(CFLAGS) $(EXTCFLAGS) -L$(MUSLROOT)/lib -I$(MUSLROOT)/include/ncursesw -std=gnu99" LDFLAGS="$(LDFLAGS) $(EXTLDFLAGS)" ./configure --host=i486-linux-musl --prefix=$(SYSROOT)/usr --disable-gui --without-x --with-tlib=ncursesw --disable-nls --disable-acl --disable-selinux --disable-gpm --without-wayland vim_cv_getcwd_broken=no ac_cv_func_getcwd=yes
	cd vim && $(MAKE)

lua:
	cd ../tars && wget https://www.lua.org/ftp/lua-5.4.8.tar.gz
	tar xzvf ../tars/lua-5.4.8.tar.gz
	cp -v ../conf/srcluamake lua-5.4.8/src/Makefile
	cd lua-5.4.8 && $(MAKE)
	cp -v lua-5.4.8/src/lua $(SYSROOT)/usr/bin
	mkdir -p $(MUSLROOT)/include/lua
	cp -v lua-5.4.8/src/*.h $(MUSLROOT)/include/lua
	cp -v lua-5.4.8/src/*.a $(MUSLROOT)/lib
	
clean:
	rm -rfv bash/ syslinux/ coolmath/ nixgames/ 8086tiny/ ASCII_bad_apple_c89/ dropbear/ ncurses-6.6/ ../tars/ncurses* links-2.30/ ../tars/links-2.30* microwindows/ vim/ ../tars/lua* lua-5.4.8/
