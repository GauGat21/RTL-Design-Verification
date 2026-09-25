Parity Generator

## Objective

Design and verify an odd parity generator.

The circuit adds one parity bit to a binary data word so that the
total number of `1`s in the transmitted data, including the parity bit,
is odd.

---

## Concept

This design uses an **odd parity generator**.

If the input data already contains an odd number of `1`s, the parity
bit is `0`.

If the input data contains an even number of `1`s, the parity bit is
`1` so that the total number of `1`s becomes odd.

---

## Example

For a 4-bit data input:

| Data | Number of 1s | Parity bit | Total 1s |
|------|--------------|------------|----------|
| 0000 | 0 | 1 | 1 |
| 0001 | 1 | 0 | 1 |
| 0011 | 2 | 1 | 3 |
| 0111 | 3 | 0 | 3 |
| 1111 | 4 | 1 | 5 |

---

## Logic

For odd parity, the parity bit is generated using XOR.

For four input bits:

```text
parity = A ^ B ^ C ^ D
