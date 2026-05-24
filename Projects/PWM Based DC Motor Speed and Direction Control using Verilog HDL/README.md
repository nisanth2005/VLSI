PWM Based DC Motor Speed and Direction Control using Verilog HDL
Overview

This project implements a PWM (Pulse Width Modulation) based DC motor speed and direction control system using Verilog HDL on an FPGA board.
The design generates a PWM signal with different duty cycles to control the motor speed and also provides direction control signals for clockwise and anticlockwise rotation.

The project is designed using Xilinx Vivado and can be implemented on an FPGA development board with an external motor driver module such as L293D or L298N.

Features
PWM signal generation using Verilog HDL
Motor speed control using selectable duty cycles
Clockwise and anticlockwise motor rotation
FPGA based hardware implementation
Simple and modular Verilog design
Compatible with motor driver ICs
Technologies Used
Verilog HDL
Xilinx Vivado
FPGA (Artix-7 / Edge FPGA Board)
PWM Technique
DC Motor Driver (L293D/L298N)
Working Principle
PWM Speed Control

The motor speed is controlled by varying the PWM duty cycle.

Higher duty cycle → Higher average voltage → Higher motor speed.

The module uses an 8-bit counter to generate PWM signals.

Direction Control

Two outputs (in1 and in2) control the motor direction:

dir	in1	in2	Direction
0	0	1	Anticlockwise
1	1	0	Clockwise
Duty Cycle Selection
value	Duty Cycle	Motor Speed
00	0%	Motor OFF
01	25%	Slow Speed
10	50%	Medium Speed
11	100%	Full Speed
Verilog Module Description
Inputs
Signal	Description
clk	System clock
rst	Active-high reset
value[1:0]	Duty cycle selector
dir	Direction control
Outputs
Signal	Description
pwm_out	PWM output signal
in1	Motor driver input 1
in2	Motor driver input 2
PWM Logic

The PWM signal is generated using:

An 8-bit counter
Comparison between counter and threshold value (temp)

If:

counter < temp

Then:

pwm_out = 1

Else:

pwm_out = 0
RTL Design Flow
Write Verilog HDL code
Create constraints (.xdc) file
Simulate the design
Synthesize the design
Implement on FPGA
Connect motor driver and DC motor
Observe speed and direction control
Constraints File (XDC)
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {clk}]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {rst}]
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {value[0]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {value[1]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {dir}]
set_property -dict {PACKAGE_PIN A14 IOSTANDARD LVCMOS33} [get_ports {pwm_out}]
set_property -dict {PACKAGE_PIN B14 IOSTANDARD LVCMOS33} [get_ports {in1}]
set_property -dict {PACKAGE_PIN A13 IOSTANDARD LVCMOS33} [get_ports {in2}]
Hardware Connections
FPGA to Motor Driver
FPGA Output	Motor Driver
pwm_out	ENA / Enable
in1	IN1
in2	IN2
Motor Driver to Motor
OUT1 and OUT2 connected to DC Motor terminals
Simulation Result

The PWM waveform changes according to the selected duty cycle:

25% → Short HIGH pulse
50% → Equal HIGH and LOW pulse
100% → Fully HIGH output

Direction changes according to dir input.

Applications
Robotics
Industrial motor control
Embedded systems
Electric vehicles
Automated machines
FPGA based control systems
Future Enhancements
Variable speed control using switches or potentiometer
Closed-loop motor speed control
LCD/7-segment display integration
Bluetooth/WiFi motor control
PID based motor controller
Folder Structure
PWM-DC-Motor-Control/
│
├── pwm.v                # Verilog HDL source code
├── constraints.xdc      # FPGA constraints file
├── simulation/          # Simulation files
├── images/              # RTL schematic and waveform images
└── README.md            # Project documentation
Conclusion

This project demonstrates the implementation of a PWM based DC motor controller using Verilog HDL on FPGA. The design efficiently controls both motor speed and direction using PWM techniques and digital logic, making it suitable for real-time embedded and motor control applications.

Author

Nisanth S

License

This project is open-source and available under the MIT License.
