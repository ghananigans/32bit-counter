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
	input	wire			clk;
	input	wire			rstn;

	// Output Port Declarations
	output	reg		[31:0]	cnt;

	// Counter
	always @ ( posedge clk )
	begin : COUNTER
		if ( rstn == 0 )
		begin
			cnt <= 32'd0;
		end
		else
		begin
			cnt <= cnt + 1;
		end
	end

endmodule
