INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:latest:11.0
export ARCHS = arm64 arm64e

TWEAK_NAME = FolderList

FolderList_FILES = Tweak.xm FLIconEntry.m FLTableViewCell.m
FolderList_CFLAGS = -O3 -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += folderlistprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
