`timescale 1ns/1ps
module majority5_tb();
  logic [4:0]in;
  logic clk;
  wire Y;
  
  majority5 dut(.A(in[0]),.B(in[1]),.C(in[2]),.D(in[3]),.E(in[4]),.Y(Y));
  
  initial begin
    in = 0;
  end
  
  initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, majority5_tb);

        in = 5'b00000;

        repeat (32) begin
            #10;
            in = in + 1'b1;
        end

        $finish;
  end
  
  initial begin
    $monitor("time=%0t in=%05b Y=%b", $time, in, Y);
  end  
  
endmodule
    
    
    
  
  