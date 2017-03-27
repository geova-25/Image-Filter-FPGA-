`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:06:32 03/26/2017
// Design Name:   REG_IF_ID
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/REG_IF_ID_TB.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: REG_IF_ID
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module REG_IF_ID_TB;

	// Inputs
	reg clk;
	reg [31:0] Instruction;
	reg [31:0] Pcmas4_In;

	// Outputs
	wire [31:0] Pcmas4;
	wire [3:0] OpCode;
	wire [1:0] Cond;
	wire [1:0] F;
	wire [3:0] Rg;
	wire [3:0] Rp;
	wire [3:0] Rs;
	wire [15:0] Inm;
	wire [23:0] Label;

	// Instantiate the Unit Under Test (UUT)
	REG_IF_ID uut (
		.clk(clk), 
		.Instruction(Instruction), 
		.Pcmas4_In(Pcmas4_In), 
		.Pcmas4(Pcmas4), 
		.OpCode(OpCode), 
		.Cond(Cond), 
		.F(F), 
		.Rg(Rg), 
		.Rp(Rp), 
		.Rs(Rs), 
		.Inm(Inm), 
		.Label(Label)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Instruction = 0;
		Pcmas4_In = 0;

		//--------------------------------------- SUM R0, R1, R7
		#100;
		clk = 1;
		Instruction = 32'b0000_0000_0000_0001_0111_0000_0000_0000;
		Pcmas4_In = 4;		
		
		#100;
		clk = 0;
		Instruction = 32'b0000_0000_0000_0001_0111_0000_0000_0000;
		Pcmas4_In = 4;				
		
		//--------------------------------------- SUMI R0, R1, R7
		#100;
		clk = 1;
		Instruction = 32'b0001_0001_0111_0101_1011_0000_0000_0000;
		Pcmas4_In = 8;		
		
		#100;
		clk = 0;
		Instruction = 32'b0000_0001_0001_0111_0000_0000_0000_0000;
		Pcmas4_In = 8;
		//--------------------------------------- STO [0XC]
		#100;
		clk = 1;
		Instruction = 32'b1001_1110_0111_1111_0001_0010_0011_0100;
		Pcmas4_In = 8;		
		
		#100;
		clk = 0;
		Instruction = 32'b1001_1110_0111_1111_0001_0010_0011_0100;
		Pcmas4_In = 8;		
        
		// Add stimulus here
	end	
      
endmodule

