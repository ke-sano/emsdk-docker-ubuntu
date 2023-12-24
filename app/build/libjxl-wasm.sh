apt-get -q update && \
apt-get -q install -y --no-install-recommends \
git \
cmake \
pkg-config \
ninja-build \
doxygen \
graphviz \
default-jre \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

git clone https://github.com/libjxl/libjxl.git --recursive --shallow-submodules

cd libjxl

BUILD_TARGET=wasm32 ENABLE_WASM_SIMD=1 emconfigure ./ci.sh release

apt-get purge --auto-remove -y \
git \
cmake \
pkg-config \
ninja-build \
doxygen \
graphviz \
default-jre
