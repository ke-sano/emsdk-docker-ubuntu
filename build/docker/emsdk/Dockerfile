FROM ubuntu:22.04

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && apt-get -q update && \
    apt-get -q install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends \
    nodejs \
    git \
    xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/emscripten-core/emsdk.git && chmod +x emsdk && cd emsdk && \
    ./emsdk install latest && \
    ./emsdk activate latest

ENV EMSDK=/emsdk \
    PATH="/emsdk:/emsdk/upstream/emscripten:/emsdk/node/16.20.0_64bit/bin:${PATH}"

RUN apt-get purge --auto-remove -y \
    ca-certificates \
    curl \
    gnupg \
    nodejs \
    git \
    xz-utils \
    emcc --version

WORKDIR /app
