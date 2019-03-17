LIBJWT_SRC = ../libjwt
ANDROID_LIBDIR = ../../android/lib
LOCAL_PATH := $(shell pwd)

include $(CLEAR_VARS)
LOCAL_MODULE := jansson
LOCAL_SRC_FILES := $(ANDROID_LIBDIR)/$(TARGET_ARCH_ABI)/libjansson.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := crypto
LOCAL_SRC_FILES := $(ANDROID_LIBDIR)/$(TARGET_ARCH_ABI)/libcrypto.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := ssl
LOCAL_SRC_FILES := $(ANDROID_LIBDIR)/$(TARGET_ARCH_ABI)/libssl.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(LIBJWT_SRC)/base64.c \
		 $(LIBJWT_SRC)/jwt.c \
		 $(LIBJWT_SRC)/jwt-openssl.c
LOCAL_CFLAGS := -Wall -Wextra -O2 -DHAVE_CONFIG_H
LOCAL_LDFLAGS :=
LOCAL_LDLIBS :=
LOCAL_SHARED_LIBRARIES := jansson crypto ssl
LOCAL_C_INCLUDES := ../include ../../jansson/src ../../jansson/android ../../openssl/include
LOCAL_MODULE := libjwt
include $(BUILD_SHARED_LIBRARY)
