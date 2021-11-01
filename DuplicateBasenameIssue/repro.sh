#!/bin/bash

set -euo pipefail
set -x

rm -rf libfoo.a lib ./*/*.o lib.dwarf lib.dSYM

clang -o foo/a.o foo/a.cc -c -g
clang -o bar/a.o bar/a.cc -c -g

libtool -static -D "bar/a.o" "foo/a.o" -o libfoo.a

ld -o lib -dynamic libfoo.a -dylib -arch "$(uname -m)" -macos_version_min 11.0 -all_load -lSystem -syslibroot "$(xcrun --show-sdk-path)"

output=$(mktemp)
dsymutil lib --flat >"$output" 2>&1
cat "$output"

if grep --quiet "could not find object file symbol" "$output"; then
  echo "Got expected warning"
else
  echo "Warning is gone"
fi
