#!/bin/bash

echo

echo -e "\n"
echo -e "############################"
echo -e "#      BUILD STARTING      #"
echo -e "############################"
echo -e "\n"

echo -e "\n\nCreating output directory...\n"
# create output directory
mkdir -p out

echo -e "\n\nPreparing PATH...\n"
# add prebuilts to path for duration of this script
PATH="$(pwd)/prebuilts/clang/bin:$(pwd)/prebuilts/gcc/bin:${PATH}"

echo -e "\n\nCleaning up last build...\n"
# clean up last (attempted) build
make O=out mrproper

echo -e "\n\nPreparing configuration file...\n"
# prepare for build with specified defconfig
# arch/arm64/configs/defconfig
make O=out ARCH=arm64 sm8150-perf_defconfig

echo -e "\n\nStart building kernel source...\n"
# start the build
# (and hope to fucking god it bloody works...)
make O=out \
     ARCH=arm64 \
     CC=clang \
     CLANG_TRIPLE=aarch64-linux-gnu- \
     CROSS_COMPILE=aarch64-linux-android-

echo -e "\n"
echo -e "############################"
echo -e "#      BUILD FINISHED      #"
echo -e "############################"
echo -e "\n"
