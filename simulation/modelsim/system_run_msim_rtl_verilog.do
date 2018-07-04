transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/LCD_message.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/reset_delay.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/LCD_Display.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/I2C_Controller.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/avconf.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/Audio_Controller.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/Audio_Clock.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/Altera_UP_SYNC_FIFO.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/Altera_UP_Clock_Edge.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/Altera_UP_Audio_Out_Serializer.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/Altera_UP_Audio_In_Deserializer.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project/audio {N:/Veralog/Midterm Project/audio/Altera_UP_Audio_Bit_Counter.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/system.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/debouncer.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/incrementer.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/disp.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/clk_det.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/system_de2.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/bin_to_dec.v}
vlog -vlog01compat -work work +incdir+N:/Veralog/Midterm\ Project {N:/Veralog/Midterm Project/square_wave_osc.v}

