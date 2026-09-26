`timescale 1ns/1ps

module dtohe_tb();
  logic [2:0]in;
  logic [7:0]out;
  
  decimal_to_onehot_encoder dut(in,out);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,dtohe_tb);
    
    in = 3'b000;
    
    repeat (8) begin 
      #10
      in = in+1;
    end
    
    $finish;
  end
  
  initial begin 
    $monitor("time=%0t in=%03d out=%08d",$time,in,dut.out);
  end
  
endmodule