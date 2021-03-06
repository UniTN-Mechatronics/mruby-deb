#!/bin/bash
VERSION=$(date +"%y.%m.%d")
PATCHLEVEL=`(git rev-parse --short HEAD)`
SOURCE_BIN=./mruby/build/host/bin
LIB_DIR=./mruby/build/host/lib

echo "Building deb package for version $VERSION-$PATCHLEVEL"

mkdir -p products
mkdir -p spool
mkdir -p spool/usr/bin
mkdir -p spool/usr/lib/mruby
mkdir -p spool/DEBIAN
echo

echo "Copying Binaries"
cp $SOURCE_BIN/mruby spool/usr/bin/mruby
cp $SOURCE_BIN/mrbc spool/usr/bin/mrbc
cp $SOURCE_BIN/mirb spool/usr/bin/mirb
cp $LIB_DIR/*.so spool/usr/lib/mruby/
cp $LIB_DIR/*.a spool/usr/lib/mruby/
#cp $SOURCE_BIN/mruby-config spool/usr/bin/mruby-config
echo

echo "Setting up permissions"
find ./spool -type d | xargs chmod 755
echo

echo "Creting metainformation"
echo "Package: mruby
Version: $VERSION-p$PATCHLEVEL
Section: base
Priority: optional
Architecture: armhf
Depends: libc6, libreadline6, libssl1.0.0, libpcre3, libyaml-0-2, libyaml-dev, i2c-tools, libi2c-dev, libopencv-core2.4, libopencv-core-dev, libopencv-dev, libgsl0ldbl, libgsl0-dev, wiringpi
Maintainer: Paolo Bosetti <paolo.bosetti@unitn.it>
Description: mruby for for robotics on Raspberry PI. Please remember to install wiringPi" > spool/DEBIAN/control
echo
cat spool/DEBIAN/control
echo

echo "Building package"
fakeroot dpkg-deb --build spool
mv spool.deb products/mruby-unitn-$VERSION-$PATCHLEVEL.deb
echo "Completed"

rm -rf spool
