`include "fullsubtractor.sv"

module subtractor_8bit(
  input logic [7:0]A,
  input logic [7:0]B,
  
  output logic [7:0]DIFF,
  output logic BOUT
);
  
  wire [8:0]bor;
  
  assign bor[0] = 1'b0;
  assign BOUT = bor[8];
  
  genvar i;
  
  generate
    for(i=0;i<8;i=i+1)begin:FS_STAGE
      fullsubtractor fs(
        A[i],
        B[i],
        bor[i],
        DIFF[i],
        bor[i+1]
      );
    end
  endgenerate
  
endmodule
