# ==============================================================================
# Vivado Pure Block-Design Handoff Script
# ==============================================================================

# 1. Project Configuration
set proj_name "handoff_project"
set proj_dir  "./vivado_project"
set fpga_part "xc7z010clg400-1" ;# Verify this matches your target board

# 2. Create the Project Container
create_project $proj_name $proj_dir -part $fpga_part -force

# 3. Register Custom IP Repositories
set_property ip_repo_paths [list ./ip_repo/simulink_hdl_coder ./ip_repo/board_peripheral] [current_project]
update_ip_catalog -rebuild

# 4. Import Physical and Timing Constraints
if {[llength [glob -nocomplain ./constraints/*.xdc]] > 0} { 
    add_files -fileset constrs_1 [glob ./constraints/*.xdc] 
}

# 5. Reconstruct the Block Design
source ./bd/system_bd.tcl

# 6. Generate Block Design Outputs and Top VHDL Wrapper Automatically
set bd_file [get_files *.bd]
generate_target all [get_files $bd_file]
make_wrapper -files [get_files $bd_file] -top
add_files -norecurse [file normalize [glob $proj_dir/${proj_name}.srcs/sources_1/bd/*/hdl/*_wrapper.vhd]]

# 7. Finalize Project Hierarchy
set_property top SEL_wrapper [current_fileset]
update_compile_order -fileset sources_1

puts "=========================================================================="
puts "SUCCESS: Project environment completely reconstructed!"
puts "=========================================================================="