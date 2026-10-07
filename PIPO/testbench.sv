
`timescale 1ns/1ps

module pipo_tb();
  logic clk;
  logic reset;
  logic [3:0]pi;
  
  logic [3:0]po;
  
  pipo dut(
    .clk(clk),
    .reset(reset),
    .pi(pi),
    .po(po)
  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,pipo_tb);
  end
  
  initial begin
	
    reset = 1;
    pi = 0;
    repeat (2) @(posedge clk);
    if(po!==0)
      $error("Reset Failed: reset=%b po=%b",reset,po);
    #1;

    reset = 0;
    pi = 4'b1011;
    
    @(posedge clk);
    #1;
    if(pi!==po)
      $error("PIPO Failed: pi=%b po=%b",pi,po);
    
    
    pi = 4'b0011;
    
    @(posedge clk);
	#1;
    if(pi!==po)
      $error("PIPO Failed: pi=%b po=%b",pi,po);
    
    reset = 1;
    
    @(posedge clk);
    #1;
    if(po!==0)
      $error("Reset Failed: reset=%b po=%b",reset,po);
    repeat (2) @(posedge clk);
    
    $finish;

  end
  
  initial begin
    $monitor("time = %t pi=%b reset=%b po=%b",$time,pi,reset,po);
  end
  
endmodule
