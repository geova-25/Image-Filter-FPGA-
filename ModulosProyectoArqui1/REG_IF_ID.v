`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:17 03/25/2017 
// Design Name: 
// Module Name:    REG_IF_ID 
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
module REG_IF_ID(
	 input clk,
    input [31:0] Instruction,
    input [31:0] Pcmas4_In,
    output wire [31:0] Pcmas4,
    output wire [3:0]  OpCode,	 
    output wire [1:0]  Cond,
    output wire [1:0]  F,
    output wire [3:0]  Rg,	 
    output wire [3:0]  Rp,
    output wire [3:0]  Rs,
    output wire [15:0] Inm,
    output wire [23:0] Label
    );
	 
	reg [31:0] Pcmas4_InReg = 32'b0;
	reg [31:0] InstructionReg = 32'b0;

	always @(posedge clk)
		begin
			Pcmas4_InReg = Pcmas4_In;		
			InstructionReg = Instruction;
		end
	
	assign Pcmas4 = Pcmas4_InReg;
	assign OpCode = InstructionReg[31:28];
	assign Cond   = InstructionReg[27:26];
	assign F 	  = InstructionReg[25:24];
	assign Rg 	  = InstructionReg[23:20];
	assign Rp 	  = InstructionReg[19:16];
	assign Rs 	  = InstructionReg[15:12];
	assign Inm 	  = InstructionReg[15:0];
	assign Label  = InstructionReg[23:0];

endmodule
