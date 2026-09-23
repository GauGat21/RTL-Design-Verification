Ring Counter

## Objective

Design and verify a 4-bit Ring Counter using SystemVerilog.

A Ring Counter is a special application of a Serial-In Serial-Out (SISO)
shift register in which the output of the last flip-flop is fed back to the
input of the first flip-flop.

For an N-bit Ring Counter:

```text
Number of states = N
