# Creating SmartDesign BaseDesign
set sd_name {BaseDesign}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USER_RST} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}



# Add CoreAPB3_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_0} -instance_name {CoreAPB3_0}



# Add CoreGPIO_IN instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_IN} -instance_name {CoreGPIO_IN}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_IN:GPIO_IN} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_IN:GPIO_IN} -pin_slices {[1:1]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_IN:INT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_IN:GPIO_OUT}



# Add CoreGPIO_OUT instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_OUT} -instance_name {CoreGPIO_OUT}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[3:3]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:GPIO_IN} -value {GND}



# Add CoreJTAGDebug_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreJTAGDebug_0} -instance_name {CoreJTAGDebug_0}



# Add CoreRESET_PF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreRESET_PF_0} -instance_name {CoreRESET_PF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:FPGA_POR_N} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:PLL_POWERDOWN_B}



# Add CoreTimer_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreTimer_0} -instance_name {CoreTimer_0}



# Add CoreTimer_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreTimer_1} -instance_name {CoreTimer_1}



# Add CoreUARTapb_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreUARTapb_0} -instance_name {CoreUARTapb_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:TXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:RXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:OVERFLOW}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:FRAMING_ERR}



# Add MIV_RV32_CFG1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32_CFG1_0} -instance_name {MIV_RV32_CFG1_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_0:JTAG_TDO_DR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_0:EXT_RESETN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_0:TIME_COUNT_OUT}



# Add PF_CCC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_0} -instance_name {PF_CCC_0}



# Add PF_INIT_MONITOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_INIT_MONITOR_0} -instance_name {PF_INIT_MONITOR_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:FABRIC_POR_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:AUTOCALIB_DONE}



# Add PF_OSC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_OSC_0} -instance_name {PF_OSC_0}



# Add PF_SRAM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SRAM_0} -instance_name {PF_SRAM_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_IN:GPIO_IN[0:0]" "SW_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_IN:GPIO_IN[1:1]" "SW_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_IN:PCLK" "CoreGPIO_OUT:PCLK" "CoreRESET_PF_0:CLK" "CoreTimer_0:PCLK" "CoreTimer_1:PCLK" "CoreUARTapb_0:PCLK" "MIV_RV32_CFG1_0:CLK" "PF_CCC_0:OUT0_FABCLK_0" "PF_SRAM_0:HCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_IN:PRESETN" "CoreGPIO_OUT:PRESETN" "CoreRESET_PF_0:FABRIC_RESET_N" "CoreTimer_0:PRESETn" "CoreTimer_1:PRESETn" "CoreUARTapb_0:PRESETN" "MIV_RV32_CFG1_0:RESETN" "PF_SRAM_0:HRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[0:0]" "LED_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[1:1]" "LED_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[2:2]" "LED_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[3:3]" "LED_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TCK_0" "MIV_RV32_CFG1_0:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TDI_0" "MIV_RV32_CFG1_0:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TDO_0" "MIV_RV32_CFG1_0:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TMS_0" "MIV_RV32_CFG1_0:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TRSTN_0" "MIV_RV32_CFG1_0:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreRESET_PF_0:EXT_RST_N" "USER_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreRESET_PF_0:INIT_DONE" "PF_INIT_MONITOR_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreRESET_PF_0:PLL_LOCK" "PF_CCC_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_0:TIMINT" "MIV_RV32_CFG1_0:MSYS_EI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_1:TIMINT" "MIV_RV32_CFG1_0:EXT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_0:RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_0:TX" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_0:REF_CLK_0" "PF_OSC_0:RCOSC_160MHZ_GL" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APB3mmaster" "MIV_RV32_CFG1_0:APB_MSTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave1" "CoreUARTapb_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave2" "CoreGPIO_IN:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave3" "CoreTimer_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave4" "CoreTimer_1:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave5" "CoreGPIO_OUT:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_CFG1_0:AHBL_M_SLV" "PF_SRAM_0:AHBSlaveInterface" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign BaseDesign
generate_component -component_name ${sd_name}
