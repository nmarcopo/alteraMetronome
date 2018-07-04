`timescale 1ns/1ns

module incrementer_tb();

reg SW;
reg DB;
wire [7:0] BPM;

incrementer uut(
	.SW 		(SW),
	.DB		(DB),
	.BPM		(BPM)
);

initial begin

		SW = 0; DB = 1;
		#10 DB = 0;
		#10 DB = 1;
		#10 SW = 1; DB = 0;
		#10 DB = 1;
		#10 DB = 0;
		#10 DB = 1;
		#10 DB = 0;
		#10;
		$stop;
		
end

endmodule