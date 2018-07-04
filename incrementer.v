module incrementer(

    input [1:0] SW,
    input DB,
    
    output reg [7:0] BPM
    );

	 initial BPM = 8'd121;
		
	always @(posedge DB) begin 
	
		if(SW[1])
			BPM <= 8'd120;
		// account for divide by 0
		else if(BPM == 1 & SW[0] == 0)
			BPM <= 8'd255;
		else if(BPM == 255 & SW[0] == 1)
			BPM <= 8'd1;
		else if(SW[0])
			BPM <= BPM + 1;
		else
			BPM <= BPM - 1;

	end
    
endmodule    