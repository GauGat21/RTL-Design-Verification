`timescale 1ns/1ps

module priority_encoder4to2 (
    input  logic [3:0] I,
    output logic [1:0] Y,
    output logic       valid
);

    always_comb begin
        Y = 2'b00;
        valid = 1'b0;

        if (I[3]) begin
            Y = 2'b11;
            valid = 1'b1;
        end
        else if (I[2]) begin
            Y = 2'b10;
            valid = 1'b1;
        end
        else if (I[1]) begin
            Y = 2'b01;
            valid = 1'b1;
        end
        else if (I[0]) begin
            Y = 2'b00;
            valid = 1'b1;
        end
    end

endmodule
