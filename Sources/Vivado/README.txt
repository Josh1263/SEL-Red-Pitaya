MATLAB Version: 2026a
Vivado Version: 2024.1


NOTE: Building only needs to be done once, after that the project can be opened in Vivado GUI
To build the project:
1. download this repo
2. open Vivado (or Tcl shell) set this as working directory
3. run build.tcl

Send overlay to board:
run in tcl console: source program_fpga, or make a custom tcl shortcut linked to program_fpga.tcl

If building for the 7020 chip:
1. change the device in the build.tcl
2. regenerate the IP in Simulink with matching 7020 device
3. replace IP in simulink_hdl_coder
4. run build.tcl
5. If project is already built for old part, just change project device and upgrade IP with newly generated version, this will be simple if the IP is sent to the same folder and just overwrites the previous version

adjust the build script as you like, change the project/directory name if you want

(7020 device: xc7z020clg400-1)