`timescale 1ns/1ps
module mux_tb();
  logic [1:0]I;
  logic sel;
  logic expected;
  logic Y;
  
  logic [2:0]count;
  
  mux2to1 dut(.I(I),.sel(sel),.Y(Y));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, mux_tb);

    for (int i = 0; i < 8; i++) begin
      count = i;
      I     = count[1:0];
      sel   = count[2];

      #1;

      expected = sel ? I[1] : I[0];

      if (Y !== expected)
        $error("MUX FAIL: sel=%b I=%b Y=%b expected=%b",
               sel, I, Y, expected);
      else
        $display("MUX PASS: sel=%b I=%b Y=%b",
                 sel, I, Y);
    end

    $display("All 8 combinations tested.");
    $finish;
  end
  
endmodule
