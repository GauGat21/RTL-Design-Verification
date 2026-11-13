
# Full Adder

## Objective
Design and verify a 1-bit Full Adder using SystemVerilog.

## Concept
A Full Adder is a combinational circuit that adds
two single-bit operands and a carry-in.

## Boolean Expressions
- SUM = A ^ B ^ CIN
- COUT = (A & B) | ((A ^ B) & CIN)

## Architecture
The design uses propagate and generate signals
to calculate the sum and carry outputs.

## Verification Approach
A self-checking testbench applies all eight possible
input combinations and compares the DUT output
against an arithmetic reference model.

## Key Test Cases
All eight combinations of A, B, and CIN are tested.

## EDA Playground
https://www.edaplayground.com/x/URq2

## Key Takeaways
- Understood carry-in and carry-out behavior.
- Learned propagate and generate logic.
- Implemented exhaustive combinational verification.
