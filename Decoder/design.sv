`timescale 1ns/1ps
module decoder2to4#(
  parameter int N = 2
)(
  input logic [N-1:0]I,
  output logic [(2**N)-1:0]Y
);
  always_comb begin
    Y = '0;
    Y[I] = 1'b1;
  end
endmodule
