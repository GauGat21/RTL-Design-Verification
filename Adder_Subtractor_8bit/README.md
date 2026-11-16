
# 8-bit Adder/Subtractor

## Objective
Design and verify an 8-bit configurable adder/subtractor
using SystemVerilog.

## Concept
The circuit performs both addition and subtraction
using a common Full Adder chain.

## Operation Selection
- MODE = 0: A + B
- MODE = 1: A - B

## Architecture
The design uses XOR gates to conditionally invert
the second operand and a carry chain of eight
Full Adders.

## Boolean Operation
B_modified = B XOR {8{MODE}}
CIN = MODE

## Verification Approach
A self-checking testbench exhaustively tests all
131,072 possible input combinations using a
9-bit arithmetic reference model.

## Key Test Cases
- Addition of zero operands
- Addition with carry-out
- Subtraction of equal operands
- Subtraction when A > B
- Subtraction when A < B
- Maximum and minimum operand combinations

## EDA Playground
https://www.edaplayground.com/x/mh8H

## Key Takeaways
- Understood two's complement subtraction.
- Learned conditional inversion using XOR.
- Combined addition and subtraction in one circuit.
- Understood carry-out and borrow interpretation.
- Implemented exhaustive self-checking verification.
