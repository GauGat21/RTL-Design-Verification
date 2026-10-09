`timescale 1ns/1ps

module mux2to1#(
  parameter int N=2
)(
  input logic [N-1:0]I,
  input logic sel,
  output logic Y
);
  
  assign Y = sel ? I[1]:I[0];
                    
endmodule
