# PWM Based DC Motor Speed and Direction Control using Verilog HDL

## Overview
This project implements a **PWM (Pulse Width Modulation) based DC motor speed and direction control system** using **Verilog HDL** on an FPGA board.  
The design generates a PWM signal with different duty cycles to control the motor speed and also provides direction control signals for clockwise and anticlockwise rotation.

<img width="695" height="399" alt="image" src="https://github.com/user-attachments/assets/f0ae5bc5-d258-4589-b601-dc157325110f" />


What is PWM ?
Pulse-width modulation, commonly known as PWM, is a modulation method that changes the pulse signal's width in electrical systems to regulate the average power supplied to a load. PWM is particularly helpful for effectively regulating the output of audio amplifiers, the speed of motors,  brightness of light,etc..

To efficiently control power delivery to devices without wasting energy,preicsely in devices like motors, LEDs the  Duty cycle is used in PWM
Duty Cycle of PWM 
The fraction of a second that a signal or system is operational is called a duty cycle. A duty cycle is usually expressed as a percentage or ratio. The amount of time a signal takes to complete an ON-OFF cycle is called a period. The proportion of time a digital signal is on throughout a period of time or interval is precisely described by the percentage duty cycle. The waveform time is equal to its inverse frequency. 

    			Duty Cycle :  On Time / (On Time + Off Time)
We would say a digital signal has a 50% duty cycle and looks like a perfect square wave if it is on for half of the time and off for the other half. The digital signal spends more time in the high state than the low state if the percentage is greater than 50%, and vice versa if the duty cycle is lower than 50%. Here is a graph depicting the three scenarios.








A 100% duty cycle is equivalent to a 5 volt (high) voltage setting. Grounding the signal would be equivalent to 0% duty cycle.




---

## Features
- PWM signal generation using Verilog HDL
- Motor speed control using selectable duty cycles
- Clockwise and anticlockwise motor rotation
- FPGA based hardware implementation
- Simple and modular Verilog design
- Compatible with motor driver ICs

---

## Technologies Used
- Verilog HDL
- Xilinx Vivado
- FPGA (Artix-7 / Edge FPGA Board)
- PWM Technique
- DC Motor Driver (L293D/L298N)

---

## Working Principle

### PWM Speed Control
The motor speed is controlled by varying the PWM duty cycle.

Higher duty cycle → Higher average voltage → Higher motor speed.

The module uses an 8-bit counter to generate PWM signals.

### Direction Control

| dir | in1 | in2 | Direction |
|-----|-----|-----|------------|
| 0 | 0 | 1 | Anticlockwise |
| 1 | 1 | 0 | Clockwise |

---

## Duty Cycle Selection

| value | Duty Cycle | Motor Speed |
|------|-------------|--------------|
| 00 | 0% | Motor OFF |
| 01 | 25% | Slow Speed |
| 10 | 50% | Medium Speed |
| 11 | 100% | Full Speed |
<img width="928" height="476" alt="image" src="https://github.com/user-attachments/assets/e4446e48-df63-48eb-be7b-87af2f0a1632" />


---

# Verilog Module Description

## Inputs

| Signal | Description |
|--------|-------------|
| `clk` | System clock |
| `rst` | Active-high reset |
| `value[1:0]` | Duty cycle selector |
| `dir` | Direction control |

## Outputs

| Signal | Description |
|--------|-------------|
| `pwm_out` | PWM output signal |
| `in1` | Motor driver input 1 |
| `in2` | Motor driver input 2 |

---

# PWM Logic

The PWM signal is generated using:
- An 8-bit counter
- Comparison between counter and threshold value (`temp`)

If:

```verilog
counter < temp
```

Then:

```verilog
pwm_out = 1
```

Else:

```verilog
pwm_out = 0
```

---

# RTL Design Flow

1. Write Verilog HDL code
2. Create constraints (.xdc) file
3. Simulate the design
4. Synthesize the design
5. Implement on FPGA
6. Connect motor driver and DC motor
7. Observe speed and direction control

---

# Simulation

## Testbench Description

The following Verilog testbench is used to simulate and verify the PWM based DC motor speed and direction control module.

The testbench performs:
- Clock generation
- Reset operation
- Different duty cycle testing
- Direction control testing
- Functional verification of the PWM module

---
# Expected Simulation Output

| value | Duty Cycle | Motor Speed |
|------|-------------|--------------|
| 00 | 0% | Motor OFF |
| 01 | 25% | Slow Speed |
| 10 | 50% | Medium Speed |
| 11 | 100% | Full Speed |

| dir | Rotation |
|-----|-----------|
| 0 | Anticlockwise |
| 1 | Clockwise |

---
<img width="857" height="253" alt="image" src="https://github.com/user-attachments/assets/332d854f-14d9-47b3-abce-a249646eadfa" />


# Hardware Connections

## FPGA to Motor Driver

| FPGA Output | Motor Driver |
|-------------|--------------|
| pwm_out | ENA / Enable |
| in1 | IN1 |
| in2 | IN2 |

## Motor Driver to Motor
- OUT1 and OUT2 connected to DC Motor terminals

---

<img width="866" height="419" alt="image" src="https://github.com/user-attachments/assets/f343c741-5a5b-43f6-8967-b5e1d3fa6b92" />


# Applications
- Robotics
- Industrial motor control
- Embedded systems
- Electric vehicles
- Automated machines
- FPGA based control systems

---

# Future Enhancements
- Variable speed control using switches or potentiometer
- Closed-loop motor speed control
- LCD/7-segment display integration
- Bluetooth/WiFi motor control
- PID based motor controller

---

<img width="867" height="479" alt="image" src="https://github.com/user-attachments/assets/dda417d3-c849-481f-9a6a-e4847a51610a" />

# Conclusion

This project demonstrates the implementation of a PWM based DC motor controller using Verilog HDL on FPGA. The design efficiently controls both motor speed and direction using PWM techniques and digital logic, making it suitable for real-time embedded and motor control applications.

---


