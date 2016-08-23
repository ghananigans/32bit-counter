/*
 * MODULE: count_tb
 *
 * DESCRIPTION: Testbench for 32-bit counter with an active-low synchronous
 *              reset.
 *
 * PARAMETERS:
 *   N/A
 *
 * INPUTS:
 *   N/A
 *
 * OUTPUTS:
 *   N/A
 */
module count_tb ();
	// Internal
	reg				clk;
	reg				rstn;
	wire	[31:0]	cnt;

	count COUNTER (
		.clk( clk ),
		.rstn( rstn ),
		.cnt( cnt )
	);

	// Generate a clock
	initial
	begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	// Reset
	initial
	begin
		rstn = 0;
		#10 rstn = 1;
	end

endmodule
