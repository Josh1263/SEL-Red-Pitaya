# Vivado Build Scripts & Hardware Generation

**Toolchain Versions Used:**
* MATLAB: 2026a
* Vivado: 2024.1

## How to Build the Project
*Note: Building only needs to be done once. After that, the project can be opened normally via the Vivado GUI.*

1. Clone or download this repository.
2. Open Vivado (or the Vivado Tcl Shell) and set this folder as your working directory.
3. Run the build script in the Tcl console:
   ```tcl
   source build.tcl
   ```

## Sending the Overlay to the Board
To program the Red Pitaya directly from Vivado, run the following in the Tcl console:
   ```tcl
   source program_fpga.tcl
   ```
*(Tip: You can also create a custom GUI button in Vivado linked to this script).*

## Upgrading to the Zynq-7020 Chip
If you are migrating this project to a Red Pitaya or custom board with the larger Zynq-7020 part (`xc7z020clg400-1`), follow these steps:

**If building from scratch:**
1. Change the target device string inside `build.tcl`.
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