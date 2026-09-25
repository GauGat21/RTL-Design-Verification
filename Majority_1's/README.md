5-Input Majority Circuit

## Objective

Design and verify a 5-input majority circuit.

The circuit should produce a logic `1` when the majority of the
five inputs are `1`. Otherwise, the output should be `0`.

Since there are five inputs, at least three inputs must be `1`
for the output to become `1`.

---

## Inputs and Output

### Inputs

- `A`
- `B`
- `C`
- `D`
- `E`

### Output

- `Y`

---

## Majority Condition

For five inputs:

- 0 ones → `Y = 0`
- 1 one → `Y = 0`
- 2 ones → `Y = 0`
- 3 ones → `Y = 1`
- 4 ones → `Y = 1`
- 5 ones → `Y = 1`

Therefore:

```text
Y = 1 when at least 3 of the 5 inputs are 1
