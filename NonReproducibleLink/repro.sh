#!/bin/bash

set -euo pipefail
set -x

function build() {
  env -i \
    PATH=/usr/bin:/bin \
    ZERO_AR_DATE=true \
  ld \
    -arch x86_64 \
    -bundle \
    -platform_version ios-simulator 12.0.0 14.5 \
    -syslibroot "$(xcrun --show-sdk-path --sdk iphonesimulator)" \
    -objc_abi_version 2 \
    -framework CoreGraphics \
    -framework ImageIO \
    -framework QuartzCore \
    -framework SystemConfiguration \
    -framework UIKit \
    -framework CoreImage \
    -framework CoreTelephony \
    -framework OpenGLES \
    -framework CoreData \
    -framework CoreLocation \
    -framework CoreText \
    -framework Security \
    -framework GoogleMaps \
    -framework GoogleMapsBase \
    -framework GoogleMapsCore \
    -lz \
    libmain.a \
    -objc_abi_version 2 \
    -all_load \
    -lc++ \
    -framework Foundation \
    -lSystem \
    "$(xcode-select -p)"/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/*/lib/darwin/libclang_rt.iossim.a \
    -F. \
    "$@"
}

rm -rf /tmp/bins2
mkdir -p /tmp/bins2

build -o /tmp/bins2/first
build -o /tmp/bins2/second

if diff -Nur <(xxd /tmp/bins2/first) <(xxd /tmp/bins2/second); then
  echo "NO DIFF!! (but maybe run again to be sure)"
else
  echo "HAS DIFF, something was non deterministic!"
fi
