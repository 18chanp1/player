/* 5-bit Linear Feedback Shift Register Module for Lab 5 */

module linear_feedback_shift_register_5_bit
(
	input logic clk,
	input logic reset,
	output logic [4:0] lfsr = 5'b00001 // Initial value
);

	/* XOR Gate */
	logic feedback;
	assign feedback = lfsr[0] ^ lfsr[2];
	
	/* Sequential block */
	always_ff @(posedge clk, posedge reset)
	begin
		/* Asynchronous Reset to initialize LFSR registers */
		if (reset) lfsr <= 5'b00001;
		else
		begin
			lfsr[3] <= lfsr[4];
			lfsr[2] <= lfsr[3];
			lfsr[1] <= lfsr[2];
			lfsr[0] <= lfsr[1];
			lfsr[4] <= feedback;
		end
	end
	
endmodule

