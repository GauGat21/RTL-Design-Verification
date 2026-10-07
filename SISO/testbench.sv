`timescale 1ns/1ps
module siso_tb();
  logic clk;
  logic reset;
  logic si;
  
  logic so;
  
  siso dut(.clk(clk),.reset(reset),.si(si),.so(so));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,siso_tb);
  end
  
  initial begin
    
    reset = 1;
    si=0;
    repeat (2) begin
      @(posedge clk);
      #1;
    end
    
    reset = 0;
    
    si=1;
    @(posedge clk);
    #1;
    
    si=0;
    @(posedge clk);
    #1;
    
    si=1;
    @(posedge clk);
    #1;
    
    si=0;
    @(posedge clk);
    #1;
    
    
    si=0;
    repeat (4) begin
      @(posedge clk);
      #1;
    end
    
    $finish;
  end
  
  initial begin
    $monitor("time=%0t reset=%0b si=%0b tmp=%ob so=%0b",$time,reset,si,dut.tmp,so); 
  end
  
endmodule

    
