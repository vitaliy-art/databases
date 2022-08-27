# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.0/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential libreadline-dev unzip libsqlite3-dev default-jre sqlite3

# Load and install Lua
WORKDIR /tmp
RUN curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz
RUN tar -zxf lua-5.4.4.tar.gz
WORKDIR /tmp/lua-5.4.4
RUN make linux test
RUN make install

# Load and install luarocks
WORKDIR /tmp
RUN wget https://luarocks.org/releases/luarocks-3.9.1.tar.gz
RUN tar zxpf luarocks-3.9.1.tar.gz
WORKDIR /tmp/luarocks-3.9.1
RUN ./configure --with-lua-include=/usr/local/include
RUN make
RUN make install

WORKDIR /lib
RUN git clone https://github.com/itdxer/4DaysORM.git
