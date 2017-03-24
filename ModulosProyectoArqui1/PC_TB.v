`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:26:18 03/24/2017
// Design Name:   PC
// Module Name:   C:/Image-Filter/PC_TB.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_TB;

	// Inputs
	reg [31:0] Di_pc;
	reg clk;

	// Outputs
	wire [31:0] Do_pc;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.Di_pc(Di_pc), 
		.clk(clk), 
		.Do_pc(Do_pc)
	);

	initial begin
		// Initialize Inputs
		Di_pc = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

