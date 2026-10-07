`timescale 1ns/1ps
module sipo(
  input logic clk,
  input logic reset,
  input logic si,
  
  output logic [3:0]q
);
  
  always_ff @(posedge clk) begin
    if(reset)
      q <= 0;
    else
      q <= {q[2:0],si};
  end
  
endmodule
  
