LOCAL_PATH := $(call my-dir)

ifeq ($(LOCAL_PATH),$(call project-path-for,bt-vendor))

# TODO:  Find a better way to separate build configs for ADP vs non-ADP devices
ifneq ($(TARGET_BOARD_AUTO),true)
  ifneq ($(filter msm8x27 msm8974 msm8226,$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,msm8960)
  else ifneq ($(filter msm8994,$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,msm8992)
  else ifneq ($(wildcard $(LOCAL_PATH)/$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,$(TARGET_BOARD_PLATFORM))
  endif
endif

endif
