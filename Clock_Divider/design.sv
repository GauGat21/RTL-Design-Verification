module clock_divider (
    input  logic       clk,
    input  logic       reset,
    output logic       div2,
    output logic       div4,
    output logic       div8,
    output logic       div16
);

    logic [3:0] count;

    always_ff @(posedge clk) begin
        if (reset)
            count <= 4'b0000;
        else
            count <= count + 1'b1;
    end

    assign div2  = count[0];
    assign div4  = count[1];
    assign div8  = count[2];
    assign div16 = count[3];

endmodule