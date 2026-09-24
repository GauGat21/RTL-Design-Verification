`timescale 1ns/1ps

module ring_counter_tb();
  logic clk;
  logic reset;
  logic preset;
  logic [3:0]q;
  
  ring_counter dut(.clk(clk),.reset(reset),.preset(preset),.q(q));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,ring_counter_tb);
    
    
    reset = 1;
    preset = 0;
    repeat(2) @(posedge clk);
    
    reset = 0;
    repeat(2) @(posedge clk);
    
    preset = 1;
    repeat(1.5) @(posedge clk);
    
    preset = 0;
    
    repeat(20) @(posedge clk);
    
    $finish;
    
  end
  
  initial begin 
    $monitor("time=%0t reset=%0b preset=%0b q=%04b",$time,reset,preset,dut.q);
  end
    
endmodule