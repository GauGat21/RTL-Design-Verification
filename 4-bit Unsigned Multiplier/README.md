
# 4-bit Unsigned Multiplier

## Objective
Design and verify a 4-bit unsigned multiplier using SystemVerilog.

## Concept
The multiplier multiplies two 4-bit unsigned operands
and produces an 8-bit product.

## Architecture
The design generates four partial products using
bitwise AND operations. Each partial product is
shifted according to the corresponding multiplier bit
position. All partial products are added to produce
the final product.

## Inputs and Outputs
- A[3:0]: Multiplicand
- B[3:0]: Multiplier
- PRODUCT[7:0]: Multiplication result

## Verification Approach
A self-checking testbench exhaustively tests all
256 possible input combinations using an arithmetic
reference model.

## Key Test Cases
- Multiplication by zero
- Multiplication by one
- Equal operands
- Maximum operands (15 x 15)
- Different partial-product combinations

## EDA Playground
https://www.edaplayground.com/x/LvNy

## Key Takeaways
- Understood binary multiplication.
- Learned partial-product generation.
- Understood shifted partial products.
- Implemented combinational multiplication RTL.
- Performed exhaustive self-checking verification.
