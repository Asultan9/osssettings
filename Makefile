include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OSSSettings
OSSSettings2_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += osssettingsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
