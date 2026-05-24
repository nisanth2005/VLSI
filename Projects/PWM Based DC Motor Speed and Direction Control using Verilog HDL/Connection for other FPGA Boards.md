                                                    Edge Artix 7 board 
                                                   
<img width="1200" height="1200" alt="image" src="https://github.com/user-attachments/assets/e9a6922b-340c-46ac-8ac9-368ef8ddbeef" />

Constraints for this: 


set_property -dict {PACKAGE_PIN N11 IOSTANDARD LVCMOS33} [get_ports {clk}]
set_property -dict {PACKAGE_PIN M12 IOSTANDARD LVCMOS33} [get_ports {rst}]
set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS33} [get_ports {value[0]}]   
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports {value[1]}]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports {dir}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {pwm_out}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {in1}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {in2}]
