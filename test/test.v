// Run using Run Verilog HDL code extension which can be found on the upper left of your vscode for test purposes. The OUTPUT should indicate [DONE].

module hello;
  initial
    begin
	$display("Hello, world.");
	$finish;
    end
endmodule