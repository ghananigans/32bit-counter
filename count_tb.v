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

	// Count module
	count COUNTER (
		.clk( clk ),
		.rstn( rstn ),
		.cnt( cnt )
	);

	// Generate a clock
	initial
	begin
		clk <= 1;
		forever #5 clk <= ~clk;
	end

	// Reset
	initial
	begin
		rstn <= 0;
		#10 rstn <= 1;

		// cnt should be 10. Reset now.
		#100 rstn <= 0;
		#10 rstn <= 1;

		// cnt should be 5. Reset now.
		#50 rstn <= 0;

		// Leave it at 0 for 5 periods.
		#50 rstn <= 1;
	end

endmodule
