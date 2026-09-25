module majority5 (
    input  wire A,
    input  wire B,
    input  wire C,
    input  wire D,
    input  wire E,
    output wire Y
);

    wire ABC;
    wire ABD;
    wire ABE;
    wire ACD;
    wire ACE;
    wire ADE;
    wire BCD;
    wire BCE;
    wire BDE;
    wire CDE;

    and g1(ABC, A, B, C);
    and g2(ABD, A, B, D);
    and g3(ABE, A, B, E);
    and g4(ACD, A, C, D);
    and g5(ACE, A, C, E);
    and g6(ADE, A, D, E);
    and g7(BCD, B, C, D);
    and g8(BCE, B, C, E);
    and g9(BDE, B, D, E);
    and g10(CDE, C, D, E);

    or g11(Y, ABC, ABD, ABE, ACD, ACE,
               ADE, BCD, BCE, BDE, CDE);

endmodule