Clock Divider

## Objective

Design and verify a clock divider using a 4-bit binary counter.

The design generates divided clock signals from an input clock:

- Divide-by-2
- Divide-by-4
- Divide-by-8
- Divide-by-16

## Concept

A binary counter increments on every rising edge of the input clock.

Each successive counter bit toggles at half the frequency of the previous bit. Therefore:

- `count[0]` → divide-by-2
- `count[1]` → divide-by-4
- `count[2]` → divide-by-8
- `count[3]` → divide-by-16

## Architecture

The design consists of:

1. A 4-bit synchronous binary counter
2. Synchronous active-high reset
3. Counter bits used as frequency-divided outputs

## Frequency Relationship

For an input frequency `Fin`:

```text
div2  = Fin / 2
div4  = Fin / 4
div8  = Fin / 8
div16 = Fin / 16
