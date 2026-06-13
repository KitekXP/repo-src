CFLAGS=-static

###############
# BUILD       #
###############

autogen:
	cd dash && ./autogen.sh

configure:
	cd dash && ./configure CFLAGS="$(CFLAGS)" CC="$(CC)" LDFLAGS="$(LDFLAGS)"

compile:
	cd dash && make

###############
# PACKAGE     #
###############

copy_to_pkgdir:
	cd dash && make install DESTDIR=$(PWD)/package/files

package: copy_to_pkgdir
	tar --zstd -cf dash.tar.zst package/

###############
# CLEAN       #
###############

clean_build:
	cd dash && make clean

clean_pkg:
	rm -rf package/clean dash.tar.zst

###############
# META        #
###############

build: autogen configure compile

