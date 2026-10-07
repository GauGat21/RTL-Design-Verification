## PIPO Register
# Objective
Design and verify a Parallel-In Parallel-Out (PIPO) register.
The register loads multiple bits simultaneously through parallel inputs on the active clock edge and makes the stored data available simultaneously through parallel outputs.
# Concept
A PIPO register consists of multiple flip-flops operating together.
For a 4-bit PIPO register:
- All 4 input bits are loaded simultaneously.
- Data is captured on the active clock edge.
- The stored 4-bit value remains unchanged until the next load.
- The stored value is available through the parallel output.
# Basic architecture:
              Clock
                |
        +-------+-------+-------+-------+
        |       |       |       |
        v       v       v       v
      [DFF]   [DFF]   [DFF]   [DFF]
        |       |       |       |
        v       v       v       v
       Q0      Q1      Q2      Q3

        ↑       ↑       ↑       ↑
        |       |       |       |
       D0      D1      D2      D3

             Parallel Input

# Load Operation
For a 4-bit register:
Q[0] <= D[0]
Q[1] <= D[1]
Q[2] <= D[2]
Q[3] <= D[3]

This can be expressed compactly as:
Q <= D

On every active clock edge, the entire 4-bit input is captured simultaneously.

https://www.edaplayground.com/x/BuZ5
