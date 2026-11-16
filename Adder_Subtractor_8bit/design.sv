`include "fulladder.sv"
module adder_subtractor_8bit(
  input logic [7:0]A,
  input logic [7:0]B,
  input logic MODE,
  
  output logic [7:0]RESULT,
  output logic COUT
);
  
  logic [7:0]B_MOD;
  wire [8:0]car_bor;
  assign car_bor[0] = MODE;
  assign B_MOD = B^{8{MODE}};
  assign COUT = car_bor[8];
  
  genvar i ;
  
  generate
    for(i=0;i<8;i=i+1)begin:FA_STAGE
      full_adder FA(
        A[i],
        B_MOD[i],
        car_bor[i],
        RESULT[i],
        car_bor[i+1]
      ); 
    end
  endgenerate
  
endmodule
