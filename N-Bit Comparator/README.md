# Day 09 - N-Bit Comparator

## Objective

Design and verify an N-bit magnitude comparator that compares two binary numbers and determines whether:

- A is greater than B
- A is equal to B
- A is less than B

A magnitude digital comparator is a combinational circuit used to compare two digital or binary numbers and determine their relative magnitude. :chatgpt-content-reference{index="0"}

---

## Concept

The comparator takes two N-bit binary inputs:

    A[N-1:0]
    B[N-1:0]

and produces three comparison results:

    A > B
    A = B
    A < B

The comparison is performed starting from the **most significant bit (MSB)** because the highest-order differing bit determines which binary number is larger.

For example:

    A = 1010
    B = 1001

The first two bits are equal:

    10
    10

At the next bit:

    A[1] = 1
    B[1] = 0

Therefore:

    A > B

The lower bits do not affect the result once a higher-order difference has been found.

---

## Comparison Logic

For a bit position `i`, the basic comparison conditions are:

    A[i] > B[i]  → A[i] & ~B[i]

    A[i] < B[i]  → ~A[i] & B[i]

    A[i] = B[i]  → A[i] XNOR B[i]

For an N-bit comparator, the comparison result depends on the highest-order bit position where `A` and `B` differ.

---

## Hardware Architecture

    A[N-1:0] ─────┐
                  │
                  ▼
           ┌──────────────┐
           │ N-bit        │
           │ Comparator   │
           └──────┬───────┘
                  │
          ┌───────┼───────┐
          ▼       ▼       ▼
        A > B    A = B   A < B

The most significant bits have the highest priority during comparison.

---

## Design

The comparator is a **combinational circuit**.

There is no clock or reset.

The design accepts two N-bit values and produces three mutually exclusive outputs:

    greater
    equal
    less

For any valid pair of inputs, exactly one of these conditions should be true.

---

## Verification

For an N-bit comparator, the complete input space is:

    2^N possible values of A
    ×
    2^N possible values of B

For a 4-bit implementation:

    16 × 16 = 256 combinations

Therefore, exhaustive verification is practical for a 4-bit comparator.

The expected result can be obtained directly from the mathematical comparison:

    A > B
    A == B
    A < B

The DUT outputs are then compared against the expected result.

---

## Important Test Cases

The verification should include:

    A = B

    A > B

    A < B

and cases where the first difference occurs at different bit positions.

Examples:

    A = 0000
    B = 0000
    → A = B

    A = 0001
    B = 0000
    → A > B

    A = 0000
    B = 0001
    → A < B

    A = 1000
    B = 0111
    → A > B

    A = 0111
    B = 1000
    → A < B

---

## Key Design Point

The MSB has the highest priority.

Consider:

    A = 1010
    B = 1001

Although the lower bits are different, the comparison is decided at the first differing bit from the MSB side.

Therefore, a comparator must ensure that a lower-order difference cannot override a higher-order difference.

---

## EDA Playground

EDA Playground: [<ADD YOUR EDA PLAYGROUND LINK HERE>](https://www.edaplayground.com/x/hiNb)

Simulator: Icarus Verilog / SystemVerilog

---

## Key Takeaways

    N-bit Comparator
          ↓
    Compare two binary numbers
          ↓
    Check from MSB toward LSB
          ↓
    Produce:
       A > B
       A = B
       A < B

The core concept is:

**The highest-order bit at which the two numbers differ determines the comparison result.**
