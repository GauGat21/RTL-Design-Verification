`include "moore_seq_detector.sv"
module tb_sequence_detector;

    logic clk;
    logic rst_n;
    logic din;

    logic moore_detect;
    logic mealy_detect;

    logic [3:0] history;
    logic expected;

    logic [15:0] stream;

    integer i;
    integer pass_count;
    integer fail_count;

    moore_seq_detector U_MOORE (
        .clk    (clk),
        .rst_n  (rst_n),
        .din    (din),
        .detect (moore_detect)
    );

    mealy_seq_detector U_MEALY (
        .clk    (clk),
        .rst_n  (rst_n),
        .din    (din),
        .detect (mealy_detect)
    );

    // Clock generation: 10 ns period
    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin

        rst_n      = 1'b0;
        din        = 1'b0;
        history    = 4'b0000;
        stream     = 16'b1011011010110011;

        pass_count = 0;
        fail_count = 0;

        // Apply reset
        repeat (2) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        // Apply input stream one bit at a time
        for (i = 0; i < 16; i = i + 1) begin

            // Drive input away from the active clock edge
            @(negedge clk);
            din = stream[15-i];

            // Independent reference model
            expected = ({history[2:0], din} == 4'b1011);

            // Check Mealy before the next rising edge
            #1;
            if (mealy_detect === expected) begin
                pass_count = pass_count + 1;
            end
            else begin
                fail_count = fail_count + 1;
                $display(
                    "MEALY FAIL: bit=%0d din=%b expected=%b actual=%b",
                    i+1, din, expected, mealy_detect
                );
            end

            // FSM samples input here
            @(posedge clk);
            #1;

            // Update reference history after sampling the input
            history = {history[2:0], din};

            // Check Moore after its state has updated
            if (moore_detect === expected) begin
                pass_count = pass_count + 1;
            end
            else begin
                fail_count = fail_count + 1;
                $display(
                    "MOORE FAIL: bit=%0d din=%b expected=%b actual=%b",
                    i+1, din, expected, moore_detect
                );
            end

            $display(
                "Bit=%0d din=%b expected=%b Moore=%b Mealy=%b",
                i+1, din, expected, moore_detect, mealy_detect
            );

        end

        $display("--------------------------------");
        $display("Total checks : %0d", pass_count + fail_count);
        $display("PASS         : %0d", pass_count);
        $display("FAIL         : %0d", fail_count);
        $display("--------------------------------");

        if (fail_count == 0)
            $display("TEST PASSED");
        else
            $display("TEST FAILED");

        $finish;
    end

endmodule
