`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:00:55 03/27/2017
// Design Name:   Control_Unit
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Image-Filter-FPGA-/ModulosProyectoArqui1/Control_Unit_TB.v
// Project Name:  Image-Filter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Unit_TB;

	// Inputs
	reg [3:0] OpCode;
	reg [3:0] F;

	// Outputs
	wire SEL_A;
	wire SEL_B;
	wire SEL_EXT;
	wire [1:0] SELOP_B;
	wire [1:0] SELOP_A;
	wire SEL_RES;
	wire [2:0] ALU_CTRL;
	wire WE_MEM;
	wire SEL_DAT;
	wire SEL_C;
	wire WE_C_AUX;
	wire WE_V;
	wire COMPARA;
	wire SUMA_RESTA;
	wire SALTO;
	wire PROHIB;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.OpCode(OpCode), 
		.F(F), 
		.SEL_A(SEL_A), 
		.SEL_B(SEL_B), 
		.SEL_EXT(SEL_EXT), 
		.SELOP_B(SELOP_B), 
		.SELOP_A(SELOP_A), 
		.SEL_RES(SEL_RES), 
		.ALU_CTRL(ALU_CTRL), 
		.WE_MEM(WE_MEM), 
		.SEL_DAT(SEL_DAT), 
		.SEL_C(SEL_C), 
		.WE_C_AUX(WE_C_AUX), 
		.WE_V(WE_V), 
		.COMPARA(COMPARA), 
		.SUMA_RESTA(SUMA_RESTA), 
		.SALTO(SALTO), 
		.PROHIB(PROHIB)
	);

	initial begin
		// Initialize Inputs
		OpCode = 0;
		F = 0;

		//--------------------------------SUM
		#100;
		OpCode = 4'b0000;
		F = 2'b00;	
		//--------------------------------SUMI
		#100;
		OpCode = 4'b0001;
		F = 2'b01;	
		//--------------------------------RES
		#100;
		OpCode = 4'b0010;
		F = 2'b00;	
		//--------------------------------RESI
		#100;
		OpCode = 4'b0011;
		F = 2'b01;	
		//--------------------------------MUL
		#100;
		OpCode = 4'b0100;
		F = 2'b00;	
		//--------------------------------AND
		#100;
		OpCode = 4'b0101;
		F = 2'b00;	
		//--------------------------------OR
		#100;
		OpCode = 4'b0110;
		F = 2'b00;	
		//--------------------------------MOV
		#100;
		OpCode = 4'b0111;
		F = 2'b01;	
		//--------------------------------COMP
		#100;
		OpCode = 4'b1000;
		F = 2'b00;	
		//--------------------------------STO
		#100;
		OpCode = 4'b1001;
		F = 2'b10;	
		//--------------------------------VECH
		#100;
		OpCode = 4'b1010;
		F = 2'b00;	
		//--------------------------------OBT
		#100;
		OpCode = 4'b1011;
		F = 2'b00;	
		//--------------------------------CAR
		#100;
		OpCode = 4'b1100;
		F = 2'b00;	
		//--------------------------------CARI
		#100;
		OpCode = 4'b1110;
		F = 2'b01;	
		//--------------------------------ALMB
		#100;
		OpCode = 4'b1111;
		F = 2'b00;	
		//--------------------------------NOP
		#100;
		OpCode = 4'b0000;
		F = 2'b11;		
        
		// Add stimulus here

	end
      
endmodule

