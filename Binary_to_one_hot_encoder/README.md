Binary to One-Hot Encoder

## Objective

Design and verify a Binary-to-One-Hot converter.

The circuit takes an N-bit binary input and produces a 2^N-bit
one-hot output.

Only one output bit is HIGH at a time, corresponding to the
binary value of the input.

---

## Concept

A binary-to-one-hot converter converts a binary value into a
vector in which exactly one bit is set to `1`.

For a 2-bit input, there are:

2^2 = 4

possible input values.

Therefore, the output contains 4 bits.

---

## Example

For a 2-bit input:

| Binary Input | One-Hot Output |
|--------------|----------------|
| 00 | 0001 |
| 01 | 0010 |
| 10 | 0100 |
| 11 | 1000 |

Only one output bit is HIGH for each input value.

---

## General Relationship

For an N-bit binary input:

```text
Number of input combinations = 2^N
Number of output bits = 2^N
