# D Flip-Flop with Synchronous Reset

## 1. Objective

Design a positive-edge-triggered D Flip-Flop (DFF) with a synchronous active-high reset.

### Specification

| Signal | Direction | Description |
|--------|-----------|-------------|
| `clk` | Input | Clock signal |
| `reset` | Input | Synchronous active-high reset |
| `d` | Input | Data input |
| `q` | Output | Stored data |

The flip-flop behaves as follows:

- On every rising edge of `clk`, if `reset = 1`, `q` is cleared to `0`.
- If `reset = 0`, the value of `d` is captured into `q`.
- Changes in `d` between clock edges do not immediately affect `q`.

---

## 2. Underlying Concept

A D Flip-Flop is a fundamental sequential logic element capable of storing one bit of information.

Unlike combinational logic, the output of a flip-flop depends on its previous state as well as the input.

For a positive-edge-triggered DFF:

```text
             ┌─────────────┐
d ──────────►│             │
             │    D Flip   │──────► q
clk ────────►│    Flop     │
             │             │
reset ──────►│             │
             └─────────────┘
```
https://www.edaplayground.com/x/uDXH
             
