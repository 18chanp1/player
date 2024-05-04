/* Clock Divider Module From Labs 1/2 -- By Ishan Joshi, Student # 15161524 */

module clock_divider(clk_signal_in, counter_limit, clk_signal_out);
	// Input Clock Signal
	input logic clk_signal_in;
	// Limit for Counter --> "Count up to this limit"
	input logic [31:0] counter_limit;
	// Output Clock Signal --> Initialize at Low
	output logic clk_signal_out = 1'b0;
	
	// Counter
	logic [31:0] counter;
	// Reset
	logic reset = 1'b1; // Should reset
		
	// Sequential Always Block
	always_ff @(posedge clk_signal_in)
	begin
		// reset at 0
		if (reset)
		begin
			counter <= 32'b1;
			reset = 1'b0; // reset won't occur again
		end
		// Must be strict Less Than
		else if (counter < counter_limit)
		begin
			counter <= counter + 1;
		end
		// Counter has reached it's limit
		// Toggle clock signal and reset counter
		else
		begin
			counter <= 32'b1;
			clk_signal_out <= ~clk_signal_out;
		end
	end
endmodule
