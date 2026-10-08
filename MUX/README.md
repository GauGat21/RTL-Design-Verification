# 2:1 Multiplexer (MUX)

## 1. Objective

Design a **2:1 Multiplexer** that selects one of two input signals and forwards the selected input to the output based on a select signal.

### Specification

| Signal | Direction | Description |
|--------|-----------|-------------|
| `a` | Input | Input 0 |
| `b` | Input | Input 1 |
| `sel` | Input | Select signal |
| `y` | Output | Selected output |

The behavior is:

- When `sel = 0`, `y = a`
- When `sel = 1`, `y = b`

---

## 2. Underlying Concept

A Multiplexer, commonly called a **MUX**, is a combinational circuit that selects one input from multiple inputs and routes it to a single output.

A 2:1 MUX has:

- 2 data inputs
- 1 select input
- 1 output

Conceptually:

```text
             ┌─────────────┐
a ──────────►│             │
             │    2:1 MUX  │──────► y
b ──────────►│             │
             │             │
sel ────────►│             │
             └─────────────┘
```
https://www.edaplayground.com/x/hnc_
