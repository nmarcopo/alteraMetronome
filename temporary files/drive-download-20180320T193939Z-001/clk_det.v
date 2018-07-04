module clk_det(

    input [7:0]BPM,
    input    CLOCK_50,
        
	reg counter,

	reg goal,
		
    output BEEP);
        
	@always (BPM, CLOCK_50)
	{
			BEEP = 0;
	
			goal = BPM * 50000 / 60;

		for (counter <= goal)
		{
			if CLOCK_50 == 1
				counter = counter + 1;
		}

		if counter == goal
			{
			BEEP = 1;
			
			counter = 0;
			}
	}
		
		
		
		
    // use clock_50 to blink light in time with BPM

endmodule
