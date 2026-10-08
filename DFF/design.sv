`timescale 1ns/1ps
module dff(
  input logic d,
  input logic clk,
  input logic reset,
  output logic q
);
  
  always_ff @(posedge clk) begin
    if(reset)
      q <= 1'b0;
    else
      q <= d;
    
  end
  
endmodule
