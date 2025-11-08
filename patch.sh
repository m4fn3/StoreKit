#!/bin/bash
set -e

if [[ -z "$1" ]]; then
  echo "Usage: $0 /path/to/ipa"
  exit 1
fi

INPUT_IPA="$1"
OUTPUT_IPA="${INPUT_IPA%.*}_patched.tipa"

echo "Copying original IPA..."
rm -f "$OUTPUT_IPA"
cp "$INPUT_IPA" "$OUTPUT_IPA"

unzip "$OUTPUT_IPA" Payload/LINE.app/LINE
mkdir -p Payload/LINE.app/Frameworks
cp .theos/obj/*.dylib Payload/LINE.app/Frameworks/

# Fix a strange issue where map_images_nolock tries to write to __DATA_CONST
# gsed -i 's/__objc_protorefs/__xbjc_protorefs/g' Payload/LINE.app/LINE

install_name_tool \
  -change /usr/lib/swift/libswiftObservation.dylib @executable_path/Frameworks/libswiftObservation.dylib \
  -change /System/Library/Frameworks/MarketplaceKit.framework/MarketplaceKit @executable_path/Frameworks/StoreKit.dylib \
  -change /System/Library/Frameworks/Foundation.framework/Foundation @executable_path/Frameworks/Foundation.dylib \
  -change /System/Library/Frameworks/AVFAudio.framework/AVFAudio @executable_path/Frameworks/AVFAudio.dylib \
  -change /System/Library/Frameworks/ActivityKit.framework/ActivityKit @executable_path/Frameworks/ActivityKit.dylib \
  -change /System/Library/Frameworks/SwiftUI.framework/SwiftUI @executable_path/Frameworks/SwiftUI.dylib \
  -change /System/Library/Frameworks/Network.framework/Network @executable_path/Frameworks/Network.dylib \
  -change /System/Library/Frameworks/Photos.framework/Photos @executable_path/Frameworks/Photos.dylib \
  -change /System/Library/Frameworks/UIKit.framework/UIKit @executable_path/Frameworks/UIKit.dylib \
  -change /usr/lib/swift/libswiftCore.dylib @executable_path/Frameworks/libswiftCore.dylib \
  -change /usr/lib/swift/libswift_Concurrency.dylib @executable_path/Frameworks/libswift_Concurrency.dylib \
  -change /System/Library/Frameworks/Vision.framework/Vision @executable_path/Frameworks/Vision.dylib \
  -change /System/Library/Frameworks/WidgetKit.framework/WidgetKit @executable_path/Frameworks/WidgetKit.dylib \
  Payload/LINE.app/LINE
# -change /System/Library/Frameworks/Network.framework/Network /usr/lib/swift/libswiftNetwork.dylib \

# ios17+のNetwork.frameworkの中身は、ios16ではNetwork.framework(objCのみ) + libswiftNetwork.dylib
# => dummyのdylib(空)にリンク先を変更 + dumyのdylibから、この2つにreexportでリンクすることで解決
# photosも同様
zip -r "$OUTPUT_IPA" Payload
rm -r Payload

echo "== Patched IPA saved as: $OUTPUT_IPA =="