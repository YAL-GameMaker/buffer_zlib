# Set local path (An Android.mk file must begin by defining the LOCAL_PATH variable)
LOCAL_PATH := $(call my-dir)

# Clears LOCAL_XXX variables
include $(CLEAR_VARS)

# Header file(s)
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CPP_INCLUDES := $(LOCAL_PATH)

# Name of shared library
LOCAL_MODULE := BufferZlib

# Source file(s)
LOCAL_SRC_FILES := buffer_zlib.cpp
LOCAL_SRC_FILES += $(notdir $(wildcard $(LOCAL_PATH)/*.c))

# Example: include all C source files
# LOCAL_SRC_FILES := $(notdir $(wildcard $(LOCAL_PATH)/*.c))

# The following command will build the library
include $(BUILD_SHARED_LIBRARY)