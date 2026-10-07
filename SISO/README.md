# Day 10 - SISO Shift Register

## Objective

Design and verify a Serial-In Serial-Out (SISO) shift register.

The register accepts data one bit at a time through a serial input and shifts the stored data by one position on every active clock edge. The data eventually appears at the serial output.

---

## Concept

A shift register is a group of flip-flops connected so that data can be shifted from one flip-flop to another.

In a SISO shift register:

- Data enters serially through `serial_in`.
- Data shifts by one position on every clock edge.
- Data leaves serially through `serial_out`.
- The register operates synchronously with the clock.

For a 4-bit SISO register:

```text
serial_in
    |
    v
+-----+    +-----+    +-----+    +-----+
| DFF | -> | DFF | -> | DFF | -> | DFF |
| Q3  |    | Q2  |    | Q1  |    | Q0  |
+-----+    +-----+    +-----+    +-----+
                                      |
                                      v
                                 serial_out
```
https://www.edaplayground.com/x/kpqS
