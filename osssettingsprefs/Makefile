include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = OSSSettingsPrefs
OSSSettingsPrefs_FILES = COSSSRootListController.m
OSSSettingsPrefs_INSTALL_PATH = /Library/PreferenceBundles
OSSSettingsPrefs_FRAMEWORKS = UIKit
OSSSettingsPrefs_PRIVATE_FRAMEWORKS = Preferences

ARCHS = armv7 arm64 #arm64e

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/OSSSettingsPrefs.plist$(ECHO_END)
