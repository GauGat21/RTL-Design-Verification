
module ring_counter(
  input logic clk,
  input logic reset,
  input logic preset,
  output logic [3:0]q
  
);
  
  always_ff @(posedge clk)begin
    if(reset)
      q<=4'b0000;
    else if(preset)
      q<=4'b1000;
    else
      q<={q[0],q[3:1]};
  end
  
  
endmodule