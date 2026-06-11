fastfetch:
	cd fastfetch
	make
	cd ..

tsux:
	cd tsux
	make okiz
	cd ..

build: tsux fastfetch
