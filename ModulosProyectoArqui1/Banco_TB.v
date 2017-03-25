`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:39:39 03/24/2017
// Design Name:   Banco
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/Banco_TB.v
// Project Name:  ModulosProyectoArqui1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Banco
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Banco_TB;

	// Inputs
	reg clk=0;
	reg WE_C;
	reg WE_V;
	reg [3:0] DirA;
	reg [3:0] DirB;
	reg [3:0] DirC;
	reg [3:0] DirV;
	reg [31:0] DinC;
	reg [31:0] DinV;

	// Outputs
	wire [31:0] DoA;
	wire [31:0] DoB;

	// Instantiate the Unit Under Test (UUT)
	Banco uut (
		.clk(clk), 
		.WE_C(WE_C), 
		.WE_V(WE_V), 
		.DirA(DirA), 
		.DirB(DirB), 
		.DirC(DirC), 
		.DirV(DirV), 
		.DinC(DinC), 
		.DinV(DinV), 
		.DoA(DoA), 
		.DoB(DoB)
	);
	always #50 clk=~clk; 
	initial begin
		// Initialize Inputs
		WE_C = 0;
		WE_V = 0;
		DirA = 0;
		DirB = 0;
		DirC = 0;
		DirV = 0;
		DinC = 0;
		DinV = 0;

		// Wait 100 ns for global reset to finish
		#100;
        

		
		//escribo un 54 en R3
		//leo R3=54
		WE_C = 0;
		WE_V = 1;
		DirA = 4'd3;
		DirB = 0;
		DirC = 4'd3;
		DirV = 4'd15;
		DinC = 32'd54;
		DinV = 32'd19;
		#100;
		
		//Escribo  un 99 en R15 
		//leo R3=54 y R15=99
		WE_C = 1;
		WE_V = 0;
		DirA = 4'd3;
		DirB = 4'd15;
		DirC = 4'd3;
		DirV = 4'd15;
		DinC = 32'd54;
		DinV = 32'd99;
		#100;

	end
      
endmodule

