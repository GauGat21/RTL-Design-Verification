module full_adder(
  input logic A,
  input logic B,
  input logic CIN,
  
  output logic SUM,
  output logic COUT
);
  
  assign SUM = A^B^CIN;
  assign COUT = (A^B)&CIN | A&B;
  
endmodule
