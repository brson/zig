default:
    @just --list

llvm-clone:
    -git clone https://github.com/llvm/llvm-project.git

llvm-checkout: llvm-clone
    cd llvm-project && git checkout llvmorg-18.1.8

llvm-configure: llvm-checkout
    cd llvm-project && \
    cmake -S llvm -B build -G Ninja \
    -DLLVM_ENABLE_PROJECTS="clang;lld" \
    -DCMAKE_INSTALL_PREFIX="$(pwd)/install" \
    -DCMAKE_BUILD_TYPE=Release

llvm-build: llvm-configure
    cd llvm-project && cmake --build build

llvm-install: llvm-build
    cd llvm-project && cmake --install build

llvm-clean:
    -rm -r llvm-project/build
    -rm -r llvm-project/install

zig-configure: #llvm-install
    mkdir -p build && cd build && \
    cmake .. \
    -DCMAKE_PREFIX_PATH="$(pwd)/../llvm-project/install"

zig-build: zig-configure
    cd build && make

zig-clean:
   -rm -r build

build: llvm-install zig-build

