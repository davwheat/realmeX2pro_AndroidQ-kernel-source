# Realme X2 Pro Kernel Source

Modified by David Wheatley (davwheat)

[Join the realme Discord server!](https://discord.gg/96SJ7PU)

## Changes

I've basically just fixed the source which realme released...

```diff
+ Add blu_schedutil CPU governor

* Fix build
```

## Build instructions

0. Clone the repository

1. Install dependencies
```sh
apt install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip python libelf-dev libssl-dev
```

2. Run build script
```sh
./build.sh
```