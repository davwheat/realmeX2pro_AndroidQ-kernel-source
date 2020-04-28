#!/bin/bash

# set build architecture to ARM64
export ARCH=arm64 && export SUBARCH=arm64

# set prebuild toolchain directory
export CROSS_COMPILE=`pwd`/toolchain64/bin/aarch64-linux-android-

# create output directory
mkdir -p out

# prevent errors from stopping script
set -e

# clean up last (attempted) build
make O=out mrproper

# prepare for build with specified defconfig
# arch/arm64/configs/defconfig
make O=out defconfig

# start the build
# (and hope to fucking god it bloody works...)
make O=out -j$(nproc --all)

set +e

echo "\n"
echo "############################"
echo "#      BUILD FINISHED      #"
echo "############################"
echo "\n"
