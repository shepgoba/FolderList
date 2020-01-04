INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk
DEBUG = 0
TWEAK_NAME = FolderList

FolderList_FILES = Tweak.xm FLTableViewCell.m
FolderList_CFLAGS = -O3 -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
