`timescale 1ns/1ns

module clk_det_tb ();

reg	[7:0]BPM;

reg	CLOCK_50;

wire	BEEP;

clk_det uut(

.BPM			(BPM),

.CLOCK_50	(CLOCK_50),

.BEEP			(BEEP)

);

always
	#1 CLOCK_50 = ~CLOCK_50;

initial begin

	CLOCK_50 = 0; BPM = 120;
	#100000000;
	$stop;
	
	end
	
	endmodule