#!/bin/sh
#

export ANDROID_NDK=${ANDROID_NDK:-~/android-ndk-r21}
export TOOLCHAIN=${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64

function do_ndk()
{
	cd android
	${ANDROID_NDK}/ndk-build $1
}

if [[ $1 == "clean" ]]; then
        do_ndk "clean"
        exit
fi

autoreconf -i

export AR=$TOOLCHAIN/bin/aarch64-linux-android-ar
export AS=$TOOLCHAIN/bin/aarch64-linux-android-as
export CC=$TOOLCHAIN/bin/aarch64-linux-android21-clang
export CXX=$TOOLCHAIN/bin/aarch64-linux-android21-clang++
export LD=$TOOLCHAIN/bin/aarch64-linux-android-ld
export RANLIB=$TOOLCHAIN/bin/aarch64-linux-android-ranlib
export STRIP=$TOOLCHAIN/bin/aarch64-linux-android-strip

./configure --host aarch64-linux-android

do_ndk
