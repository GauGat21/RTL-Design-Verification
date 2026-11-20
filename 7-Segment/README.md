# BCD to Seven-Segment Display Decoder

## Objective
Design a combinational BCD-to-seven-segment decoder using SystemVerilog to convert a 4-bit BCD input into a seven-segment display pattern.

## Concept
A seven-segment display consists of seven independently controlled LED segments named a, b, c, d, e, f, and g. The decoder maps decimal digits 0–9 to corresponding segment activation patterns.

## Design Specifications
- Input: 4-bit BCD
- Output: 7-bit segment control
- Logic type: Combinational
- Segment encoding: Active-low
- Invalid BCD inputs (10–15): All segments OFF

## RTL Implementation
The design uses an `always_comb` block and a `case` statement to map BCD inputs to seven-segment patterns. A default assignment is included for invalid BCD inputs.

## Verification
A self-checking SystemVerilog testbench verifies all 16 possible input combinations against an independent reference model.

## Test Cases
- Valid BCD digits: 0–9
- Invalid BCD values: 10–15
- Expected output comparison
- Unknown-value detection using case inequality (`!==`)

## Simulation
Simulated using Icarus Verilog on EDA Playground.

## Key Takeaways
- Combinational decoding
- Seven-segment display encoding
- Active-low logic
- `always_comb` and `case`
- Reference-model-based verification
- Exhaustive testing of a small input space

https://edaplayground.com/x/ibeD
