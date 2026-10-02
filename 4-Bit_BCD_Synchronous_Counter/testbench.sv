`timescale 1ns/1ps

module bsc4b_tb();

    logic       clk;
    logic       reset;
    logic [3:0] out;

    logic [3:0] expected;

    bcd_sync_counter_4bit dut (
        .clk   (clk),
        .reset (reset),
        .y     (out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, bsc4b_tb);
    end

    // Stimulus + reference model + checking
    initial begin

        reset    = 1;
        expected = 4'd0;

        // Reset is synchronous
        repeat (2) begin
            @(posedge clk);
            #1;

            if (out !== expected)
                $error("RESET FAIL: expected=%0d actual=%0d",
                       expected, out);
            else
                $display("RESET PASS: out=%0d", out);
        end

        reset = 0;

        // Normal counting
        repeat (20) begin

            @(posedge clk);
            #1;

            // Reference model
            if (expected == 4'd9)
                expected = 4'd0;
            else
                expected = expected + 1'b1;

            // Compare DUT with expected value
            if (out !== expected)
                $error("FAIL: expected=%0d actual=%0d",
                       expected, out);
            else
                $display("PASS: expected=%0d actual=%0d",
                         expected, out);
        end

        $finish;
    end

endmodule