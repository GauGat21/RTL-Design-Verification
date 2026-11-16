
module tb_adder_subtractor_8bit;

    logic [7:0] A, B;
    logic MODE;

    logic [7:0] RESULT;
    logic COUT;

    logic [8:0] expected;

    integer i, j, m;
    integer pass_count, fail_count;

    adder_subtractor_8bit dut (
        .A      (A),
        .B      (B),
        .MODE   (MODE),
        .RESULT (RESULT),
        .COUT   (COUT)
    );

    initial begin

        pass_count = 0;
        fail_count = 0;

        for (m = 0; m < 2; m = m + 1) begin
            for (i = 0; i < 256; i = i + 1) begin
                for (j = 0; j < 256; j = j + 1) begin

                    MODE = m;
                    A = i;
                    B = j;

                    #1;

                    if (MODE == 1'b0) begin
                        expected = {1'b0, A} +
                                   {1'b0, B};
                    end
                    else begin
                        expected = {1'b0, A} +
                                   {1'b0, ~B} +
                                   9'd1;
                    end

                    if ({COUT, RESULT} === expected) begin
                        pass_count = pass_count + 1;
                    end
                    else begin
                        fail_count = fail_count + 1;

                        $display(
                            "FAIL: MODE=%b A=%h B=%h",
                            MODE, A, B
                        );

                        $display(
                            "Expected=%b Actual=%b",
                            expected, {COUT, RESULT}
                        );
                    end

                end
            end
        end

        $display("--------------------------------");
        $display("Total tests : %0d", pass_count + fail_count);
        $display("PASS        : %0d", pass_count);
        $display("FAIL        : %0d", fail_count);
        $display("--------------------------------");

        if (fail_count == 0)
            $display("ADDER SUBTRACTOR TEST PASSED");
        else
            $fatal(1, "ADDER SUBTRACTOR TEST FAILED");

        $finish;

    end

endmodule
