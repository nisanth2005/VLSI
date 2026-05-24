# Smart Cold Storage Temperature Controller

## Overview

This project implements a **Smart Cold Storage Temperature Controller** using **Verilog HDL**.  
The system continuously monitors the storage temperature and automatically controls the cooling system to maintain safe temperature conditions.

The controller uses:
- Temperature monitoring
- Hysteresis window control
- Finite State Machine (FSM)
- Multi-level cooling control
- Temperature violation alert system

The design is implemented and verified using FPGA design tools and simulation waveforms.

---

# Problem Statement

Develop a controller capable of:
- Monitoring temperature continuously
- Activating cooling when temperature exceeds limits
- Preventing frequent ON/OFF switching using hysteresis
- Generating alerts during critical temperature conditions
- Supporting reset functionality

---

# Features

- Real-time temperature monitoring
- Automatic cooling activation
- Hysteresis based window control
- Multi-level cooling operation
- Critical temperature alert generation
- FSM based control architecture
- Reset support

---

# System Architecture

The project contains four major modules:
<img width="1824" height="917" alt="image" src="https://github.com/user-attachments/assets/ecb79d60-a8a0-4e69-97c9-44ca06a2354a" />


| Module | Function |
|--------|----------|
| `window.v` | Temperature window detection |
| `fsm.v` | State machine controller |
| `multicooling.v` | Cooling level controller |
| `topmodule.v` | Top-level integration module |

---

# Working Principle

## 1. Temperature Monitoring

The system continuously checks the temperature input.

Three conditions are monitored:
- Below lower limit
- Above upper limit
- Critical temperature condition

---

## 2. Hysteresis Window Control

A temperature window is used to avoid frequent switching of the cooling system.

### Temperature Limits

| Condition | Temperature |
|-----------|-------------|
| Lower Limit | 18°C |
| Upper Limit | 25°C |
| Critical Limit | 35°C |

### Operation
- If temperature exceeds 25°C → Cooling starts
- If temperature falls below 18°C → Cooling stops
- If temperature exceeds 35°C → Alert activated

---

# FSM Based Control

The controller uses a **Finite State Machine (FSM)** with three states.

| State | Description |
|------|-------------|
| MONITOR | Normal monitoring state |
| COOLING | Cooling system active |
| ALERT | Critical temperature condition |

---

## State Transitions

### MONITOR State
- Waits for temperature increase
- Moves to COOLING state if temperature exceeds upper limit

### COOLING State
- Activates cooling levels
- Returns to MONITOR when temperature drops below lower limit
- Moves to ALERT state if temperature becomes critical

### ALERT State
- Critical condition detected
- Alert remains active until reset

---

# Multi-Level Cooling Control

Different cooling levels are applied based on temperature.

| Temperature Range | Cooling Level |
|------------------|---------------|
| Below 25°C | 00 |
| 25°C – 27°C | 01 |
| 28°C – 31°C | 10 |
| Above 32°C | 11 |

This improves:
- Energy efficiency
- Cooling performance
- System reliability

---

# Module Explanation

## window.v
This module compares the temperature with predefined limits and generates:
- `below_lower`
- `above_upper`
- `critical`

signals.

---

## fsm.v
This module controls the system states:
- MONITOR
- COOLING
- ALERT

based on temperature conditions.

---

## multicooling.v
This module generates cooling levels according to:
- Current temperature
- Current FSM state

---

## topmodule.v
This module integrates:
- Window comparator
- FSM controller
- Cooling controller

and generates the final alert output.

---

# Simulation

The testbench verifies:
- Temperature monitoring
- Cooling activation
- State transitions
- Alert generation
- Reset functionality
  <img width="1854" height="1055" alt="image" src="https://github.com/user-attachments/assets/a1d8c36f-5234-4351-894f-02beeafc7c97" />


Different temperature values are applied during simulation to verify system behavior.

---

# Expected System Behavior

| Temperature | System Action |
|-------------|---------------|
| Below 18°C | Cooling OFF |
| 25°C – 27°C | Low cooling |
| 28°C – 31°C | Medium cooling |
| Above 32°C | Maximum cooling |
| Above 35°C | Alert activated |

---

# Results

## Power Result
- Total Power = **12.9434**

## Area Result
- Total Area = **65.262863**

## Timing Result
- Timing Slack (MET) = **0.34**

---

# Applications

- Smart cold storage systems
- Food preservation systems
- Medical storage units
- Industrial refrigeration
- Warehouse temperature monitoring
- Automated cooling systems

---

# Advantages

- Reduces energy consumption
- Prevents temperature damage
- Improves cooling efficiency
- Avoids frequent switching
- Reliable alert mechanism
- FPGA based high-speed operation

---

# Future Enhancements
---

# FPGA Implementation

The design is synthesized and implemented on FPGA hardware using Verilog HDL.

Implementation includes:
- RTL synthesis
- Schematic generation
- Gate-level netlist
- Timing analysis
- Power analysis
- Area optimization

- IoT based monitoring
- LCD temperature display
- Mobile application control
- Wireless temperature sensing
- AI based cooling optimization
- Sensor integration

---

# Conclusion

This project successfully implements a Smart Cold Storage Temperature Controller using Verilog HDL. The system efficiently monitors temperature, controls cooling levels, and generates alerts during critical conditions. The FSM based architecture improves reliability, energy efficiency, and system performance.

