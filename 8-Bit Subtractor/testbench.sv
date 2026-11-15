
module tb_subtractor_8bit;

    logic [7:0] A, B;
    logic [7:0] DIFF;
    logic BORROW;

    logic [8:0] expected;

    integer i, j;
    integer pass_count, fail_count;

    subtractor_8bit dut (
        .A      (A),
        .B      (B),
        .DIFF   (DIFF),
        .BOUT (BORROW)
    );

    initial begin

        pass_count = 0;
        fail_count = 0;

        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin

                A = i;
                B = j;

                #1;

                expected = {1'b0, A} - {1'b0, B};

                if ({BORROW, DIFF} === expected) begin
                    pass_count = pass_count + 1;
                end
                else begin
                    fail_count = fail_count + 1;

                    $display(
                        "FAIL: A=%0d B=%0d",
                        A, B
                    );

                    $display(
                        "Expected=%b Actual=%b",
                        expected, {BORROW, DIFF}
                    );
                end

            end
        end

        $display("------------------------------");
        $display("Total tests : %0d", pass_count + fail_count);
        $display("PASS        : %0d", pass_count);
        $display("FAIL        : %0d", fail_count);
        $display("------------------------------");

        if (fail_count == 0)
            $display("8-BIT SUBTRACTOR TEST PASSED");
        else
            $fatal(1, "8-BIT SUBTRACTOR TEST FAILED");

        $finish;

    end

endmodule
