module system_de2(
	input [1:0] SW,
	input [0:0]	KEY,
	input CLOCK_50,
	
	// Audio Items
	input       AUD_ADCDAT,
	inout       AUD_BCLK,
	inout       AUD_ADCLRCK,
	inout       AUD_DACLRCK,
	inout       I2C_SDAT,
	output      AUD_XCK,
	output      AUD_DACDAT,
	output      I2C_SCLK,
	// End of Audio Items
	
	// LCD Items
		//LCD Module 16X2
	output 				LCD_ON,		// LCD Power ON/OFF
	output 				LCD_BLON,	// LCD Back Light ON/OFF
	output 				LCD_RW,		// LCD Read/Write Select, 0 = Write, 1 = Read
	output 				LCD_EN,		// LCD Enable
	output 				LCD_RS,		// LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] 		LCD_DATA,		// LCD Data bus 8 bits
	
	// End of LCD items
	
	output [6:0] LEDG,
	output [1:0] LEDR,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2);
	
	assign LEDR = { SW };
	
	/******* Audio Items *******/
	wire				   audio_out_allowed;
   wire     [31:0]   osc_out;
	
	
	
	/******* LCD Initialization *******/
	wire DLY_RST;
	
	// reset delay gives some time for peripherals to initialize
   Reset_Delay r0 (
      .iCLK		(CLOCK_50),
      .oRESET	(DLY_RST)
	);
	
	assign	LCD_ON	=	1'b1;
	assign	LCD_BLON	=	1'b1;
	
	wire [4:0] disp_addr;
	wire [7:0] disp_data;
	
	LCD_message (
		.SW		(SW),
		.raddr	(disp_addr),
		.dout		(disp_data)
	);
	
	LCD_Display u1(
	// Host Side
		.iCLK_50MHZ	(CLOCK_50),
		.iRST_N		(DLY_RST),
		.oMSG_INDEX	(disp_addr),
		.iMSG_ASCII	(disp_data),
	// LCD Side
		.DATA_BUS	(LCD_DATA),
		.LCD_RW		(LCD_RW),
		.LCD_E		(LCD_EN),
		.LCD_RS		(LCD_RS)
	);
	
	
	
	/******* System Initialization *******/
	system s(
		.SW			(SW),
		.CLOCK_50	(CLOCK_50),
		.KEY			(KEY),
		.LEDG			(LEDG[0]),
		.HEX0			(HEX0),
		.HEX1			(HEX1),
		.HEX2			(HEX2));
	
	assign	LEDG[1] = LEDG[0];
	assign 	LEDG[2] = LEDG[0];
	assign 	LEDG[3] = LEDG[0];
	assign 	LEDG[4] = LEDG[0];
	assign 	LEDG[5] = LEDG[0];
	assign 	LEDG[6] = LEDG[0];
	
	
	
	/******* Audio Module Initialization *******/
	square_wave_osc osc (
      .CLOCK_50						(CLOCK_50),
      .reset						   (~LEDG[0]),
      .out                       (osc_out)
   );
	
	Audio_Controller Audio_Controller (
      // Inputs
      .CLOCK_50						(CLOCK_50),
      .reset						   (~LEDG[0]),
      .left_channel_audio_out		(osc_out),
      .right_channel_audio_out	(osc_out),
      .write_audio_out			   (audio_out_allowed),
      .AUD_ADCDAT					   (AUD_ADCDAT),
      // Bidirectionals
      .AUD_BCLK					   (AUD_BCLK),
      .AUD_ADCLRCK				   (AUD_ADCLRCK),
      .AUD_DACLRCK				   (AUD_DACLRCK),
      // Outputs
      .audio_out_allowed			(audio_out_allowed),
      .AUD_XCK					      (AUD_XCK),
      .AUD_DACDAT					   (AUD_DACDAT),
   );
   
   avconf avc (
      .I2C_SCLK					(I2C_SCLK),
      .I2C_SDAT					(I2C_SDAT),
      .CLOCK_50					(CLOCK_50),
      .reset						(~LEDG[0])
   );
		
endmodule