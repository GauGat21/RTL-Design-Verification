## PISO Shift Register
# Objective
Design and verify a Parallel-In Serial-Out (PISO) shift register.
The register loads multiple bits simultaneously through parallel inputs and then shifts them out one bit at a time through a serial output.
# Concept
A PISO shift register performs the opposite conversion of a SIPO register:
Parallel Data → Serial Data

For a 4-bit PISO register:
- Four bits are loaded simultaneously.
- A control signal selects between parallel load and shift.
- After loading, one bit is shifted out on each clock cycle.
- The serial output provides the stored data one bit at a time.
# Architecture
For this design, use:
parallel input → Q0 → Q1 → Q2 → Q3 → serial output

             Parallel Input
                 
        P0       P1       P2       P3
        │        │        │        │
        ▼        ▼        ▼        ▼
      ┌────┐   ┌────┐   ┌────┐   ┌────┐
      │MUX │   │MUX │   │MUX │   │MUX │
      └─┬──┘   └─┬──┘   └─┬──┘   └─┬──┘
        ▼        ▼        ▼        ▼
      [DFF] ──► [DFF] ──► [DFF] ──► [DFF] ──► SO
        Q0       Q1       Q2       Q3
         ▲
         │
      Shift/Load

Each flip-flop has a multiplexer at its input.
The multiplexer selects either:
- parallel input, during load
- previous flip-flop data, during shift
# Control Operation
Use a control signal:
load = 1 → Parallel Load
load = 0 → Shift

Parallel Load
When load = 1:
Q <= parallel_in
