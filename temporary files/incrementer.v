module incrementer(

    input SW,
    input DB,
	input [7:0]modtime,
    
    output reg [7:0]BPM,
    output reg [2:0]digit_100,
    output reg [2:0]digit_10,
    output reg [2:0]digit_1
    
    );    
        
		
		
	always @(SW, DB) begin 
	
		if DB == 0{
			case(SW)
		
				(0)		BPM = modtime - 8'b1;
		
				(1)		BPM = modtime + 8'b1;
		
			endcase
		}
		
		// implement binary to BCD converter (look at firefox bookmarks thomas)
		
		bin_to_dec conv(
		
			.binary (BPM),
			
			.huns 	(digit_100),
			
			.tens	(digit_10),
			
			.ones	(digit_1)
		
		)
	
	end
    
endmodule    