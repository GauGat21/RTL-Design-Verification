`timescale 1ns/1ps

module decimal_to_onehot_encoder(
  input logic [2:0]in,
  output logic [7:0]out
);
  
	always_comb begin
      out = 8'b00000001 << in;
    end
endmodule
    