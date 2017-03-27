`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:42 03/26/2017 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
		input [3:0] OpCode,
		input [3:0] F,
		output wire SEL_A,	 
		output wire SEL_B,
		output wire SEL_EXT,
		output wire [1:0] SELOP_B,
		output wire [1:0] SELOP_A,
		output wire SEL_RES,
		output wire [2:0] ALU_CTRL,
		output wire WE_MEM,		
		output wire SEL_DAT,		
		output wire SEL_C,
		output wire WE_C_AUX,		
		output wire WE_V,
		output wire COMPARA,
		output wire SUMA_RESTA,
		output wire SALTO,
		output wire PROHIB
    );
	 
		assign SEL_A = (OpCode == 4'b1011) ? 1'b1:
														 1'b0;
														 
		assign SEL_B    = (OpCode == 4'b1011) ? 1'b1:
														 1'b0;
														 
		assign SEL_EXT  = (OpCode == 4'b1001) ? 1'b1:
															1'b0;
															
		assign SELOP_A  = ((OpCode == 4'b0111) | (OpCode == 4'b1110)) ? 2'b11:
							  ((OpCode == 4'b1001) | (F == 2'b11)) 		 ? 2'b00:
																							2'b10;
								
		assign SELOP_B  = ( (OpCode == 4'b0001) | (OpCode == 4'b0011) | (OpCode == 4'b0111)
							  | (OpCode == 4'b1001) | (OpCode == 4'b1110)) 				   			? 2'b01:
							  ( (OpCode == 4'b1010) | (OpCode == 4'b1100) | (OpCode == 4'b1111)) ? 2'b10:
																														2'b00;
		
		assign SEL_RES  = (OpCode == 4'b1011) ? 1'b1:
														1'b0;
								
		assign ALU_CTRL = ((OpCode == 4'b0000) | (OpCode == 4'b0001) | (OpCode == 4'b1001)) ? 3'b000: //Suma
								((OpCode == 4'b0010) | (OpCode == 4'b0011) | (OpCode == 4'b1000)) ? 3'b001: //Resta
								(OpCode == 4'b0100) 																? 3'b010: //Multiplica
								(OpCode == 4'b0101) 																? 3'b011: //AND
																														  3'b100; //OR
		assign WE_MEM   = (OpCode == 4'b1111) ? 1'b0:
														   1'b1;
															
		assign SEL_DAT  = ((OpCode == 4'b1010) | (OpCode == 4'b1100) | (OpCode == 4'b1110)) ? 1'b0:
																														 1'b1;
																														 
		assign SEL_C    = (OpCode == 4'b1010) ? 1'b1:
														    1'b0;
															 
		assign COMPARA  = (OpCode == 4'b1000) ? 1'b1:
														 1'b0;
														  
		assign WE_C_AUX =  ((OpCode == 4'b1000) | (OpCode == 4'b1001) | (OpCode == 4'b1111) | (F == 2'b11)) ? 1'b1:
																																				1'b0;
																																				
		assign SUMA_RESTA = (((OpCode == 4'b0000) | (OpCode == 4'b0010)) & !(F == 2'b11)) ? 1'b1:
																														1'b0;	
		assign SALTO = (OpCode == 4'b1001) ? 1'b1:
													 1'b0;
		
		assign PROHIB = ((OpCode == 4'b1001) |(OpCode == 4'b1000) |(OpCode == 4'b1111) | (F == 2'b11)) ? 1'b1:
																																		 1'b0;
		
		assign WE_V = (OpCode == 4'b1010) ? 1'b0:
														1'b1;
endmodule
