TARGET := iphone:clang:latest:16.0
ARCHS = arm64
STRIP = 0
include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libswiftCoreFake libswiftCore AVFAudio AVFoundation StoreKit SwiftUI

libswiftCoreFake_FILES = libswiftCoreFake.c
libswiftCoreFake_LDFLAGS = -install_name /usr/lib/swift/libswiftCore.dylib
libswiftCoreFake_INSTALL_PATH = /usr/local/lib/swift

libswiftCore_FILES = libswiftCore.c
libswiftCore_LDFLAGS = -Xlinker -reexport_library $(THEOS_OBJ_DIR)/libswiftCoreFake.dylib
libswiftCore_INSTALL_PATH = /usr/local/lib/swift

AVFAudio_FILES = AVFAudio.m
AVFAudio_LDFLAGS = -Xlinker -reexport_framework -Xlinker AVFAudio
AVFAudio_INSTALL_PATH = /usr/local/lib

AVFoundation_FILES = AVFoundation.m
AVFoundation_LDFLAGS = -Xlinker -reexport_framework -Xlinker AVFoundation
AVFoundation_INSTALL_PATH = /usr/local/lib

StoreKit_FILES = StoreKit.swift StoreKit.x
StoreKit_CFLAGS = -fobjc-arc
StoreKit_SWIFTFLAGS = -enable-library-evolution
StoreKit_INSTALL_PATH = /usr/local/lib

SwiftUI_FILES = SwiftUI.swift
SwiftUI_LDFLAGS = -Xlinker -reexport_framework -Xlinker SwiftUI
SwiftUI_SWIFTFLAGS = -enable-library-evolution
SwiftUI_INSTALL_PATH = /usr/local/lib

include $(THEOS_MAKE_PATH)/library.mk
