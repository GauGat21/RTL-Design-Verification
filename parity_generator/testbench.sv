`timescale 1ns/1ps

module parity_gen_tb();
  logic [2:0]a;
  logic y;
  
  parity_generator dut(a[0],a[1],a[2],y);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,parity_gen_tb);
    
    a = 3'b000;
    
    repeat (8) begin
      #10
      a = a +1'b1;
    end
    
    $finish;
    
  end
  
  initial begin
    $monitor("time=%0t a=%03b y=%0b",$time,a,y);
  end
endmodule