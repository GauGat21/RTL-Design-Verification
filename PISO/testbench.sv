`timescale 1ns/1ps

module piso_tb();

    logic clk;
    logic reset;
    logic [3:0] pi;
    logic shift;
    logic so;

    logic [3:0] expected;

    piso dut(
        .clk(clk),
        .reset(reset),
        .pi(pi),
        .shift(shift),
        .so(so)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, piso_tb);
    end

    initial begin

        reset = 1;
        pi = 4'b0000;
        shift = 0;
        expected = 4'b0000;

        repeat (2) begin
            @(posedge clk);
            #1;
        end

        if (dut.register !== 4'b0000)
            $error("Reset FAIL: register=%04b", dut.register);
        else
            $display("Reset PASS");

        reset = 0;
        pi = 4'b1011;
        shift = 0;

        @(posedge clk);
        #1;

        expected = pi;

        if (dut.register !== expected)
            $error("Load FAIL: expected=%04b actual=%04b",
                   expected, dut.register);
        else
            $display("Load PASS: register=%04b", dut.register);

        shift = 1;

        for (int i = 0; i < 4; i++) begin

            if (so !== expected[3])
                $error("Shift FAIL: expected_so=%b actual_so=%b",
                       expected[3], so);
            else
                $display("Shift PASS: expected_so=%b actual_so=%b",
                         expected[3], so);

            expected = {expected[2:0], 1'b0};

            @(posedge clk);
            #1;
        end

        $finish;

    end

    initial begin
        $monitor("time=%0t reset=%b shift=%b pi=%b register=%b so=%b",
                 $time, reset, shift, pi, dut.register, so);
    end

endmodule
