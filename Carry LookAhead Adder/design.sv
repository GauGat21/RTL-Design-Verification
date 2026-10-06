`timescale 1ns/1ps

module cla(
  input logic [3:0]A,
  input logic [3:0]B,
  input logic cin,
  output logic [3:0]Sum,
  output logic cout
);

  wire [3:0]P;
  wire [3:0]G;
  wire [3:0]C;
  
  assign P[0] = A[0]^B[0];
  assign P[1] = A[1]^B[1];
  assign P[2] = A[2]^B[2];
  assign P[3] = A[3]^B[3];
  
  assign G[0] = A[0]&B[0];
  assign G[1] = A[1]&B[1];
  assign G[2] = A[2]&B[2];
  assign G[3] = A[3]&B[3];
  
  assign C[0] = G[0]|(P[0]&cin);
  assign C[1] = G[1]|(P[1]&C[0]);
  assign C[2] = G[2]|(P[2]&C[1]);
  assign C[3] = G[3]|(P[3]&C[2]);
  
  
  assign Sum[0] = P[0]^C[0];
  assign Sum[1] = P[1]^C[1];
  assign Sum[2] = P[2]^C[2];
  assign Sum[3] = P[3]^C[3];
  
  assign cout = C[3];
  
endmodule
