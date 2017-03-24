`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:53:12 03/23/2017
// Design Name:   ALU
// Module Name:   C:/Users/Sebastian/Documents/workspace/ModulosProyectoArqui1/ALU_TB.v
// Project Name:  ModulosProyectoArqui1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TB;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] Alu_CTRL;

	// Outputs
	wire C;
	wire Z;
	wire N;
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.Alu_CTRL(Alu_CTRL), 
		.C(C), 
		.Z(Z), 
		.N(N), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Alu_CTRL = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 32'd3;
		B = 32'd10;
		Alu_CTRL = 3'b001;
		#100;
		
		A = 32'd3;
		B = 32'd10;
		Alu_CTRL = 3'b010;
		#100;
		
		A = 32'd3;
		B = 32'd10;
		Alu_CTRL = 3'b011;
		#100;
		
		
		A = 32'd3;
		B = 32'd10;
		Alu_CTRL = 3'b100;
		#100;
		
		A = 32'd3;
		B = 32'd10;
		Alu_CTRL = 3'b000;
		#100;

	end
      
endmodule

