
# Half Adder

## Objective
Design and verify a 1-bit Half Adder using SystemVerilog.

## Concept
A Half Adder is a combinational circuit that adds two
single-bit binary inputs and generates Sum and Carry outputs.

## Boolean Expressions
- SUM = A ^ B
- CARRY = A & B

## Architecture
The design consists of one XOR operation for Sum
and one AND operation for Carry.

## Verification Approach
A self-checking testbench applies all four possible
input combinations and compares DUT outputs against
the expected results.

## Key Test Cases
| A | B | SUM | CARRY |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

## EDA Playground
[Add your simulation link here]

## Key Takeaways
- Understood combinational RTL design.
- Implemented XOR and AND logic.
- Created an exhaustive self-checking testbench.
