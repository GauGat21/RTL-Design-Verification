
# BCD Time Counter — HH:MM:SS

## Objective

Design a digital time counter using BCD digits to represent hours, minutes, and seconds.

The counter supports a 24-hour format and rolls over from 23:59:59 to 00:00:00.

## Concept

The design uses six individual BCD digits:

- Seconds ones: 0–9
- Seconds tens: 0–5
- Minutes ones: 0–9
- Minutes tens: 0–5
- Hours ones: 0–9, subject to the hour range
- Hours tens: 0–2

A one-cycle clock-enable pulse named `tick` advances the time by one second.

## Architecture

The design uses cascaded BCD counters.

- Seconds ones increments on every tick.
- Seconds tens increments when seconds ones rolls over.
- Minutes ones increments when seconds roll over from 59.
- Minutes tens increments when minutes ones rolls over.
- Hours increment when minutes roll over from 59.
- Hours reset when the time reaches 23:59:59 and another tick arrives.

## Verification Approach

A self-checking SystemVerilog testbench uses an independent integer-based reference model.

The testbench simulates one complete day plus one additional second.

It checks all six BCD digits against the expected HH:MM:SS value.

## Key Test Cases

- Counter hold when tick is low
- Seconds rollover from 09 to 10
- Seconds rollover from 59 to 00
- Minutes rollover from 59 to 00
- Hours rollover
- Midnight rollover from 23:59:59 to 00:00:00
- Full-day counting

## EDA Playground

Link:https://edaplayground.com/x/VN8n

## Key Takeaways

- BCD digit representation
- Cascaded counters
- Clock-enable implementation
- Nested rollover conditions
- 24-hour timekeeping logic
- Long-duration self-checking verification
