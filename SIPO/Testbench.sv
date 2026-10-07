`timescale 1ns/1ps

module sipo_tb();
  logic clk;
  logic reset;
  logic si;
  
  logic [3:0]q;
  
  sipo dut(
    .clk(clk),
    .reset(reset),
    .si(si),
    .q(q)
  );
  
  initial begin 
    si=0;
    clk = 0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,sipo_tb);
  end
  
  initial begin
    
    reset = 1;
    repeat(2) begin
      @(posedge clk);
      #1;
    end
    
    reset = 0;
    
    si = 1;
    @(posedge clk);
    #1;
    
    si = 0;
    @(posedge clk);
    #1;
    
    si = 1;
    @(posedge clk);
    #1;
    
    si = 1;
    @(posedge clk);
    #1;
      
    si=0;
    repeat(4) begin
      @(posedge clk);
      #1;
    end
    $finish;
  end
  
  initial begin
    $monitor("time=%t reset=%b si=%b q=%4b",$time,reset,si,dut.q);  
  end
  
endmodule
  
