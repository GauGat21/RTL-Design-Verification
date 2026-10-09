`timescale 1ns/1ps
module decoder_tb();
  logic [1:0]I;
  logic [3:0]Y;
   logic [3:0] expected;
  
  decoder2to4 dut(
    .I(I),
    .Y(Y)
  );
  
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, decoder_tb);

        for (int i = 0; i < 4; i++) begin
            I = i;
            expected = 4'b0001 << i;

            #1;

            if (Y !== expected)
                $error("Decoder FAIL: I=%b Y=%b expected=%b",
                       I, Y, expected);
            else
                $display("Decoder PASS: I=%b Y=%b",
                         I, Y);
        end

        $display("All 4 input combinations tested.");
        $finish;
    end
endmodule
