`timescale 1ns/1ps

module piso(
  input logic clk,
  input logic reset,
  input logic [3:0]pi,
  input logic shift,

  output logic so
);
  logic [3:0]register;
  
  always_ff @(posedge clk) begin
    if(reset)
      register <= 4'b0000;
    else if(!shift)
      register <= pi;
    else 
      register <= {register[2:0],1'b0};
    
  end
  assign so = register[3];

endmodule
      

    
    
      
