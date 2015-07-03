export ARCHS=armv7 armv7s arm64
export TARGET=iphone:latest:7.1

include theos/makefiles/common.mk

TWEAK_NAME = SmartLock
SmartLock_FILES = Tweak.xm
SmartLock_FRAMEWORKS = UIKit
SmartLock_LIBRARIES = substrate
SmartLock_ARCHS = armv7 armv7s arm64

include $(THEOS_MAKE_PATH)/tweak.mk
