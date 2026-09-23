// Code your design here
module johnsonCounter(
  input logic clk,
  input logic reset,
  output logic [3:0] q
);
  
  always_ff @(posedge clk)begin
    if(reset)
      q <= 4'b0;
    else
      q <= {~q[0],q[3:1]};
  end
  
endmodule