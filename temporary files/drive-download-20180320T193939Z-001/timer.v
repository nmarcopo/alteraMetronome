module timer (
 
	input clk,
 
	input rst,
	
	input bpm,
	
	output t
	
	);

 
	reg [2:0] q;

 
	assign t = (q == 5);

 
	always @(posedge clk) begin

		if (rst || q == 5)
		
			q <= 0;
		
		else
			q <= q + 1;
 
	end

 
endmodule