module tb_linear_feedback_shift_register_5_bit;
	
	/* Inputs */
	logic clk, reset;
	
	/* Outputs */
	logic [4:0] lfsr;
	
	
	/* Instantiation */
	linear_feedback_shift_register_5_bit DUT
	(
		.clk(clk),
		.reset(reset),
		.lfsr(lfsr)
	);
	
	
	/* Clk initial forever block */
	initial forever begin
		clk = 1'b1;
		#5;
		clk = 1'b0;
		#5;
	end
	
	/* Test */
	initial begin
		reset = 1'b1;
		#20;
		reset = 1'b0;
		#400; // observe lfsr values over clock cycles
		$stop;
	end


endmodule
