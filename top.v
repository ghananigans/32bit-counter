/*
 * MODULE: top
 *
 * DESCRIPTION: 2x 32-bit counters (module count) that will have their outputs
 *              compared.
 *
 * PARAMETERS:
 *   N/A
 *
 * INPUTS:
 *   clk
 *     - Clock.
 *   rstn1
 *     - Active-low reset for counter 1.
 *   rstn2
 *     - Active-low reset for counter 2.
 *
 * OUTPUTS:
 *   cnt1 [31:0]
 *     - Counter output for counter 1.
 *   cnt2 [31:0]
 *     - Counter output for counter 2.
 *   diff
 *     - Active-high output when counters are different.
 */
module top (
	clk,
	rstn1,
	rstn2,
	cnt1,
	cnt2,
	diff
);

	// Input Port Declarations
	input	wire			clk;
	input	wire			rstn1;
	input	wire			rstn2;

	// Output Port Declarations
	output	wire	[31:0]	cnt1;
	output	wire	[31:0]	cnt2;
	output	wire			diff;

	count COUNTER1 (
		.clk( clk ),
		.rstn( rstn1 ),
		.cnt( cnt1 )
	);

	count COUNTER2 (
		.clk( clk ),
		.rstn( rstn2 ),
		.cnt( cnt2 )
	);

	// Assign outputs
	assign diff = cnt1 != cnt2;

endmodule
