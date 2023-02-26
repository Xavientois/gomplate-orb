#!/bin/sh

curl -o /usr/local/bin/gomplate -sSL "https://github.com/hairyhenderson/gomplate/releases/download/${VERSION:?}/gomplate_${OS:?}-${ARCH:?}"
chmod 755 /usr/local/bin/gomplate
gomplate --help