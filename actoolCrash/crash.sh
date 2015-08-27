#!/bin/sh

if ! xcodebuild -version | grep -q 7A192o; then
  echo "Xcode command line tools must be set to Xcode 7 beta 6 build 7A192o"
  exit 1
fi

count=0
while true
do
  echo "Run $count"
  rm -rf build/
  mkdir build

  xcrun actool \
    --output-format human-readable-text \
    --notices \
    --warnings \
    --export-dependency-info build/assetcatalog_dependencies \
    --output-partial-info-plist build/assetcatalog_generated_info.plist \
    --app-icon AppIcon \
    --launch-image LaunchImage \
    --compress-pngs \
    --enable-on-demand-resources YES \
    --filter-for-device-model iPhone7,2 \
    --filter-for-device-os-version 9.0 \
    --target-device iphone \
    --minimum-deployment-target 8.0 \
    --platform iphonesimulator \
    --compile build/ Images.xcassets \
    || break

  count=$((count+1))
done
