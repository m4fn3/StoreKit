#!/bin/bash
set -e

if [[ -z "$1" ]]; then
  echo "Usage: $0 /path/to/Fortnite_decrypted.ipa"
  exit 1
fi

unzip "$1" Payload/FortniteClient-IOS-Shipping.app/FortniteClient-IOS-Shipping
mkdir -p Payload/FortniteClient-IOS-Shipping.app/Frameworks
cp .theos/obj/*.dylib Payload/FortniteClient-IOS-Shipping.app/Frameworks/

# Fix a strange issue where map_images_nolock tries to write to __DATA_CONST
gsed -i 's/__objc_protorefs/__xbjc_protorefs/g' Payload/FortniteClient-IOS-Shipping.app/FortniteClient-IOS-Shipping

install_name_tool \
  -change /usr/lib/libc++.1.dylib @executable_path/Frameworks/libcpp.dylib \
  -change /usr/lib/swift/libswiftCore.dylib @executable_path/Frameworks/libswiftCore.dylib \
  -change /System/Library/Frameworks/MarketplaceKit.framework/MarketplaceKit @executable_path/Frameworks/StoreKit.dylib \
  -change /System/Library/Frameworks/SwiftUI.framework/SwiftUI @executable_path/Frameworks/SwiftUI.dylib \
  -change /System/Library/Frameworks/AVFoundation.framework/AVFoundation @executable_path/Frameworks/AVFoundation.dylib \
  -change /System/Library/Frameworks/AVFAudio.framework/AVFAudio @executable_path/Frameworks/AVFAudio.dylib \
  Payload/FortniteClient-IOS-Shipping.app/FortniteClient-IOS-Shipping

zip -r "$1" Payload
rm -r Payload
