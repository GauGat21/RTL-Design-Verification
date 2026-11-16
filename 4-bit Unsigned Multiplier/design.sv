module multiplier_4bit(
  input logic [3:0]A,
  input logic [3:0]B,
  
  output logic [7:0]PRODUCT
);
  
  logic [7:0]pp0,pp1,pp2,pp3;
  
  assign pp0 = {4'b0000,(A&{4{B[0]}})};
  assign pp1 = {3'b000,(A&{4{B[1]}}),1'b0};
  assign pp2 = {2'b00,(A&{4{B[2]}}),2'b00};
  assign pp3 = {1'b0,(A&{4{B[3]}}),3'b000};
  
  assign PRODUCT = pp0+pp1+pp2+pp3;
  
endmodule
