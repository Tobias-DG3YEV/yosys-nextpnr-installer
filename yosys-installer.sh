#!/bin/sh
#simple install script for YOSYS and itss dependencies

sudo apt-get -y install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev \
    cmake python3 python3-pip python3-yaml libboost-all-dev \
    libeigen3-dev python3-venv

# use mktemp to use system temp. directory
#TMPDIR=$(mktemp -d)
TMPDIR="./tmp"
mkdir $TMPDIR
cd $TMPDIR

function cleanup {
  cd
  rm -rf $TMPDIR
}

if [ ! -x "$(which yosys)" ];
then
    if [ -d "yosys" ]; then
	echo "Yosys source dir already exists"
    else
	echo "does not exists, cloning..."
	git clone --branch yosys-0.17 https://github.com/YosysHQ/yosys
    fi
    cd yosys
    make -j$(nproc)
    sudo make install
  if [ $? -ne 0 ]
  then
    echo "Downloading yosys package failed."
    cleanup
    exit 1
  fi
else
    echo "Yosys is already installed. Using your current installation"
    sudo make install
fi
