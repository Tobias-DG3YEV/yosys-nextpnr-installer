#!/bin/sh
# simple installer script for openFPGAloader 
# use mktemp to use system temp. directory

#TMPDIR=$(mktemp -d)
TMPDIR="./tmp"
mkdir $TMPDIR

LOADERDIR="openFPGALoader"

sudo apt -y install \
  git \
  gzip \
  libftdi1-2 \
  libftdi1-dev \
  libhidapi-hidraw0 \
  libhidapi-dev \
  libudev-dev \
  zlib1g-dev \
  cmake \
  pkg-config \
  make \
  g++

cd $TMPDIR
git clone https://github.com/trabucayre/openFPGALoader
cd $LOADERDIR
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

cd ..

sudo cp 99-openfpgaloader.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger # force udev to take new rule
sudo usermod -a $USER -G plugdev # add user to plugdev group
