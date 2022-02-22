// [1/2] For testing iverilog, gtk wave, and vscode extensions workflow. One should be able to configure all of these for stable setup.

module xor_gate (
    input a,
    input b,
    output out
);
    assign out = a ^ b;

endmodule
