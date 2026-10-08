`timescale 1ns/1ps
module dff_tb();
  logic d;
  logic clk;
  logic reset;
  logic q;
  
  dff dut(
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
  );
  
  logic expected;
  
  initial begin
    clk = 0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, dff_tb);
  end
  
  initial begin
    reset = 1'b1;
    expected = 0;
    for(int i =0;i<2;i++)begin
      d = i;
      @(posedge clk);
      #1;
      if(q !== expected)
        $error("Reset Failed: reset=%b expected=%b q=%b", reset,expected,q);
      else
        $display("Reset Pass: reset=%b expected=%b q=%b",reset,expected,q);

    end
    
    reset = 1'b0;
    for(int i =0;i<2;i++)begin
      d = i;
      expected = d;
      @(posedge clk);
      #1;
      if(q !== expected)
        $error("DFF Failed: reset=%b expected=%b q=%b",reset,expected,q);
      else
        $display("DFF Pass: reset=%b expected=%b q=%b",reset,expected,q);

    end
    @(posedge clk);
    
    $finish;
    
  end
    
  
endmodule
