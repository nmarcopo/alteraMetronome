module clk_det(

   input [7:0]BPM,
   input    CLOCK_50,
	
   output reg BEEP
	
	);
   
	reg [31:0] goal = 0;
	reg [31:0] counter = 0;
	reg [31:0] lightcount = 0;

	always@ (posedge(CLOCK_50)) begin
		goal <= 50000000 * 60 / BPM;
		
		counter <= counter + 1;
		lightcount <= lightcount + 1;
		
		if(counter == goal) begin
			BEEP <= 1;
			counter <= 0;
			lightcount <= 0;
			
		end
		else if(lightcount > 1000000)	
			BEEP <= 0;
		
	// use clock_50 to blink light in time with BPM

	end
		
endmodule
