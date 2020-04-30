#!/bin/bash

echo -e "\n"
echo -e "############################"
echo -e "#      BUILD STARTING      #"
echo -e "############################"
echo -e "\n"

echo -e "Creating output directory..."
# create output directory
mkdir -p out

echo -e "Setting up exports..."
# add prebuilts to path for duration of this script
PATH="$(pwd)/prebuilts/clang/bin:$(pwd)/prebuilts/gcc/bin:${PATH}"
# export variables needed for kernel build because of OPPO's silly
# method for building their fingerprint drivers
export TARGET_PRODUCT=msmnile
export OPPO_TARGET_DEVICE=MSM_8150

echo -e "Cleaning up last build..."
echo -e "############################\n"
# clean up last build
make O=out mrproper

echo -e "Preparing configuration file..."
echo -e "############################\n"
# prepare for build with specified defconfig
# arch/arm64/configs/vendor/sm8150-perf_defconfig
make O=out ARCH=arm64 vendor/sm8150-perf_defconfig

echo -e "\n\nStart building kernel source..."
echo -e "############################\n"
# start the build
# (and hope to fucking god it bloody works...)
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-

echo -e "\n"
echo -e "############################"
echo -e "#      BUILD FINISHED      #"
echo -e "############################"
echo -e "\n"
