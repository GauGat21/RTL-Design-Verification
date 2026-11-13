
module tb_half_adder;

    logic A;
    logic B;
    logic SUM;
    logic CARRY;

    logic expected_sum;
    logic expected_carry;

    integer i;

    half_adder dut (
        .A(A),
        .B(B),
        .SUM(SUM),
        .CARRY(CARRY)
    );

    initial begin

        $display("A B | SUM CARRY | STATUS");

        for (i = 0; i < 4; i = i + 1) begin

            {A, B} = i[1:0];

            #10;

            expected_sum   = A ^ B;
            expected_carry = A & B;

            if ((SUM === expected_sum) &&
                (CARRY === expected_carry)) begin

                $display("%0b %0b |  %0b    %0b   | PASS",
                         A, B, SUM, CARRY);

            end
            else begin

                $display("%0b %0b |  %0b    %0b   | FAIL",
                         A, B, SUM, CARRY);

                $error("Half Adder output mismatch!");
            end

        end

        $display("Half Adder verification completed.");
        $finish;

    end

endmodule
