export TARGET_PRODUCT=msmnile
export OPPO_TARGET_DEVICE=MSM_8150

PATH="$(pwd)/prebuilts/clang/bin:$(pwd)/prebuilts/gcc/bin:${PATH}"

make O=out ARCH=arm64 CC=clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-android-