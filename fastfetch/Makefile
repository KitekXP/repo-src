build: create_pkg

build_fastfetch:
	mkdir fastfetch/build
	cmake -S fastfetch -B fastfetch/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static"
	cmake --build fastfetch/build --target fastfetch -j$(nproc)

cp_build: build_fastfetch
	unzip fastfetch/build/fastfetch-linux-amd64.zip
	cp fastfetch/build/fastfetch-linux-amd64/* package/files/

clean_build:
	rm -rf fastfetch/build

create_pkg: cp_build
	tar --zstd -cf fastfetch.tar.zst package/

clean_pkg:
	rm -rf fastfetch.tar.zst

clean: clean_pkg clean_build
