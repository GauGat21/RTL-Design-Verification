# 2-to-4 Decoder

## 1. Objective

Design a 2-to-4 binary decoder using SystemVerilog.

The decoder takes a 2-bit binary input and activates exactly one of four output lines based on the input value.

### Specification

| Signal | Direction | Description |
|---|---|---|
| `A` | Input | Most significant input bit |
| `B` | Input | Least significant input bit |
| `Y[3:0]` | Output | One-hot decoded output |

**Expected behavior:**

- Input `00` activates `Y[0]`.
- Input `01` activates `Y[1]`.
- Input `10` activates `Y[2]`.
- Input `11` activates `Y[3]`.

All other output bits must remain zero.

---

## 2. Underlying Concept

A decoder is a combinational circuit that converts an encoded binary input into a corresponding output line.

A 2-to-4 decoder has:

- 2 input bits
- 4 output lines
- Exactly one active output for each valid binary input

The number of outputs for an n-to-2ⁿ decoder is:

\[
N_{\text{outputs}}=2^n
\]

For two input bits:

\[
N_{\text{outputs}}=2^2=4
\]

A decoder is different from an encoder:

- **Decoder:** Binary input → one-hot output.
- **Encoder:** One active input line → binary output.

### Block diagram

```text
             ┌──────────────┐
A ──────────►│              │────► Y[0]
B ──────────►│  2-to-4      │────► Y[1]
             │  Decoder     │────► Y[2]
             │              │────► Y[3]
             └──────────────┘
```

The decoder does not store data. Its outputs respond to the current inputs, subject to ordinary hardware propagation delays.

---

## 3. Truth Table

| A | B | Y[3] | Y[2] | Y[1] | Y[0] |
|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 |

The output is one-hot: exactly one bit is high for each valid binary input.

For example:

```text
A B = 00 → Y = 0001
A B = 01 → Y = 0010
A B = 10 → Y = 0100
A B = 11 → Y = 1000
```

Notice that `Y[0]` corresponds to input `00`, while `Y[3]` corresponds to input `11`.

---

## 4. Boolean Equations

Each output is activated by one unique combination of input bits.

Using `~` for NOT and `&` for AND:

\[
Y[0]=\overline{A}\,\overline{B}
\]

\[
Y[1]=\overline{A}B
\]

\[
Y[2]=A\overline{B}
\]

\[
Y[3]=AB
\]

Each equation represents one minterm of the two input variables.

For example, `Y[1]` is active only when `A=0` and `B=1`:

\[
Y[1]=\overline{A}B
\]

This is why the decoder activates exactly one output for each valid binary input.

---

## 5. Gate-Level Architecture

The decoder can be implemented using:

- Two NOT gates to generate `~A` and `~B`.
- Four AND gates to generate the four minterms.

```text
A ──────┬───────────────┐
        │               │
        NOT             │
        │               │
       ~A               A

B ──────┬───────────────┐
        │               │
        NOT             │
        │               │
       ~B               B

Y[0] = ~A & ~B
Y[1] = ~A &  B
Y[2] =  A & ~B
Y[3] =  A &  B
```

A synthesis tool may optimize this logic into an equivalent gate network depending on the target technology.

---

## 6. RTL Design Approach

A decoder can be described using either Boolean equations or a combinational procedural block.

### Approach 1: `always_comb`

```systemverilog
always_comb begin
    Y = 4'b0000;

    case ({A, B})
        2'b00: Y = 4'b0001;
        2'b01: Y = 4'b0010;
        2'b10: Y = 4'b0100;
        2'b11: Y = 4'b1000;
    endcase
end
```

Initializing `Y` to zero ensures that the output has a defined assignment before the `case` statement.

### Approach 2: Boolean equations

```systemverilog
assign Y[0] = ~A & ~B;
assign Y[1] = ~A &  B;
assign Y[2] =  A & ~B;
assign Y[3] =  A &  B;
```

Both approaches are synthesizable and describe combinational logic.

For this design, the Boolean equations directly express the decoder's logic, while the `case` statement makes the input-to-output mapping easy to read.

---

## 7. SystemVerilog RTL

```systemverilog
`timescale 1ns/1ps

module decoder2to4 (
    input  logic A,
    input  logic B,
    output logic [3:0] Y
);

    always_comb begin
        Y = 4'b0000;

        case ({A, B})
            2'b00: Y = 4'b0001;
            2'b01: Y = 4'b0010;
            2'b10: Y = 4'b0100;
            2'b11: Y = 4'b1000;
        endcase
    end

endmodule
```

---

## 8. Verification Approach

A 2-to-4 decoder has only four combinations of its two binary inputs:

\[
2^2=4
\]

Therefore, exhaustive testing is the preferred approach.

The testbench should:

1. Apply each input combination.
2. Allow the combinational logic to settle.
3. Calculate the expected one-hot output.
4. Compare the actual output with the expected output.
5. Report a failure if they differ.

### Reference model

The expected output can be generated using a shift:

```systemverilog
expected = 4'b0001 << {A, B};
```

For example:

```text
A B = 10
{A,B} = 2
expected = 0001 << 2
expected = 0100
```

The reference model should be used independently in the testbench to check the DUT.

---

## 9. Key Test Cases

| Input `{A,B}` | Expected `Y` |
|---|---|
| `2'b00` | `4'b0001` |
| `2'b01` | `4'b0010` |
| `2'b10` | `4'b0100` |
| `2'b11` | `4'b1000` |

### Additional verification checks

**One-hot property:** Exactly one output bit should be high for every valid binary input.

**Output mapping:** Confirm that each input activates the correct output index.

**Combinational response:** Changing either input should cause the output to reflect the new input combination without waiting for a clock edge.

---

## 10. Common Mistakes

### Mistake 1: Reversing the output bit order

For this design:

```text
00 → 0001
01 → 0010
10 → 0100
11 → 1000
```

Do not accidentally reverse the mapping.

### Mistake 2: Assigning only some output bits

In combinational procedural RTL, assign the entire output for every possible input condition. Incomplete assignments can infer unintended storage.

### Mistake 3: Treating a decoder as sequential logic

A basic decoder does not require a clock or reset. It is combinational.

### Mistake 4: Testing only one input combination

A design may work for one case but have incorrect bit ordering elsewhere. Test all four combinations.

---

## 11. Applications

Decoders are used in:

- Address decoding
- Memory and register selection
- Instruction decoding
- Chip-select generation
- Control logic
- Display selection
- Demultiplexing-related logic

For example, a processor can decode an address to determine which peripheral or register should respond to a transaction.

---

## 12. Important Concepts for Interview Revision

Be prepared to explain:

- What a decoder does
- Why a 2-to-4 decoder has four outputs
- The truth table and Boolean equations
- Decoder versus encoder
- Binary output versus one-hot output
- Why a decoder is combinational
- How incomplete assignments can infer latches
- How decoders are used in memory address decoding
- How to verify a decoder exhaustively
- How to extend the design to a 3-to-8 decoder

---

## 13. Key Takeaways

- A decoder converts binary input into a one-hot output.
- A 2-to-4 decoder has two input bits and four output lines.
- The output equations are the four minterms of `A` and `B`.
- A basic decoder is combinational and requires no clock.
- Both Boolean equations and `always_comb` can describe the design.
- Exhaustive testing covers all four input combinations.
- Decoder designs are important for address decoding and control logic.

---

## 14. EDA Playground

EDA Playground: https://edaplayground.com/

EDA Playground Link:

https://www.edaplayground.com/x/TE6J
