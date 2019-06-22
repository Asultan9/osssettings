include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OSSSettings
OSSSettings_FILES = Tweak.xm
ARCHS = armv7 arm64 #arm64e

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += osssettingsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
