// [1/2] For testing iverilog, gtk wave, and vscode extensions workflow. One should be able to configure all of these for stable setup.

`include "xor.v"

module xor_tb ();
    reg a, b;
    wire out;

    xor_gate G1 (a, b, out);

    initial begin
        $dumpfile("xor_tb.vcd");
        $dumpvars(0, xor_tb);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

    end
    
endmodule