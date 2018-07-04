module system(
	input [1:0] SW,
	input KEY,
	input CLOCK_50,
	
	output LEDG,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2);

	// Main system module to connect everything together.
	wire debouncer_to_inc;
	wire debouncer_to_res;
	wire [7:0]inc_to_clk_det;
	wire [3:0]inc_to_disp100;
	wire [3:0]inc_to_disp10;
	wire [3:0]inc_to_disp1;
	
	// debounces button and sends button input to incrementer
	debouncer d(
		.CLOCK_50		(CLOCK_50),
		.in				(KEY),
		.out				(debouncer_to_inc)
	);
		
	// increments BPM value and sends data to clk_det and the three displays
	incrementer inc(
		.SW				(SW),
		.DB				(debouncer_to_inc),
		.BPM				(inc_to_clk_det)
	);
	
	bin_to_dec conv(
		.binary			(inc_to_clk_det),
		.huns				(inc_to_disp100),
		.tens				(inc_to_disp10),
		.ones				(inc_to_disp1)
	);
	
	// determines when the light shall shine
	clk_det	clk_det(
		.BPM				(inc_to_clk_det),
		.CLOCK_50		(CLOCK_50),
		.BEEP				(LEDG)
	);

	//display modules
	disp disp100(
		.in				(inc_to_disp100),
		//check to see if this is actually the 100's place on the board
		.out				(HEX2)
	);
	
	disp disp10(
		.in		(inc_to_disp10),
		.out		(HEX1)		
	);
	
	disp disp1(
		.in		(inc_to_disp1),
		.out		(HEX0)		
	);	
	
endmodule