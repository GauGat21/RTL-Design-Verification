# SIPO Shift Register
## Objective
Design and verify a Serial-In Parallel-Out (SIPO) shift register.
The register accepts data one bit at a time through a serial input and shifts the stored data on every active clock edge. Unlike SISO, the contents of the register are available simultaneously through parallel outputs.
## Concept
A SIPO shift register converts a serial data stream into parallel data.
In a 4-bit SIPO register:
- Data enters through serial_in.
- One bit is shifted in on every clock edge.
- The stored bits are available simultaneously on Q[3:0].
- The register is cleared using reset.
## Basic architecture:
                 Clock
                   |
        +----------+----------+----------+----------+
        |          |          |          |
        v          v          v          v
serial_in -> [DFF] -> [DFF] -> [DFF] -> [DFF]
              Q0       Q1       Q2       Q3
               |        |        |        |
               v        v        v        v
              Q[0]     Q[1]     Q[2]     Q[3]

## Shift Operation
For the shift direction:
serial_in → Q0 → Q1 → Q2 → Q3

the register operation is:
Q[0] <= serial_in
Q[1] <= Q[0]
Q[2] <= Q[1]
Q[3] <= Q[2]

Therefore:
Q <= {Q[2:0], serial_in}
