`timescale 1ns/1ps
module bcd_sync_counter_4bit(
  input logic clk,
  input logic reset,
  output logic [3:0]y
);
  
  always_ff @(posedge clk)begin
    if(reset)
      y <= 4'b0000;
    else if(y == 4'b1001)
      y <= 4'b0000;
    else
      y <= y+1;
  end
endmodule