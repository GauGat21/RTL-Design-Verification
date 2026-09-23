`timescale 1ns/1ps

module johnsonCounter_tb();
  logic clk;
  logic reset;
  logic [3:0] q;
  
  johnsonCounter dut(.clk(clk),.reset(reset),.q(q));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, johnsonCounter_tb);
    
    reset = 1;
    
    repeat(2) @(posedge clk);
    
    reset = 0;
    
    repeat (20) @(posedge clk);
    
    $finish;
    
  end
  
  initial begin 
    $monitor("time=%0t reset=%0b q=%04b",$time,reset,dut.q);
  end
  
endmodule
    
    
    
  
  