`timescale 1ns/1ps
module pipo(
  input logic clk,
  input logic reset,
  input logic [3:0]pi,
  
  output logic [3:0]po
);
  
  always_ff @(posedge clk) begin
    if(reset)
      po <= 4'b0000;
    else
      po <= pi;
  end
  
endmodule
