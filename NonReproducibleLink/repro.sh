#!/bin/bash

set -euo pipefail

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
    -no_uuid \
    -lSystem \
    "$(xcode-select -p)"/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/*/lib/darwin/libclang_rt.iossim.a \
    -F. \
    "$@"
}

for i in $(seq 100); do
  rm -rf /tmp/bins2
  mkdir -p /tmp/bins2

  build -o /tmp/bins2/first
  build -o /tmp/bins2/second

  if diff -Nur <(xxd /tmp/bins2/first) <(xxd /tmp/bins2/second); then
    echo "NO DIFF!! Running $((100 - i)) more times to be sure"
  else
    echo "HAS DIFF, something was non deterministic!"
    exit 1
  fi
done
