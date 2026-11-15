
# 8-bit Subtractor

## Objective
Design and verify an 8-bit unsigned subtractor using SystemVerilog.

## Concept
The subtractor performs binary subtraction of two 8-bit operands
and produces an 8-bit difference and a final borrow output.

## Architecture
The design consists of eight Full Subtractor stages connected
in a ripple borrow configuration.

## Inputs and Outputs
- A[7:0]: Minuend
- B[7:0]: Subtrahend
- DIFF[7:0]: Difference
- BORROW: Final borrow output

## Verification Approach
A self-checking testbench exhaustively tests all 65,536
possible input combinations using a 9-bit arithmetic
reference model.

## Key Test Cases
- Zero minus zero
- Equal operands
- A greater than B
- A smaller than B
- Maximum value minus zero
- Zero minus maximum value
- Borrow propagation across multiple bit positions

## EDA Playground
https://www.edaplayground.com/x/Smdb

## Key Takeaways
- Understood binary subtraction.
- Learned Full Subtractor borrow logic.
- Implemented a ripple borrow architecture.
- Distinguished unsigned borrow from signed overflow.
- Performed exhaustive self-checking verification.
