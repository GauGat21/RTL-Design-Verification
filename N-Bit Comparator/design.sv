`timescale 1ns/1ps

module comparator #(
    parameter int N = 4
)(
    input  logic [N-1:0] A,
    input  logic [N-1:0] B,
    output logic         Greater,
    output logic         Equal,
    output logic         Lesser
);
  
  always_comb begin
    Greater = 0;
    Equal   = 0;
    Lesser  = 0;
    if(A>B)
      Greater = 1;
    else if(A<B)
      Lesser = 1;
    else
      Equal = 1;
  end
  
endmodule
    
  
  
  
