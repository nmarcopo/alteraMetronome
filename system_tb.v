`timescale 1ns/1ns

module system_tb ();

		reg SW;
		
		reg KEY;
		
		reg CLOCK_50;
		
		wire LEDG;
		
		wire [6:0]HEX0;
		
		wire [6:0]HEX1;
		
		wire [6:0]HEX2;
		
		system uut(
		
		.SW			(SW),
		
		.KEY			(KEY),
		
		.CLOCK_50	(CLOCK_50),
	
		.LEDG			(LEDG),
		
		.HEX0			(HEX0),
		
		.HEX1			(HEX1),
		
		.HEX2			(HEX2)
		
		);
		
		
		always
			#1	CLOCK_50 = ~CLOCK_50;
			
			
			initial begin
				
				CLOCK_50 = 0; SW = 0; KEY = 1; 
				#1		KEY = 0;
				#1		KEY = 1;
				#1		KEY = 0;
				#1		SW = 1; KEY = 1;
				#100000000;
				$stop;
			end
				
endmodule
			