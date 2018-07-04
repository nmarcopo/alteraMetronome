`timescale 1ns/1ns

module bin_to_dec_tb();

reg 		[7:0]binary;

wire		[3:0]huns;

wire		[3:0]tens;

wire		[3:0]ones;



bin_to_dec uut(

.binary		(binary),

.huns			(huns),

.tens			(tens),

.ones			(ones)

);




initial begin

		binary = 8'd0;
		#10 binary = 8'd123;
		#10 binary = 8'd75;
		#10 binary = 8'd3;
		#10 binary = 8'd220;
		#10;
		$stop;
		
	end
		
		
endmodule
		
		
