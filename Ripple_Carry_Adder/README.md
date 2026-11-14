
# 4-bit Ripple Carry Adder

## Objective
Design and verify a 4-bit Ripple Carry Adder using SystemVerilog.

## Concept
A Ripple Carry Adder performs binary addition using
multiple Full Adders connected in a carry chain.

## Architecture
The design contains four Full Adder stages.
The carry output of each stage is connected to the
carry input of the next stage.

## Inputs and Outputs
- A[3:0]: First operand
- B[3:0]: Second operand
- CIN: Initial carry input
- SUM[3:0]: Sum output
- COUT: Final carry output

## Verification Approach
A self-checking testbench exhaustively tests all
512 possible input combinations.

The expected result is calculated using a 5-bit
arithmetic reference model.

## Key Test Cases
- Zero plus zero
- Maximum operand plus maximum operand
- Addition with carry-in
- Carry propagation across multiple stages
- All possible combinations of both operands and CIN

## EDA Playground
[Add your simulation link here]

## Key Takeaways
- Understood structural RTL design.
- Learned generate loops and module instantiation.
- Understood carry propagation.
- Explored the timing limitation of Ripple Carry Adders.
- Implemented exhaustive self-checking verification.
