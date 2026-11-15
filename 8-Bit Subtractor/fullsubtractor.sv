module fullsubtractor(
  input logic A,
  input logic B,
  input logic BIN,
  
  output logic DIFF,
  output logic BOUT
);
  
  assign DIFF = A^B^BIN;
  assign BOUT = (~A&B)|((~(A^B))&BIN);
  
endmodule
  
