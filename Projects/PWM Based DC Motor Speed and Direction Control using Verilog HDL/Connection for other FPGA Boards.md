# FPGA Board Constraints

This project was tested on multiple FPGA boards using different XDC constraint files.

---

# 1. Edge Artix-7 Board

## Board Image

<img width="1200" height="1200" alt="Edge Artix 7 Board" src="https://github.com/user-attachments/assets/e9a6922b-340c-46ac-8ac9-368ef8ddbeef" />

---

## Constraints File

```tcl
set_property -dict {PACKAGE_PIN N11 IOSTANDARD LVCMOS33} [get_ports {clk}]
set_property -dict {PACKAGE_PIN M12 IOSTANDARD LVCMOS33} [get_ports {rst}]
set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS33} [get_ports {value[0]}]
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports {value[1]}]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports {dir}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {pwm_out}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {in1}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {in2}]
```

---

# 2. Arty A7 Board
<img width="225" height="225" alt="image" src="https://github.com/user-attachments/assets/54c6394b-13c2-471c-84a5-25d9a59d1396" />

---

## Constraints File

```tcl
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { CLK100MHZ }];
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33} [get_ports {rst}]
set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS33} [get_ports {value[0]}]
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33} [get_ports {value[1]}]
set_property -dict {PACKAGE_PIN C10 IOSTANDARD LVCMOS33} [get_ports {dir}]
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports {pwm_out}]
set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS33} [get_ports {in1}]
set_property -dict {PACKAGE_PIN A11 IOSTANDARD LVCMOS33} [get_ports {in2}]
```

---

# 3. ZedBoard
<img width="237" height="212" alt="image" src="https://github.com/user-attachments/assets/d7ebef84-ed45-4afe-973d-1418d282fea9" />

---
## Constraints File

```tcl
set_property PACKAGE_PIN Y9 [get_ports {clk}]
set_property PACKAGE_PIN P16 [get_ports {rst}]
set_property PACKAGE_PIN T22 [get_ports {value[0]}]  
set_property PACKAGE_PIN T21 [get_ports {value[1]}]   
set_property PACKAGE_PIN U22 [get_ports {dir}]       
et_property PACKAGE_PIN Y11 [get_ports {pwm_out]}] 
set_property PACKAGE_PIN A11 [get_ports {in1}]  
set_property PACKAGE_PIN Y19 [get_ports {in2]     

```

---

# Pin Description

| Signal | Description |
|--------|-------------|
| `clk` | System clock input |
| `rst` | Reset input |
| `value[1:0]` | Duty cycle selection |
| `dir` | Direction control |
| `pwm_out` | PWM output signal |
| `in1` | Motor driver input 1 |
| `in2` | Motor driver input 2 |

---
