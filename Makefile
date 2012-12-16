export ARCHS=armv7
export TARGET=iphone:latest:4.3

include theos/makefiles/common.mk

TWEAK_NAME = SmartLock
SmartLock_FILES = Tweak.xm
SmartLock_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
