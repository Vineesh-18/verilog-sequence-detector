# Sequence Detector Using Verilog HDL

## Overview
This project implements a sequence detector using Verilog HDL and a Finite State Machine (FSM). The design processes serial input data on the rising edge of the clock and asserts the detection output when the FSM reaches its detection state.

The design separates sequential state storage from combinational next-state and output logic.

## Design Features
- 5-state Finite State Machine (FSM)
- 3-bit state encoding
- Asynchronous active-high reset
- Clock-driven state transitions
- Combinational next-state logic
- Sequence detection output
- Testbench for functional simulation

## State Encoding

| State | Encoding |
|---|---|
| S0 | `000` |
| S1 | `001` |
| S2 | `010` |
| S3 | `011` |
| S4 | `100` |

The FSM starts in state S0 after reset. The output `sequence_detected` becomes high when the current state is S4.

## Project Files
- `Sequence_detector.v` — RTL implementation of the sequence detector.
- `tb.v` — Testbench used to generate clock and reset signals, apply serial input data, and monitor the simulation.

## Tools Used
- Verilog HDL
- Icarus Verilog

## Simulation
The design is compiled and simulated using Icarus Verilog. The testbench applies reset, generates clock cycles, provides serial input data, and monitors the current FSM state and sequence detection output.

### How to Run

Compile the Verilog design and testbench:

```bash
iverilog -o sequence_detector_sim Sequence_detector.v tb.v
```

Run the simulation:

```bash
vvp sequence_detector_sim
```

## Concepts Demonstrated
- Finite State Machine design
- Sequential and combinational logic
- Asynchronous reset
- State encoding and transitions
- Testbench development
- RTL functional simulation

## Possible Improvements
- Add more test cases for different input sequences.
- Verify reset behavior and detection timing.
- Test overlapping sequence detection.
