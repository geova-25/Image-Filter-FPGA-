`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:29:04 04/02/2017 
// Design Name: 
// Module Name:    Asteroid 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Asteroid(
	 input clk,
	 input wire reset,
    output wire vga_hs,
	 output wire vga_vs, 
	 output wire solicitud,
	 output wire vga_blank,
	 output wire vga_clock,
    output wire [7:0]r_out,
	 output wire [7:0]g_out,
	 output wire [7:0]b_out,
	 output wire bandera,
	 output wire [31:0]instr
    );
	 
	 wire [7:0]byte_In;
	 wire [18:0]Adress_byte;
	 wire CLK_25MHz;
	 reg clk_12MHz = 1'b0;
	 reg clk_6MHz = 1'b0;
	 
	
	ClockDivision25MHz divisor(
	
			.clk(clk),
			.clk_25MHz(CLK_25MHz)
    );

	 always @(posedge CLK_25MHz)
		clk_12MHz <= ~clk_12MHz;

	always @(posedge clk_12MHz)
	clk_6MHz <= ~clk_6MHz;

	 
	 ImageFilter procesador(
		.clk(CLK_25MHz),
		.vgaAdress(Adress_byte),
		.ImageData(byte_In),
		.ALU_result_wb(),
		.Instruccion(instr)
	 );
	 
	 VGA_Interface moduloVGA(
		.clk(CLK_25MHz), 
		.reset(reset),
		.byte_In(byte_In),
		.Adress_byte(Adress_byte),
		.vga_hs(vga_hs),
		.vga_vs(vga_vs), 
		.solicitud(solicitud),
		.vga_blank(vga_blank),
		.vga_clock(vga_clock),
		.r_out(r_out),
		.g_out(g_out),
		.b_out(b_out)
   );
	assign bandera = (instr == 32'h9EFFFFFE)|(instr == 32'h9efffffe);


endmodule
