/*
 * MODULE: count
 *
 * DESCRIPTION: 32-bit counter with an active-low synchronous reset.
 *
 * PARAMETERS:
 *   N/A
 *
 * INPUTS:
 *   clk
 *     - Clock.
 *   rstn
 *     - Active-low reset.
 *
 * OUTPUTS:
 *   cnt [31:0]
 *     - Counter output.
 */
module count (
	clk,
	rstn,
	cnt
);

	// Input Port Declarations
	input			clk;
	input			rstn;

	// Output Port Declarations
	output	[31:0]	cnt;

	// Regs
	reg		[31:0]	counter;

	// Counter
	always @ ( posedge clk )
	begin : COUNTER
		if ( rstn == 0 )
		begin
			counter <= 32'd0;
		end
		else
		begin
			counter <= counter + 1;
		end
	end

	// Assign outputs
	assign cnt = counter;

endmodule
