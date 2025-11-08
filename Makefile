TARGET := iphone:clang:16.5:16.0 # 16.5のsdkを使用するように指定 
ARCHS = arm64
STRIP = 0
include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libswiftObservation StoreKit Foundation AVFAudio ActivityKit SwiftUI Network Photos UIKit libswiftCore libswift_Concurrency Vision WidgetKit# libswiftCore AVFAudio AVFoundation SwiftUI

libswiftObservation_FILES = libswiftObservation.swift libswiftObservation.c
libswiftObservation_CFLAGS = -fobjc-arc
libswiftObservation_SWIFTFLAGS = -enable-library-evolution -module-name libswiftObservation
libswiftObservation_INSTALL_PATH = /usr/local/lib/swift

libswiftCore_FILES = libswiftCore.swift libswiftCore.c
libswiftCore_CFLAGS = -fobjc-arc
libswiftCore_LDFLAGS = -Xlinker -reexport_library $(SYSROOT)/usr/lib/swift/libswiftCore.tbd
libswiftCore_SWIFTFLAGS = -enable-library-evolution -module-name libswiftCore
libswiftCore_INSTALL_PATH = /usr/local/lib/swift

libswift_Concurrency_FILES = libswift_Concurrency.swift 
libswift_Concurrency_LDFLAGS = -Xlinker -reexport_library $(SYSROOT)/usr/lib/swift/libswift_Concurrency.tbd
libswift_Concurrency_SWIFTFLAGS = -enable-library-evolution -module-name libswift_Concurrency
libswift_Concurrency_INSTALL_PATH = /usr/local/lib/swift

Foundation_FILES = Foundation.m
Foundation_LDFLAGS = -Xlinker -reexport_framework -Xlinker Foundation
Foundation_INSTALL_PATH = /usr/local/lib

AVFAudio_FILES = AVFAudio.m
AVFAudio_LDFLAGS = -Xlinker -reexport_framework -Xlinker AVFAudio
AVFAudio_INSTALL_PATH = /usr/local/lib

ActivityKit_FILES = ActivityKit.m
ActivityKit_LDFLAGS = -Xlinker -reexport_framework -Xlinker ActivityKit
ActivityKit_INSTALL_PATH = /usr/local/lib

Network_FILES = Network.swift 
Network_LDFLAGS = -Xlinker -reexport_framework -Xlinker Network -Xlinker -reexport_library $(SYSROOT)/usr/lib/swift/libswiftNetwork.tbd
Network_INSTALL_PATH = /usr/local/lib

Photos_FILES = Photos.swift
Photos_LDFLAGS = -Xlinker -reexport_framework -Xlinker Photos -Xlinker -reexport_library $(SYSROOT)/usr/lib/swift/libswiftPhotos.tbd
Photos_INSTALL_PATH = /usr/local/lib

UIKit_FILES = UIKit.swift
UIKit_LDFLAGS = -Xlinker -reexport_framework -Xlinker UIKit -Xlinker -reexport_library $(SYSROOT)/usr/lib/swift/libswiftUIKit.tbd
UIKit_INSTALL_PATH = /usr/local/lib

Vision_FILES = Vision.swift
Vision_LDFLAGS = -Xlinker -reexport_framework -Xlinker Vision
Vision_INSTALL_PATH = /usr/local/lib

WidgetKit_FILES = WidgetKit.swift
WidgetKit_LDFLAGS = -Xlinker -reexport_framework -Xlinker WidgetKit
WidgetKit_INSTALL_PATH = /usr/local/lib

StoreKit_FILES = StoreKit.swift StoreKit.x
StoreKit_CFLAGS = -fobjc-arc
StoreKit_SWIFTFLAGS = -enable-library-evolution -module-name MarketplaceKit
StoreKit_INSTALL_PATH = /usr/local/lib

SwiftUI_FILES = SwiftUI.swift
SwiftUI_LDFLAGS = -Xlinker -reexport_framework -Xlinker SwiftUI
SwiftUI_SWIFTFLAGS = -enable-library-evolution
SwiftUI_INSTALL_PATH = /usr/local/lib

include $(THEOS_MAKE_PATH)/library.mk
