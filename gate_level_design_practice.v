/*
    This HDL code is for practice, reference, and review.
*/

module half_adder(
    A, 
    B, 
    S, 
    Cout
);

    input A, B;
    output S, Cout;
    
    xor (S, A, B);
    and (C, A, B);

endmodule


module full_adder (
    A,
    B,
    S,
    Cin,
    Cout
);
    
    input A, B, Cin;
    output S, Cout;

    xor (S, A, B, Cin);
    or or1 (W1, A, B);
    and and1 (W2, W1, Cin);
    and and2 (W3, A, B);
    or or2 (Cout, W2, W3);

endmodule


module full_adder2 (
    A,
    B,
    Cin,
    Sun,
    Cout
);

    input A, B, Cin;
    output S, Cout;

    half_adder ha1(A, B, S1, C1);
    half_adder ha2(Cin, S1, S, C2);
    or(Cout, C2, C1);
    
endmodule


module FourBit_adder (
    A, 
    B, 
    Cin, 
    S, 
    Cout
);
    input [0:3] A, B;
    input Cin;
    output [0:3] S;
    output Cout;

    full_adder fa1 (A[0], B[0], Cin, S[0], C1);
    full_adder fa2 (A[1], B[1], C1, S[1], C2);
    full_adder fa3 (A[2], B[2], C2, S[2], C3);
    full_adder fa4 (A[3], B[3], C3, S[3], C4);

endmodule


module mult_2x1 (
    I0,
    I1,
    A,
    Z
);

    input I0, I1, A;
    output Z;

    not (W1, A);
    and and1(W2, I0, W1);
    and and2(W3, I1, A);
    or (Z, W2, W3);
    
endmodule

module mult_4x1 (
    I0,
    I1,
    I2,
    I3,
    S0,
    S1,
    Y
);

    input I0, I1, I2, I3, S0, S1;
    output Y;

    not (W1, S0);
    not (W2, S1);
    and (W3, I0, W1, W2);
    and (W4, I1, W2, S0);
    and (W5, I2, S1, W1);
    and (W6, I3, S1, S0);
    or (Y, W3, W4, W5, W6);
    
endmodule


module mult_4x1_2 (
    I0,
    I1,
    I2,
    I3,
    S0,
    S1,
    Y
);

    input I0, I1, I2, I3, S0, S1;
    output Y;

    mult_2x1 m1(I0, I1, S0, W1);
    mult_2x1 m2(I2, I3, S0, W2);
    mult_2x1 m3(W1, W2, S1, Y);
    
endmodule


// https://static.javatpoint.com/tutorial/digital-electronics/images/multiplexer9.png

// 8x1 Multiplexer using only primitive gates
module mult_8x1 (
    A0,
    A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    A7,
    S0
    S1,
    S2,
    Y
);

    /* making the signals "scalar" allows for extensibility and reusability
    of the model for future use */ 
    input A0, A1, A2, A3, A4, A5, A6, A7, S0, S1, S2;
    output Y;

    not not1 (W1, S2);
    not not2 (W2, S1);
    not not3 (W3, S0);
    and and1 (W4, A7, W1, W2, W3);
    and and2 (W5, A6, W1, W2, S0);
    and and3 (W6, A5, W1, S1, W3);
    and and4 (W7, A4, W1, S1, S0);
    and and5 (W8, A3, W2, S2, W3);
    and and6 (W9, A2, S2, W2, W3);
    and and7 (W10, A1, S2, W2, W3);
    and and8 (W11, A0, S2, S1, S0);
    or or1 (Y, W4, W5, W6, W7, W8, W9, W10, W11);

endmodule




// https://electronics-fun.com/wp-content/uploads/2020/12/8x1-mux-using-2x1-mux.png

// 8X1 Multiplexer using 2x1 Multiplexers
module mult_8x1_2 (
    A0,
    A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    A7,
    S0
    S1,
    S2,
    Y
);

    /* making the signals "scalar" allows for extensibility and reusability
    of the model for future use */ 
    input A0, A1, A2, A3, A4, A5, A6, A7, S0, S1, S2;
    output Y;

    mult_2x1 m1 (A0, A1, S0, W1);
    mult_2x1 m2 (A2, A3, S0, W2);
    mult_2x1 m3 (A4, A5, S0, W3);
    mult_2x1 m4 (A6, A7, S0, W4);
    mult_2x1 m5 (W1, W2, S1, W5);
    mult_2x1 m6 (W3, W4, S1, W6);
    mult_2x1 m7 (W5, W6, S2, Y);
    
endmodule



// https://3.bp.blogspot.com/-119YPRdkAt0/WPCQoZriiHI/AAAAAAAAAD0/7Yn3viiyFKIsvZ8GPxMmb0z9yuaCbfkVQCLcB/s1600/8x1.PNG
// Note: typical logic diagram has "enable" in S2 signal, but in our 4x1 multiplexer only allows two control signals (S0 & S1), thus we need to have an alternative diagram such as above.

module mult_8x1_3 (
    A0,
    A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    A7,
    S0
    S1,
    S2,
    Y
);

    /* making the signals "scalar" allows for extensibility and reusability
    of the model for future use */ 
    input A0, A1, A2, A3, A4, A5, A6, A7, S0, S1, S2;
    output Y;

    mult_4x1 m1 (A0, A1, A2, A3, S0, S1, W1);
    mult_4x1 m2 (A0, A1, A2, A3, S0, S1, W2);
    not not1 (W3, S2);
    and and1 (W4, W1, W3);
    and and2 (W5, W2, S2);
    or or1 (Y, W4, W5);
    
endmodule
