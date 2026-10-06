# 4-Bit Carry Look-Ahead Adder

## Objective

Design and verify a 4-bit Carry Look-Ahead Adder (CLA) that adds two 4-bit binary numbers with an input carry and produces a 4-bit sum and final carry.

The main goal is to understand how carry look-ahead logic reduces carry propagation delay compared with a conventional Ripple Carry Adder.

---

## Concept

A Ripple Carry Adder passes the carry from one bit to the next:

    C0 -> C1 -> C2 -> C3 -> C4

Each stage must wait for the previous carry, creating carry propagation delay.

A Carry Look-Ahead Adder calculates the carry signals using Generate and Propagate signals.

For each bit:

    Pi = Ai ^ Bi
    Gi = Ai & Bi

Where:

- Pi = Propagate
- Gi = Generate

The carry equations for a 4-bit CLA are:

    C1 = G0 + P0Cin

    C2 = G1 + P1G0 + P1P0Cin

    C3 = G2 + P2G1 + P2P1G0 + P2P1P0Cin

    C4 = G3 + P3G2 + P3P2G1
         + P3P2P1G0
         + P3P2P1P0Cin

The sum equations are:

    S0 = P0 ^ Cin
    S1 = P1 ^ C1
    S2 = P2 ^ C2
    S3 = P3 ^ C3

---

## Hardware Architecture

    A[3:0] ─────┐
                 │
    B[3:0] ─────┼──> Propagate / Generate Logic
                 │
    Cin ────────┘
                        │
                        ▼
                Carry Look-Ahead Logic
                        │
                  C1 C2 C3 C4
                        │
                        ▼
                  Sum Generation
                        │
                        ▼
                     Sum[3:0]

---

## Ripple Carry vs Carry Look-Ahead

### Ripple Carry Adder

    C0 -> C1 -> C2 -> C3 -> C4

The carry propagates sequentially through the adder stages.

### Carry Look-Ahead Adder

    P/G Generation
          |
          v
    Carry Look-Ahead Logic
          |
          +----> C1
          +----> C2
          +----> C3
          +----> C4

The carry signals are calculated using the P/G equations instead of waiting for the previous carry to propagate.

---

## Design

### Inputs

- A[3:0] - First 4-bit operand
- B[3:0] - Second 4-bit operand
- cin - Input carry

### Outputs

- Sum[3:0] - 4-bit addition result
- cout - Final carry

### Internal Signals

- P[3:0] - Propagate signals
- G[3:0] - Generate signals
- C[3:0] - Carry signals

The design is purely combinational and does not use a clock or reset.

---

## Verification

For a 4-bit CLA:

    16 possible A values
    x
    16 possible B values
    x
    2 possible cin values
    =
    512 total combinations

Therefore, exhaustive verification is practical.

The testbench checks:

    {cout, Sum} == A + B + cin

for every possible combination of A, B, and cin.

---

## Verification Strategy

The testbench uses nested loops:

    A = 0 to 15
    B = 0 to 15
    cin = 0 to 1

For each combination, the expected result is calculated using:

    expected = A + B + cin

The DUT output is then compared against the expected value.

---

## Important Test Cases

Examples include:

    0000 + 0000 + 0 = 00000

    0000 + 0000 + 1 = 00001

    1111 + 0001 + 0 = 10000

    1111 + 1111 + 1 = 11111

The exhaustive testbench also verifies carry generation, carry propagation, Cin = 0, Cin = 1, and final Cout generation.

---

## EDA Playground

EDA Playground: https://www.edaplayground.com/x/LYdL

Simulator: Icarus Verilog / SystemVerilog

---

## Key Takeaways

    Ripple Carry:
    Simple hardware -> Higher carry propagation delay

    Carry Look-Ahead:
    More hardware -> Faster carry computation

The core concept is:

    CLA trades additional hardware complexity
    for reduced carry propagation delay.
