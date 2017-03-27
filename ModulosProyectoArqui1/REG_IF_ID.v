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

	always @(posedge clk)
		begin
			Pcmas4_InReg = Pcmas4_In;		
		end
	
	assign Pcmas4 = Pcmas4_InReg;
	assign OpCode = Instruction[31:28];
	assign Cond   = Instruction[27:26];
	assign F 	  = Instruction[25:24];
	assign Rg 	  = Instruction[23:20];
	assign Rp 	  = Instruction[19:16];
	assign Rs 	  = Instruction[15:12];
	assign Inm 	  = Instruction[15:0];
	assign Label  = Instruction[23:0];

endmodule
