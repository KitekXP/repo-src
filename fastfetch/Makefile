.PHONY: build build_fastfetch cp_build clean_build create_pkg clean_pkg clean

build: create_pkg

build_fastfetch:
	mkdir -p fastfetch/build
	cmake -S fastfetch -B fastfetch/build \
		-DCMAKE_C_FLAGS="-Oz -w -pipe" \
		-DCMAKE_EXE_LINKER_FLAGS="-Wl,-s" \
		-DCMAKE_BUILD_TYPE="Release" \
		-DBUILD_SHARED_LIBS="Off" \
		-DBUILD_TESTS="Off" \
		-GNinja
	cmake --build fastfetch/build --target fastfetch -j$(nproc)

cp_build: build_fastfetch
	mkdir -p package/files/
	cp fastfetch/build/fastfetch package/files/

clean_build:
	rm -rf fastfetch/build

create_pkg: cp_build
	tar --zstd -cf fastfetch.tar.zst package/

clean_pkg:
	rm -rf fastfetch.tar.zst package/files/

clean: clean_pkg clean_build
