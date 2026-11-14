`include "fulladder.sv"
module ripple_carry_adder(
  input logic [3:0]A,
  input logic [3:0]B,
  input logic CIN,
  
  output logic [3:0]SUM,
  output logic COUT
);
  
  wire [4:0]carry;
  assign carry[0] = CIN;
  assign COUT = carry[4];
  genvar i;
  
  generate
    for(i = 0; i<4 ; i=i+1)begin: FA_STAGE
      fulladder FA(
        A[i],
        B[i],
        carry[i],
        SUM[i],
        carry[i+1]
      );
    end
  endgenerate
  
endmodule
