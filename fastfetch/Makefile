all: build

build: build_fastfetch create_pkg

build_fastfetch:
	mkdir fastfetch/build
	cmake -S fastfetch -B fastfetch/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static"
	cmake --build fastfetch/build --target fastfetch -j$(nproc)

cp_build:
	unzip fastfetch/build/fastfetch-linux-amd64.zip
	cp fastfetch/build/fastfetch-linux-amd64/* package/files/

clean_build:
	rm -rf fastfetch/build

create_pkg:
	tar --zstd -cf fastfetch.tar.zst package/

clean_pkg:
	rm -rf fastfetch.tar.zst

clean: clean_pkg clean_build
