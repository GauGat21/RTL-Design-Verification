`timescale 1ns/1ps

module clock_divider_tb;

    logic clk;
    logic reset;

    logic div2;
    logic div4;
    logic div8;
    logic div16;

    clock_divider dut (
        .clk   (clk),
        .reset (reset),
        .div2  (div2),
        .div4  (div4),
        .div8  (div8),
        .div16 (div16)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, clock_divider_tb);

        reset = 1;

        // Hold reset for two clock cycles
        repeat (2) @(posedge clk);

        reset = 0;

        // Observe counter for 20 cycles
        repeat (20) @(posedge clk);

        $finish;
    end

    initial begin
        $monitor("time=%0t reset=%b count=%b div2=%b div4=%b div8=%b div16=%b",
                 $time, reset, dut.count,
                 div2, div4, div8, div16);
    end

endmodule