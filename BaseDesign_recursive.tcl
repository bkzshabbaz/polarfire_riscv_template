#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source hdl_source.tcl
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source components/CoreAPB3_0.tcl 
source components/CoreGPIO_IN.tcl 
source components/CoreGPIO_OUT.tcl 
source components/CoreJTAGDebug_0.tcl 
source components/CoreRESET_PF_0.tcl 
source components/CoreTimer_0.tcl 
source components/CoreTimer_1.tcl 
source components/CoreUARTapb_0.tcl 
source components/MIV_RV32_CFG1_0.tcl 
source components/PF_CCC_0.tcl 
source components/PF_INIT_MONITOR_0.tcl 
source components/PF_OSC_0.tcl 
source components/PF_SRAM_0.tcl 
source components/BaseDesign.tcl 
build_design_hierarchy
