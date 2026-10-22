`timescale 1ns/1ps

module priority_encoder4to2_tb ();

  logic [3:0] I;
  logic [1:0] Y;
  logic valid;
  
  logic [1:0] expected_Y;
  logic expected_valid;
  
  priority_encoder4to2 dut(.I(I),.Y(Y),.valid(valid));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,priority_encoder4to2_tb);
  	
    for (int i = 0; i < 16; i++) begin
      I = i;

      expected_valid = |I;

      if (I[3])
        expected_Y = 2'b11;
      else if (I[2])
        expected_Y = 2'b10;
      else if (I[1])
        expected_Y = 2'b01;
      else
        expected_Y = 2'b00;

      #1;

      if ((Y !== expected_Y) ||
          (valid !== expected_valid)) begin
        $error(
          "FAIL: I=%b Y=%b expected_Y=%b valid=%b expected_valid=%b",
          I, Y, expected_Y, valid, expected_valid
        );
      end
      else begin
        $display(
          "PASS: I=%b Y=%b valid=%b",
          I, Y, valid
        );
      end

      #4;
    end
    $finish;
  end
endmodule
