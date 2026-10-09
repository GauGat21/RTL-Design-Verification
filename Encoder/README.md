# 4-to-2 Priority Encoder

## 1. Objective

Design a 4-to-2 priority encoder using SystemVerilog.

The circuit has four request inputs, `I[3:0]`, and produces a 2-bit binary output representing the highest-priority asserted input.

For this design, **`I[3]` has the highest priority and `I[0]` has the lowest priority**.

An additional output, `valid`, indicates whether at least one input is asserted.

### Specification

| Signal | Direction | Description |
|---|---|---|
| `I[3:0]` | Input | Four request inputs |
| `Y[1:0]` | Output | Encoded index of the highest-priority request |
| `valid` | Output | High when at least one request is active |

The priority order is:

`I[3] > I[2] > I[1] > I[0]`

If multiple inputs are high simultaneously, the encoder selects the highest-priority input.

---

## 2. Underlying Concept

An ordinary encoder converts an active input line into a binary code. However, if multiple inputs are asserted simultaneously, an ordinary encoder may not define a unique result.

A **priority encoder** solves this problem by assigning a priority order to its inputs.

For example:

```text
I = 4'b0101
```

Both `I[2]` and `I[0]` are high. Since `I[2]` has higher priority, the output represents input index 2:

```text
Y     = 2'b10
valid = 1'b1
```

Similarly:

```text
I = 4'b1010
```

Both `I[3]` and `I[1]` are high. The encoder selects `I[3]`, producing `Y = 2'b11`.

The fundamental rule is:

> The output represents the highest-priority asserted input, not necessarily the only asserted input.

---

## 3. Architecture

```text
 I[3] ───────┐
 I[2] ───────┤
 I[1] ───────┤──► Priority Logic ───► Y[1:0]
 I[0] ───────┤                   └──► valid
             │
             └── Priority: I[3] highest
```

The priority logic examines the inputs and suppresses the influence of lower-priority requests whenever a higher-priority request is asserted.

This is different from a basic decoder:

- A decoder converts a binary code into an output line.
- A priority encoder converts multiple request lines into a binary index, resolving simultaneous requests by priority.

---

## 4. Truth Table

The table below includes all possible combinations of the four request inputs.

| `I[3:0]` | `Y[1:0]` | `valid` | Explanation |
|---|---|---:|---|
| `0000` | `00` | 0 | No request active |
| `0001` | `00` | 1 | Select `I[0]` |
| `0010` | `01` | 1 | Select `I[1]` |
| `0011` | `01` | 1 | `I[1]` beats `I[0]` |
| `0100` | `10` | 1 | Select `I[2]` |
| `0101` | `10` | 1 | `I[2]` beats `I[0]` |
| `0110` | `10` | 1 | `I[2]` beats `I[1]` |
| `0111` | `10` | 1 | `I[2]` beats `I[1:0]` |
| `1000` | `11` | 1 | Select `I[3]` |
| `1001` | `11` | 1 | `I[3]` beats `I[0]` |
| `1010` | `11` | 1 | `I[3]` beats `I[1]` |
| `1011` | `11` | 1 | `I[3]` beats `I[1:0]` |
| `1100` | `11` | 1 | `I[3]` beats `I[2]` |
| `1101` | `11` | 1 | `I[3]` beats `I[2:0]` |
| `1110` | `11` | 1 | `I[3]` beats `I[2:1]` |
| `1111` | `11` | 1 | `I[3]` beats all lower inputs |

When no input is asserted, `Y` is defined as `00`, but `valid = 0` indicates that this output does not represent an active request.

---

## 5. Boolean Logic

The encoded output can be expressed using Boolean equations.

The most significant output bit is high when either `I[3]` is high or `I[2]` is high and `I[3]` is low:

\[
Y_1=I_3\lor I_2
\]

The least significant output bit is high when `I[3]` is asserted, or when `I[3]` is low and `I[1]` is asserted:

\[
Y_0=I_3\lor(\overline{I_2}\land I_1)
\]

The valid signal is:

\[
valid=I_3\lor I_2\lor I_1\lor I_0
\]

These equations describe the specified priority behavior for all four-state-known binary input combinations.

---

## 6. RTL Design Approach

Priority logic can be implemented using a sequence of `if` and `else if` conditions.

The order of these conditions is important. The highest-priority input must be checked first.

```systemverilog
always_comb begin
    Y = 2'b00;
    valid = 1'b0;

    if (I[3]) begin
        Y = 2'b11;
        valid = 1'b1;
    end
    else if (I[2]) begin
        Y = 2'b10;
        valid = 1'b1;
    end
    else if (I[1]) begin
        Y = 2'b01;
        valid = 1'b1;
    end
    else if (I[0]) begin
        Y = 2'b00;
        valid = 1'b1;
    end
end
```

### Why use `if` / `else if`?

The first matching condition wins. Once a higher-priority input is found, the lower-priority conditions are not considered.

### Why initialize the outputs?

The initial assignments define a default output when no request is active. This ensures every output has an assignment on every path and avoids unintended latch inference.

---

## 7. SystemVerilog RTL

```systemverilog
`timescale 1ns/1ps

module priority_encoder4to2 (
    input  logic [3:0] I,
    output logic [1:0] Y,
    output logic       valid
);

    always_comb begin
        Y = 2'b00;
        valid = 1'b0;

        if (I[3]) begin
            Y = 2'b11;
            valid = 1'b1;
        end
        else if (I[2]) begin
            Y = 2'b10;
            valid = 1'b1;
        end
        else if (I[1]) begin
            Y = 2'b01;
            valid = 1'b1;
        end
        else if (I[0]) begin
            Y = 2'b00;
            valid = 1'b1;
        end
    end

endmodule
```

---

## 8. Verification Approach

There are four input bits, so the total number of binary input combinations is:

\[
2^4=16
\]

All 16 combinations can be tested exhaustively.

For each input combination, the testbench should calculate:

1. Whether any request is active.
2. Which input has the highest priority.
3. The expected encoded index.
4. Whether the DUT's `Y` and `valid` outputs match the expected values.

### Reference model

The reference model should independently implement the priority rule:

```systemverilog
if (I[3])
    expected = 2'b11;
else if (I[2])
    expected = 2'b10;
else if (I[1])
    expected = 2'b01;
else
    expected = 2'b00;
```

The expected valid signal can be calculated as:

```systemverilog
expected_valid = |I;
```

Here, `|I` is a reduction OR. It evaluates to 1 if any bit of `I` is 1.

The testbench should compare both outputs using case inequality (`!==`) so that unknown values in the DUT are not silently accepted as correct.

---

## 11. Applications

Priority encoders are used in:

- Interrupt controllers
- Bus arbitration
- Request scheduling
- Resource allocation
- Instruction/control logic
- Systems where multiple events can request service simultaneously

For example, an interrupt controller may receive multiple interrupt requests at once and select the request with the highest configured priority.

A fixed-priority encoder is simple to implement, but continuous preference for higher-priority requests can starve lower-priority requests. Round-robin arbitration is one approach to improve fairness.

---
## 14. EDA Playground

EDA Playground Link:

https://www.edaplayground.com/x/XWVt
