/*
 * MODULE: top
 *
 * DESCRIPTION: Testbench for 2x 32-bit counters (module count) that will have
 *              their outputs compared.
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
module top_tb ();
	// Internal
	reg				clk;
	reg				rstn1;
	reg				rstn2;
	wire	[31:0]	cnt1;
	wire	[31:0]	cnt2;
	wire			diff;

	// Top module
	top TOP (
		.clk( clk ),
		.rstn1( rstn1 ),
		.rstn2( rstn2 ),
		.cnt1( cnt1 ),
		.cnt2( cnt2 ),
		.diff( diff )
	);

	// Generate a clock
	initial
	begin
		clk <= 1;
		forever #5 clk <= ~clk;
	end

	initial
	begin
		rstn1 <= 0;
		rstn2 <= 0;

		#10 rstn1 <= 1;
		rstn2 <= 1;

		// diff should be 0 until now.
		#100 rstn1 <= 0;
		#10 rstn1 <= 1;
	end

endmodule
