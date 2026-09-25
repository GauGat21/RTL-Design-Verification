`timescale 1ns/1ps
module parity_generator(
  input logic a,
  input logic b,
  input logic c,
  output logic y
  
);
  
  xnor x(y,a,b,c);
  
endmodule
