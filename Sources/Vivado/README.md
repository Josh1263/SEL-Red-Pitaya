# Vivado Build Scripts & Hardware Generation

**Toolchain Versions Used:**
* MATLAB: 2026a
* Vivado: 2024.1

## Configuration
Before running the scripts, you must open them in a text editor and update a few key parameters to match your specific hardware setup:

**In `program_fpga.tcl`:**
* `set ip <user-RP-IP>`: You **must** change this to the actual IP address of your Red Pitaya on your local network (e.g., `set ip 192.168.1.100`).
* `set user xilinx`: This is the default username for the PYNQ OS. Change this if your board uses a different login credential.

**In `build.tcl`:**
* `set fpga_part "xc7z010clg400-1"`: Update this if you are using a different chip (like the Zynq-7020).
* `set proj_name` / `set proj_dir`: You can leave these as their defaults, or customize them if you want your Vivado project named/stored differently on your local machine.

---

## How to Build the Project
*Note: Building only needs to be done once. After that, the project can be opened normally via the Vivado GUI.*

1. Clone or download this repository.
2. Open Vivado (or the Vivado Tcl Shell) and set this folder as your working directory.
3. Run the build script in the Tcl console:
   ```tcl
   source build.tcl
   ```

## Sending the Overlay to the Board
To package the bitstream and program the Red Pitaya directly from Vivado over SCP, run the following in the Tcl console:
   ```tcl
   source program_fpga.tcl
   ```
*(Tip: You can also create a custom GUI button in Vivado linked to this script for 1-click uploads).*

## Upgrading to the Zynq-7020 Chip
If you are migrating this project to a Red Pitaya or custom board with the larger Zynq-7020 part (`xc7z020clg400-1`), follow these steps:

**If building from scratch:**
1. Change the `fpga_part` variable inside `build.tcl`.
2. Regenerate the IP core in Simulink with the matching 7020 device selected in the HDL Workflow Advisor.
3. Replace the old IP in the `IP/` folder with the newly generated version.
4. Run: 
   ```tcl
   source build.tcl
   ```

**If upgrading an already-built project:**
1. Open the project in Vivado and change the Project Device in the settings.
2. Generate the new 7020 IP from Simulink and overwrite the existing IP folder.
3. Go to **IP Status -> Upgrade All** in Vivado to pull in the new definitions.