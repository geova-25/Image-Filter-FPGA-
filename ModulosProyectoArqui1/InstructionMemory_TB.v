`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:55:51 03/24/2017
// Design Name:   InstructionMemory
// Module Name:   C:/Image-Filter/InstructionMemoryTest.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionMemoryTest;

	// Inputs
	reg [31:0] DIR;

	// Outputs
	wire [31:0] DO;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.DIR(DIR), 
		.DO(DO)
	);

	initial begin
		// Initialize Inputs
		DIR = 0;

		// Wait 100 ns for global reset to finish
		#100;
		DIR = 4;
		#100;
		DIR = 8;
		#100;
		DIR = 12;		
		#100;
		DIR = 16;		
        
		// Add stimulus here

	end
      
endmodule

