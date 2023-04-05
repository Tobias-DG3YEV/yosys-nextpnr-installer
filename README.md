# yosys-nextpnr-installer
Here you find helper scripts and Debian packages to set up a open source FPGA toolchain with Yosys and nextpnr-xilinx

use this script to download the matching version 0.17 of Yosys from github, build and install it.
```
yosys-installer.sh
```

nextpnr-xilinx-*_amd64.deb contains the amd64 compiled version of nextpnr-xilinx and all needed files of the prjxray project

Install it by executing the following command:
```
sudo apt install -f ./nextpnr-xilinx-*_amd64.deb
```

After installation reboot or run the following command to set all needed search paths to your enviroment variables.
```
source /etc/profile.d/10-nextpnr-xilinx.sh
```

openFPGAloader-installer downloads trabucayre's openFPGAloader from github, compiles and installs it.

```
openFPGAloader-installer.sh
```
