#############################
# PARAMETERS
#############################
set ip 192.168.2.99
set user xilinx
#############################
cd [get_property DIRECTORY [current_project]]
set projName [get_property NAME [current_project]]

# Explicitly defining your wrapper name for file targeting
set wrapperName "SEL_wrapper"

set overlay_dir overlay/$projName
file delete -force $overlay_dir
file mkdir $overlay_dir
puts $overlay_dir

# 1. Copy and rename the .bit file to match the PYNQ project folder name
file copy -force $projName.runs/impl_1/$wrapperName.bit $overlay_dir/$projName.bit

# 2. Copy the .hwh file
set bdName [string map {"_wrapper" ""} $wrapperName]
file copy -force [glob $projName.*/sources_1/bd/$bdName/hw_handoff/*.hwh] $overlay_dir/$projName.hwh
write_bd_tcl -force $overlay_dir/$projName.tcl

# 3. Copy and rename the .ltx debug probes file for the ILA
if {[file exists $projName.runs/impl_1/$wrapperName.ltx]} {
    file copy -force $projName.runs/impl_1/$wrapperName.ltx $overlay_dir/$projName.ltx
    puts "Found and copied debug probes file ($wrapperName.ltx -> $projName.ltx)"
} else {
    puts "WARNING: No .ltx file found at $projName.runs/impl_1/$wrapperName.ltx. Ensure your design has 'Mark Debug' signals and Implementation has finished."
}

set ::env(LD_LIBRARY_PATH) "/usr/bin/openssl"
exec scp -r $overlay_dir $user@$ip:/home/xilinx/pynq/overlays
puts "\nOverlay \"$projName\" successfully uploaded to: \n$user@$ip:/home/xilinx/pynq/overlays/$projName"