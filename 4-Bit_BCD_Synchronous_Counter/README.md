# 4-Bit BCD Synchronous Counter

## Objective

Design a **4-bit synchronous BCD counter** that counts from `0` to `9` and then returns to `0`.

The counter should operate only on the **positive edge of the clock** and use a **synchronous active-high reset**.

---

## Concept

A normal 4-bit binary counter has 16 possible states:

```text
0000 → 0001 → 0010 → ... → 1111
  0      1      2            15
```
https://www.edaplayground.com/x/f2WN
