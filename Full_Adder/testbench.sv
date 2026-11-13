
module tb_full_adder;

    logic A;
    logic B;
    logic CIN;

    logic SUM;
    logic COUT;

    logic [1:0] expected;

    integer i;

    full_adder dut (
        .A(A),
        .B(B),
        .CIN(CIN),
        .SUM(SUM),
        .COUT(COUT)
    );

    initial begin

        $display("A B CIN | SUM COUT | STATUS");

        for (i = 0; i < 8; i = i + 1) begin

            {A, B, CIN} = i[2:0];

            #10;

            expected = A + B + CIN;

            if ({COUT, SUM} === expected) begin

                $display("%0b %0b  %0b  |  %0b    %0b  | PASS",
                         A, B, CIN, SUM, COUT);

            end
            else begin

                $display("%0b %0b  %0b  |  %0b    %0b  | FAIL",
                         A, B, CIN, SUM, COUT);

                $error("Full Adder mismatch!");
            end

        end

        $display("Full Adder verification completed.");

        $finish;

    end

endmodule
