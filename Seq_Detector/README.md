
# 1011 Sequence Detector — Moore and Mealy FSM

## Objective

Design and verify serial sequence detectors for the binary pattern `1011` using both Moore and Mealy finite state machines.

## Concept

A sequence detector monitors a serial input stream and asserts an output whenever the specified bit pattern is detected.

This project implements overlapping sequence detection.

For example, the input stream `1011011` contains two occurrences of `1011`.

## Architecture

### Moore FSM

The Moore implementation uses five states:

- S0: No bits matched
- S1: Matched 1
- S2: Matched 10
- S3: Matched 101
- S4: Pattern 1011 detected

The output is asserted when the FSM enters S4.

### Mealy FSM

The Mealy implementation uses four states:

- S0: No bits matched
- S1: Matched 1
- S2: Matched 10
- S3: Matched 101

The output is asserted when the FSM is in S3 and the current input is 1.

## Overlapping Detection

Both implementations retain useful matched bits after detecting the pattern.

This allows consecutive occurrences of `1011` to share input bits.

## Verification Approach

A self-checking SystemVerilog testbench verifies both implementations.

The reference model uses a sliding four-bit history:

`expected = (last_four_bits == 4'b1011)`

Mealy output is checked before the active clock edge, while Moore output is checked after the state update.

## Key Test Cases

- Input sequences without a match
- Exact occurrence of `1011`
- Multiple occurrences
- Overlapping occurrences
- Reset behavior
- Continuous serial input

## EDA Playground

Link: https://edaplayground.com/x/kX6Q

## Key Takeaways

- Difference between Moore and Mealy FSMs
- State transition design
- Overlapping sequence detection
- Sequential and combinational logic separation
- Self-checking verification using an independent reference model
