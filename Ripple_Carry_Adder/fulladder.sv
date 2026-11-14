module fulladder (
    input  logic A,
    input  logic B,
    input  logic CIN,
    output logic SUM,
    output logic COUT
);

    logic P, G;

    assign P    = A ^ B;
    assign G    = A & B;
    assign SUM  = P ^ CIN;
    assign COUT = G | (P & CIN);

endmodule
