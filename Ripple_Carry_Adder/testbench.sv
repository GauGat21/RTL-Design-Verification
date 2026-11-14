
module tb_ripple_carry_adder;

    logic [3:0] A, B;
    logic CIN;

    logic [3:0] SUM;
    logic COUT;

    logic [4:0] expected;

    integer i, j, k;
    integer pass_count;
    integer fail_count;

    ripple_carry_adder dut (
        .A    (A),
        .B    (B),
        .CIN  (CIN),
        .SUM  (SUM),
        .COUT (COUT)
    );

    initial begin

        pass_count = 0;
        fail_count = 0;

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin

                    A   = i;
                    B   = j;
                    CIN = k;

                    #10;

                    expected = {1'b0, A} +
                               {1'b0, B} +
                               CIN;

                    if ({COUT, SUM} === expected) begin
                        pass_count = pass_count + 1;
                    end
                    else begin
                        fail_count = fail_count + 1;

                        $display(
                            "FAIL: A=%b B=%b CIN=%b",
                            A, B, CIN
                        );

                        $display(
                            "Expected=%b Actual=%b",
                            expected, {COUT, SUM}
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
            $display("RIPPLE CARRY ADDER TEST PASSED");
        else
            $fatal(1, "RIPPLE CARRY ADDER TEST FAILED");

        $finish;

    end

endmodule
