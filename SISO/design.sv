`timescale 1ns/1ps
module siso(
  input logic clk,
  input logic reset,
  input logic si,
  
  output logic so
);
  logic [3:0]tmp;
  
  always_ff @(posedge clk) begin
    if(reset)
      tmp <= 4'b0000;
    else begin
      tmp <= {tmp[2:0],si};
      //tmp[3] <= tmp[2];
      //tmp[2] <= tmp[1];
      //tmp[1] <= tmp[0];
      //tmp[0] <= si;
    end
  end
  assign so = tmp[3];
endmodule
  
    
