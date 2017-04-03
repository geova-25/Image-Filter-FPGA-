`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:42:52 04/02/2017
// Design Name:   Asteroid
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/Asteroid_TB.v
// Project Name:  FiltroMorfologico
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Asteroid
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Asteroid_TB;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire vga_hs;
	wire vga_vs;
	wire solicitud;
	wire vga_blank;
	wire vga_clock;
	wire [7:0] r_out;
	wire [7:0] g_out;
	wire [7:0] b_out;
	wire bandera;
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	Asteroid uut (
		.clk(clk), 
		.reset(reset), 
		.vga_hs(vga_hs), 
		.vga_vs(vga_vs), 
		.solicitud(solicitud), 
		.vga_blank(vga_blank), 
		.vga_clock(vga_clock), 
		.r_out(r_out), 
		.g_out(g_out), 
		.b_out(b_out), 
		.bandera(bandera), 
		.instr(instr)
	);
	integer y=0;
	initial begin
				// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$display("\tinstr"); 
        while (y<5888000)
		  begin
			clk = 1;
			#5;
			clk = 0;
			#5;
			y = y+1;
			
				$monitor("\t%h",instr); 
		
		  end
		// Add stimulus here

	end
      
endmodule

