module LCD_message (
	input		   [1:0] SW,
	input			[4:0] raddr,
	output reg	[7:0]	dout
	);
	
   always @(raddr, SW)
		case (SW[1:0])
		
			0: begin
				case(raddr)
					0: dout = "M";
					1: dout = "o";
					2: dout = "d";
					3: dout = "e";
					4: dout = ":";
					16: dout = "D";
					17: dout = "e";
					18: dout = "c";
					19: dout = "r";
					20: dout = "e";
					21: dout = "a";
					22: dout = "s";
					23: dout = "e";
					default: dout = " ";
				endcase
			end
			
			1: begin
				case(raddr)
					0: dout = "M";
					1: dout = "o";
					2: dout = "d";
					3: dout = "e";
					4: dout = ":";
					16: dout = "I";
					17: dout = "n";
					18: dout = "c";
					19: dout = "r";
					20: dout = "e";
					21: dout = "a";
					22: dout = "s";
					23: dout = "e";
					default: dout = " ";
				endcase
			end
			
			default: begin
				case(raddr)
					0: dout = "M";
					1: dout = "o";
					2: dout = "d";
					3: dout = "e";
					4: dout = ":";
					16: dout = "R";
					17: dout = "e";
					18: dout = "s";
					19: dout = "e";
					20: dout = "t";
					default: dout = " ";
				endcase
			end
		endcase
	
endmodule
