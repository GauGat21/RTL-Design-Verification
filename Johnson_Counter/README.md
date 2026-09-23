Johnson Counter

## Objective

Design and verify a 4-bit Johnson counter using SystemVerilog.

A Johnson counter is a shift-register-based counter in which the complemented output of the last stage is fed back to the first stage.

For an N-bit Johnson counter, the counter cycles through `2N` states.

For this 4-bit implementation:

```text
Number of states = 2 × 4 = 8
