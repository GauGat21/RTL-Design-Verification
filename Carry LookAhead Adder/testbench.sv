`timescale 1ns/1ps

module cla_tb;

    logic [3:0] A;
    logic [3:0] B;
    logic       cin;

    logic [3:0] Sum;
    logic       cout;

    logic [4:0] expected;

    cla dut (
        .A    (A),
        .B    (B),
        .cin  (cin),
        .Sum  (Sum),
        .cout (cout)
    );

    // Waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, cla_tb);
    end

    // Exhaustive test
    initial begin

        for (int a = 0; a < 16; a++) begin

            for (int b = 0; b < 16; b++) begin

                for (int c = 0; c < 2; c++) begin

                    A   = a;
                    B   = b;
                    cin = c;

                    #1;

                    expected = A + B + cin;

                    if ({cout, Sum} !== expected) begin
                        $error(
                            "FAIL: A=%04b B=%04b Cin=%b Expected=%05b Actual=%05b",
                            A, B, cin,
                            expected,
                            {cout, Sum}
                        );
                    end

                end
            end
        end


        $finish;
    end

endmodule
