LOCAL_PATH:= $(call my-dir)

# Log
include $(CLEAR_VARS)

LOCAL_SRC_FILES := log/lab126_shim.cpp
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := liblog_shim
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

LOCAL_PATH:= $(call my-dir)

# Audio
include $(CLEAR_VARS)

LOCAL_SRC_FILES := audio/libaudio_shim.c
LOCAL_LDLIBS += -ldl

LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	system/core/include/cutils

LOCAL_SHARED_LIBRARIES := liblog libtinyalsa

LOCAL_MODULE := libaudio_shim
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
