set local_dir [pwd]
set project_name "RISCV_Base"
set project_dir "$local_dir/$project_name"

new_project \
    -location $project_name \
    -name $project_name \
    -project_description {} \
    -block_mode 0 \
    -standalone_peripheral_initialization 0 \
    -instantiate_in_smartdesign 1 \
    -ondemand_build_dh 1 \
    -use_relative_path 0 \
    -linked_files_root_dir_env {} \
    -hdl {VHDL} \
    -family {PolarFire} \
    -die {MPF100T} \
    -package {FCG484} \
    -speed {STD} \
    -die_voltage {1.0} \
    -part_range {EXT} \
    -adv_options {IO_DEFT_STD:LVCMOS 1.8V} \
    -adv_options {RESTRICTPROBEPINS:0} \
    -adv_options {RESTRICTSPIPINS:0} \
    -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} \
    -adv_options {TEMPR:EXT} \
    -adv_options {VCCI_1.2_VOLTR:EXT} \
    -adv_options {VCCI_1.5_VOLTR:EXT} \
    -adv_options {VCCI_1.8_VOLTR:EXT} \
    -adv_options {VCCI_2.5_VOLTR:EXT} \
    -adv_options {VCCI_3.3_VOLTR:EXT} \
    -adv_options {VOLTR:EXT}

source BaseDesign_recursive.tcl

save_project
build_design_hierarchy
set_root "BaseDesign"

# TODO Add pulling in of constraints
# 
