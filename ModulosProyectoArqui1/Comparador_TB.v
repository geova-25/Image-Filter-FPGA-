`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:32:19 03/25/2017
// Design Name:   Comparador
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/Comparador_TB.v
// Project Name:  ModulosProyectoArqui1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comparador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Comparador_TB;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [7:0] C;
	reg [7:0] D;
	reg [7:0] E;

	// Outputs
	wire [7:0] mayor;

	// Instantiate the Unit Under Test (UUT)
	Comparador uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.E(E), 
		.mayor(mayor)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		E = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 8'b00110011;
		B = 8'b10000000;
		C = 8'b00011111;
		D = 8'b10000000;
		E = 8'b00000000;

	end
      
endmodule

