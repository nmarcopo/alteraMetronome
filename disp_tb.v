`timescale 1 ns/1 ns

module disp_tb();

	reg [3:0]in;
	wire [6:0]out;
	
	disp uut(
	
		.in		(in),
		.out		(out)
	
	);
	
	initial begin
			in = 4'd0;
		#10 in = 4'd1;
		#10 in = 4'd2;
		#10 in = 4'd3;
		#10 in = 4'd4;
		#10 in = 4'd5;
		#10 in = 4'd6;
		#10 in = 4'd7;
		#10 in = 4'd8;
		#10 in = 4'd9;
		#10 in = 4'd10;
		#10 in = 4'd11;
		#10 in = 4'd12;
		#10 in = 4'd13;
		#10 in = 4'd14;
		#10 in = 4'd15;
		#10;
		
		$stop;
	end
endmodule