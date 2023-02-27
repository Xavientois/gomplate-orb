#!/bin/sh

curl -o ./gomplate -sSL "https://github.com/hairyhenderson/gomplate/releases/download/${VERSION:?}/gomplate_${OS:?}-${ARCH:?}"
chmod 755 ./gomplate
sudo cp ./gomplate /usr/local/bin/gomplate
gomplate --help